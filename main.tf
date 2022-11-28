# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "example-org-00eaf8"
#
    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "artworks-1-workspace"
    }
  }
}
#