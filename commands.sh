 kubectl create deployment my-deployment1 --image=nginx
kubectl expose deployment my-deployment1 --port=80 --type=NodePort --name=my-service1
 kubectl get services
kubectl get pods | awk 'awk NR>1 ${print 1}'
