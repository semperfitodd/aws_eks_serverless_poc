resource "aws_ecr_lifecycle_policy" "this" {
  count = local.ecr_repository_count

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
  repository = "${aws_ecr_repository.this[count.index].name}"
}

resource "aws_ecr_repository" "this" {
  count = local.ecr_repository_count

  name                 = "${var.environment}_springboot_${count.index}"
  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tags
}