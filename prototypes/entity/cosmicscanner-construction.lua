--code mostly by Talandar
local item_sounds = require("__base__.prototypes.item_sounds")


local megastructure_stages = {
  {
    name = "moshine_cosmicscanner-construction-stage-1",
    upgrade_recipe = {
      energy_required = 10,
      ingredients = {
        { type = "item", name = "steel-plate", amount = 120 },
        { type = "item", name = "concrete", amount = 150 },
      },
    },
  },
  {
    name = "moshine_cosmicscanner-construction-stage-2",
    upgrade_recipe = {
      energy_required = 12,
      ingredients = {
        { type = "item", name = "low-density-structure", amount = 50 },
        { type = "item", name = "steel-plate", amount = 200 },
      },
    },
  },
  {
    name = "moshine_cosmicscanner-construction-stage-3",
    upgrade_recipe = {
      energy_required = 14,
      ingredients = {
        { type = "item", name = "electric-engine-unit", amount = 40 },
        { type = "item", name = "steel-plate", amount = 200 },
      },
    },
  },
  {
    name = "moshine_cosmicscanner-construction-stage-4",
    upgrade_recipe = {
      energy_required = 16,
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
    name = "moshine_cosmicscanner-construction-stage-1",
    energy_required = 100,
    categories = {"crafting"},
    subgroup = "moshine-space-platform",
    order = "a[moshine_cosmicscanner]",
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
    auto_recycle = false,
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
      idle_animation = {
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
      animation_progress = 0.05,
      always_draw_idle_animation = true,
      states =
      {
        {
          name = "idle",
          duration = 1,
          next_active = "working",
          next_inactive = "idle",
        },
        {
          name = "working",
          duration = 50,
          next_active = "working",
          next_inactive = "idle",
        },
      },
      working_visualisations = {
        {
          name = "constructionlights",
          constant_speed = true,
          --always_draw = true,
          draw_in_states = {"working"},
          --fadeout = true,
          effect = "flicker",
          --frame_based_on_shift_animation_progress = false,
          --apply_tint = "status",
          render_layer = "train-stop-top",
          animation = 
          { 
            layers =
            {
              {
                filename = "__Moshine-assets__/graphics/entity/moshine_cosmicscanner/" .. entity_name .. "-light.png",
                priority = "high",
                width = 1024,
                height = 1024,
                frame_count = 2,
                line_length = 2,
                frame_sequence = {1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,1,1,2,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1},
                animation_speed = 0.05,
                run_mode = "forward-then-backward",
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
                --render_layer = "",
              },
            }
          },
        },
      },
    },
    impact_category = "metal-large",
    open_sound = {filename = "__Moshine-assets__/sound/cosmic-scanner/scanner-open.ogg", volume = 0.9},
    working_sound =
    {
      sound = {filename = "__Moshine-assets__/sound/cosmic-scanner/construction-loop.ogg", volume = 1},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 20,
      fade_out_ticks = 20,
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
        subgroup = "moshine-space-platform",
        order = "b[moshine_cosmicscanner]-" .. i,
        categories = { "moshine_cosmicscanner-building" },
        energy_required = stage.upgrade_recipe.energy_required,
        enabled = false,
        ingredients = stage.upgrade_recipe.ingredients,
        results = {},
        raise_on_crafted = true,
        --hidden = true,
        --hidden_in_factoriopedia = true,
        hide_from_player_crafting = true,
        surface_conditions = {{ property = "gravity", min = 0, max = 0}},
        auto_recycle = false,
      },
    })
  end
end
