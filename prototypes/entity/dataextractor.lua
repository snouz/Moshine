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
    type = "mining-drill",
    name = "data-extractor",
    icon = "__Moshine__/graphics/icons/data-extractor.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "data-extractor"},
    resource_categories = {"raw-data"},
    max_health = 200,
    corpse = "pumpjack-remnants",
    dying_explosion = "pumpjack-explosion",
    collision_mask = {layers={doodad=true},colliding_with_tiles_only = false},
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
      volume = 10000,
      --pipe_covers = pipecoverspictures(),,
      max_pipeline_extent = 1000000,
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
    energy_usage = "3000kW",
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
      sound = {filename = "__Moshine-assets__/sound/data-extractor/extractor_buzz.ogg", volume = 1.1},
      --max_sounds_per_type = 3,
      audible_distance_modifier = 0.6,
      fade_in_ticks = 4,
      fade_out_ticks = 10
    },
    fast_replaceable_group = "data-extractor",

    circuit_connector = circuit_connector_definitions.create_vector
      (
        universal_connector_template,
        {
          { variation = 26, main_offset = util.by_pixel(-30, 74), shadow_offset = util.by_pixel(-30, 74), show_shadow = true },
          { variation = 26, main_offset = util.by_pixel(-30, 74), shadow_offset = util.by_pixel(-30, 74), show_shadow = true },
          { variation = 26, main_offset = util.by_pixel(-30, 74), shadow_offset = util.by_pixel(-30, 74), show_shadow = true },
          { variation = 26, main_offset = util.by_pixel(-30, 74), shadow_offset = util.by_pixel(-30, 74), show_shadow = true }
        }
      ),
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
})