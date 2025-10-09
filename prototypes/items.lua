local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
require("sound-util")


data:extend({


--- subgroups
  {
    type = "item-subgroup",
    name = "moshine-processes",
    group = "intermediate-products",
    order = "pa"
  },

  {
    type = "item-subgroup",
    name = "moshine-production-machine",
    group = "production",
    order = "e2"
  },

--- entities begin

  {
    type = "item",
    name = "data-processor",
    icon = "__Moshine__/graphics/icons/data-processor.png",
    subgroup = "moshine-production-machine",
    order = "fff",
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
    name = "supercomputer",
    icon = "__Moshine__/graphics/icons/supercomputer.png",
    subgroup = "moshine-production-machine",
    order = "ffg",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "supercomputer",
    stack_size = 5,
    default_import_location = "moshine",
    weight = 100 * kg
  },
  {
    type = "item",
    name = "data-extractor",
    icon = "__Moshine__/graphics/icons/data-extractor.png",
    subgroup = "moshine-production-machine",
    order = "ffh",
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
    name = "optical-cable",
    icon = "__Moshine__/graphics/icons/optical-fiber.png",
    subgroup = "moshine-production-machine",
    order = "ffi",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "optical-cable",
    stack_size = 100,
    default_import_location = "moshine",
    weight = 20 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "ai-trainer",
    icon = "__Moshine__/graphics/icons/ai-trainer.png",
    subgroup = "moshine-production-machine",
    order = "ffj",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "ai-trainer",
    stack_size = 20,
    default_import_location = "moshine"
  },
  {
    type = "item",
    name = "processing-grid",
    icon = "__Moshine__/graphics/icons/processing-grid.png",
    subgroup = "moshine-production-machine",
    order = "ffk",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "processing-grid",
    stack_size = 20,
    weight = 50 * kg,
    default_import_location = "moshine"
  }, 

  {
    type = "item",
    name = "processing-tile",
    icon = "__Moshine__/graphics/icons/processing-tile.png",
    subgroup = "moshine-production-machine",
    order = "ffl",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    stack_size = 100,
    weight = 10 * kg,
    place_as_tile =
    {
      result = "processing-tile",
      condition_size = 1,
      condition = {layers={water_tile=true}}
    },
    random_tint_color = item_tints.bluish_concrete
  },

--- items
  
  {
    type = "item",
    name = "sand",
    icon = "__Moshine__/graphics/icons/sand-3.png",
    subgroup = "moshine-processes",
    order = "aaa",
    icon_size = 64,
    pictures =
    {
      { size = 64, filename = "__Moshine__/graphics/icons/sand-1.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/sand-2.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/sand-3.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/sand-4.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/sand-5.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/sand-6.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/sand-7.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/sand-8.png", scale = 0.5 },
      { size = 64, filename = "__Moshine__/graphics/icons/sand-9.png", scale = 0.5 },
    },
    stack_size = 100,
    default_import_location = "moshine",
    random_tint_color = item_tints.iron_rust,
    weight = 1*kg,
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
    random_tint_color = item_tints.iron_rust,
    stack_size = 50,
    weight = 2*kg,
  },
})
if not data.raw.item["glass"] then
  data:extend({
    {
      icon = "__Moshine__/graphics/icons/glass.png",
      name = "glass",
      order = "ccc",
      stack_size = 100,
      subgroup = "moshine-processes",
      type = "item",
      pick_sound = item_sounds.grenade_inventory_pickup,
      drop_sound = item_sounds.grenade_inventory_move,
      inventory_move_sound = item_sounds.grenade_inventory_move,
    }
  })
