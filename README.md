# aws_eks_serverless_poc

## Deploy Terraform

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

kubectl apply -f https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.5.1/v2_5_1_full.yaml
```

## Deploy to kuberenetes
```bash
cd k8s/master
helm template . |k apply -f -
```

## Connect ArgoCD to git repo
![argo_repo.png](images%2Fargo_repo.png)
