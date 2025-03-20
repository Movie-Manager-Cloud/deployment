resource "aws_resourcegroups_group" "devops" {
  name        = "devops-resource-group"
  description = "Devops resource group"

  resource_query {
    query = jsonencode({
      ResourceTypeFilters = ["AWS::AllSupported"]
      TagFilters = [
        {
          Key    = "Name"
          Values = ["terraform-eks-devops-node", "terraform-eks-devops"]
        }
      ]
    })
  }
}