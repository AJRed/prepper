if (Get-Command winget -ErrorAction SilentlyContinue)
{
	$wingetver = winget -v
	$latestwingetver = "v1.8.1911"
	$ROOT = Get-Location
	Write-Host "Latest winget version: $latestwingetver"
	Write-Host "Detected winget version: $wingetver"

	if ($wingetver -eq $latestwingetver)
	{
		Write-Host "Winget up to date. Skipping update."
		return 0
	} else
	{
		Write-Host "New winget version. Updating winget."
		Set-Location $PSScriptRoot
		Add-AppxPackage $ROOT/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
		Set-Location $ROOT
		return 0
	}
} else
{
	Write-Host "Winget not installed. Assuming test run" -ForegroundColor Yellow
	return 0
}

