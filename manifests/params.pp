#
#
#
class galaxy::params {
  $version = 'release_16.10'
  $manage_service = false
  $docker_build = true
  $db_host = 'localhost'
  $db_pass = 'password'

  if ($docker_build) {
    $galaxy_db = '__GALAXY_DB'
    $docker_payload = present
  }else{
    $galaxy_db = "postgres://postgres:${db_pass}@${db_host}:5432/postgres"
    $docker_payload = absent
  }


}
