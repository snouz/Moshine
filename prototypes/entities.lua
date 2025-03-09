require ("sound-util")
require ("opticalfiberpictures")
require ("supercomputer")
require ("dataprocessor")
require ("computerfarm")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")

local data_extractor_sheet =
{
  layers = {
    {
      filename = "__Moshine__/graphics/entity/data-extractor/data-extractor-base-shadow.png",
      width = 700,
      height = 500,
      scale = 0.5,
      draw_as_shadow = true,
      shift = util.by_pixel(0, 0),
    },
    {
      filename = "__Moshine__/graphics/entity/data-extractor/data-extractor-base.png",
      priority = "extra-high",
      width = 700,
      height = 500,
      scale = 0.5,
      shift = util.by_pixel(0, 0),
    },
    {
      filename = "__Moshine__/graphics/entity/data-extractor/data-extractor-base-light.png",
      width = 700,
      height = 500,
      scale = 0.5,
      draw_as_light = true,
      shift = util.by_pixel(0, 0),
    },
  }
}










data:extend({
  {
    type = "corpse",
    name = "opticalfiber-remnants",
    icon = "__Moshine__/graphics/icons/optical-fiber.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2,
    {
      filename = "__Moshine__/graphics/entity/opticalfiber/remnants/opticalfiber-remnants.png",
      width = 122,
      height = 120,
      line_length = 1,
      direction_count = 2,
      shift = util.by_pixel(1.5, 2.5), -- -0,5
      scale = 0.5
    })
  },

  {
    type = "pipe",
    name = "optical-cable",
    icon = "__Moshine__/graphics/icons/optical-fiber.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "optical-cable"},
    max_health = 10,
    corpse = "opticalfiber-remnants",
    dying_explosion = "pipe-explosion",
    icon_draw_specification = {scale = 0},
    resistances =
    {
      {
        type = "fire",
        percent = 30
      },
      {
        type = "impact",
        percent = 50
      }
    },
    fast_replaceable_group = "optical-cable",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 10,
      pipe_covers = opticalfibercoverspictures(), -- in case a real pipe is connected to a ghost
      --filter = "raw-data",
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0}, connection_category = "data" },
        { direction = defines.direction.east, position = {0, 0}, connection_category = "data" },
        { direction = defines.direction.south, position = {0, 0}, connection_category = "data" },
        { direction = defines.direction.west, position = {0, 0}, connection_category = "data" }
      },
      hide_connection_info = true,
      max_pipeline_extent = 1000000000,
    },
    impact_category = "glass",
    pictures = opticalfiberpictures(),
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,

    horizontal_window_bounding_box = {{-0.25, -0.28125}, {0.25, 0.15625}},
    vertical_window_bounding_box = {{-0.28125, -0.5}, {0.03125, 0.125}}
  },







  {
    type = "mining-drill",
    name = "data-extractor",
    icon = "__Moshine__/graphics/icons/data-extractor.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "data-extractor"},
    resource_categories = {"raw-data"},
    max_health = 200,
    corpse = "pumpjack-remnants",
    dying_explosion = "pumpjack-explosion",
    collision_mask = {layers={},colliding_with_tiles_only = true},
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    energy_source =
    {
      type = "electric",
      emissions_per_minute = { pollution = 10 },
      usage_priority = "secondary-input"
    },
    output_fluid_box =
    {
      volume = 1000,
      --pipe_covers = pipecoverspictures(),,
      max_pipeline_extent = 1000000000,
      pipe_connections =
      {
        {
          direction = defines.direction.north,
          position = {0, -2},
          connection_category = "data",
          flow_direction = "output"
        },
      }
    },
    energy_usage = "90kW",
    mining_speed = 0.5,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    module_slots = 2,
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {78, 173, 255},
    --base_picture =
    --{
    --  north = data_extractor_sheet,
    --  east = data_extractor_sheet,
    --  south = data_extractor_sheet,
    --  west = data_extractor_sheet,
    --},
    graphics_set =
    {
      always_draw_idle_animation = true,
      idle_animation = 
      {
        north =
        {
          layers =
          {
            {
              filename = "__Moshine__/graphics/entity/data-extractor/data-extractor-base-shadow.png",
              width = 700,
              height = 500,
              scale = 0.5,
              draw_as_shadow = true,
              repeat_count = 24,
              shift = util.by_pixel(0, 0),
            },
            {
              filename = "__Moshine__/graphics/entity/data-extractor/data-extractor-base.png",
              priority = "extra-high",
              width = 700,
              height = 500,
              scale = 0.5,
              repeat_count = 24,
              shift = util.by_pixel(0, 0),
            },
            {
              filename = "__Moshine__/graphics/entity/data-extractor/data-extractor-base-light.png",
              width = 700,
              height = 500,
              scale = 0.5,
              draw_as_light = true,
              repeat_count = 24,
              shift = util.by_pixel(0, 0),
            },
          }
        }
      },
      animation =
      {
        north =
        {
          layers =
          {
            {
              filename = "__Moshine__/graphics/entity/data-extractor/hr-crash-site-lab-repaired-beams.png",
              priority = "high",
              width = 130,
              height = 100,
              frame_count = 24,
              line_length = 6,
              animation_speed = 1/3,
              shift = util.by_pixel(11, -27),
              draw_as_glow = true,
              blend_mode = "additive",
              scale = 0.5
            },
            {
              filename = "__Moshine__/graphics/entity/data-extractor/hr-crash-site-lab-repaired-beams.png",
              priority = "high",
              width = 130,
              height = 100,
              frame_count = 24,
              line_length = 6,
              animation_speed = 1/3,
              shift = util.by_pixel(11, -27),
              draw_as_light = true,
              scale = 0.5
            },
          }
        }
      }
    },
    --base_render_layer = "under-elevated",
    open_sound = {filename = "__base__/sound/open-close/pumpjack-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/pumpjack-close.ogg", volume = 0.5},
    working_sound =
    {
      sound = {filename = "__base__/sound/pumpjack.ogg", volume = 0.7},
      max_sounds_per_type = 3,
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 10
    },
    fast_replaceable_group = "data-extractor",

    circuit_connector = circuit_connector_definitions["pumpjack"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  --{
  --  type = "fuel-category",
  --  name = "processing-power"
  --},

  {
    type = "furnace",
    name = "ai-trainer", --stone-furnace
    icon = "__Moshine__/graphics/icons/ai-trainer.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "ai-trainer"},
    fast_replaceable_group = "ai-trainer",
    --next_upgrade = "steel-furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["stone-furnace"],
    max_health = 1000,
    corpse = "stone-furnace-remnants",
    dying_explosion = "stone-furnace-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    impact_category = "metal",
    icon_draw_specification = {scale = 0},
    ignore_output_full = true,
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 0,
        max = 5
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__Moshine__/sound/ai-trainer/ai-trainer-loop.ogg",
        volume = 0.6,
        modifiers = {volume_multiplier("main-menu", 1.5), volume_multiplier("tips-and-tricks", 1.4)},
        audible_distance_modifier = 0.4
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    damaged_trigger_effect = hit_effects.rock(),
    crafting_categories = {"ai-training"},
    energy_usage = "20kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 12,
    --[[energy_source =
    {
      type = "fluid",
      fluid_box =
      {
        production_type = "input",
        volume = 1000,
        filter = "processing-power-fluid",
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1}, connection_category = "data"}},
        secondary_draw_orders = { north = -1 },
        max_pipeline_extent = 1000000000,
      },
      fluid_usage_per_tick = 4,
    },]]
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-base.png",
            priority = "extra-high",
            width = 620,
            height = 620,
            scale = 0.5,
          },
          {
            filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-base-shadow.png",
            width = 620,
            height = 620,
            draw_as_shadow = true,
            scale = 0.5,
          },
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            layers =
            {
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                scale = 0.5,
              },
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim.png",
                blend_mode = "additive",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                draw_as_light = true,
                scale = 0.5,
              },
            }
          }
        },
        --[[{
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__base__/graphics/entity/stone-furnace/stone-furnace-ground-light.png",
            blend_mode = "additive",
            width = 116,
            height = 110,
            repeat_count = 48,
            draw_as_light = true,
            shift = util.by_pixel(-1, 44),
            scale = 0.5,
          },
        },]]--
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/stone-furnace/stone-furnace-reflection.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          shift = util.by_pixel(0, 35),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },

--[[

  {
    type = "assembling-machine",
    name = "ai-support",
    icon = "__Moshine__/graphics/icons/ai-support.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "ai-support"},
    max_health = 400,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",
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
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    fast_replaceable_group = "assembling-machine",
    graphics_set =
    {
      animation_progress = 0.5,
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        }
      }
    },

    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 }
    },
    energy_usage = "375kW",
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
  },
]]--
})