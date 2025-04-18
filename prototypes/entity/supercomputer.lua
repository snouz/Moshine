local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")


supercomputer = "__Moshine__/graphics/entity/supercomputer/"


local planetary_teleporter_on_animation = {

  layers = {
    --SHADOW
    {
      filename = supercomputer .. "teleporter-shadow.png",
      priority = "low",
      width = 531,
      height = 292,
      scale = 0.5,
      frame_count = 1,
      repeat_count = 95,
      draw_as_shadow = true,
      animation_speed = 0.5,
      shift = { 1.9, 1.2 - 0.5},
    },
    --BUILDING
    {
      filename = supercomputer .. "teleporter-base.png",
      priority = "high",
      width = 400,
      height = 475,
      scale = 0.5,
      repeat_count = 95,
      shift = {0,-0.5},
      animation_speed = 0.5,
    },
    -- GLOWS
    {
      filename = supercomputer .. "teleporter-base-combined-glow.png",
      priority = "high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 19,
      line_length = 5,
      repeat_count = 5,
      animation_speed = 0.5,
      draw_as_glow = true,
      shift = {0,-0.5},
      blend_mode = "additive",
    },
    -- LIGHTS
    {
      filename = supercomputer .. "teleporter-base-combined-light.png",
      priority = "high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 19,
      line_length = 5,
      repeat_count = 5,
      animation_speed = 0.5,
      draw_as_light = true,
      shift = {0,-0.5},
      blend_mode = "additive",
    },
    {
      filename = supercomputer .. "ball-anim.png",
      priority = "high",
      width = 256,
      height = 256,
      scale = 0.4,
      frame_count = 95,
      line_length = 10,
      animation_speed = 1,
      draw_as_glow = true,
      apply_special_effect = true,
      shift = {0,-2.4},
      blend_mode = "additive",
    },
  },
}

local planetary_teleporter_off_animation = {
  layers = {
    --SHADOW
    {
      filename = supercomputer .. "teleporter-shadow.png",
      priority = "low",
      width = 531,
      height = 292,
      scale = 0.5,
      frame_count = 1,
      repeat_count = 20,
      draw_as_shadow = true,
      animation_speed = 0.5,
      shift = { 1.9, 1.2 -0.5 },
    },
    --BUILDING
    {
      filename = supercomputer .. "teleporter-base.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      repeat_count = 20,
      shift = {0,-0.5},
      animation_speed = 0.5,
    },
  },
}



data:extend({
  {
    type = "lab",
    name = "supercomputer", -- Neural computer
    icon = "__Moshine__/graphics/icons/supercomputer.png",
    minable = {mining_time = 3, result = "supercomputer"},
    subgroup = "production-machine",
    order = "z-zz[z-lab]",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    collision_box = { { -2.7, -2.7 }, { 2.7, 2.7 } },
    selection_box = { { -3, -3 }, { 3, 3 } },
    drawing_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    max_health = 900,
    impact_category = "metal",
    alert_icon_shift = util.by_pixel(0, -12),
    icon_draw_specification = {shift = {0, -0.3}, scale = 1.2},
    corpse = "biolab-remnants",
    dying_explosion = "biolab-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 99
      }
    },
    --[[surface_conditions =
    {
      {
        property = "pressure",
        min = 1000,
        max = 1000
      }
    },]]
    --[[surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 0,
        max = 5
      }
    },]]
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1,
      },
    },
    damaged_trigger_effect = hit_effects.entity(),
    on_animation = planetary_teleporter_on_animation,
    off_animation = planetary_teleporter_off_animation,
    open_sound = { filename = "__base__/sound/open-close/lab-open.ogg", volume = 0.6 },
    close_sound = { filename = "__base__/sound/open-close/lab-close.ogg", volume = 0.6 },
    working_sound =
    {
      sound =
      {
        filename = "__Moshine__/sound/neural-computer/computer_buzz.ogg",
        volume = 0.6,
        modifiers = {volume_multiplier("main-menu", 2.2), volume_multiplier("tips-and-tricks", 0.8)},
        audible_distance_modifier = 0.7,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    researching_speed = 1,
    inputs =
    {
      -- declared in data-final-fixes.lua
      
      --[[
      "hard-drive",
      "model-stable"
      
      "automation-science-pack",
      "logistic-science-pack",
      "military-science-pack",
      "chemical-science-pack",
      "production-science-pack",
      "utility-science-pack",
      "space-science-pack",
      "metallurgic-science-pack",
      "agricultural-science-pack",
      "electromagnetic-science-pack",
      "cryogenic-science-pack",
      "promethium-science-pack"

      ]]
    },
    science_pack_drain_rate_percent = 50,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 8 }
    },
    energy_usage = "300kW",
    module_slots = 10,
    allowed_effects = {"speed"}, --{"consumption", "speed", "pollution", "quality"}, --"productivity"
    allowed_module_categories = {"ai-speed"},
    effect_receiver = {uses_module_effects = true, uses_beacon_effects = false, uses_surface_effects = false},
    icons_positioning =
    {
      {inventory_index = defines.inventory.lab_modules, shift = {0, 1.8}, scale = 0.5, max_icons_per_row = 5},
      {inventory_index = defines.inventory.lab_input, shift = {0, 0}, scale = 0.7, max_icons_per_row = 6, separation_multiplier = 1/1.1}
    }
  },

})