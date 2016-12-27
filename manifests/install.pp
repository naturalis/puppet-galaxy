#
#
#
class galaxy::install inherits ::galaxy::params
{
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
      content => template('galaxy/galaxy.ini.template.erb'),
    }

    python::dotfile { '/root/.pip/pip.conf':
      config => {
        'global' => {
        'index-url' => 'https://wheels.galaxyproject.org/simple',
        }
      }
    }

    python::requirements { '/opt/galaxy/requirements.txt':
      require => [ Vcsrepo['/opt/galaxy'], Python::Dotfile['/root/.pip/pip.conf'] ]
    }

    python::pip { 'psycopg2':
      ensure  => '2.6.1',
      require => Python::Dotfile['/root/.pip/pip.conf'],
    }

  }else{
    file {'/opt/galaxy/config/galaxy.ini':
      content => template('galaxy/galaxy.ini.template.erb'),
      require => Vcsrepo['/opt/galaxy'],
    }
  }
}
