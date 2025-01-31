# Sample initial configuration

This sample configuration shows how to create a Cluster as described in `cluster.tf` file, a Bucket as described in `bucket.tf` file, a Scope as described in `scope.tf` file, a Collection as described in `collection.tf` file and an App Service as described in `app_service.tf` file in Capella.


# Prerequisites

Terraform Provider with the minimum required version 1.5.2 has to be installed on your computer. Follow the instructions here: https://developer.hashicorp.com/terraform/install. 

An IDE of your choice can be used (e.g. VS Code).

A paid Capella account is required (not the Capella Free Tier Account).

A project has to be created via the Capella UI.


# Walkthrough
## Assign values to the variables used

Assign actual values to the variables in the file `terraform.tfvars`.

The values of the `auth_token`, `organization_id` and `project_id` variables are needed for your authentication in Capella and navigation to the correct Capella project. 

`organization_id`: replace the placeholder with the oid of your tenant (you can copy it from the url once you log into your Capella account)

`project_id`: replace the placeholder with the pid of your project (you can copy it from the url once you log into your Capella account -> go to the tab 'Projects' -> create a project (if not done yet) -> navigate to this project)

`auth_token`: replace the placeholder with the APIKeyToken value of your management API Key (created via Capella UI) for the project specified in the `project_id` variable.

Check the predefined values of other variables and adjust them as needed.

## Initialize the Terraform Provider

Command: `terraform init`

## Create the defined ressources in Capella
### View the plan for the resources that Terraform will create

Command: `terraform plan`

### Apply the Plan, in order to create the resources

Command: `terraform apply`
Confirm with `yes` when prompted.

## Show the details for the deployed ressources
### Show the list of the deployed ressources

Command: `terraform state list`

### Show the details of a specified deployed ressource

Command: `terraform state show couchbase-capella_bucket.new_bucket`

## Destroy the ressources in Capella
### Destroy the ressources that were created by Terraform in Capella

Command: `terraform destroy`
Confirm with `yes` when prompted.