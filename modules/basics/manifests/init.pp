class basics {
  package { 'vim':
    ensure => latest,
  }

  package { 'ack-grep':
    ensure => latest,
  }

  package { 'sudo':
    ensure => latest,
  }

  package { 'terminator':
    ensure => installed,
  }

  package { 'skype':
    ensure => latest,
  }

  package { 'filezilla':
    ensure => installed,
  }
}
