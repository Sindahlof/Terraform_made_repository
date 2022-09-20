
resource "github_repository_file" "files_tf" {
  repository = github_repository.my_repository.name
  branch     = "terraform_branch"
  file       = "files.tf"
  content    = file("${path.module}/files.tf")
}

resource "github_repository_file" "readme" {
  repository = github_repository.my_repository.name
  branch     = github_repository.my_repository.default_branch
  file       = "readme.md"
  content    = file("${path.module}/readme.md")
}
resource "github_repository_file" "terraform_file" {
  repository = github_repository.my_repository.name
  branch     = "terraform_branch"
  file       = "main.tf"

  content             = file("${path.module}/main.tf")
  overwrite_on_create = true
}

resource "github_repository_file" "Powershell_script" {
  repository = github_repository.my_repository.name
  branch     = "terraform_branch"
  file       = "run.ps1"

  content             = file("${path.module}/run.ps1")
  overwrite_on_create = true
}