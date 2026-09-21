terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "healthcare_app" {
  name = "uk-healthcare-cicd:1.0"
}

resource "docker_container" "healthcare_app" {
  name  = "uk-healthcare-cicd-terraform"
  image = docker_image.healthcare_app.image_id

  ports {
    internal = 8080
    external = 8080
  }
}


output "container_name" {
  description = "Name of the Terraform-managed healthcare validation container"
  value       = docker_container.healthcare_app.name
}