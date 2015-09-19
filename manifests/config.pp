# Class: hadoop::config
#
# This class manages the hadoop environment script
#
# Parameters: 
#
#   $jvm_home    : $JAVA_HOME environment variable path
#   $install_dir : Hadoop install path
#   $hadoop_home : $HADOOP_HOME environment variable path
#
# Note: Parameterize as much as you want in this cofig file, pass them in or
#       make them local to this file, this is really just the minimum
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