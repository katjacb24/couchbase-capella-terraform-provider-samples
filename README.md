
# Configure and create a Cluster, a Bucket, a Scope, a Collection and an App Service in Couchbase Capella using Terraform

## Description

This walkthrough demonstrates how to configure and create a Cluster (as described in `cluster.tf` file), a Bucket (as described in `bucket.tf` file), a Scope (as described in `scope.tf` file), a Collection (as described in `collection.tf` file) and an App Service (as described in `app_service.tf` file) in Couchbase Capella using Terraform.


## Prerequisites

Terraform Provider with the minimum required version 1.5.2 has to be installed on your computer. Follow the instructions here: https://developer.hashicorp.com/terraform/install. 

An IDE of your choice can be used (e.g. VS Code).

A paid Capella account is required (Capella Free Tier Account is not supported by the Terraform Provider).

A project has to be created via the Capella UI.


## Walkthrough
### Declare the variables and assign values to these variables

The file `variables.tf` contains the declaration of all the variables that are used in this walkthrough.
The file `terraform.tfvars` contains the actual values that are assigned to these variables for this walkthrough.

#### Exchange placeholders with the actual values in the file `terraform.tfvars`.

The values of the `organization_id`, `project_id` and `auth_token` variables are needed for your authentication in Capella and navigation to the correct Capella project: 

`organization_id`: replace the placeholder with the oid of your tenant (you can copy it from the url once you log into your Capella account)

`project_id`: replace the placeholder with the pid of your project (you can copy it from the url once you log into your Capella account -> go to the tab 'Projects' -> create a project (if not done yet) -> navigate to this project)

`auth_token`: replace the placeholder with the APIKeyToken value of your management API Key (created via Capella UI) for the project specified in the `project_id` variable.

Check the predefined values of other variables in this file and adjust them as needed.

### Initialize the Terraform Provider

Run Command: initializes a working directory containing Terraform configuration files. This command that should be run after writing a new Terraform configuration or cloning an existing one from version control.

```sh
terraform init
```


### Option 1: Create the defined ressources in Capella one by one

> [!Note]
> In order to create ressources one by one in this walkthrough, we will use `-target=ADDRESS` option in the following Terraform commands. 
> This option instructs Terraform to focus its planning efforts only on resource instances which match the given address (<resource_type>.<resource_name>) and on any objects that those instances depend on.
> In your projects, use this option in exceptional circumstances only, such as recovering from mistakes or working around Terraform limitations and use Option 2 below 'Create all the defined ressources in Capella at once' for usual use cases.

#### Create a Cluster inside of your Capella project with the configuration defined in the file `cluster.tf`
**View the plan for the Cluster that Terraform will create**

Run Command: creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

```sh
terraform plan -target=couchbase-capella_cluster.new_cluster
```

**Apply the Plan, in order to create the Cluster**

Run Command: executes the actions proposed in the Terraform plan.

```sh
terraform apply -target=couchbase-capella_cluster.new_cluster
```
Confirm with `yes` when prompted.

> [!Note]
> If you get an error in the Terminal because of the CIDR value, try changing its value in the file `terraform.tfvars` e.g. to "10.0.28.0/24" or similar.

#### Create a Bucket inside of the newly created Cluster with the configuration defined in the file `bucket.tf`
**View the plan for the Bucket that Terraform will create**

Run Command: creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

```sh
terraform plan -target=couchbase-capella_bucket.new_bucket
```

**Apply the Plan, in order to create the Bucket**

Run Command: executes the actions proposed in the Terraform plan.

```sh
terraform apply -target=couchbase-capella_bucket.new_bucket
```
Confirm with `yes` when prompted.

#### Create a Scope for the newly created Bucket with the configuration defined in the file `scope.tf`
**View the plan for the Scope that Terraform will create**

Run Command: creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

```sh
terraform plan -target=couchbase-capella_scope.new_scope
```

**Apply the Plan, in order to create the Scope**

Run Command: executes the actions proposed in the Terraform plan.

```sh
terraform apply -target=couchbase-capella_scope.new_scope
```
Confirm with `yes` when prompted.

#### Create a Collection inside of the newly created Scope with the configuration defined in the file `collection.tf`
**View the plan for the Collection that Terraform will create**

Run Command: creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

```sh
terraform plan -target=couchbase-capella_collection.new_collection
```

**Apply the Plan, in order to create the Collection**

Run Command: executes the actions proposed in the Terraform plan.

```sh
terraform apply -target=couchbase-capella_collection.new_collection
```
Confirm with `yes` when prompted.

#### Create an App Service for the newly created Cluster with the configuration defined in the file `app_service.tf`
**View the plan for the App Service that Terraform will create**

Run Command: creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.

```sh
terraform plan -target=couchbase-capella_app_service.new_app_service
```

**Apply the Plan, in order to create the App Service**

Run Command: executes the actions proposed in the Terraform plan.

```sh
terraform apply -target=couchbase-capella_app_service.new_app_service
```
Confirm with `yes` when prompted.


### Option 2: Create all the defined ressources in Capella at once
#### View the plan for the resources that Terraform will create

Run Command: creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure. 

```sh
terraform plan
```

#### Apply the Plan, in order to create the resources

Run Command: executes the actions proposed in the Terraform plan.

```sh
terraform apply
```
Confirm with `yes` when prompted.


### Show the details for the deployed ressources
#### Show the list of the deployed ressources

Run Command: lists all resources in the state file.

```sh
terraform state list
```

#### Show the details of a specified deployed ressource

Run Command: shows the attributes of a single resource in the Terraform state.

```sh
terraform state show couchbase-capella_bucket.new_bucket
```

### Destroy the ressources in Capella
#### Destroy the ressources that were created by Terraform in Capella

Run Command: a convenient way to destroy all remote objects managed by a particular Terraform configuration.

```sh
terraform destroy
```
Confirm with `yes` when prompted.


## Conclusion

This walkthrough provides a comprehensive example of how to configure and create such Capella ressources as a Cluster, a Bucket, a Scope, a Collection and an App Service in your Capella account programatically with the help of the Couchbase Capella Terraform Provider instead of using the Capella UI for this. This approach allows you to manage your Capella ressources quickly and in an iterative manner using Terraform commands.  