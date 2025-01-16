local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({


-----entities begin


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
    name = "data-extractor",
    icon = "__Moshine__/graphics/icons/data-extractor.png",
    subgroup = "production-machine",
    order = "z[z-biolab]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "data-extractor",
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


-----entities end


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
    random_tint_color = item_tints.iron_rust,
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
    weight = 5*kg
  },
  {
    type = "item",
    name = "magnet",
    icon = "__Moshine__/graphics/icons/magnet.png",
    subgroup = "raw-material",
    color_hint = { text = "C" },
    order = "a[smelting]-b[copper-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "silicon",
    icon = "__Moshine__/graphics/icons/silicon.png",
    subgroup = "raw-material",
    color_hint = { text = "C" },
    order = "a[smelting]-b[copper-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "silicon-wafer",
    icon = "__Moshine__/graphics/icons/silicon-wafer.png",
    subgroup = "raw-material",
    color_hint = { text = "C" },
    order = "a[smelting]-b[copper-plate]",
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
    subgroup = "raw-material",
    color_hint = { text = "C" },
    order = "a[smelting]-b[copper-plate]",
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
    subgroup = "raw-material",
    color_hint = { text = "C" },
    order = "a[smelting]-b[copper-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
  {
    type = "item",
    name = "unstable-model",
    icon = "__Moshine__/graphics/icons/unstable-model.png",
    pictures =
    {
      { size = 64, filename = "__Moshine__/graphics/icons/unstable-model.png", scale = 0.5 },
    },
    fuel_category = "chemical",
    subgroup = "agriculture-products",
    order = "c[eggs]-a[biter-egg]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
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
            }
          }
        }
      }
    }
  },
  {
    type = "item",
    name = "stable-model",
    icon = "__Moshine__/graphics/icons/stable-model.png",
    subgroup = "raw-material",
    color_hint = { text = "C" },
    order = "a[smelting]-b[copper-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 10*kg,
  },
})