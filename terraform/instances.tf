# Create a project
resource "packet_project" "packer_builder" {
  name           = "eval-win10x86-enterprise"
}

# Create a device and add it to tf_project_1
resource "packet_device" "build1" {
  hostname         = "build1.ubuntu"
  plan             = "t1.small.x86"
  facility         = "ams1"
  operating_system = "ubuntu_18_04"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.packer_builder.id}"

  provisioner "remote-exec" {
    inline = [
      "curl -fSsl https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -",
      "curl -fSsl https://www.virtualbox.org/download/oracle_vbox.asc | apt-key add -",
      "add-apt-repository 'deb http://download.virtualbox.org/virtualbox/debian bionic contrib'",
      "DEBIAN_FRONTEND=noninteractive apt-get update",
      "DEBIAN_FRONTEND=noninteractive apt-get upgrade -y",
      "DEBIAN_FRONTEND=noninteractive apt-get install -y htop iotop iftop nmap tmux git vim unzip zip build-essential gcc make linux-headers-generic linux-headers-$(uname -r) dkms",
      "DEBIAN_FRONTEND=noninteractive apt-get install -y virtualbox-6.0",
      "mkdir -p /opt/packer; cd /opt/packer; curl -OL 'https://releases.hashicorp.com/packer/1.3.4/packer_1.3.4_linux_amd64.zip'; unzip packer_1.3.4_linux_amd64.zip; install packer /usr/local/bin; rm packer_1.3.4_linux_amd64.zip",
      "mkdir -p /opt/boxcutter; cd /opt/boxcutter; git clone https://github.com/boxcutter/windows.git"
    ]
  }
}
