resource "aws_vpc" "devops" {
    cidr_block = "10.0.0.0/16"

    tags = tomap({
        "Name"                                   = "terraform-eks-devops-node",
        "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    })
}

resource "aws_subnet" "devops1" {
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  cidr_block        = "10.0.1.0/24"
  vpc_id            = "${aws_vpc.devops.id}"
  map_public_ip_on_launch = true

  tags = tomap({
    "Name"                                   = "terraform-eks-devops-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "kubernetes.io/role/elb" = "1"
  })
}

resource "aws_subnet" "devops2" {
  availability_zone = "${data.aws_availability_zones.available.names[2]}"
  cidr_block        = "10.0.2.0/24"
  vpc_id            = "${aws_vpc.devops.id}"
  map_public_ip_on_launch = true
  
  tags = tomap({
    "Name"                                   = "terraform-eks-devops-node",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
    "kubernetes.io/role/elb" = "1"
  })
}

resource "aws_internet_gateway" "devops" {
  vpc_id = "${aws_vpc.devops.id}"

  tags = {
    Name = "terraform-eks-devops"
  }
}

resource "aws_route_table" "devops" {
  vpc_id = "${aws_vpc.devops.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.devops.id}"
  }
  tags = {
    Name = "terraform-eks-devops"
  }
}

resource "aws_route_table_association" "devops1" {
  subnet_id      = "${aws_subnet.devops1.id}"
  route_table_id = "${aws_route_table.devops.id}"
  
}


resource "aws_route_table_association" "devops2" {
  subnet_id      = "${aws_subnet.devops2.id}"
  route_table_id = "${aws_route_table.devops.id}"
  
}