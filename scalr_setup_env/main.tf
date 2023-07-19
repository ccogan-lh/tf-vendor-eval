terraform {
  required_providers {
    scalr = {
      source  = "registry.scalr.io/scalr/scalr"
      version = "~> 1.0.0"
    }
  }
}

provider "scalr" {
  hostname = "lucemhealth.scalr.io"
  token    = var.api_token
}

data "scalr_environment" "a_env_for_test" {
  name       = "Environment A"
  account_id = "acc-v0nvs3rsjnc26blnl"
}



resource "scalr_workspace" "cli-driven" {
  name           = "i-make-workspace-with-cli"
  environment_id = data.scalr_environment.a_env_for_test.id

  execution_mode = "local"
}
