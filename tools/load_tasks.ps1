$TASK_DIR = $args[0]
$ADD_HP = 0

if ($args[1] -eq "--test") {
	$TASK_STRING = Get-Content("$TASK_DIR/test_tasks")
} elseif ($args[1] -eq "--hpprep") {
	$TASK_STRING = Get-Content("$TASK_DIR/tasks")
	$ADD_HP = 1
} else {
	$TASK_STRING = Get-Content("$TASK_DIR/tasks")
}

$TASKS = [System.Collections.ArrayList]::new()

# Custom prep tasks
if ($ADD_HP)
{
	[void]$TASKS.Add("tools/prep_hp.ps1")
}

# Generic prep tasks (Ends in resetting exec policy)
foreach($line in $TASK_STRING)
{
	[void]$TASKS.Add($line)
}

write-host("Added Tasks:")
foreach ($tline in $TASKS)
{
	write-host($tline)
}

return $TASKS
