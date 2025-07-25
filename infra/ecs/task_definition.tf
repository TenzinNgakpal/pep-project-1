resource "aws_ecs_task_definition" "flask_app" {
  family                   = "flask-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"

  container_definitions = jsonencode([
    {
      name      = "flask-container"
      image     = "your-dockerhub-user/flask-app:latest" # OR ECR
      essential = true
      portMappings = [
        {
          containerPort = 5000
          protocol      = "tcp"
        }
      ]
    }
  ])
}
