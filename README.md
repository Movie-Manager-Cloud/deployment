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

### Deploy with helm

Simply run the following command to deploy all ressources for your application with a nginx controller.

```bash
./deploy_helm.sh
```

The helm part for back-end,database and front-end will be moove in the futur to their respective repository, and Github secret wil be use to pass throw the organisation the secret that are necessary to let helm connect to the cluster.