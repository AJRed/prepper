#!/usr/bin/pwsh
#Set-PSDebug -off
$mode = 1 # Set operation mode (0 = testing, 1 = prod)

$projectRoot = @(
    "scripts\prepper",
    "scripts\prepper"
)

$path = $MyInvocation.MyCommand.Path
$path = $path -split "\\", 2
$driveLetter = $path[0]
$exec = @("echo", "cp")
$args = @(
    "`"cp -r $driveLetter\scripts\prepper C:\`"",
    "-r $driveLetter\scripts\prepper C:\",
    "`"Asshole`""
)

$cmd = [string]::Format('{0} {1}',$exec[$mode], $args[$mode])
Invoke-Expression -Command $cmd


#$opt = $opt -split "\n"
#echo $cmd
#echo "cp -r $driveLetter\scripts\prepper" "C:\"

