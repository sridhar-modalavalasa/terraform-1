
// vpc cidr ranges
variable "vpc_cidr" {
    default      =    "192.168.0.0/16"
    type          =    string
    description   =    "This is vpc cidr "
}

// vpc tag
variable "vpc_tag" {
    default      =    "myvpc"
    type          =    string
    description   =    "Name of the vpc"
}


// subnet cidr ranges
variable "subnet_cidr" {
    default       =    ["192.168.0.0/24","192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24","192.168.5.0/24"]
    type          =    list(string)
    description   =    "These are subnet cidrs "
}

// subnets availability zones

variable "subnet_azs" {
    default       =    ["us-west-2a","us-west-2b","us-west-2a","us-west-2b","us-west-2a","us-west-2b"]
    type          =    list(string)
    description   =    "These are subnet availability zones "

  
}

// names of the subnets

variable "subnet_tag" {
    default       =    ["web1","web2","db1","db2","app1","app2"] 
    type          =    list(string)
    description   =    "Names of subnets"
}

// name of the web security group

variable "websg" {
    default       =   "webapplication-sg"
    type          =    string
    description   =    "Name of websg"  
}

// name of the db security group

variable "dbsg" {
    default       =   "database-sg"
    type          =    string
    description   =    "Name of dbsg"  
}
variable "access_key" {
    default = "AKIAX7IEASGWG54WB5AD"
    description = "Access key to AWS console"

}
variable "secret_key" {
    default = "UYpR570RSGVunsFeQ0tkoJ8H88/Kk1Hqe2xoSmwG"
    description = "Secret key to AWS console"

}
