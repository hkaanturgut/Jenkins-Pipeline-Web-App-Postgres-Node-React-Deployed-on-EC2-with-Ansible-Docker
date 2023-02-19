# Jenkins Pipeline for Web Page Application (Postgresql-Nodejs-React) deployed on EC2's with Ansible and Docker

## Description

The goal of this project is to develop a Jenkins pipeline for deploying a web page built with Nodejs and React frameworks on AWS Cloud infrastructure using Ansible. The infrastructure building process is managed with a control node utilizing Ansible. The infrastructure consists of one Jenkins server (Amazon Linux 2 AMI) as the Ansible control node and three EC2 worker nodes (Red Hat Enterprise Linux 8 with High Availability), which are launched on the AWS console. The web page is composed of three primary components - PostgreSQL, Nodejs, and React - each of which is served in a Docker container on a dedicated EC2 instance. PostgreSQL serves as the web page's database, while Nodejs controls the backend and React handles the frontend.
#

## Project Details

![image](https://user-images.githubusercontent.com/113396342/219977455-1bab8d5e-a213-48c1-975a-482aabc78160.png)

- Web-page allows users to collect their infos. Registration data should be kept in separate PostgreSQL database located in one of EC2s. Nodejs framework controls backend and serves on port 5000, it is also connected to the PostgreSQL database on port 5432. React framework controls the frontend and it is also connected to the Nodejs server on port 5000. React server broadcasts web-page on port 3000.

- The Web Application will be deployed using Nodejs and React framework.

- The Web Application should be accessible via web browser from anywhere on port 3000.

- EC2s and their security groups should be created on AWS with Terraform.

- The rest of the process has to be controlled with control node which is connected SSH port.

- Codes should be pulled from the Repo into the Jenkins server and sent them to the EC2s from there with Ansible.

- Postgresql, Nodejs and React parts has to be placed in docker container.

- Launch an EC2 for each postgresql, nodejs and react docker container. In addition, write one playbook for this project to install and configure docker and create containers in each instances.

- Use AWS ECR as image repository, to create Docker Containers with 3 managed nodes (postgresql, nodejs and react EC2 instances).

- All process has to be controlled into the `jenkins server` as control node.

- Dynamic inventory (`inventory_aws_ec2.yml`) has to be used for inventory file.

- Ansible config file (`ansible.cfg`) has to be placed in jenkins server.

- Docker should be installed in all worker nodes using ansible.

- Docker images should be build in jenkins server and pushed to the AWS ECR.

- For PostgreSQL worker node

    - Docker image should be created for PostgreSQL container with `dockerfile-postgresql` and `init.sql` file should be placed under necessary folder.

    - Docker images should be build in jenkins server from `dockerfile-postgresql` and pushed to the AWS ECR.

    - Create PostgreSQL container in the worker node. Do not forget to set password as environmental variable.

    - This instance's security group should accept traffic from PostgreSQL's dedicated port from Nodejs EC2 and port 22 from anywhere.

    - To keep database's data, volume has to be created with docker container and necessary file(s) should be kept under this file.

- For Nodejs worker node

	- Make sure to correct or create `.env` file under `server` folder based on PostgreSQL environmental variables. To automate taking private ip of postgresql instance you can use linux `envsubst` command with env-template.

	- Docker image should be created for nodejs container with dockerfile-nodejs and `server` files should be placed under necessary folder. This file will use for docker image. You don't need any extra file for creating Nodejs image.

	- Docker image should be built for Nodejs container in jenkins server from `dockerfile-nodejs` and pushed to the AWS ECR.

	- Create Nodejs container in nodejs instance with ansible and publish it on port 5000.

	- This instance's security group should accept traffic from 5000, 22 dedicated port from anywhere.

- For React worker node

	- Make sure to correct `.env` file under `client` folder based on Nodejs environmental variables. To automate taking public ip of nodejs instance, you can use linux `envsubst` command with env-template.

	- Docker image should be created for react container with dockerfile-react and `client` files should be placed under necessary folder. This file will be used for docker image. You don't need any extra file for creating react image.

	- Docker image should be built for React container in jenkins server from `dockerfile-react` and pushed to the AWS ECR.

	- Create React container and publish it on port 3000.

	- This instance's security group should accept traffic from 3000, and 80 dedicated port from anywhere.

- To use the AWS ECR as image repository;

	- Enable the instances with IAM Role allowing them to work with ECR repos using the instance profile.

	- Install AWS CLI `Version 2` on worker node instances to use `aws ecr` commands.

- To create a Jenkins Pipeline, you need to launch a Jenkins Server with security group allowing SSH (port 22) and HTTP (ports 80, 8080) connections. For this purpose, you can use pre-configured [*Terraform configuration file for Jenkins Server enabled with Git, Docker, Terraform, Ansible and also configured to work with AWS ECR using IAM role*](./jenkins_server/install-jenkins.tf).

- Create a Jenkins Pipeline with following configuration;

  - Build the infrastructure for the app on EC2 instances using Terraform configuration file.

  - Create an image repository on ECR for the app.

  - Build the application Docker image and push it to the same ECR repository with different tags.

  - Deploy the application on AWS EC2's with ansible.

  - Make a failure stage and ensure to destroy infrastructure, ECR repo and docker images when the pipeline failed.
  #
  
  # Steps
  
 - Create a Jenkins server runs in EC2 instance and a security group with Terraform
   - <a href="https://github.com/hkaanturgut/Jenkins-Pipeline-Web-App-Postgres-Node-React-Deployed-on-EC2-with-Ansible-Docker/tree/main/jenkins_server" target="_blank">Terraform Codes</a> 

![Screenshot 2023-02-19 at 9 36 27 AM](https://user-images.githubusercontent.com/113396342/219977662-f4b1ba2d-3289-4110-9ed8-a5b409e1736a.png)
#

- Go to Jenkins server from the EC2's port 8080 

- To be able to start using Jenkins , we need our Admin Password. 
  - Login to Ec2 and write this command. Then copy your password and paste to the Jenkins
        
        - sudo cat /var/lib/jenkins/secrets/initialAdminPassword
        
- Go on and complete the Jenkins set up 

![Screenshot 2023-02-19 at 9 36 42 AM](https://user-images.githubusercontent.com/113396342/219977690-7a7ce09e-ecbb-42cc-a4c5-b84b05c91d42.png)
#

- Install ( Ansible and Terraform ) plugins to our Jenkins as the project pipeline will be working with them later

![Screenshot 2023-02-19 at 9 41 58 AM](https://user-images.githubusercontent.com/113396342/219978001-83f1223d-d019-4f87-89ae-2f553966aafe.png)
#

- Configure the Ansible and Terraform from ;
  
    - Manage Jenkins > Configuration tools
    
![Screenshot 2023-02-19 at 9 44 58 AM](https://user-images.githubusercontent.com/113396342/219978118-07847b96-eb67-4880-9683-b8a8ab1ed960.png)

- Found where Ansible and Terraform works in the Ec2 like this 

![Screenshot 2023-02-19 at 9 44 29 AM](https://user-images.githubusercontent.com/113396342/219978150-c032a6f4-036f-4c9c-9464-768f95a65f8d.png)
#

- Add credentials in order to make connection with the Github repo and let Ansible make the connection with the worker nodes in the pipeline with a private key

  - In order to add the Ansible credentials , create a new key pair for it
  
![Screenshot 2023-02-19 at 10 09 43 AM](https://user-images.githubusercontent.com/113396342/219978341-4f2cc8fe-b5be-4396-a5bb-e436bc386e67.png)

  - Copy the private key content and paste it here 
  
![Screenshot 2023-02-19 at 10 12 45 AM](https://user-images.githubusercontent.com/113396342/219978384-d2e585e7-8429-4b6e-908e-f107496158f2.png)

  - In order to connect your repo with Jenkins , create a token and paste it in the password box ( also your token's name in the username )
  
![Screenshot 2023-02-19 at 10 12 45 AM](https://user-images.githubusercontent.com/113396342/219978486-b46d9332-fd46-4055-9156-5b8ef290d583.png)
#


  


