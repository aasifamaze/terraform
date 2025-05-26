# This is the terraform variables file

variable "var_filename" {
    default = "file_created using_var.txt"
    type = string
    description = "This is the first file created using variables in terraform" 
}

variable "var_filecontent" {
    default = "I am the first file created using a variable in terraform"
    type = string
    description = "These are the contents of first file created using variables in terraform" 
}
