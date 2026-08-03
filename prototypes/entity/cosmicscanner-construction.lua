--code mostly by Talandar
local item_sounds = require("__base__.prototypes.item_sounds")


local megastructure_stages = {
  {
    name = "moshine_cosmicscanner-construction-stage-1",
    upgrade_recipe = {
      energy_required = 4,
      ingredients = {
        { type = "item", name = "steel-plate", amount = 120 },
        { type = "item", name = "concrete", amount = 150 },
      },
    },
  },
  {
    name = "moshine_cosmicscanner-construction-stage-2",
    upgrade_recipe = {
      energy_required = 6,
      ingredients = {
        { type = "item", name = "low-density-structure", amount = 50 },
        { type = "item", name = "steel-plate", amount = 200 },
      },
    },
  },
  {
    name = "moshine_cosmicscanner-construction-stage-3",
    upgrade_recipe = {
      energy_required = 9,
      ingredients = {
        { type = "item", name = "electric-engine-unit", amount = 40 },
        { type = "item", name = "steel-plate", amount = 200 },
      },
    },
  },
  {
    name = "moshine_cosmicscanner-construction-stage-4",
    upgrade_recipe = {
      energy_required = 15,
      ingredients = {
        { type = "item", name = "processing-unit", amount = 50 },
        { type = "item", name = "electric-engine-unit", amount = 40 },
        { type = "item", name = "radar", amount = 5 },
      },
    },
  },
}

data:extend({
  {
    type = "recipe-category",
    name = "moshine_cosmicscanner-building",
  },

  {
    type = "item-subgroup",
    name = "moshine-space-platform",
    group = "space",
    order = "a2"
  },

  {
    type = "item",
    name = "moshine_cosmicscanner-construction-stage-1",
    icon = "__Moshine__/graphics/icons/moshine_cosmicscanner-construction-stage-1.png",
    --subgroup = "moshine-production-machine",
    --order = "ffl",
    subgroup = "moshine-space-platform",
    order = "a[moshine_cosmicscanner]",
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "moshine_cosmicscanner-construction-stage-1",
    stack_size = 1,
    weight = 1000 * kg,
    default_import_location = "moshine"
  },
  {
    type = "recipe",
    name = "moshine_cosmicscanner",
    energy_required = 100,
    categories = {"crafting"},
    surface_conditions = {{ property = "gravity", min = 0, max = 0}},
    ingredients =
    {
      {type = "item", name = "concrete", amount = 100},
      {type = "item", name = "glass", amount = 400},
      {type = "item", name = "processing-unit", amount = 50},
      {type = "item", name = "model-stable", amount = 10},
      {type = "item", name = "data-processor", amount = 1},
      {type = "item", name = "model-unstable", amount = 1},
    },
    results = {{type="item", name="moshine_cosmicscanner-construction-stage-1", amount=1}},
    allow_productivity = false,
    enabled = false,
    sort_item_ingredients = false,
  },
  --[[{
    type = "item",
    name = "moshine_cosmicscanner-construction-stage-1",
    icon = "__Moshine__/graphics/icons/moshine_cosmicscanner-construction-stage-1.png",
    icon_size = 64,
    subgroup = "space-platform",
    order = "a[moshine_cosmicscanner]",
    place_result = "moshine_cosmicscanner-construction-stage-1",
    stack_size = 10,
  },]]
})

for i, stage in ipairs(megastructure_stages) do

  local size = 14
  local entity_name = stage.name
  local entity = {
    type = "assembling-machine",
    name = entity_name,
    icon = "__Moshine__/graphics/icons/" .. entity_name .. ".png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 10, result = "moshine_cosmicscanner-construction-stage-1"},
    max_health = 3000 - (i * 300),
    collision_box = {{-((size/2)-0.3), -((size/2)-0.3)}, {((size/2)-0.3), ((size/2)-0.3)}},
    selection_box = {{-(size/2), -(size/2)}, {(size/2), (size/2)}},
    crafting_categories = { "moshine_cosmicscanner-building" },
    crafting_speed = 1,
    energy_source = { type = "electric", usage_priority = "secondary-input" },
    energy_usage = i * 360 .. "MW",
    icon_draw_specification = {shift = {0, 5.5}, scale = 1.2},
    surface_conditions = {
      { property = "gravity", min = 0, max = 0 },
    },
    show_recipe_icon = false,
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          type = "script",
          effect_id = "moshine_cosmicscanner-built",
        },
      },
    },
    graphics_set = {
      integration_patch =
      {
        filename = "__Moshine-assets__/graphics/entity/moshine_cosmicscanner/moshine_cosmicscanner-underplatform2.png",
        priority = crash_site_sprite_priority,
        width = 1024,
        height = 1772,
        scale = 0.5
      },
      integration_patch_render_layer = "background-transitions",
      animation = {
        layers = {
          {
            filename = "__Moshine-assets__/graphics/entity/moshine_cosmicscanner/" .. entity_name .. ".png",
            priority = "high",
            width = 1024,
            height = 1024,
            frame_count = 1,
            line_length = 1,
            shift = util.by_pixel(0, 0),
            scale = 0.5,
          },
        },
      },
    },
  }

  if stage.upgrade_recipe then
    entity.fixed_recipe = "moshine_cosmicscanner-construct-" .. i
  end

  data:extend({
    entity
  })

  if stage.upgrade_recipe then
    data:extend({
      {
        type = "recipe",
        name = "moshine_cosmicscanner-construct-" .. i,
        icon = "__Moshine__/graphics/icons/" .. entity_name .. ".png",
        icon_size = 64,
        categories = { "moshine_cosmicscanner-building" },
        energy_required = stage.upgrade_recipe.energy_required,
        enabled = true,
        ingredients = stage.upgrade_recipe.ingredients,
        results = {},
        raise_on_crafted = true,
        hidden = true,
        hidden_in_factoriopedia = true,
        hide_from_player_crafting = true,
      },
    })
  end
end
