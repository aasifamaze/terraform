
resource "local_file" "my_file1" {
  filename = "my-first-tf-file1.txt"
  content  = "I am a terraform tf file"
}

resource "local_file" "my_file2" {
  filename = "my-first-tf-file2.txt"
  content  = "I am a terraform tf file and my pet is ${random_pet.my_pet_name.id}"
}

resource "random_pet" "my_pet_name" {
  length    = 2
  prefix    = "Mr."
  separator = " "
}

variable "filename" {
    default = "myfile.txt"
    type = string
    description = "Name of File to create"
}

variable "file_content" {
    default = "This is the file to create.txt"
    type = string
    description = "Name of File to create"
}