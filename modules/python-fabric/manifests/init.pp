class python-fabric {
  package { 'python':
    ensure => installed,
  }

  package { 'python-dev':
    ensure => installed,
    require => Package['python'],
  }

  package { 'python-pip':
    ensure => installed,
    require => Package['python'],
  }

  package {'fabric':
    ensure => installed,
    require => Package['python'],
  } 

}
