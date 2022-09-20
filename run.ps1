param(
    [Parameter(Mandatory=$true)]
    [string] $GITHUB_TOKEN
)
$software = "+";

$string = dir env:path | select-Object -property Value
$installed = ($string -like "*scoop*")
If(-Not $installed) {
	Invoke-RestMethod get.scoop.sh | Invoke-Expression
    write-host "scoop installed"
}

scoop install terraform
Write-host "Terraform Installed"

Set-Item -Path env:GITHUB_TOKEN -Value $GITHUB_TOKEN
Write-host "Environmental variable set"

terraform init 
Write-host "terraform initialised"

terraform fmt
write-host "syntax formated"

terraform apply -target github_repository.my_repository -target github_branch.init_branch -auto-approve
write-host "repository and terraform branch made"

terraform apply -auto-approve
Write-Host "Github repository created"