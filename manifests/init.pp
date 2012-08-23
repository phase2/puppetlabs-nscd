class nscd {
  package { 'nscd':
    ensure => latest,
  }

  service { 'nscd':
    ensure    => running,
    subscribe => File['/etc/nscd.conf'],
    require   => [
      Package['nscd'],
      File['/etc/nscd.conf'],
    ]
  }
  
  file { '/etc/nscd.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nscd/nscd.conf.erb'),
    require => Package['nscd'],
  }
}
