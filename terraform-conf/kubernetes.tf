resource "kubernetes_deployment" "flask_app" {
  metadata {
    name = "flask-time-app"
    labels = {
      app = "flask-time-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "flask-time-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "flask-time-app"
        }
      }

      spec {
        container {
          image = "flask-time-app:latest"
          name  = "flask-time-app"
          image_pull_policy = "Never"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "flask_app" {
  metadata {
    name = "flask-time-app-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.flask_app.metadata.0.labels.app
    }
    port {
      port        = 8080
      target_port = 8080
    }
    type = "NodePort"
  }
}
