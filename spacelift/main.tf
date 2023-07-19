terraform {

  backend "remote" {

    hostname     = "spacelift.io"
    organization = "ccogan-lh"

    workspaces {

      name = "asdfasfasdf"

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
