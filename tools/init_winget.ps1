# Script by Andrew Ruedisueli

# Github release download snippet (Modified from original)
# https://gist.github.com/MarkTiedemann/c0adc1701f3f5c215fc2c2d5b1d5efd3

function Test-Winget
{
	if (Get-Command winget -ErrorAction SilentlyContinue)
	{
		# Winget command exists
		Write-Host "Winget already installed. Upgrading to latest version"
		winget upgrade winget

	} else
	{
		# Winget command does NOT exist
		# Download latest package from Github
		Write-Host "Winget cmdlet not found. Downloading lates release from Github"
		$repo = "microsoft/winget-cli"
		$file = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

		$releases = "https://api.github.com/repos/$repo/releases"

		Write-Host Determining latest release
		$tag = (Invoke-WebRequest $releases | ConvertFrom-Json)[0].tag_name

		$download = "https://github.com/$repo/releases/download/$tag/$file"

		Write-Host Dowloading latest release
		Invoke-WebRequest $download -Out $file

		Add-AppxPackage $file

	}
	return 0
}

if ( -Not $(Test-Winget)[-1])
{
	Write-Host "Winget setup complete"
	return 0
} else
{
	Write-Host "Winget error" -ForegroundColor Yellow
	return 1
}

