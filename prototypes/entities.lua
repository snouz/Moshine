require ("sound-util")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")

data:extend({
{
  type = "lab",
  name = "supercomputer",
  icon = "__Moshine__/graphics/icons/supercomputer.png",
  minable = {mining_time = 0.5, result = "supercomputer"},
  subgroup = "production-machine",
  order = "z-z[z-lab]",
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  max_health = 350,
  impact_category = "metal",
  alert_icon_shift = util.by_pixel(0, -12),
  icon_draw_specification = {shift = {0, -0.3}},
  corpse = "biolab-remnants",
  dying_explosion = "biolab-explosion",
  resistances =
  {
    {
      type = "fire",
      percent = 70
    }
  },
  surface_conditions =
  {
    {
      property = "pressure",
      min = 1000,
      max = 1000
    }
  },
  damaged_trigger_effect = hit_effects.entity(),
  on_animation = {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-anim",{
        frame_count = 32,
        scale = 0.5,
        animation_speed = 0.2,
      }),
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-lights",{
        frame_count = 32,
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.5,
        animation_speed = 0.2,
      }),
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-shadow",{
        frame_count = 32,
        scale = 0.5,
        animation_speed = 0.2,
        draw_as_shadow = true,
      })
    }
  },
  off_animation = {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-anim",{
        frame_count = 32,
        scale = 0.5,
        animation_speed = 0.2,
      }),
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-shadow",{
        frame_count = 32,
        scale = 0.5,
        animation_speed = 0.2,
        draw_as_shadow = true,
      })
    }
  },
  open_sound = sounds.machine_open,
  close_sound = sounds.machine_close,
  working_sound =
  {
    sound = {filename = "__space-age__/sound/entity/biolab/biolab-loop.ogg", volume = 0.7},
    sound_accents =
    {
      {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-push", 3, 0.3)}, frame = 1, audible_distance_modifier = 0.6},
      {sound = {variations = sound_variations("__space-age__/sound/entity/biolab/biolab-beaker", 7, 0.8)}, frame = 1, audible_distance_modifier = 0.4},
      {sound = {variations = sound_variations("__space-age__/sound/entity/biolab/biolab-centrifuge", 4, 0.7)}, frame = 14, audible_distance_modifier = 0.3},
      {sound = {variations = sound_variations("__space-age__/sound/entity/spawner/spawner-respirator-pull", 3, 0.3)}, frame = 17, audible_distance_modifier = 0.6},
    },
    max_sounds_per_type = 2,
  },
  researching_speed = 2,
  inputs =
  {
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
  },
  science_pack_drain_rate_percent = 50,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 8 }
  },
  energy_usage = "300kW",
  module_slots = 4,
  allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
  icons_positioning =
  {
    {inventory_index = defines.inventory.lab_modules, shift = {0, 1.6}},
    {inventory_index = defines.inventory.lab_input, shift = {0, 0.4}, max_icons_per_row = 6, separation_multiplier = 1/1.1}
  }
},




{
  type = "assembling-machine",
  name = "data-processor",
  icon = "__Moshine__/graphics/icons/data-processor.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 0.2, result = "data-processor"},
  max_health = 350,
  corpse = "assembling-machine-2-remnants",
  dying_explosion = "assembling-machine-2-explosion",
  icon_draw_specification = {shift = {0, -0.3}},
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
  circuit_connector = circuit_connector_definitions["assembling-machine"],
  alert_icon_shift = util.by_pixel(0, -12),
  resistances =
  {
    {
      type = "fire",
      percent = 70
    }
  },
  fluid_boxes =
  {
    {
      production_type = "input",
      pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 1000,
      pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
      secondary_draw_orders = { north = -1 }
    },
    {
      production_type = "output",
      pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 1000,
      pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
      secondary_draw_orders = { north = -1 }
    }
  },
  fluid_boxes_off_when_no_fluid_recipe = true,
  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  damaged_trigger_effect = hit_effects.entity(),
  fast_replaceable_group = "assembling-machine",
  next_upgrade = "assembling-machine-3",
  graphics_set =
  {
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
          priority = "high",
          width = 214,
          height = 218,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
          priority = "high",
          width = 196,
          height = 163,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12, 4.75),
          scale = 0.5
        }
      }
    },
  },
  open_sound = sounds.machine_open,
  close_sound = sounds.machine_close,
  impact_category = "metal",
  working_sound =
  {
    sound = { filename = "__base__/sound/assembling-machine-t2-1.ogg", volume = 0.45 },
    audible_distance_modifier = 0.5,
    fade_in_ticks = 4,
    fade_out_ticks = 20
  },
  crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},

  crafting_speed = 0.75,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 3 }
  },
  energy_usage = "150kW",
  module_slots = 2,
  allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
},


