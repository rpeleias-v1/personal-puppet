node 'rodrigo-pc' {
  file { '/tmp/rodrigo':
    content => "Hello, Goku!!\n",
  }

  include basics
  include hipchat
}
