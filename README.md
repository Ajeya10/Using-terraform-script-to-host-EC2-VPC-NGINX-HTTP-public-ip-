# Terraform AWS Nginx Deployment

## Overview
This project uses *Terraform* to deploy an *AWS VPC* with a public and private subnet, an EC2 instance running *Nginx, and the necessary security configurations. The EC2 instance is configured to automatically install and start **Nginx* upon creation.

## Infrastructure Components
- *AWS VPC* (10.0.0.0/16)
- *Public Subnet* (10.0.2.0/24) with auto-assign public IP enabled
- *Private Subnet* (10.0.1.0/24)
- *Internet Gateway* for public internet access
- *Route Table* for public subnet routing to the internet
- *Security Group* allowing HTTP (port 80) access
- *EC2 Instance* running Nginx with public access

## Prerequisites
Before you begin, ensure you have the following installed:
- *Terraform* (https://developer.hashicorp.com/terraform/downloads)
- *AWS CLI* (https://aws.amazon.com/cli/)
- AWS credentials configured (~/.aws/credentials or environment variables)

## Deployment Steps
### 1. Clone the Repository
sh
 git clone https://github.com/your-username/terraform-nginx-aws.git
 cd terraform-nginx-aws


### 2. Initialize Terraform
sh
terraform init


### 3. Validate Configuration
sh
terraform validate


### 4. Deploy Infrastructure
sh
terraform apply -auto-approve


### 5. Access Nginx Server
Once the deployment is complete, retrieve the public IP:
sh
echo $(terraform output instance_public_ip)

Now, open a browser and visit:

http://<EC2_PUBLIC_IP>

You should see the *Nginx welcome page*.

## Destroying the Infrastructure
To remove all resources and avoid unnecessary costs:
sh
terraform destroy -auto-approve


## Troubleshooting
- *If the site is not loading:*
  - Ensure the *EC2 instance* is running.
  - Check that the *Security Group* allows HTTP traffic (0.0.0.0/0 on port 80).
  - SSH into the instance and restart Nginx:
    sh
    ssh -i your-key.pem ec2-user@<EC2_PUBLIC_IP>
    sudo systemctl restart nginx
    

## Future Enhancements
- Add *NAT Gateway* for private subnet internet access.
- Use *Load Balancer* for better availability.
- Configure *Auto Scaling* for handling high traffic.

## Author
*Your Name*  
GitHub: [your-username](https://github.com/Ajeya10)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
