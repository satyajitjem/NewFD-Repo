terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "rye-${var.system}-cus-web-central-appsvcs-rg"
  location = var.location
  tags      = {
      Environment = var.system
    }
}

resource "azurerm_frontdoor" "rg" {
  name                                         = "rg-${var.system}"
  location                                     = "Global"
  resource_group_name                          = azurerm_resource_group.rg.name
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = var.rulename
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = [var.frontend]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = var.backend
    }
  }

  backend_pool_load_balancing {
    name = var.BackendSetting
  }

  backend_pool_health_probe {
    name = var.HealthProbeSetting
  }

  backend_pool {
    name = var.backend
    backend {
      host_header = var.header
      address     = var.header
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = var.BackendSetting
    health_probe_name   = var.HealthProbeSetting
  }

  frontend_endpoint {
    name                              = var.frontend
    host_name                         = "rg-${var.system}.azurefd.net"
    custom_https_provisioning_enabled = false
  }
}
