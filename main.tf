terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_droplet" "vps" {
  image  = "ubuntu-20-04-x64"
  name   = "VPS"
  region = "sgp1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}

resource "digitalocean_ssh_key" "default" {
  name       = "VPS"
  public_key = file(".ssh/id_vps.pub")
}

provider "digitalocean" {
  token = var.do_token
}
