terraform {
  cloud {
    hostname     = "lucemhealth.scalr.io"
    organization = "env-v0nvs3rsk9a2ivfds"

    workspaces {
      name = "i-make-workspace-with-cli"
    }
  }
}

resource "null_resource" "test_resource" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command     = "echo running terraform for a test"
    working_dir = path.module
  }
}

resource "null_resource" "test_resource_second" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command     = "echo running terraform for a test - second attempt"
    working_dir = path.module
  }
}
