variable "cloud_name" {
    default = "name"
    description = "Name of cloud's entry in clouds.yaml"
}

variable "client_name" {
    default = "client"
    description = "Name of cloud's entry in clouds.yaml"
}

variable "keypair_name" {
   default = "robdyke-1"
   description = "Keypair to use for this demo"
}

variable "auth_token" {
}
