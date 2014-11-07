class core::composer {
	package { 'git':
		ensure => present,
		require => Exec['apt-update']
	}

	exec { "download_composer":
		cwd => '/var/www',
		command => "/usr/bin/curl -sS https://getcomposer.org/installer | /usr/bin/php; mv composer.phar /usr/local/bin/composer",
		creates => "/usr/local/bin/composer",
		require => Package['curl','git']
	}
}
