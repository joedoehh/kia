# Kubernetes Dashboard

- follow https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
- manage user: see https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

## create proxy and navigate to dashboard

```
kubectl proxy
```
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/workloads?namespace=default

## install user

```
kubectl apply -f dashboard-adminuser.yml

kubectl apply -f dashboard-clusterrolebinding.yml
```

## create token

create an use token for each login
```
kubectl -n kubernetes-dashboard create token admin-user
```

## create long-lived token
Create long-lived token as secret

```
kubectl apply -f dashboard-secret.yml
```
get the token which saved in the Secret:

```
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d
```

```
eyJhbGciOiJSUzI1NiIsImtpZCI6IjBNOWZ6MTdZUkF6bWFpWVR4VFp0NEMzZnRLNFd5d3BPdVBjUVZUb2VEMkUifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJhZG1pbi11c2VyIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQubmFtZSI6ImFkbWluLXVzZXIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiJmZjg3ZDVmZS0wY2U3LTRjMjctOWVhZC02ZGQ3YTcwNjkyNTAiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZXJuZXRlcy1kYXNoYm9hcmQ6YWRtaW4tdXNlciJ9.Hru-gsgYzb6kRW2J_FnB6slK7inoyjcVr5Qs0IlENQULYEQfiYdJcX44hrNzXB0KcCjHXhhx8iCeBkkLKY6DCpSD-sizJl6jMVKfb7-g7lTLUdFDc1nf1-6jXeHiCdRi7yeCR_rZIFOsBxUc5Rm4XQQpKo7hnwoGh3iQMQxZIbS0qTCDF7MJu6XUiyXTv7KYhOQyoT6CqGLteb5lqM0E7WVG60a6L0eWk8EmbRrHwtmV_bWY6USQpi0Wr4ZWokatedJ8gHkq67v93NlIx4-PO0uzxrizRFkbCjayjMv6FYpe-AUuZzsLyxBw-I-h3sltSGrZ_nHIH7eptSUyFsx7eQ
```

## cleanup 

Remove the admin ServiceAccount and ClusterRoleBinding.

```
kubectl -n kubernetes-dashboard delete serviceaccount admin-user
kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user
```