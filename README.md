# k8s-pods-service
Kubernetes - Create Cluster with Terraform and create Pods and Service, of type Load Balancer with manifest yaml 

Goal:
- An HTML page rendering the text "MY CONTAINER - NAME" will be browsable at the URL http://<IP>:80/
  - Where "NAME" is the pod name that is serving the response
  - Where "<IP>" is a Public IP associated to a Kubernetes Service of type Load Balancer

Expectations:
- Everything will done by code, no manual action will be considered in the review
- The Azure Cloud Resources will be created in the Resource Group: Giacomo-Quaglia-001
- Stack: Kubernetes Cluster with:
  - 1 node
  - 2 pods with a NGINX container exposing the request HTML page on the port 80
  - 1 Service of type Load Balancer exposing on port 8080 the 2 pods
- The Cloud Resources provisioning will be done ONLY through Terraform
  - The Azure credentials for Terraform are available in the LastPass shared folder "Shared-Tutoring Giacomo Quaglia"
- The Kubernetes Resources/Manifest will be applied through a local script to run after the Cloud Resources provisioning, using the kubectl tool
- The work, to be considered done, should be pushed in the git repository "tutoring_giacomo-quaglia_terraform-001"
  - branch name: "tickets/<current_ticket_id>"
  - in the root directory should be present all code used
