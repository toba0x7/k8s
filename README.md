**Utilizing Terraform to provision a Kubernetes cluster in AWS EKS**

**Prerequisites:**\
AWS account\
Cloud9, VSCode or similar IDE\
Kubernetes CLI installed\
Kubectl installed\
AWS CLI installed\
Terraform installed\
Basic Terraform knowledge\
Basic Kubernetes knowledge


**Objectives:**\
Set up AWS credentials\
Install kubectl (if not already done)\
Configure working directory & add terraform files to create Kubernetes cluster infrastructure\
Deploy the Kubernetes cluster\
Clean up

**Set Up AWS Credentials**
```
export AWS_ACCESS_KEY_ID="<access_key>"
export AWS_SECRET_ACCESS_KEY="<secret_key>"
export AWS_DEFAULT_REGION=<region>
```

**Install Kubectl**
```
kubectl version --short--client
```
For Installation - https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

**Configure working directory**\
Create work directory and add terraform files

**Deploy Kubernetes Cluster with Terraform**\
Initialize the backend, modules, and provider plugins defined in code. Because we didn’t explicitly define a backend, Terraform will use the local backend.
```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

**Configure kubectl**
```
aws eks update-kubeconfig --region <region> --name <EKS_cluster_name>
kubectl cluster-info
kubectl get nodes
```

**Clean Up**
```
terraform destroy
```



