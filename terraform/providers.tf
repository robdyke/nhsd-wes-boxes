# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.auth_token}"
}

# Create a new SSH key
resource "packet_ssh_key" "key1" {
  name       = "robdyke-1"
  public_key = "${file("/home/robd/.ssh/robdyke@gmail.com_rsa.pub")}"
}
