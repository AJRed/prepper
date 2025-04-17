
$trigger=$false

foreach ($item in $args)
{
	if ($item -eq "ass")
	{
		$trigger=$true
	} else
	{
		Write-Output($item)
	}
}

if ($trigger)
{
	Write-Output("Asshole Detected!")
} else
{
	Write-Output("No Assholes Detected")
}
