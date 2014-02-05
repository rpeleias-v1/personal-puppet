node 'rodrigo-pc' {
  
  $user_name = 'rodrigo'

  include basics
  include hipchat
  include python-fabric

  class{ 'skype' : 
    ensure => stopped,
  }
  
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
