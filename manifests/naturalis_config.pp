#
#
#
class galaxy::naturalis_config
{

  vcsrepo { '/opt/galaxy-naturalis' :
    provider => git,
    source   => 'git://github.com/naturalis/Galaxy-Pipeline'
  }

  file {'/opt/galaxy/tools/idenify':
    ensure => link,
    target => '/opt/galaxy-naturalis/Wrappers'
  }

  file {'/opt/galaxy/config/datatypes_conf.xml':
    ensure => link,
    target => '/opt/galaxy-naturalis/Galaxy_Configuration/datatypes_conf.xml'
  }

  file {'/opt/galaxy/config/tool_conf.xml':
    ensure => link,
    target => '/opt/galaxy-naturalis/Galaxy_Configuration/tool_conf.xml'
  }

  file {'/opt/galaxy/config/auth_conf.xml':
    ensure => link,
    target => '/opt/galaxy/config/auth_conf.xml.sample'
  }

  file {'/opt/galaxy/static/welcome.html':
    ensure => link,
    target => '/opt/galaxy-naturalis/Galaxy_Configuration/welcome.html'
  }

}
