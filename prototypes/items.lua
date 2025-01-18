local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({


--- subgroups
  {
    type = "item-subgroup",
    name = "moshine-production-machine",
    group = "production",
    order = "ea"
  },
  {
    type = "item-subgroup",
    name = "moshine-processes",
    group = "intermediate-products",
    order = "pa"
  },

--- entities begin

  {
    type = "item",
    name = "supercomputer",
    icon = "__Moshine__/graphics/icons/supercomputer.png",
    subgroup = "moshine-production-machine",
    order = "aaa",
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
    name = "data-extractor",
    icon = "__Moshine__/graphics/icons/data-extractor.png",
    subgroup = "moshine-production-machine",
    order = "bbb",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "data-extractor",
    stack_size = 10,
    default_import_location = "moshine",
    weight = 100 * kg
  },
  {
    type = "item",
    name = "data-processor",
    icon = "__Moshine__/graphics/icons/data-processor.png",
    subgroup = "moshine-production-machine",
    order = "ccc",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "data-processor",
    stack_size = 10,
    default_import_location = "moshine",
    weight = 100 * kg
  },
  {
    type = "item",
    name = "optical-fiber",
    icon = "__Moshine__/graphics/icons/optical-fiber.png",
    subgroup = "moshine-production-machine",
    order = "ddd",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "optical-fiber",
    stack_size = 100,
    default_import_location = "moshine",
    weight = 5 * kg,
    random_tint_color = item_tints.iron_rust
  },


--- items

  
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
    subgroup = "moshine-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "moshine",
    weight = 10*kg
  },
  {
    type = "item",
    name = "silicon",
    icon = "__Moshine__/graphics/icons/silicon.png",
    subgroup = "moshine-processes",
    order = "bbb",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "neodymium",
    icon = "__Moshine__/graphics/icons/neodymium.png",
    pictures =
    {
      { size = 64, filename = "__Moshine__/graphics/icons/neodymium.png",   scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/neodymium-1.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/neodymium-2.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/neodymium-3.png", scale = 0.5 }
    },
    subgroup = "moshine-processes",
    order = "ccc",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "moshine",
    random_tint_color = item_tints.iron_rust,
    weight = 10*kg
  },
  {
    type = "item",
    name = "magnet",
    icon = "__Moshine__/graphics/icons/magnet.png",
    subgroup = "moshine-processes",
    order = "ddd",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "silicon-cell",
    icon = "__Moshine__/graphics/icons/silicon-cell.png",
    subgroup = "moshine-processes",
    order = "eee",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "heat-shielding",
    icon = "__Moshine__/graphics/icons/heat-shielding.png",
    subgroup = "moshine-processes",
    order = "fff",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "hard-drive",
    icon = "__Moshine__/graphics/icons/hard-drive.png",
    subgroup = "moshine-processes",
    order = "ggg",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "3d-data-storage",
    icon = "__Moshine__/graphics/icons/3d-data-storage.png",
    subgroup = "moshine-processes",
    order = "hhh",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "model-unstable",
    icon = "__Moshine__/graphics/icons/model-unstable.png",
    pictures =
    {
      { size = 64, filename = "__Moshine__/graphics/icons/model-unstable.png", scale = 0.5 },
    },
    subgroup = "moshine-processes",
    order = "iii",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 1,
    weight = 2 * kg,
    spoil_ticks = 0.5 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 5, -- per 5 items the trigger is run
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "medium-explosion",
            },
            {
              type = "damage",
              damage = {amount = 50, type = "explosion"}
            },
            {
              type = "create-entity",
              entity_name = "medium-scorchmark-tintable",
              check_buildability = true
            },
          }
        }
      }
    }
  },
  {
    type = "item",
    name = "model-stable",
    icon = "__Moshine__/graphics/icons/model-stable.png",
    subgroup = "moshine-processes",
    order = "jjj",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
})