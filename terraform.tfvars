# Assigning values to the declared variables

auth_token = "<replace-with-v4-api-key-secret>"

organization_id = "<replace-with-the-oid-of-your-tenant>"

project_id = "<replace-with-the-pid>"

cluster = {
  name               = "New Terraform Cluster"
  cidr               = "10.0.21.0/24"
  node_count         = 3
  couchbase_services = ["data", "index", "query"]
  availability_zone  = "multi"
}

cloud_provider = {
  name   = "aws",
  region = "us-east-1"
}

compute = {
  cpu = 4
  ram = 16
}

disk = {
  size = 50
  type = "io2"
  iops = 5000
}

support = {
  plan     = "developer pro"
  timezone = "PT"
}

bucket = {
  name                       = "terraform_bucket"
  type                       = "couchbase"
  storage_backend            = "couchstore"
  memory_allocation_in_mb    = 100
  bucket_conflict_resolution = "seqno"
  durability_level           = "none"
  replicas                   = 1
  flush                      = false
  time_to_live_in_seconds    = 0
  eviction_policy            = "fullEviction"
}

scope = {
  scope_name = "terraform_scope"
}

collection = {
  collection_name = "terraform_collection"
  max_ttl         = 200
}

app_service = {
  name        = "terraform-app-service"
  description = "My Terraform app service."
  nodes       = 2
  compute = {
    cpu = 4
    ram = 8
  }
}