{
  type = "assembling-machine",
  name = "data-processor",
  icon = "__Moshine__/graphics/icons/data-processor.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 0.2, result = "assembling-machine-1"},
  max_health = 300,
  corpse = "assembling-machine-1-remnants",
  dying_explosion = "assembling-machine-1-explosion",
  icon_draw_specification = {shift = {0, -0.3}},
  resistances =
  {
    {
      type = "fire",
      percent = 70
    }
  },
  fluid_boxes =

{
  {
    production_type = "input",
    pipe_picture = assembler3pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    filter = "raw-data",
    pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    pipe_picture = assembler3pipepictures(),
    pipe_covers = pipecoverspictures(),
    volume = 1000,
    filter = "raw-data",
    pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
    secondary_draw_orders = { north = -1 }
  }
},

  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  damaged_trigger_effect = hit_effects.entity(),
  fast_replaceable_group = "assembling-machine",
  next_upgrade = "assembling-machine-2",
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
  circuit_connector = circuit_connector_definitions["assembling-machine"],
  alert_icon_shift = util.by_pixel(0, -12),
  graphics_set =
  {
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 214,
          height = 226,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 190,
          height = 165,
          line_length = 1,
          repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5),
          scale = 0.5
        }
      }
    }
  },
  crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
  crafting_speed = 0.5,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 4 }
  },
  energy_usage = "75kW",
  open_sound = sounds.machine_open,
  close_sound = sounds.machine_close,
  allowed_effects = {"speed", "consumption", "pollution"},
  effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
  impact_category = "metal",
  working_sound =
  {
    sound = { filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5 },
    audible_distance_modifier = 0.5,
    fade_in_ticks = 4,
    fade_out_ticks = 20
  }
},







{
  type = "pipe",
  name = "optical-fiber",
  icon = "__Moshine__/graphics/icons/optical-fiber.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.1, result = "optical-fiber"},
  max_health = 100,
  corpse = "pipe-remnants",
  dying_explosion = "pipe-explosion",
  icon_draw_specification = {scale = 0.5},
  resistances =
  {
    {
      type = "fire",
      percent = 80
    },
    {
      type = "impact",
      percent = 30
    }
  },
  fast_replaceable_group = "optical-fiber",
  collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  damaged_trigger_effect = hit_effects.entity(),
  fluid_box =
  {
    volume = 100,
    pipe_covers = pipecoverspictures(), -- in case a real pipe is connected to a ghost
    filter = "raw-data",
    pipe_connections =
    {
      { direction = defines.direction.north, position = {0, 0} },
      { direction = defines.direction.east, position = {0, 0} },
      { direction = defines.direction.south, position = {0, 0} },
      { direction = defines.direction.west, position = {0, 0} }
    },
    hide_connection_info = true
  },
  impact_category = "metal",
  pictures = pipepictures(),
  working_sound = sounds.pipe,
  open_sound = sounds.metal_small_open,
  close_sound = sounds.metal_small_close,

  horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
  vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
},








})