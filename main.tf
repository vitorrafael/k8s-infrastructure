terraform {
  backend "remote" {
    organization = "tech-challenge-soat-8-group-6"
  }
}

# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}
