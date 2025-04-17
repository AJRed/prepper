#!/usr/bin/pwsh
$CFGDIR = "cfg"
$ROOT = $PSScriptRoot
Set-Location $PSScriptRoot
$CFG = ./tools/load_config.ps1 $CFGDIR
$PASS_ARGS = $args

Write-Host "Starting Prepper v$($CFG['VERSION'])" -ForegroundColor Green

if ($PASS_ARGS)
{
	Write-Output $PASS_ARGS
	if ($PASS_ARGS[0] -eq "--test")
	{
		$TASKS = ./tools/load_tasks.ps1 $CFGDIR "--test"
	}
	else
	{
		$TASKS = ./tools/load_tasks.ps1 $CFGDIR $PASS_ARGS
	}
}
else
{
	$TASKS = ./tools/load_tasks.ps1 $CFGDIR
}
$CONTINUE = 1
foreach($TASK in $TASKS)
{
	if($CONTINUE)
	{
		Write-Host "Running Task: $TASK" -ForegroundColor Green
		$ret = & $TASK
		if ($ret)
		{
			$CONTINUE = 0
		}

	} else
	{
		Write-Host "Fatal Error running task: $TASK. Terminating"
		break
	}

}
