# Declaration of the variables used

variable "auth_token" {
  description = "Authentication API Key"
  sensitive = true
}

variable "organization_id" {
  description = "Capella Organization ID"
}

variable "project_id" {
  description = "Project ID"
}

variable "cluster" {
  description = "Cluster configuration details used for cluster creation"

  type = object({
    name               = string
    cidr               = string
    node_count         = number
    couchbase_services = list(string)
    availability_zone  = string
  })
}

variable "cloud_provider" {
  description = "Cloud Provider details used for cluster creation"

  type = object({
    name   = string
    region = string
  })
}

variable "compute" {
  description = "Cluster nodes compute configuration"

  type = object({
    cpu = number
    ram = number
  })
}

variable "disk" {
  description = "Cluster nodes disk configuration"

  type = object({
    size = optional(number)
    type = string
    iops = optional(number)
  })
}

variable "support" {
  description = "Support configuration applicable to the cluster during creation"

  type = object({
    plan     = string
    timezone = string
  })
}

variable "bucket" {
  description = "Bucket configuration details used for creation"

  type = object({
    name                       = string
    type                       = optional(string)
    storage_backend            = optional(string)
    memory_allocation_in_mb    = optional(number)
    bucket_conflict_resolution = optional(string)
    durability_level           = optional(string)
    replicas                   = optional(number)
    flush                      = optional(bool)
    time_to_live_in_seconds    = optional(number)
    eviction_policy            = optional(string)
  })
}

variable "scope" {
  description = "Scope configuration details used for creation"

  type = object({
    scope_name = string
  })
}

variable "collection" {
  description = "Collection configuration details used for creation"

  type = object({
    collection_name = string
    max_ttl         = optional(number)
  })
}

variable "app_service" {
  description = "App Service configuration details used for creation"

  type = object({
    name        = string
    description = optional(string)
    nodes       = optional(number)
    compute = object({
      cpu = number
      ram = number
    })
  })
}