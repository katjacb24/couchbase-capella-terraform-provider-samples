terraform {
 required_providers {
    couchbase-capella = {
     source = "couchbasecloud/couchbase-capella"
    #  version = "1.4.1"
    }
  }
}

 
# Configure the Couchbase Capella Provider
provider "couchbase-capella" {
    authentication_token = var.auth_token
}
