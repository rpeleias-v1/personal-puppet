node 'rodrigo-pc.a5.local' {
  file { '/tmp/rodrigo':
    content => "Hello, Goku!!\n",
  }

  include basics
  include hipchat
}
