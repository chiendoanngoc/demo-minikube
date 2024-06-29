### Danh sách câu lệnh

minikube start --driver=docker

@FOR /f "tokens=*" %i IN ('minikube -p minikube docker-env') DO @%i

docker build -t my-spring-boot-app:latest .

kubectl create namespace 1st-app-namespace

kubectl apply -f deployment.yaml -n 1st-app-namespace

kubectl get deployments -n 1st-app-namespace

kubectl get pods -n 1st-app-namespace  

kubectl delete deployment 1st-app-deployment -n 1st-app-namespace

kubectl get services -n 1st-app-namespace 

minikube service service-1st-app --url -n 1st-app-namespace

docker rmi my-2nd-app:latest
