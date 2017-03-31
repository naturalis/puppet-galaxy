#
#
#
class galaxy::naturalis_packages{

  $support_packages = ['r-base','cd-hit','ncbi-blast+']

  ensure_packages($support_packages)
  # package { $support_packages :
  #   ensure => present
  # }
}
