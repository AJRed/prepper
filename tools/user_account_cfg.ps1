function Set-Author
{
	Write-Host "Starting user-account-cfg." -ForegroundColor Blue
	Write-Host "By Andrew Ruedisueli" -ForegroundColor Blue
}

if (Get-Command WMIC -ErrorAction SilentlyContinue)
{
	try
	{
		$tmp = WMIC USERACCOUNT WHERE "Name='Owner'" SET PasswordExpires=False
	} catch
	{
		Write-Host "WMIC Error."
		return 1
	}

} else
{
	Write-Host "WMIC not installed. Assuming test run." -ForegroundColor Yellow
	return 0
}
