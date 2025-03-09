local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
 
data:extend({
  {
    type = "assembling-machine",
    name = "data-processor",
    icon = "__Moshine__/graphics/icons/data-processor.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "data-processor"},
    crafting_categories = {"data-processing"},
    max_health = 300,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-explosion",
    icon_draw_specification = {shift = {0, 0}, scale = 0.7},
    resistances =
    {
      {
        type = "fire",
        percent = 98
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        --pipe_covers = pipecoverspictures(),
        volume = 1000,
        --filter = "raw-data",
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.north, position = {0, -1}, connection_category = "data"}},
        secondary_draw_orders = { north = -1 },
        max_pipeline_extent = 1000000000,
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        --pipe_covers = pipecoverspictures(),
        volume = 1000,
        --filter = "raw-data",
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.south, position = {0, 1}, connection_category = "data"}},
        secondary_draw_orders = { north = -1 },
        max_pipeline_extent = 1000000000,
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        --pipe_covers = pipecoverspictures(),
        volume = 1000,
        --filter = "raw-data",
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.east, position = {1, 0}, connection_category = "data"}},
        secondary_draw_orders = { north = -1 },
        max_pipeline_extent = 1000000000,
      },
      {
        production_type = "input",
        --pipe_picture = assembler3pipepictures(),
        --pipe_covers = pipecoverspictures(),
        volume = 1000,
        --filter = "raw-data",
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.west, position = {-1, 0}, connection_category = "data"}},
        secondary_draw_orders = { north = -1 },
        max_pipeline_extent = 1000000000,
      },
      {
        production_type = "output",
        --pipe_picture = assembler3pipepictures(),
        --pipe_covers = pipecoverspictures(),
        volume = 1000,
        --filter = "raw-data",
        pipe_connections = {{ flow_direction="input-output", direction = defines.direction.north, position = {-1, -1}, connection_category = "data"}},
        secondary_draw_orders = { north = -1 },
        max_pipeline_extent = 1000000000,
      },
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "data-processor",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set =
    {
      animation_progress = 0.25,
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
          duration = 30,
          next_active = "working",
          next_inactive = "idle",
        },
      },
      idle_animation =
      {
        layers =
        {
          {
            filename = "__Moshine__/graphics/entity/data-processor/suit-plug-outlet-hr-base.png",
            priority="high",
            width = 290,
            height = 290,
            repeat_count = 30,
            line_length = 1,
            animation_speed = 1/3,
            shift = util.by_pixel(0, -16),
            scale = 0.5
          },
          {
            filename = "__Moshine__/graphics/entity/data-processor/suit-plug-outlet-hr-shadow.png",
            priority="high",
            width = 400,
            height = 350,
            repeat_count = 30,
            line_length = 1,
            draw_as_shadow = true,
            animation_speed = 1/3,
            shift = util.by_pixel(0, -16),
            scale = 0.5
          },
          {
            filename = "__Moshine__/graphics/entity/data-processor/suit-plug-outlet-hr-animation-1.png",
            priority="high",
            width = 160,
            height = 290,
            frame_count = 16,
            line_length = 8,
            animation_speed = 1/3,
            run_mode = "forward-then-backward",
            shift = util.by_pixel(0, -16),
            scale = 0.5
          },
          
        }
      },
      working_visualisations =
      {
        {
          always_draw = true,
          draw_in_states = {"working"},
          animation = 
          { 
            layers = {
              {
                filename = "__Moshine__/graphics/entity/data-processor/suit-plug-outlet-hr-animation-1.png",
                priority="high",
                width = 160,
                height = 290,
                frame_count = 16,
                line_length = 8,
                animation_speed = 1/3,
                run_mode = "forward-then-backward",
                shift = util.by_pixel(0, -16),
                scale = 0.5
              },
              {
                filename = "__Moshine__/graphics/entity/data-processor/suit-plug-outlet-hr-emission-1.png",
                priority="high",
                width = 160,
                height = 290,
                frame_count = 16,
                line_length = 8,
                animation_speed = 1/3,
                run_mode = "forward-then-backward",
                draw_as_glow = true,
                blend_mode = "additive",
                shift = util.by_pixel(0, -16),
                scale = 0.5
              },
            }
          },
          name = "rotation"
        },
      }
    },
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
    --allowed_effects = {"speed", "consumption", "pollution"},
    --effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    module_slots = 5,
    allowed_effects = {"speed"}, --{"consumption", "speed", "pollution", "quality"}, --"productivity"
    allowed_module_categories = {"ai-speed"},
    impact_category = "metal",
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 0.4,
        modifiers = volume_multiplier("main-menu", 1.44),
        audible_distance_modifier = 0.5
      },
      match_volume_to_activity = true,
      activity_to_volume_modifiers = {offset = 2, inverted = true},
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
  },
})