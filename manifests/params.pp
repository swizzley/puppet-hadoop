# Class: hadoop::params
#
class hadoop::params {
  # BEGIN user configurable
  $version = 'current'
  $package = 'common'
  $target = '/tmp'
  $install_dir = '/opt/hadoop'
  $java_dist = undef
  $java_pkg = undef
  $java_ver = 'present'
  $owner = 'hadoop'
  $group = 'hadoop'

  # END user configurable


  if ($version != 'current') {
    $file = "hadoop-${version}.tar.gz"
    $ver = $version
  } else {
    $file = 'hadoop-2.7.1.tar.gz'
    $ver = '2.7.1'
  }

  if ($java_dist == undef) {
    $java = 'jdk'
  } else {
    $java = $java_dist
  }

  $hadoop_home = '/usr/share/hadoop'
  $source = "http://archive.apache.org/dist/hadoop/${package}/hadoop-${ver}/${file}"

}
