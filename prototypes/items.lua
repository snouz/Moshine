local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "supercomputer",
    icon = "__Moshine__/graphics/icons/supercomputer.png",
    subgroup = "production-machine",
    order = "z[z-biolab]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "biolab",
    stack_size = 5,
    default_import_location = "moshine",
    weight = 1000 * kg
  },
  {
    type = "item",
    name = "data-processor",
    icon = "__Moshine__/graphics/icons/data-processor.png",
    subgroup = "production-machine",
    order = "z[z-biolab]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "data-processor",
    stack_size = 5,
    default_import_location = "moshine",
    weight = 1000 * kg
  },
{
  type = "item",
  name = "optical-fiber",
  icon = "__Moshine__/graphics/icons/optical-fiber.png",
  subgroup = "energy-pipe-distribution",
  order = "a[pipe]-a[pipe]",
  inventory_move_sound = item_sounds.metal_small_inventory_move,
  pick_sound = item_sounds.metal_small_inventory_pickup,
  drop_sound = item_sounds.metal_small_inventory_move,
  place_result = "optical-fiber",
  stack_size = 100,
  default_import_location = "moshine",
  weight = 5 * kg,
  random_tint_color = item_tints.iron_rust
},
{
  type = "item",
  name = "neodymium-ore",
  icon = "__Moshine__/graphics/icons/neodymium-ore.png",
  pictures =
  {
    { size = 64, filename = "__Moshine__/graphics/icons/neodymium-ore.png",   scale = 0.5 },
    { size = 64, filename = "__Moshine__/graphics/icons/neodymium-ore-1.png", scale = 0.5 },
    { size = 64, filename = "__Moshine__/graphics/icons/neodymium-ore-2.png", scale = 0.5 },
    { size = 64, filename = "__Moshine__/graphics/icons/neodymium-ore-3.png", scale = 0.5 }
  },
  subgroup = "vulcanus-processes",
  color_hint = { text = "T" },
  order = "c[tungsten]-a[tungsten-ore]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  default_import_location = "moshine",
  weight = 10*kg
},
{
  type = "item",
  name = "quartz-ore",
  icon = "__Moshine__/graphics/icons/quartz-ore.png",
  pictures =
  {
    { size = 64, filename = "__Moshine__/graphics/icons/quartz-ore.png",   scale = 0.5 },
    { size = 64, filename = "__Moshine__/graphics/icons/quartz-ore-1.png", scale = 0.5 },
    { size = 64, filename = "__Moshine__/graphics/icons/quartz-ore-2.png", scale = 0.5 },
    { size = 64, filename = "__Moshine__/graphics/icons/quartz-ore-3.png", scale = 0.5 }
  },
  subgroup = "vulcanus-processes",
  color_hint = { text = "T" },
  order = "c[tungsten]-a[tungsten-ore]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  default_import_location = "moshine",
  weight = 10*kg
},
})