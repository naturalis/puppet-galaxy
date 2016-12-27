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
    mode   => '0770',
  }
}
