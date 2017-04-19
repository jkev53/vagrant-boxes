include apt
class ansible {
  package { 'software-properties-common':
    ensure => installed,
  }
  apt::ppa {'ppa:ansible/ansible':
    require => Package['software-properties-common'],
    notify => Exec['apt_update']
  } ~>
  package { 'ansible':
    ensure => "2.3.0.0-1ppa~trusty"
  }
}