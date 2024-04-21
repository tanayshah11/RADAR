terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

locals {
  ports_data = jsondecode(file("${path.module}/ports.json"))
  ports = local.ports_data.avail_ports
}

resource "docker_image" "flask_app" {
  name         = "my-flask-app:latest"
  keep_locally = true  # Ensure it doesn't attempt to pull from a registry
}

resource "docker_container" "flask_app" {
  count = length(local.ports)
  image = docker_image.flask_app.name  # Correctly references the image built above
  name  = "flask-app-${count.index}"

  ports {
    internal = 5000
    external = local.ports[count.index]
  }
}
