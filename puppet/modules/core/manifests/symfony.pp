class core::symfony {
  package { 'acl':
    ensure  => present,
    require => Exec['apt-update'],
  }
  #sed "s/\/ type ext4 (/\/ type ext4 (acl,/g"
  #exec { 'create symfony db':
  #  unless  => '/usr/bin/mysql -uroot symfony',
  #  command => '/usr/bin/mysql -uroot -e "create database symfony;"',
  #  require => Package['acl'],
  #}
  
	exec { 'create symfony project':
		cwd => '/var/www',
		command => '/usr/local/bin/composer create-project symfony/framework-standard-edition symfony 2.5.* --prefer-dist --no-interaction',
		require => [ Exec["download_composer"], Package['mysql-server'], Package['php5-mysql'], Package['php5-mysql'], Package['acl'] ],
    onlyif => [
      "/usr/bin/test ! -f /var/www/symfony/composer.json",
      ##"/usr/local/bin/composer show -i | grep -c \"symfony/symfony\"",
      "/usr/bin/test ! -d /var/www/symfony"
    ]
  }
    
  #exec { 'set_symfony_permissions':
  #  cwd => '/var/www/symfony',
  #  command => "/bin/rm -rf app/cache/*; \
   #   /bin/rm -rf app/logs/*; \
  #    APACHEUSER=`ps aux | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data' | grep -v root | head -1 | cut -d\  -f1`; \
  #    sudo chmod +a \"\$APACHEUSER allow delete,write,append,file_inherit,directory_inherit\" app/cache app/logs; \
  #    sudo chmod +a \"`whoami` allow delete,write,append,file_inherit,directory_inherit\" app/cache app/logs",
  #  require => [ Exec['create symfony project'], Package['acl'] ] ,
  #}

  exec { 'create symfony db':
    unless  => '/usr/bin/mysql -uroot symfony',
    command => '/usr/bin/mysql -uroot -e "create database symfony;"',
    require => Service['mysql'],
  }

  exec { 'create symfony user':
    unless  => '/usr/bin/mysql -usymfony -psymfony symfony',
    command => '/usr/bin/mysql -uroot -e "\
              create user \'symfony\'@\'localhost\' identified by \'symfony\';\
              create user \'symfony\'@\'10.0.2.2\' identified by \'symfony\';\
              create user \'symfony\'@\'%\' identified by \'symfony\';\
              grant all privileges on symfony.* to \'symfony\'@\'localhost\' identified by \'symfony\';\
              grant all privileges on symfony.* to \'symfony\'@\'10.0.2.2\' identified by \'symfony\';\
              grant all privileges on symfony.* to \'symfony\'@\'%\' identified by \'symfony\';\
              flush privileges;"',
    require => Exec['create symfony db']
  }
}
