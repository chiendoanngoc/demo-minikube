# Start minikube with docker
minikube start --driver=docker

### For Windows
@FOR /f "tokens=*" %i IN ('minikube -p minikube docker-env') DO @%i

## Build docker image
docker build -t my-1st-app:latest .

docker build -t my-2nd-app:latest .

## Create namespaces, deployments, services
kubectl apply -f namespace-1st-app.yaml

kubectl apply -f namespace-2nd-app.yaml

kubectl get namespaces

kubectl apply -f deployment-1st-app.yaml

kubectl apply -f deployment-2nd-app.yaml

kubectl get deployments --all-namespaces

kubectl get pods --all-namespaces

kubectl apply -f service-1st-app.yaml

kubectl apply -f service-2nd-app.yaml

kubectl get services --all-namespaces

## Get service url

minikube service service-2nd-app --url -n 2nd-app-namespace

## Test API service-2nd-app

**/hello**: test response from service-2nd-app only

**/second-app**: service-2nd-app call service-1st-app, test response from both service

## Clean up command example

kubectl delete deployment 1st-app-deployment -n 1st-app-namespace

docker rmi my-2nd-app:latest

# Test on multiple nodes

## Add one more node

minikube node add

### Get list of pods with nodes in which they are running

kubectl get pods -o wide --all-namespaces

## Build docker image

docker build -t my-3rd-app:latest .