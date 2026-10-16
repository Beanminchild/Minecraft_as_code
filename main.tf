terraform {
  required_providers {
    minecraft = {
      source = "HashiCraft/minecraft"
    }
  }
}

provider "minecraft" {
  address  = "10.0.25.234:25575"
  password = "Chocobros69?"
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
  y        = 82
  z        = -572
}
}

