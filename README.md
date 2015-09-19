# hadoop #

[![Puppet Forge](https://img.shields.io/badge/puppetforge-v0.1.0-blue.svg)](https://forge.puppetlabs.com/swizzley88/hadoop)

**Table of Contents**

1. [Overview](#overview)
2. [Setup](#setup)
3. [Usage](#usage)
4. [Requirements](#requirements)
5. [Compatibility](#compatibility)
6. [Limitations](#limitations)
7. [Development](#development)
    
## Overviw

Hadoop Module for setup of Core/Common Hadoop Package on Linux systems. 

## Setup

This could take a while to run, the current version is 200MB, others are smaller and you can specify which to use in params.

```
include ::hadoop
```


## Usage

New fact $::java_home added for finding and setting $JAVA_HOME 

```$version``` [default: 2.7.1] which is current stable at the time of this module release
```$package``` Specify Core or Common Package [default: common]
```target``` Download directory [default: /tmp]
```install_dir``` Installation path [default: /opt/hadoop]
```java_home``` Java install directory [default: undef]
```java_dist``` Java installation for use when installing java via puppetlabs/java [default: undef] which is effectively jdk
```owner``` Owner of hadoop directory and files [default: hadoop]
```group``` Group of hadoop directory and files [default: hadoop]

## Requirements

```
pupptlabs/java
puppetlabs/stdlib
swizzley88/artifact
```
## Compatibility

Linux:

 * RHEL/CentOS/Fedora/Oracle/Scientific
 * Debian/Ubuntu
 
Tested On: CentOS 6.6 (used in production)

## Limitations

Your imagination

## Development

I'd like to add zookeeper, hbase, hive, pig and other parameters and manifests, but there are other modules for that already, and the cloudera modules is already puppet approved, so we'll just see where this goes.
