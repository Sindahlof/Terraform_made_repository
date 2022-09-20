provider "github" {
}

resource "github_repository" "my_repository" {
  name        = "Terraform_made_repository"
  description = "This repository was setup using terraform"
  visibility  = "public"

  auto_init          = true
  allow_squash_merge = true
}

resource "github_branch" "init_branch" {
  repository    = github_repository.my_repository.name
  branch        = "terraform_branch"
  source_branch = github_repository.my_repository.default_branch
}

resource "github_branch" "start_from_init" {
  repository    = github_repository.my_repository.name
  branch        = "from_terraform_branch"
  source_branch = github_branch.init_branch.branch
}