# Terraform
At Smartling, we’re implementing Service Oriented Architecture (SOA). According to our vision of SOA and service ownership, every tech team owns and runs services in Amazon Web Services (AWS). Developers from each team have their own AWS account and can launch, support, deploy, and maintain AWS infrastructure for services they own using Terraform and a set of templates.

Our developers passed a set of AWS/Terraform workshops covering AWS basics like Elastic Compute (EC2), Elastic Block Storage (EBS), Elastic Load Balancing (ELB), as well as Terraform syntax and best practices in this field.

Now we’re sharing those workshops with you. In this post, you’ll find our introductory workshop, covering Terraform and AWS EC2.

Prerequisites
  Amazon AWS
  Read introduction to AWS
  Get access to your AWS account
  Get your AWS access and secret keys
  Terraform
  Read introduction to Terraform
  Install latest version Terraform
Other
Clone: Smartling/aws-terraform-workshops 
Git repository: Get ready your public SSH key and SSH client
Preface
EC2
EC2 stands for Elastic Compute Cloud — the service that provides scalable computing capacity in the Amazon Web Services (AWS) cloud. Using EC2, you can launch virtual servers, setup networking and security for them, and attach storage, public IP addresses, or associated domain names. EC2 lets you scale up or down computing resources depending on changes in requirements or spikes in popularity, reducing your need to forecast traffic.

When you launch an instance, you associate it with one or more security groups: virtual firewalls enforcing a set of rules that control the traffic to and from instances. AMI (Amazon Machine Image) is a template that contains a software configuration, including an operating system and packages. Using AMI, you can launch an instance that contains a copy of the AMI running as a virtual server in AWS cloud.

Locations for running EC2 instances are composed of regions and availability zones. Each region is a separate geographic area. Each region has multiple, isolated locations known as Availability Zones. Amazon EC2 provides you the ability to place resources, such as instances and data, in multiple locations.

EBS (Elastic Block Store) provides block level storage volumes for use with EC2 instances. You can create highly reliable EBS volumes and attach them to any running instance that is in the same Availability Zone. EBS volumes that are attached to an EC2 instance are exposed as storage volumes that persist independently from the life of the instance.

On-demand EC2 instances let you pay by the hour with no long-term commitments. Price varies considerably, based on instance type and attached storage. Internet traffic, public IP addresses, load balancing, and detailed monitoring resources are paid separately. There are options to reduce costs by upfront payments like instances reservations.

Read more:

AWS EC2 Cloud Features Explained
AWS EC2 Concepts
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
