terraform {
  cloud {
    organization = "seunorg"

    workspaces {
      name = "graylog-prod"
    }
  }

  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
