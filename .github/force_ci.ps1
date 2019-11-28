# force_ci.ps1
# force check suite to be ran
# semi-powershell
# WTFPL
cd (split-path -parent $MyInvocation.MyCommand.Definition)
echo ([int][double]::Parse((Get-Date -UFormat %s))) > .manual_CI.ver
git add .
git commit -m "CI: Build"
git push
