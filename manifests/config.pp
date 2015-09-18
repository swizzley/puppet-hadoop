# Class: hadoop::config
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
define hadoop::config ($jvm_home, $install_dir, $hadoop_home) {
  file { "${install_dir}/etc/hadoop-env.sh":
    purge   => true,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('hadoop/hadoop-env.sh.erb')
  }
}