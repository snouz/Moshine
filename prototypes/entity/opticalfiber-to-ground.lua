local entitypath = "__Moshine__/graphics/entity/opticalfiber-to-ground/"
--require ("circuit-connector-sprites")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
--local simulations = require("__base__.prototypes.factoriopedia-simulations")

local gap_length = 1

opticalfibercoverspictures = function()
  return
  {
    north =
    {
      layers =
      {
        {
          filename = "__Moshine-assets__/graphics/entity/opticalfiber/opticalfiber-cover-north.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
      }
    },
    east =
    {
      layers =
      {
        {
          filename = "__Moshine-assets__/graphics/entity/opticalfiber/opticalfiber-cover-east.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
      }
    },
    south =
    {
      layers =
      {
        {
          filename = "__Moshine-assets__/graphics/entity/opticalfiber/opticalfiber-cover-south.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
      }
    },
    west =
    {
      layers =
      {
        {
          filename = "__Moshine-assets__/graphics/entity/opticalfiber/opticalfiber-cover-west.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          scale = 0.5
        },
      }
    }
  }
end

data:extend({
  {
    type = "corpse",
    name = "optical-cable-to-ground-remnants",
    icon = "__base__/graphics/icons/pipe-to-ground.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = entitypath .. "remnants/pipe-to-ground-remnants.png",
      width = 90,
      height = 80,
      line_length = 1,
      direction_count = 1,
      shift = util.by_pixel(0.5, -3),
      scale = 0.5
    }
  },
  {
    type = "pipe-to-ground",
    name = "optical-cable-to-ground",
    icon = "__Moshine__/graphics/icons/optical-cable-to-ground.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "optical-cable-to-ground"},
    max_health = 150,
    corpse = "optical-cable-to-ground-remnants",
    dying_explosion = "pipe-to-ground-explosion",
    --factoriopedia_simulation = simulations.factoriopedia_pipe_to_ground,
    icon_draw_specification = {scale = 0.5},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 40
      }

    },
    fast_replaceable_group = "optical-cable",
    collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 100,
      pipe_covers = opticalfibercoverspictures(),
      max_pipeline_extent = 1000000,
      pipe_connections =
      {
        { direction = defines.direction.north, position = {0, 0}, hide_connection_info = true, connection_category = "data"},
        {
          connection_type = "underground",
          direction = defines.direction.south,
          position = {0, 0},
          max_underground_distance = gap_length + 2,
          hide_connection_info = true,
          connection_category = "data",
        }
      },
    },
    impact_category = "metal",
    working_sound = sounds.pipe,
    open_sound = sounds.metal_small_open,
    close_sound = sounds.metal_small_close,
    circuit_connector = circuit_connector_definitions["pipe-to-ground"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_fluid_temperature_signal = {type = "virtual", name = "signal-T"},
    pictures =
    {
      north =
      {
        filename = entitypath .. "opticalfiber-to-ground-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      },
      south =
      {
        filename = entitypath .. "opticalfiber-to-ground-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = entitypath .. "opticalfiber-to-ground-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = entitypath .. "opticalfiber-to-ground-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5
      }
    },
    visualization =
    {
      north =
      {
        filename = entitypath .. "visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = entitypath .. "visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = entitypath .. "visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = entitypath .. "visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
    disabled_visualization =
    {
      north =
      {
        filename = entitypath .. "disabled-visualization.png",
        priority = "extra-high",
        x = 64,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      south =
      {
        filename = entitypath .. "disabled-visualization.png",
        priority = "extra-high",
        x = 192,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      west =
      {
        filename = entitypath .. "disabled-visualization.png",
        priority = "extra-high",
        x = 256,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
      east =
      {
        filename = entitypath .. "disabled-visualization.png",
        priority = "extra-high",
        x = 128,
        size = 64,
        scale = 0.5,
        flags = {"icon"}
      },
    },
  },
})