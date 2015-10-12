include chocolatey



package { "google-chrome-x64":
	ensure 		=> present,
	provider 	=> 'chocolatey',
}

package { "sqlserver2014express":
	ensure 		=> present,
	provider 	=> 'chocolatey'
}

package { "sublimetext3":
	ensure 		=> present,
	provider 	=> 'chocolatey'
}

package { "git":
	ensure 		=> present,
	provider 	=> 'chocolatey'
}

package { "poshgit":
	ensure 		=> present,
	provider 	=> 'chocolatey',
	require		=> Package['git'],
}

package { "tortoisegit":
	ensure 		=> present,
	provider 	=> 'chocolatey'
}

package { "Visualstudio2013Professional":
	ensure 		=> present,
	provider 	=> 'chocolatey',
}


windowsfeature {'IIS':
	feature_name  => [
					'Web-Server',
				    'Web-WebServer',
				    'Web-Asp-Net45',
				    'Web-ISAPI-Ext',
				    'Web-ISAPI-Filter',
				    'NET-Framework-45-ASPNET',
				    'WAS-NET-Environment',
				    'Web-Http-Redirect',
				    'Web-Filtering',
				    'Web-Mgmt-Console',
				    'Web-Mgmt-Tools'
	]
}

windowsfeature { 'Web-WebServer':
  installmanagementtools => true,
  installsubfeatures => true
}
