terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "decode4youeng"

    workspaces {
      name = "gh-actions"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "HorariosFundos"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ID_FUNDO"
  range_key      = "NOME_FUNDO"

  attribute {
    name = "ID_FUNDO"
    type = "S"
  }

  attribute {
    name = "NOME_FUNDO"
    type = "S"
  }

  attribute {
    name = "HORARIO_FUNDO"
    type = "S"
  }

  attribute {
    name = "HORARIO_CADASTRO"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}