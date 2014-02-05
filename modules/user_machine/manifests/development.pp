class user_machine::development {

  package { 'meld':
    ensure => latest
  }
    
  package { 'kdiff3':
    ensure  => latest,
  }

  package { 'tree':
    ensure => latest
  }

  include hipchat
  include python-fabric
  include java

  pg_user { 'pguser':
    ensure  => present,
    password => 'pgpassword'
  }

  postgresql::db { 'basic-database':
    owner    => 'postgres',
    password => 'postgres',
    template => 'template0'
  }

  #class { 'virtualbox': }

  class { 'gvm' :
    owner => $user_name,
  }

  gvm::package { 'grails' :
    version    => '2.1.5',
    is_default => true,
    owner      => $user_name,
  }

  gvm::package { 'groovy' :
    version    => '1.8.8',
    is_default => true,
    owner      => $user_name,
  }
}
