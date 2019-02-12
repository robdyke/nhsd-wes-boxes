output "builder ip" {
  value = "ssh root@${packet_device.build1.network.0.address}"
}