end
data:extend({
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
    weight = 4*kg
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
    weight = 5*kg,
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
    weight = 5*kg,
  },
  {
    type = "item",
    name = "silicon-carbide",
    icon = "__Moshine__/graphics/icons/silicon-carbide.png",
    subgroup = "moshine-processes",
    order = "fff",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 40,
    weight = 12.5*kg,
  },

  -- datacells
  {
    type = "tool",
    name = "hard-drive", -- renamed Datacell[empty]
    icon = "__Moshine__/graphics/icons/datacell-empty.png",
    subgroup = "moshine-processes",
    order = "gga",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 40,
    weight = 5*kg,
  },


  --[[{
    type = "item",
    name = "datacell-empty",
    icon = "__Moshine__/graphics/icons/datacell-empty.png",
    subgroup = "moshine-processes",
    order = "kka",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    default_import_location = "moshine",
    stack_size = 40,
    weight = 25*kg,
  },]]
  {
    type = "tool",
    name = "datacell-raw-data",
    icon = "__Moshine__/graphics/icons/datacell-raw-data.png",
    subgroup = "moshine-processes",
    order = "ggb",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    default_import_location = "moshine",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 40,
    weight = 5*kg,
  },
  {
    type = "tool",
    name = "datacell-ai-model-data",
    icon = "__Moshine__/graphics/icons/datacell-ai-model-data.png",
    subgroup = "moshine-processes",
    order = "ggc",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    default_import_location = "moshine",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 40,
    weight = 5*kg,
  },
  {
    type = "tool",
    name = "datacell-equation",
    icon = "__Moshine__/graphics/icons/datacell-equation.png",
    subgroup = "moshine-processes",
    order = "ggd",
    plant_result = "processing-grid-process-equation",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    default_import_location = "moshine",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 40,
    weight = 5*kg,
  },

  {
    type = "tool",
    name = "datacell-solved-equation",
    icon = "__Moshine__/graphics/icons/datacell-solved-equation.png",
    subgroup = "moshine-processes",
    order = "gge",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    default_import_location = "moshine",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 40,
    weight = 5*kg,
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
    stack_size = 20,
    weight = 50*kg,
  },
  {
    type = "item",
    name = "model-unstable",
    icon = "__Moshine__/graphics/icons/model-unstable.png",
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__Moshine__/graphics/icons/model-unstable.png",
          scale = 0.5,
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__Moshine__/graphics/icons/model-unstable-light.png",
          scale = 0.5
        }
      }
    },
    subgroup = "moshine-processes",
    default_import_location = "moshine",
    order = "iii",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 1,
    weight = 100*kg,
    spoil_ticks = 0.5 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 1, -- per 5 items the trigger is run
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
              entity_name = "model-unstable-explosion",
            },
            {
              type = "damage",
              damage = {amount = 237, type = "explosion"}
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
    type = "explosion",
    name = "model-unstable-explosion",
    localised_name = {"entity-name.medium-explosion"},
    icon = "__base__/graphics/icons/explosion.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "explosions",
    animations = {
      {
        filename = "__Moshine__/graphics/entity/explosion/explosion-1.png",
        draw_as_glow = true,
        blend_mode = "additive",
        priority = "high",
        width = 150,
        height = 150,
        frame_count = 32,
        line_length = 8,
        shift = util.by_pixel(0, -2),
        animation_speed = 0.6,
        scale = 0.8,
        usage = "explosion"
      },
      {
        filename = "__Moshine__/graphics/entity/explosion/explosion-2.png",
        draw_as_glow = true,
        blend_mode = "additive",
        priority = "high",
        width = 150,
        height = 150,
        frame_count = 29,
        line_length = 8,
        shift = util.by_pixel(0,-2),
        animation_speed = 0.6,
        scale = 0.8,
        usage = "explosion"
      },
    },
    sound = {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      switch_vibration_data =
      {
        filename = "__base__/sound/fight/medium-explosion.bnvib",
        gain = 0.4
      },
      audible_distance_modifier = 0.5,
      variations = sound_variations_with_volume_variations("__base__/sound/fight/medium-explosion", 5, 0.3, 0.4, volume_multiplier("main-menu", 1.2))
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 20,
            particle_name = "explosion-stone-particle-medium",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } }
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "explosion-stone-particle-small",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 50,
            particle_name = "explosion-stone-particle-tiny",
            offset_deviation = { { -0.8984, -0.5 }, { 0.8984, 0.5 } },
            initial_height = 1,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.1,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },



  {
    type = "module-category",
    name = "ai-speed"
  },


  {
    type = "item",
    name = "model-stable",
    icons = {
      {icon = "__Moshine__/graphics/icons/aicores/tier-0.png"},
      --{icon = "__Moshine__/graphics/icons/tiers/tier-0.png", scale = 0.5},
    },
    icon = "__Moshine__/graphics/icons/model-stable.png",
    subgroup = "moshine-processes",
    order = "jjj",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    default_import_location = "moshine",
    stack_size = 20,
    --durability = 1,
    --durability_description_key = "description.science-pack-remaining-amount-key",
    --factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    --durability_description_value = "description.science-pack-remaining-amount-value",
    weight = 50*kg,
  },

})



for i=1,10 do
  data:extend({
    {
      type = "module",
      name = "ai-tier-" .. i,
      icons = {
        {icon = "__Moshine__/graphics/icons/aicores/tier-" .. i .. ".png", icon_size = 64, scale = 0.5},
        --{icon = "__Moshine__/graphics/icons/tiers/tier-" .. i .. ".png", icon_size = 64, scale = 0.35, shift = {0,0.5}},
      },
      --icon = "__Moshine__/graphics/icons/ai-tier-" .. i .. ".png",
      subgroup = "moshine-processes",
      tier = i,
      category = "ai-speed",
      effect = {speed = (i * i * i)/50}, --, consumption = 0.5, quality = -0.1},
      order = (i == 10) and "jjk-" .. i or "jjk-0" .. i,
      inventory_move_sound = item_sounds.module_inventory_move,
      pick_sound = item_sounds.module_inventory_pickup,
      drop_sound = item_sounds.module_inventory_move,
      default_import_location = "moshine",
      stack_size = 20,
      weight = 20 * kg,
    },
  })
end