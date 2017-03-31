#
#
#
class galaxy::install inherits ::galaxy::params
{
  ensure_packages(['python-pip'])

  vcsrepo {'/opt/galaxy':
    provider => git,
    source   => 'git://github.com/galaxyproject/galaxy',
    revision => $::galaxy::params::version,
  }

  file {'/docker-entrypoint.sh':
    ensure => $::galaxy::params::docker_payload,
    source => 'puppet:///modules/galaxy/docker/docker-entrypoint.sh',
  }

  file {'/opt/env_to_ini.py':
    ensure => $::galaxy::params::docker_payload,
    source => 'puppet:///modules/galaxy/docker/env_to_ini.py',
  }

  if ($::galaxy::params::docker_build) {

    file {'/opt/galaxy.ini.template':
      content => template($::galaxy::params::galaxy_ini_template),
    }

    $pip_cmd_args = ' --index-url https://wheels.galaxyproject.org/simple'

    exec { "${::galaxy::params::pip_bin} install -r /opt/galaxy/requirements.txt ${pip_cmd_args}" :
      require => Vcsrepo['/opt/galaxy']
    }

    exec { "${::galaxy::params::pip_bin} install psycopg2==2.6.1 ${pip_cmd_args}" :
      require => Vcsrepo['/opt/galaxy']
    }

  }else{
    file {'/opt/galaxy/config/galaxy.ini':
      content => template($::galaxy::params::galaxy_ini_template),
      require => Vcsrepo['/opt/galaxy'],
    }
  }
}
