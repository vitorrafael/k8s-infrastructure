provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_secret" "db_credentials" {
  metadata {
    name = "db-credentials"
  }

  data = {
    POSTGRES_HOST     = data.terraform_remote_state.rds.outputs.rds_endpoint
    POSTGRES_PORT     = data.terraform_remote_state.rds.outputs.rds_port
    POSTGRES_USER     = "postgres"
    POSTGRES_PASSWORD = "MTIzNDU2"
  }
}
