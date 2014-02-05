Personal Puppet Configuration
===============

My personal puppet configuration

This puppet project was developed to organize and automate all my machine configuration.

To use the project settings, declare the following snippet in a new node:

class { 'user_machine' :
  user_name  => $user_name, 
  include_development => true # development packages will be included,
}
