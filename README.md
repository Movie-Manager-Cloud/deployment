# deployment
Deploy the application on the cloud with Terraform

## Deployment step

### Set the AWS env

```bash
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
```

### Deploy the terraform
```bash
terraform init
terraform apply
```

### Configure the Kubectl command line

Now you need to connect to the newly cluster created

```bash
./configure_kubectl.sh
```

Enjoy deploying with Kube !