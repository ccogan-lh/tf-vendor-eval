terraform {
  backend "remote" {
    hostname     = "backend.api.env0.com"
    organization = "46a603a0-5d87-49cb-877f-86605f8c55c6"

    workspaces {
      name = "test"
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
