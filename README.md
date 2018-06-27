# Terraform

Terraform
Terraform is command line tool for building, changing, and versioning infrastructure, it supports popular cloud providers including Amazon AWS. Configuration files describe the infrastructure components needed to run a single application, for example, an EC2 instance with an attached EBS volume.

Terraform generates an execution plan, describing what it will do to reach the desired state, then executes it to build the described infrastructure. As the configuration changes, Terraform is able to determine what has changed and creates incremental execution plans that can be applied. The actual state of AWS resources managed by Terraform is stored in a terraform.tfstate file that is created after the first run of Terraform.

Key Features of Terraform
Infrastructure as code: Infrastructure is described using a high-level configuration syntax. This allows a blueprint of your datacenter to be versioned and treated as you would any other code. Additionally, infrastructure can be shared and re-used.
Execution plans: Terraform has a “planning” step where it generates an execution plan. The execution plan shows what Terraform will do when you call apply. This lets you avoid any surprises when Terraform manipulates infrastructure.
Resource graph: Terraform builds a graph of all your resources in order to create or modify non-dependent resources. Because of this, Terraform builds infrastructure as efficiently as possible, and operators get insight into dependencies in their infrastructure.
Change automation: Complex changesets can be applied to your infrastructure with minimal human interaction. With the previously mentioned execution plan and resource graph, you know exactly what Terraform will change and in what order, avoiding many possible human errors.
Example:

resource "aws_instance" "web" {
    ami = "ami-12345678"
    instance_type = "t1.micro"
    tags {
        Name = "HelloWorld"
    }
    security_groups = [ "${aws_security_group.my_security_group.id}" ]
}
aws_instance is the TYPE of resource to be created. In this example, it’s an AWS EC2 instance

web is the NAME of a resource that is addressable within the Terraform configuration file.

Read more:

Terraform configuration syntax
Terraform resources

Usage
terraform.tfvars holds variables which should be overriden with valid ones.

Plan
terraform plan -var-file terraform.tfvars
Apply
terraform apply -var-file terraform.tfvars
Destroy
terraform destroy -var-file terraform.tfvars
