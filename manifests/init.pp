# Class: hadoop
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
class hadoop (
  $target      = $::hadoop::params::target,
  $file        = $::hadoop::params::file,
  $install_dir = $::hadoop::params::install_dir,
  $source      = $::hadoop::params::source,
  $ver         = $::hadoop::params::ver,
  $hadoop_home = $::hadoop::params::hadoop_home,
  $java_home   = $::hadoop::params::java_home,
  $java_dist   = $::hadoop::params::java_dist,) inherits hadoop::params {
  # Default version is current latest stable at 2.7.1
  artifact { $file:
    source => $source,
    target => $target,
  } ->
  exec { 'install_hadoop':
    path    => '/bin:/usr/bin',
    command => "mkdir -p ${install_dir} && tar -C /opt -xzf ${target}/${file} --strip-components=1",
    unless  => 'test -d /etc/hadoop && test -d /include && test -x /bin/hadoop'
  } ->
  exec { 'de-window_hadoop':
    path    => '/bin:/usr/bin',
    command => "find ${install_dir} -name \"*.cmd\" -delete",
    unless  => "find /opt/hadoop -name \"*.cmd\"|wc -l|grep -q 0"
  } ->
  exec { 'chown_hadoop':
    path    => '/bin:/usr/bin',
    command => "chown -R ${owner}:${group} ${install_dir}",
    unless  => "sudo -u ${owner} test -O ${install_dir}",
  } -> class { 'hadoop::setup': }

  if ($java_home == undef and $::java_home == undef) {
    if $java_dist == undef {
      $java = 'jdk'
    }

    class { 'java':
      distribution => $java,
    }
    $jvm_home = $::java_home
  } else {
    $jvm_hom = $java_home
  }

  hadoop::config { 'hadoop':
    install_dir => $install_dir,
    jvm_home    => $jvm_home,
    hadoop_home => $hadoop_home,
  }
}
