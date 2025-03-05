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


--- fluids

--[[
  {
    type = "fluid",
    name = "processing-power-fluid",
    auto_barrel = false,
    subgroup = "fluid",
    fuel_value = "2kJ",
    default_temperature = 15,
    base_color = {0, 0.34, 0.6},
    flow_color = {0.7, 0.7, 0.7},
    icon = "__Moshine__/graphics/icons/processing-power-fluid.png",
    order = "a[fluid]-a[water]-a[water]"
  },
]]

--- entities begin

  {
    type = "item",
    name = "supercomputer",
    icon = "__Moshine__/graphics/icons/supercomputer.png",
    subgroup = "moshine-production-machine",
    order = "fff",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "supercomputer",
    stack_size = 5,
    default_import_location = "moshine",
    weight = 1000 * kg
  },
  {
    type = "item",
    name = "data-extractor",
    icon = "__Moshine__/graphics/icons/data-extractor.png",
    subgroup = "moshine-production-machine",
    order = "ffg",
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
    order = "ffh",
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
  --[[{
    type = "item",
    name = "ai-support",
    icon = "__Moshine__/graphics/icons/ai-support.png",
    subgroup = "moshine-production-machine",
    order = "ffj",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "ai-support",
    stack_size = 20,
    default_import_location = "moshine"
  },]]--
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
    order = "ffj",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "processing-grid",
    stack_size = 20,
    default_import_location = "moshine"
  }, 

--[[
  {
    type = "item",
    name = "processing-tile",
    icon = "__Moshine__/graphics/icons/processing-tile.png",
    subgroup = "terrain",
    order = "b[concrete]-a[plain]",
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
  },]]

--- items
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
    weight = 20*kg,
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
    name = "magnet",
    icon = "__Moshine__/graphics/icons/magnet.png",
    subgroup = "moshine-processes",
    order = "ddd",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    default_import_location = "moshine",
    stack_size = 50,
    weight = 20*kg,
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
    weight = 20*kg,
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
    weight = 25*kg,
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
    weight = 25*kg,
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
    weight = 25*kg,
  },
  {
    type = "tool",
    name = "datacell-equation",
    icon = "__Moshine__/graphics/icons/datacell-equation.png",
    subgroup = "moshine-processes",
    order = "ggc",
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
    weight = 10000*kg,
  },

  {
    type = "tool",
    name = "datacell-solved-equation",
    icon = "__Moshine__/graphics/icons/datacell-solved-equation.png",
    subgroup = "moshine-processes",
    order = "ggd",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    default_import_location = "moshine",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    stack_size = 40,
    weight = 25*kg,
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
      { size = 64, filename = "__Moshine__/graphics/icons/model-unstable.png", scale = 0.5 },
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
              entity_name = "medium-explosion",
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
    type = "module-category",
    name = "ai-speed"
  },


  {
    type = "tool",
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
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
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
        {icon = "__Moshine__/graphics/icons/tiers/tier-" .. i .. ".png", icon_size = 64, scale = 0.35, shift = {0,0.3}},
      },
      --icon = "__Moshine__/graphics/icons/ai-tier-" .. i .. ".png",
      subgroup = "moshine-processes",
      tier = i,
      category = "ai-speed",
      effect = {speed = i * i}, --, consumption = 0.5, quality = -0.1},
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