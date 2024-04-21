resource "local_file" "dog" {
  content  = "This is a dog file"
  filename = "${path.module}/dog.txt"
  
}
resource "local_file" "cat" {
  content  = "This is a cat file"
  filename = "${path.module}/cat.txt"
  
}