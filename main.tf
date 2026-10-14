terraform {
  required_providers {
    minecraft = {
      source = "HashiCraft/minecraft"
    }
  }
}

provider "minecraft" {
  address  = "localhost:25575"
  password = "1025"
}

resource "minecraft_block" "stone" {
  material = "minecraft:sea_lantern"

  position = {
    x = -81
    y = 73
    z = -560
  }
}


locals {
  blocks = ["minecraft:diamond_block", "minecraft:gold_block", "minecraft:emerald_block"]
}

resource "minecraft_block" "treasures" {
  for_each = toset(local.blocks)

  material = each.key

  position = {
  x        = index(local.blocks, each.key) - 89
  y        = 80
  z        = -572
}
}

