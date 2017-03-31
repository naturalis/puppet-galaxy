#
#
#
class galaxy::params {
  $version = 'release_16.10'
  $manage_service = false
  $docker_build = true
  $db_host = 'localhost'
  $db_pass = 'password'
  $gmail_user = 'galaxymail'
  $gmail_password = 'galaxy_password'
  $gmail_address = 'galaxymail@gmail.com'
  $admin_users = 'None'
  $pip_bin = '/usr/bin/pip'
  $galaxy_ini_template = 'galaxy/galaxy.ini.template.erb'

  if ($docker_build) {
    $galaxy_db = '__GALAXY_DB'
    $docker_payload = present
  }else{
    $galaxy_db = "postgres://postgres:${db_pass}@${db_host}:5432/postgres"
    $docker_payload = absent
  }

}
