node 'rodrigo-pc' {
  
  class { 'user_machine' :
    user_name           => 'rodrigo',
    include_development => true,
  }
}
