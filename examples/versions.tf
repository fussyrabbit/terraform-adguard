terraform {
  required_version = ">= 1.0"

  required_providers {
    adguard = {
      source  = "gmichels/adguard"
      version = "1.3.0"
    }
  }
}
