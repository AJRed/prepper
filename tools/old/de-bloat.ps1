Write-Output("Starting de-bloat.")
Write-Output("By Andrew Ruedisueli")
$packages = @(
	"Game Bar",
	"Xbox CTUI",
	"Xbox Game Bar Plugin",
	"Xbox Identity Provider",
	"Xbox Game Speech Window",
	"Xbox Console Companion",
	"Phone Link",
	"Movies $ TV",
	"Spotify Music",
	"Mail and Calendar",
	"Copilot",
	"Feedback Hub",
	"Microsoft Pay",
	"Skype",
	"Solitaire & Casual Games",
	"MSN Weather",
	"Microsoft One Drive"
)

Write-Output("Removing packages...")
foreach ($package in $packages)
{
	Write-Output("Removing package: $package")
	winget remove $package
}
