#!/usr/bin/env bash
# use puppet to make changes to our configuration file

file {'/etc/ssh/ssh_config':
  ensure => 'present',
}
file_line {'remove password auth':
  path	=> '/etc/ssh/ssh_config',
  line	=> 'PasswordAuthentication no',
  match	=> 'PasswordAuthentication yes',
  replace => 'true',
}
file_line {'Use a identity file':
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/config',
  match   => '^identityFile',
  ensure  => 'present',
}
