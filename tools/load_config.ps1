#!/usr/bin/pwsh

$CFGDIR = $args[0]
$CFG_STRING = Get-Content $CFGDIR/std.cfg
$CFG = @{}

foreach ($line in $CFG_STRING)
{
	$KEY = ""
	$VAL = ""
	if ($line -ne "")
	{
		$KEY_SIZE = $line.IndexOf("=")
		$KEY = $line.Substring(0,$KEY_SIZE)
		$VAL = $line.Substring($KEY_SIZE + 1)
		$CFG[$KEY] = $VAL
	}
}

return $CFG
