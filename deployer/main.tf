resource "local_file" "dog" {
  content  = "This is a pet file"
  filename = "${path.module}/dog.txt"
  
}
resource "local_file" "cat" {
  content  = "This is a pet file"
  filename = "${path.module}/cat.txt"
  
}