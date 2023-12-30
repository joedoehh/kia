# Kubernetes In Action

## interacting with a pod

### connect to a pod (from a one-off client pod inside the cluster)

docker desktop: connect with an curl image running in the cluster (create a pod with a shell- see https://www.tutorialworks.com/kubernetes-curl/)

```
kc run mycurlpod --image=curlimages/curl -i --tty -- sh
kc run myubi8pod --image=redhat/ubi8 -i --tty -- sh
```

define IP+Port

```
kc get pod NAME
kc describe pod NAME 
```

curl the pod

```
curl 10.244.2.4:8080
```

housekeeping

```
kc delete pods mycurlpod
```

### via kubectl port forwarding

```
$ kubectl port-forward POD-NAME 8080
... Forwarding from 127.0.0.1:8080 -> 8080
... Forwarding from [::1]:8080 -> 8080
```

### read logs

```
$ kubectl logs POD-NAME [-f] [--timestamps=true]
```

### copying files

```
$ kubectl cp POD-NAME:html/index.html /tmp/index.html
```

### execute commands in a running container

```
$ kubectl exec POD-NAME -- ps aux
USER  PID %CPU %MEM    VSZ   RSS TTY STAT START TIME COMMAND
root    1  0.0  1.3 812860 27356 ?   Ssl  11:54 0:00 node app.js
root  120  0.0  0.1  17500  2128 ?   Rs   12:22 0:00 ps aux

$ kubectl exec POD-NAME -- curl -s localhost:8080

$ kubectl exec -it POD-NAME -- bash
```

### attaching to a running container

```
$ kubectl attach POD-NAME
Defaulting container name to kiada.
Use 'kubectl describe pod/kiada -n default' to see all of the containers in this pod.
If you don't see a command prompt, try pressing enter.
```