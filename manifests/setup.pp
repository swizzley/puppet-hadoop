# Class: hadoop::setup
#
class hadoop::setup {
  File {
    purge   => true,
    force   => true,
    ensure  => link,
    require => Exec['install_hadoop'],
  }

  file {
    # profile.d
    '/etc/profile.d/hadoop-env.sh':
      target => "${hadoop::install_dir}/etc/hadoop-env.sh";

    # etc
    '/etc/hadoop':
      target => "${hadoop::install_dir}/etc";

    # share
    '/usr/share/hadoop':
      target => "${hadoop::install_dir}/share/hadoop";

    "/usr/share/doc/hadoop-${hadoop::ver}":
      target => "${hadoop::install_dir}/share/doc";

    # lib
    '/usr/lib/native':
      target => "${hadoop::install_dir}/lib/native";

    # include
    '/usr/include/hdfs.h':
      target => "${hadoop::install_dir}/include/hdfs.h";

    '/usr/include/Pipes.hh':
      target => "${hadoop::install_dir}/include/Pipes.hh";

    '/usr/include/SerialUtils.hh':
      target => "${hadoop::install_dir}/include/SerialUtils.hh";

    '/usr/include/StringUtils.hh':
      target => "${hadoop::install_dir}/include/StringUtils.hh";

    '/usr/include/TemplateFactory.hh':
      target => "${hadoop::install_dir}/include/TemplateFactory.hh";

    # libexec
    '/usr/libexec/hadoop':
      target => "${hadoop::install_dir}/libexec";

    '/usr/libexec/hadoop-config.sh':
      target => "${hadoop::install_dir}/libexec/hadoop-config.sh";

    '/usr/libexec/hdfs-config.sh':
      target => "${hadoop::install_dir}/libexec/hdfs-config.sh";

    '/usr/libexec/httpfs-config.sh':
      target => "${hadoop::install_dir}/libexec/httpfs-config.sh";

    '/usr/libexec/mapred-config.sh':
      target => "${hadoop::install_dir}/libexec/mapred-config.sh";

    '/usr/libexec/yarn-config.sh':
      target => "${hadoop::install_dir}/libexec/yarn-config.sh";

    # bin
    '/usr/bin/hadoop':
      target => "${hadoop::install_dir}/bin/hadoop";

    '/usr/bin/container-executor':
      target => "${hadoop::install_dir}/bin/container-executor";

    '/usr/bin/hdfs':
      target => "${hadoop::install_dir}/bin/hdfs";

    '/usr/bin/mapred':
      target => "${hadoop::install_dir}/bin/mapred";

    '/usr/bin/rcc':
      target => "${hadoop::install_dir}/bin/rcc";

    '/usr/bin/test-container-executor':
      target => "${hadoop::install_dir}/bin/test-container-executor";

    '/usr/bin/yarn':
      target => "${hadoop::install_dir}/bin/yarn";

    # sbin
    '/usr/bin/distribute-exclude.sh':
      target => "${hadoop::install_dir}/sbin/distribute-exclude.sh";

    '/usr/bin/hadoop-daemons.sh':
      target => "${hadoop::install_dir}/sbin/hadoop-daemons.sh";

    '/usr/bin/httpfs.sh':
      target => "${hadoop::install_dir}/sbin/httpfs.sh";

    '/usr/bin/refresh-namenodes.sh':
      target => "${hadoop::install_dir}/sbin/refresh-namenodes.sh";

    '/usr/bin/start-all.sh':
      target => "${hadoop::install_dir}/sbin/start-all.sh";

    '/usr/bin/start-dfs.sh':
      target => "${hadoop::install_dir}/sbin/start-dfs.sh";

    '/usr/bin/start-yarn.sh':
      target => "${hadoop::install_dir}/sbin/start-yarn.sh";

    '/usr/bin/stop-balancer.sh':
      target => "${hadoop::install_dir}/sbin/stop-balancer.sh";

    '/usr/bin/stop-secure-dns.sh':
      target => "${hadoop::install_dir}/sbin/stop-secure-dns.sh";

    '/usr/bin/yarn-daemon.sh':
      target => "${hadoop::install_dir}/sbin/yarn-daemon.sh";

    '/usr/bin/hadoop-daemon.sh':
      target => "${hadoop::install_dir}/sbin/hadoop-daemon.sh";

    '/usr/bin/hdfs-config.sh':
      target => "${hadoop::install_dir}/sbin/hdfs-config.sh";

    '/usr/bin/mr-jobhistory-daemon.sh':
      target => "${hadoop::install_dir}/sbin/mr-jobhistory-daemon.sh";

    '/usr/bin/slaves.sh':
      target => "${hadoop::install_dir}/sbin/slaves.sh";

    '/usr/bin/start-balancer.sh':
      target => "${hadoop::install_dir}/sbin/start-balancer.sh";

    '/usr/bin/start-secure-dns.sh':
      target => "${hadoop::install_dir}/sbin/start-secure-dns.sh";

    '/usr/bin/stop-all.sh':
      target => "${hadoop::install_dir}/sbin/stop-all.sh";

    '/usr/bin/stop-dfs.sh':
      target => "${hadoop::install_dir}/sbin/stop-dfs.sh";

    '/usr/bin/stop-yarn.sh':
      target => "${hadoop::install_dir}/sbin/stop-yarn.sh";

    '/usr/bin/yarn-daemons.sh':
      target => "${hadoop::install_dir}/sbin/yarn-daemons.sh";
  }

}