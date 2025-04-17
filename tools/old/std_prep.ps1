&"$PSScriptRoot\user_account_cfg.ps1"
&"$PSScriptRoot\init_winget.ps1"
if ($?)
{
	&"$PSScriptRoot\install_prep.ps1"
	Set-ExecutionPolicy AllSigned
} else
{
	Write-Output "Winget config failed. Please update windows then try again."
	
}

