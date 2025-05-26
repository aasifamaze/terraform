# This is the terraform configuration file. This is where terraform looks
# for the actions that it needs to do


resource "local_file" "first_file_created_using_terraform" {
  filename = "first_file_created_using_terraform.txt"
  content  = "I am the first file created using terraform"
}

# Below code explains how to use an "Interpolation sequence" using ${}.
# The petname will be referred to in creation of the file and requires 
# it to be created before.
# This is called "Implicit dependency" where Terraform understands the 
# sequence of execution and creates the dependent resource i.e. petname first
# as that will be needed in the file content
# before it creates the file.

resource "local_file" "interpolat_seq" {
  #default = "interpolat_seq.txt"
  filename = "interpolat_seq.txt"
  content  = "my pet name is ${random_pet.my_petname.id}"
}

# Below code helps understand how a variable is used
# Note that there is a variables.tf file that is being referenced

resource "local_file" "file_created_using_var" {
  filename = var.var_filename
  content = var.var_filecontent
}

# Below code highlights the *create_before_destroy* *lifecycle rule*.
# This is used to create a resource before deletion

resource "random_pet" "my_petname" {
  length    = 2
  prefix    = "Mr"
  separator = "_"
  lifecycle {
    create_before_destroy = true
  }
}

