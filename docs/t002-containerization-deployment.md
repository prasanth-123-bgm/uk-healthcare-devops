# T-002 — Containerization & Deployment Automation

## Objective

Implement containerization and deployment automation for the available healthcare CI/CD validation application using Docker, Terraform, and Docker Compose.

The implementation validates the Cloud & DevOps workflow within the available project scope. It does not represent production deployment of the complete healthcare platform.

---

## 1. Dockerization

### Dockerfile

A multi-stage Dockerfile was created to build and run the Java application.

The build stage uses Maven with Eclipse Temurin Java 17 to:

1. Copy the Maven configuration.
2. Copy the application source code.
3. Execute `mvn clean package`.
4. Generate `cicd-validation-1.0.0.jar`.

The runtime stage uses Eclipse Temurin Java 17 JRE and copies the generated JAR into the runtime image.

The application is started with:

```text
java -jar app.jar

Port 8080 is declared for the container.
Docker Image Build
The Docker image was built using:
docker build -t uk-healthcare-cicd:1.0 .
The resulting image was verified with Docker image listing.
Image:
uk-healthcare-cicd:1.0
Container Verification
The image was executed using Docker.
The application produced:
CI/CD validation target is ready
The container exited with code:
0
This confirms successful execution of the validation application inside the Docker container.
The application is a short-lived CI/CD validation target, so the container exits after completing its execution.
2. Terraform Deployment Automation
Terraform v1.16.3 was installed and configured on Windows using the Docker provider.
Terraform Provider
The project uses:
kreuzwerker/docker
The Terraform configuration manages:
- Docker image
- Docker container
Terraform Configuration
The configuration is stored in:
terraform/main.tf
Terraform manages the image:
uk-healthcare-cicd:1.0
and the container:
uk-healthcare-cicd-terraform
The container maps:
Host: 8080
Container: 8080
Terraform Validation
The configuration was formatted using:
terraform fmt
and validated using:
terraform validate
Validation completed successfully.
Terraform Plan
The Terraform plan reported:
Plan: 2 to add, 0 to change, 0 to destroy.
The two resources were:
docker_image.healthcare_app
docker_container.healthcare_app
Terraform Apply
Terraform successfully created the required resources.
The Terraform-managed container was verified through Docker and produced:
CI/CD validation target is ready
with an exit code of:
0
Terraform State
Terraform state was verified using:
terraform state list
The state contained:
docker_container.healthcare_app
docker_image.healthcare_app
A Terraform output was also configured for the managed container name.
The output was verified as:
container_name = "uk-healthcare-cicd-terraform"
3. Docker Compose Orchestration
Docker Compose was used to provide declarative orchestration for the same container image.
Compose configuration:
docker-compose.yml
The service uses:
uk-healthcare-cicd:1.0
with the container name:
uk-healthcare-cicd-compose
Compose Validation
The configuration was validated using:
docker compose config
The configuration resolved successfully.
Compose Execution
The orchestration was tested using:
docker compose up
Docker Compose successfully:
1. Created the Compose network.
2. Created the container.
3. Started the container.
4. Executed the Java application.
5. Produced the expected application output.
6. Completed with exit code 0.
Application output:
CI/CD validation target is ready
4. Validation Summary
Component	Result
Dockerfile	Passed
Docker image build	Passed
Docker container execution	Passed
Container exit verification	Passed
Terraform initialization	Passed
Terraform validation	Passed
Terraform plan	Passed
Terraform apply	Passed
Terraform state verification	Passed
Terraform output verification	Passed
Docker Compose configuration	Passed
Docker Compose execution	Passed


5. Deployment Scope
This implementation validates containerization, infrastructure-as-code, and local container orchestration using the available CI/CD validation application and Docker Desktop environment.
The project documentation identifies Cloud & DevOps responsibilities including environments, CI/CD, deployment, monitoring, and operational readiness, and identifies Docker, AWS/Azure, and Kubernetes within the DevOps technology scope.
No production AWS/Azure deployment or Kubernetes cluster was created because the available project materials do not specify an approved production infrastructure environment, credentials, cluster, or production deployment architecture.
The implementation therefore provides a reproducible local DevOps validation workflow that can be extended to the actual application services and approved infrastructure when those resources are provided.
6. Repository Structure
uk-healthcare-devops/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml
│
├── app/
│   ├── pom.xml
│   └── src/
│
├── docs/
│   ├── pipeline-setup.md
│   ├── t002-containerization-deployment.md
│   └── evidence/
│
├── scripts/
│   └── deploy.sh
│
├── terraform/
│   ├── main.tf
│   └── .terraform.lock.hcl
│
├── Dockerfile
├── docker-compose.yml
├── .gitignore
└── README.md
7. Conclusion
T-002 successfully demonstrates the containerization and deployment automation workflow for the available validation application.
The implementation combines:
Docker
  ↓
Containerized application
  ↓
Terraform
  ↓
Infrastructure-as-code deployment
  ↓
Docker Compose
  ↓
Container orchestration
