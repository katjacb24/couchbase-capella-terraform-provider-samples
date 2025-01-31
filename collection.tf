# (Optional) Stores the collection details in an output variable
# Can be viewed using `terraform output collection` command
output "collection" {
  value = couchbase-capella_collection.new_collection
}


# Collection resource definition
resource "couchbase-capella_collection" "new_collection" {
  organization_id            = var.organization_id
  project_id                 = var.project_id
  cluster_id                 = couchbase-capella_cluster.new_cluster.id
  bucket_id                  = couchbase-capella_bucket.new_bucket.id
  scope_name                 = couchbase-capella_scope.new_scope.scope_name
  collection_name            = var.collection.collection_name
  max_ttl                    = var.collection.max_ttl
}