function Get-Packages
{
	$pkg = [System.Collections.ArrayList]::new()
	$pkg_str = Get-Content("cfg\packages")
	foreach($line in $pkg_str)
	{
		# declaring statement as void silences return values
		# from Add, which for some reason pollute the list
		[void]$pkg.Add($line)
	}
	return $pkg
}


$PACKAGES = Get-Packages
Write-Host "Installing packages..."
if (Get-Command winget -ErrorAction SilentlyContinue)
{
	foreach($package in $PACKAGES)
	{
        	Write-Host "Installing package: $package" -ForegroundColor Magenta
		$pkg = Winget list --id $package --accept-package-agreements --accept-source-agreements --disable-interactivity
		$error_status = $?
		Write-Host($error_status)
        	if ($error_status)
        	{
            		Write-Host "$package already instaled"
        	} else {
			Write-Host "Installing package: $package" -ForegroundColor Magenta
			winget install $package --accept-package-agreements --accept-source-agreements --disable-interactivity
        	}
	}
	return 0
} else
{
	Write-Host "Winget Not Installed. Assuming test run" -ForegroundColor Yellow
	foreach($package in $PACKAGES)
	{
		Write-Host "Installing package: $package" -ForegroundColor Magenta
	}
	return 0
}
