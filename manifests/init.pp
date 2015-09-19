# Class: hadoop
#
# This module manages hadoop
#
# Parameters:
#
# $target      : download dir
# $file        : hadoop package archive name
# $install_dir : installation dir
# $source      : download link
# $ver         : hadoop version
# $hadoop_home : hadoop app dir
# $java_dist   : java installation
# $java        : java installation default
# $java_pkg    : java package to specify
# $java_ver    : java version
# $owner       : owner of hadoop directory
# $group       : grou of hadoop directory
#
# Requires: puppetlabs/java (only when installing java using that module)
#
class hadoop (
  $target      = $::hadoop::params::target,
  $file        = $::hadoop::params::file,
  $install_dir = $::hadoop::params::install_dir,
  $source      = $::hadoop::params::source,
  $ver         = $::hadoop::params::ver,
  $hadoop_home = $::hadoop::params::hadoop_home,
  $java        = $::hadoop::params::java,
  $java_dist   = $::hadoop::params::java_dist,
  $java_ver    = $::hadoop::params::java_ver,
  $owner       = $::hadoop::params::owner,
  $group       = $::hadoop::params::group,) inherits hadoop::params {
  # Validation
  validate_string($target)
  validate_string($file)
  validate_string($source)
  validate_string($ver)
  validate_string($owner)
  validate_string($group)
  validate_absolute_path($install_dir)
  validate_absolute_path($hadoop_home)
  # Ensure User:Group
  group { $group: ensure => present } -> user { $owner: ensure => present }

  # Default version is current latest stable at 2.7.1
  artifact { $file:
    source => $source,
    target => $target,
  } ->
  exec { 'install_hadoop':
    path    => '/bin:/usr/bin',
    command => "mkdir -p ${install_dir} && tar -C ${install_dir} -xzf ${target}/${file} --strip-components=1",
    creates => "${install_dir}/bin/hadoop"
  } ->
  exec { 'de-window_hadoop':
    path    => '/bin:/usr/bin',
    command => "find ${install_dir} -name \"*.cmd\" -delete",
    unless  => "find ${install_dir} -name \"*.cmd\"|wc -l|grep -q 0"
  } ->
  exec { 'chown_hadoop':
    path    => '/bin:/usr/bin',
    command => "chown -R ${owner}:${group} ${install_dir}/",
    unless  => "sudo -u ${owner} test -O ${install_dir}/bin/hadoop",
    require => User[$owner]
  } -> class { 'hadoop::setup': }

  # Install Java then configure Hadoop
  if ($::java_home == undef) {
    class { 'java':
      distribution => $java,
      version      => $java_ver,
      package      => $java_pkg
    } -> hadoop::config { 'hadoop':
      install_dir => $install_dir,
      jvm_home    => $::java_home,
      hadoop_home => $hadoop_home,
    }
  } else {
    hadoop::config { 'hadoop':
      install_dir => $install_dir,
      jvm_home    => $::java_home,
      hadoop_home => $hadoop_home,
    }
  }

}
