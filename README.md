## Utilizing Terraform to provision a Kubernetes cluster in AWS EKS

## Prerequisites:
- AWS account
- AWS CLI installed
- Cloud9, VSCode or similar IDE
- Kubectl installed
- Kubernetes CLI installed
- Basic Kubernetes knowledge
- Terraform installed
- Basic Terraform knowledge

## Objectives:
- Set up AWS credentials
- Install kubectl (if not already done)
- Configure working directory & add terraform files to create Kubernetes cluster infrastructure
- Deploy the Kubernetes cluster with terraform
- Configure kubectl & confirm deploymet
- Clean up

## Set Up AWS Credentials
```
export AWS_ACCESS_KEY_ID="<access_key>"
export AWS_SECRET_ACCESS_KEY="<secret_key>"
export AWS_DEFAULT_REGION=<region>
```
## Install Kubectl
```
kubectl version --short--client
```
For Installation - https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

## Configure working directory
Create work directory and add terraform files

## Deploy Kubernetes Cluster with Terraform
Initialize the backend, modules, and provider plugins defined in code. Because we didn’t explicitly define a backend, Terraform will use the local backend.
```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```
## Configure kubectl
```
aws eks update-kubeconfig --region <region> --name <EKS_cluster_name>
kubectl cluster-info
kubectl get nodes
```
<img width="960" alt="Screenshot 2023-07-03 104748" src="https://github.com/toba-0x7/repo-rainfall/assets/89642129/242b528b-9bc0-4360-9586-3c6d1eeb3bbf">

## Clean Up
```
terraform destroy
```



