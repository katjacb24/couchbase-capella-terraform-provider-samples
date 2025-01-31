# (Optional) Stores the scope details in an output variable
# Can be viewed using `terraform output scope` command
output "scope" {
  value = couchbase-capella_scope.new_scope
}


# Scope Resource definition
resource "couchbase-capella_scope" "new_scope" {
  organization_id            = var.organization_id
  project_id                 = var.project_id
  cluster_id                 = couchbase-capella_cluster.new_cluster.id
  bucket_id                  = couchbase-capella_bucket.new_bucket.id
  scope_name                 = var.scope.scope_name
}