if versioncmp($::puppetversion,'3.6.1') >= 0 {
  $allow_virtual_packages = hiera('allow_virtual_packages',false)

  Package {
    allow_virtual => $allow_virtual_packages,
  }
}

include ::site::role::drupal_server
site::role::drupal_site {'books_pages':
  www_root => '/var/lib/books_pages',
  web_name => 'web.local',
  port => '80',
  version => '1',
}
