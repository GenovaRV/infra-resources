#terraform {
#  backend "s3" {
#    bucket         = "my-terraform-state"
#    key            = "path/to/my/key"
#    region         = "us-east-1"
#    encrypt        = true
#    dynamodb_table = "terraform-locks"
#  }
#}
