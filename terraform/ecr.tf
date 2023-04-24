resource "aws_ecr_lifecycle_policy" "backstage" {
  policy = jsonencode(
    {
      rules = [
        {
          action = {
            type = "expire"
          }
          description  = "lifecycle"
          rulePriority = 1
          selection = {
            countNumber = 5
            countType   = "imageCountMoreThan"
            tagStatus   = "untagged"
          }
        },
      ]
    }
  )
  repository = aws_ecr_repository.backstage.name
}

resource "aws_ecr_lifecycle_policy" "nginx" {
  policy = jsonencode(
    {
      rules = [
        {
          action = {
            type = "expire"
          }
          description  = "lifecycle"
          rulePriority = 1
          selection = {
            countNumber = 5
            countType   = "imageCountMoreThan"
            tagStatus   = "untagged"
          }
        },
      ]
    }
  )
  repository = aws_ecr_repository.nginx.name
}

resource "aws_ecr_repository" "backstage" {
  name                 = "backstage"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tags
}

resource "aws_ecr_repository" "nginx" {
  name                 = "nginx"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tags
}