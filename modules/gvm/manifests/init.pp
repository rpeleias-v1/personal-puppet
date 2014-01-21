# == Define: gvm
#
# Setup GVM 

# === Parameters
#
# [*owner*]
# The user that owns package. This is use to infer where to install GVM: /home/$owner/.gvm

class gvm ($owner) {
   #TODO, should require java somehow
    $user_home = "/home/$owner"
    wget::fetch {'http://get.gvmtool.net':,
      destination => "/tmp/gvm-install.sh",
      verbose     => true,
      execuser    => $owner,
      user        => $owner,
    } ~>
    exec { 'GVM' :
      user        => $user_name,
      environment => "HOME=$user_home",
      path        => "/usr/bin:/usr/sbin:/bin",
      command     => "bash gvm-install.sh",
      cwd         => '/tmp',
      logoutput   => true,
      onlyif      => 'echo $PATH |grep -c gvm' #this is a weak test to prevent gvm to always run
    } ~>
    file {"$user_home/.gvm/etc/config" :
      owner  => $owner,
      group  => $owner,
      source => "puppet:///modules/gvm/gvm_config"
    }
   
}