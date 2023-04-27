# aws_eks_serverless_poc

## Deploy Terraform
```bash
terraform init
terraform plan -out=plan.out
terraform apply plan.out
```

## Login to ECR
```bash
aws --profile <AWS_PROFILE> \
  ecr get-login-password \
  --region <AWS_REGION> | \
  docker login \
  --username AWS --password-stdin \
  <AWS_ACCOUNT>.dkr.ecr.<AWS_REGION>.amazonaws.com
```

## Package up springboot_0
```bash
cd docker/springboot_0

mvn clean install
mvn clean package

docker build --platform=linux/amd64 -t <AWS_ACCOUNT>.dkr.ecr.us-east-2.amazonaws.com/aws_eks_serverless_poc_springboot_0:latest .
docker push <AWS_ACCOUNT>.dkr.ecr.us-east-2.amazonaws.com/aws_eks_serverless_poc_springboot_0:latest
```

## Package up springboot_1
```bash
cd docker/springboot_1

mvn clean install
mvn clean package


docker build --platform=linux/amd64 -t <AWS_ACCOUNT>.dkr.ecr.us-east-2.amazonaws.com/aws_eks_serverless_poc_springboot_1:latest .
docker push <AWS_ACCOUNT>.dkr.ecr.us-east-2.amazonaws.com/aws_eks_serverless_poc_springboot_1:latest
```

## Connect to EKS
```bash
aws eks --region <REGION> \
    update-kubeconfig --name <CLUSTER_NAME> \
    --profile <AWS_PROFILE_NAME>
```

## Login to ArgoCD
```bash
kubectl get secret -n argocd argocd-initial-admin-secret --template={{.data.password}} |base64 -D

kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:80
```
go to URL -> https://localhost:8080

## Deploy ALB Ingress Controller
```bash
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.11.1/cert-manager.yaml

helm repo add eks https://aws.github.io/eks-charts
helm repo update
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
    -n kube-system \
    --set clusterName=<CLUSTER_NAME> \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller
```

## Install metrics-server
```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

## Connect ArgoCD to git repo
![argo_repo.png](images%2Fargo_repo.png)

## Deploy to kuberenetes
```bash
cd k8s/master

helm template . |k apply -f -
```
