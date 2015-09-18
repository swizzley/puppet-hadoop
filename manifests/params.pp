# Class: hadoop::params
#
# This module manages hadoop
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class hadoop::params {
  $version = 'current'
  $package = 'common'
  $target = '/tmp'
  $install_dir = '/opt/hadoop'
  $hadoop_home = '/usr/share/hadoop'
  $java_home = undef
  $java_dist = undef
  $owner = 'hadoop'
  $group = 'hadoop'

  if ($version != 'current') {
    $file = "hadoop-${version}.tar.gz"
    $ver = $version
  } else {
    $file = 'hadoop-2.7.1.tar.gz'
    $ver = '2.7.1'
  }

  $source = "http://archive.apache.org/dist/hadoop/${package}/${ver}/${file}"

}
