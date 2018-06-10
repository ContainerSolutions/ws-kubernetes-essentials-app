# Kubernetes Simple Application

## Build Docker Image

`docker build -t web .`
`docker run -p 9292:9292 web`

## Push to Docker Hub

`docker login --username=[DOCKERHUB-USER] --email=[DOCKERHUB-EMAIL]`
`docker build -t [DOCKERHUB-USER]/k8s-simple-app:1.0 .`
`docker push [DOCKERHUB-USER]/k8s-simple-app:1.0`