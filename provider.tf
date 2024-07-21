terraform {
  required_version = "~> 1.0"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

provider "newrelic" {
  account_id = 4438266
  api_key = "NRAK-FHKRNTXMEACHLUC4ONZ2E1XF2ZC" 
  region = "US"                        
}

