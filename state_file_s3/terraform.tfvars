bucket_name = "berchev-terraform-up-and-running-state"

terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket  = "berchev-terraform-up-and-running-state"
      key     = "./terraform.tfstate"
      region  = "us-east-1"
      encrypt = true
      lock_table = "my-lock-table"
    }
  }
}