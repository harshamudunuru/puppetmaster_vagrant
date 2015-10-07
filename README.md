Introduction
------------
Vagrant and Puppet resources for setting up a box in Virtual Box with running Puppetmaster



Environment
-----------
Based on the `BOX_NAME` environment the following guest is created 

 - ubuntu 12.04 32 and 64
 - ubuntu 14.04 32 and 64
 - centos65
 - centos7
 - windows7 (winrm)
 - windows 2012 (winrm)

ServerSpec
----------
Currently most development targets Windows guests (Linux servesrpec is well covered elsewhere). 

  - Command Execution
  - GAC Assembly loadfing / assertion
  - ReparsePoint (Symlink and Directory Junction) validation
  - Loading Nunt.Core for adding Asserts into the Powershell snippets

Note
----
* Some of the configuration ported from [Building a Test Puppet Master With Vagrant](http://grahamgilbert.com/blog/2013/02/13/building-a-test-puppet-master-with-vagrant/) . 
* See also [A modern Puppet Master from scratch](http://stdout.no/a-modern-puppet-master-from-scratch/)
* [Provisioning a Windows box with Vagrant, Chocolatey and Puppet](www.tzehon.com/2014/01/20/provisioning-a-windows-box-with-vagrant-chocolatey-and-puppet-part-1/)
* [Vagrant Boxes for playing with Puppet on Windows (but not boxes...](https://github.com/ferventcoder/vagrant-windows-puppet) specifically for DSC
