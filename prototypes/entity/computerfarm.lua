require ("sound-util")
require ("circuit-connector-sprites")
require ("util")
require ("__space-age__.prototypes.entity.circuit-network")
require ("__space-age__.prototypes.entity.space-platform-hub-cockpit")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__base__.prototypes.tile.tile-trigger-effects")
local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local space_platform_tile_animations = require("__space-age__.prototypes.tile.platform-tile-animations")
local space_age_tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local ENTITYPATH = "__Moshine__/graphics/entity"


local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
--local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")


local seconds = 60
local minutes = 60 * seconds
local plant_flags = {"placeable-neutral"} --"placeable-off-grid"  "breaths-air"
local gleba_tree_underwater_things = {}

local nuthin = {
  filename = "__Moshine__/graphics/empty.png",
  priority = "very-low",
  height = 1,
  width = 1,
  direction_count = 1,
}

local function make_process_size_speed_shift(size, speed, shift_h, shift_v)
  return 
  {
    --probability =0.05,
    --scale = 1.2,--size/4,
    animation = {
      sheets = {
        {
          variation_count = 1,
          filenames = {"__Moshine__/graphics/entity/quantum-computer/plant-datacell.png"},
          size = 128,
          --repeat_count = 1,
          lines_per_file = 1,
          frame_count = 25,
          animation_speed = speed/10,
          scale = 0.5,
          frame_sequence = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
        },
        {
          variation_count = 1,
          filenames = {"__Moshine__/graphics/entity/quantum-computer/plant.png"},
          size = 128,
          lines_per_file = 25,
          frame_count = 25,
          animation_speed = speed/10,
          shift = util.by_pixel(shift_h, shift_v),
          scale = 0.6,
          draw_as_glow = true,
        },
      }
    }
  }
end


local default_dying_effect =
{
  particle_effects =
  {
    type = "create-particle",
    repeat_count = 20,
    particle_name = "accumulator-metal-particle-big",
    speed_from_center = 0.02,
    speed_from_center_deviation = 0.01,
    offset_deviation = { { -0.3945, -0.4961 }, { 0.3945, 0.4961 } },
    initial_height = 0.0,
    initial_height_deviation = 0.2
  },
  particle_effect_linear_distance_step = 0.15,
  explosion =
  {
    name = "explosion",
    offset = { 0.0, 1.0 },
  },
  explosion_linear_distance_step = 0.4
}

local craneprop = {
  origin = {0, 0, 2.8},
  shadow_direction = {-0.59502, 0.009124, 0.803659},

  speed =
  {
    arm =
    {
      turn_rate = 0.01,
      extension_speed = 0.3
    },
    grappler =
    {
      vertical_turn_rate = 1,
      horizontal_turn_rate = 1,
      extension_speed = 1,
      allow_transpolar_movement = true
    }
  },
  min_arm_extent = 0.0,
  min_grappler_extent = 0.2,
  operation_angle = 10,--in degrees
  telescope_default_extention = 0.5,

  parts =
  {
    --[[
    {
      rotated_sprite =
      util.sprite_load("__Moshine__/graphics/entity/agricultural-tower/agricultural-tower-crane-1",
      {
        priority = "very-low",
        dice = 4,
        direction_count = 128,
        scale = 0.5
      }),
      rotated_sprite_shadow =
      util.sprite_load("__Moshine__/graphics/entity/agricultural-tower/agricultural-tower-crane-1-shadow",
      {
        priority = "very-low",
        direction_count = 64,
        scale = 1,
        draw_as_shadow = true
      }),
      rotated_sprite_reflection =
      util.sprite_load("__Moshine__/graphics/entity/agricultural-tower/agricultural-tower-crane-1-reflection",
      {
        priority = "very-low",
        direction_count = 64,
        scale = 5
      }),
      layer = 1,
      allow_sprite_rotation = false,
      should_scale_for_perspective = false,
      relative_position = {0.0, 0.0, 0.0 },
      extendable_length = {0.0, 0.0, 0.0 },
      static_length = {0.0, 0.0, 0.88 },
      snap_start = 1.0,
      snap_end = 1.0,
      dying_effect = default_dying_effect,
      name = "hub"
    },
    ]]
    {
      rotated_sprite =
      {
        filename = "__Moshine__/graphics/entity/agricultural-tower/laser-artillery-turret.png",
        width = 220,
        height = 190,
        shift = util.by_pixel(0, 0),
        line_length = 8,
        priority = "very-low",
        direction_count = 64,
        scale = 0.5,
      },
      rotated_sprite_shadow = --nuthin,
      {
        filename = "__Moshine__/graphics/entity/agricultural-tower/laser-artillery-turret-shadow.png",
        width = 230,
        height = 190,
        shift = util.by_pixel(5, 5),
        line_length = 8,
        priority = "very-low",
        direction_count = 64,
        scale = 0.5,
        draw_as_shadow = true
      },
      rotated_sprite_reflection = nuthin,
      layer = 1,
      allow_sprite_rotation = false,
      should_scale_for_perspective = false,
      relative_position = {0.0, 0.0, 0.0 },
      extendable_length = {0.0, 0.0, 0.0 },
      static_length = {0.0, 0.0, 0.88 },
      snap_start = 1.0,
      snap_end = 1.0,
      dying_effect = default_dying_effect,
      name = "hub"
    },

    {
      rotated_sprite = nuthin,
      rotated_sprite_shadow = nuthin,
      rotated_sprite_reflection = nuthin,
      layer = -1,
      should_scale_for_perspective = false,
      relative_position = {0.0, 0.45, 0.0 },
      extendable_length = {0.0, 0.0, 0.0 }, --tg(37.3)
      static_length = {0.0, 1.0, 1.0 * 0.76179585},
      snap_start = 1.0,
      snap_end = 0.7,
      dying_effect = default_dying_effect,
      name = "arm_inner"
    },
    {
      rotated_sprite = nuthin,
      rotated_sprite_shadow = nuthin,
      rotated_sprite_reflection = nuthin,
      layer = 2,
      should_scale_for_perspective = false,
      relative_position = {0.0, 0.4, 0.4 * 0.76179585 + 0.1 },
      extendable_length = {0.0, 0.0, 0.0 * 0.1228 }, -- tg(7°)
      static_length = {0.0, 1.6, 1.6 * 0.1228},
      snap_start = 0.8,
      snap_end = 0.5,
      snap_end_arm_extent_multiplier = 0.1,
      dying_effect = default_dying_effect,
      name = "arm_inner_joint"
    },
    {
      rotated_sprite = nuthin,
      rotated_sprite_shadow = nuthin,
      rotated_sprite_reflection = nuthin,
      is_contractible_by_cropping = true,
      relative_position = {0.0, -1.5, -1.5 * 0.1228},
      extendable_length = {0.0, 4.5, 4.5 * 0.1228 }, -- tg(7°)
      static_length = {0.0, 1.4, 1.4 * 0.1228},
      snap_start = 0.7,
      snap_end = 0.3,
      dying_effect = default_dying_effect,
      name = "arm_central"
    },
    {
      rotated_sprite = nuthin,
      rotated_sprite_shadow = nuthin,
      rotated_sprite_reflection = nuthin,
      layer = 1,
      orientation_shift = 0.0,
      relative_position = {0, -0.2, 0.3 * 0.1228},
      extendable_length = {0, 0, 0 },
      static_length = {0, 0.7, 0.7* -0.1944 }, --tg(-11°)
      snap_start = 0.3,
      snap_end = 0.2,
      snap_end_arm_extent_multiplier = 0.05,
      dying_effect = default_dying_effect,
      name = "arm_central_joint"
    },
    {
      rotated_sprite = nuthin,
      rotated_sprite_shadow = nuthin,
      rotated_sprite_reflection = nuthin,
      layer = 0,
      is_contractible_by_cropping = true,
      relative_position = {0.0, -0.5, -0.5 * -0.1944},
      extendable_length = {0, 4, -4 * 0.1944 }, --tg(11°)
      static_length = {0, 1.9, 1.9 * -0.1944 },
      snap_start = 0.3,
      snap_end = 0.0,
      dying_effect = default_dying_effect,
      name = "arm_outer"
    },
    {
      rotated_sprite = nuthin,
      rotated_sprite_shadow = nuthin,
      rotated_sprite_reflection = nuthin,
      layer = -1,
      relative_position = {0.0, 0.0, -0.17 },
      static_length_grappler = {0, 0, -0.6 },
      dying_effect = default_dying_effect,
      name = "grappler-hub"
    },
    {
      sprite =
      util.sprite_load("__Moshine__/graphics/entity/agricultural-tower/agricultural-tower-crane-9",
      {
        priority = "very-low",
        scale = 0.5
      }),
      sprite_shadow =
      util.sprite_load("__Moshine__/graphics/entity/agricultural-tower/agricultural-tower-crane-9-shadow",
      {
        priority = "very-low",
        scale = 1,
        draw_as_shadow = true
      }),
      sprite_reflection =
        util.sprite_load("__Moshine__/graphics/entity/agricultural-tower/agricultural-tower-crane-9-reflection",
        {
          priority = "very-low",
          scale = 5
      }),
      scale_to_fit_model = true,
      layer = -2,
      relative_position = {0.0, 0.0, 0.0 },
      static_length_grappler = {0, 0, -0.5 },
      extendable_length_grappler = {0, 0, -4 },
      dying_effect = default_dying_effect,
      name = "telescope"
    },
    {
      sprite =
      {
        filename = "__Moshine__/graphics/entity/agricultural-tower/agricultural-tower-crane-10.png",
        shift = util.by_pixel(0, -16),
        line_length = 1,
        priority = "very-low",
        scale = 0.5,
        height = 64,
        width = 64,
        draw_as_glow = true,
      },
      rotated_sprite_shadow = nuthin,
      rotated_sprite_reflection = nuthin,
      layer = -3,
      should_scale_for_perspective = false,
      relative_position = {0.0, 0.0, 0.0 },
      static_length_grappler = {0, 0, -0.75 },
      extendable_length_grappler = {0, 0, 0 },
      dying_effect = default_dying_effect,
      name = "grappler-claw"
    }
  }
}

data:extend({
  {
    type = "agricultural-tower",
    name = "processing-grid",
    icon = "__Moshine__/graphics/icons/processing-grid.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "processing-grid"},
    fast_replaceable_group = "computer-farm",
    max_health = 500,
    corpse = "agricultural-tower-remnants",
    dying_explosion = "agricultural-tower-explosion",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    input_inventory_size = 1,
    radius_visualisation_picture =
    {
      filename = "__core__/graphics/white-square.png",
      priority = "extra-high",
      width = 10,
      height = 10,
      scale = 0.60,
    },
    random_growth_offset = 0,
    growth_grid_tile_size = 2,
    growth_area_radius = 0.65,
    radius = 4,
    crane = craneprop,
    planting_procedure_points =
    {
      {0.0, 0.0, 0.75},
      {0.0, 0.0, 0.0},
      {0.0, 0.05, -0.05},
      {0.0353553, 0.0353553, -0.1},
      {0.05, 0.0, -0.15},
      {0.0353553, -0.0353553, -0.2},
      {0.0, -0.05, -0.25},
      {-0.0353553, -0.0353553, -0.3},
      {-0.05, 0.0, -0.35},
      {-0.0353553, 0.0353553, -0.4},
      {0.0, 0.0, -0.45},
      {0.0, 0.0, 0.0}
    },
    harvesting_procedure_points =
    {
      {0.0, 0.0, 1.0}
    },
    drawing_box_vertical_extension = 5.5,
    heating_energy = "1000kW",
    energy_usage = "1000kW",
    crane_energy_usage = "1000kW",
    working_sound =
    {
      sound =
      {
        filename = "__Moshine__/sound/entity/agricultural-tower/agricultural-tower-hub-loop.ogg",
        volume = 0.5,
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    central_orienting_sound =
    {
      sound = {filename = "__Moshine__/sound/entity/agricultural-tower/agricultural-tower-rotation-loop.ogg", volume = 0.9},
      stopped_sound = {filename = "__Moshine__/sound/entity/agricultural-tower/agricultural-tower-rotation-stop.ogg", volume = 0.9}
    },
    central_orienting_sound_source = "hub",
    arm_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-loop.ogg", volume = 0},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-stop.ogg", volume = 0}
    },
    arm_extending_sound_source = "arm_central_joint",
    grappler_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-loop.ogg", volume = 0},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-stop.ogg", volume = 0}
    },
    grappler_orienting_sound_source = "grappler-hub",
    grappler_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-loop.ogg", volume = 0},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-stop.ogg", volume = 0}
    },
    grappler_extending_sound_source = "grappler-hub",
    planting_sound = sound_variations("__Moshine__/sound/entity/agricultural-tower/cervo", 13, 0.9),
    harvesting_sound = sound_variations("__Moshine__/sound/entity/agricultural-tower/cervo", 13, 0.9),
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-2.7, -2.7}, {2.7, 2.7}},
    selection_box = {{-3, -3}, {3, 3}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 0,
        max = 5
      },
      {
        property = "gravity",
        min = 0.1,
      },
    },
    damaged_trigger_effect = hit_effects.entity(),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { spores = 0 } -- necessary so attack groups find the entity
    },
    circuit_connector = circuit_connector_definitions.create_single
      (
        universal_connector_template,
        { variation = 30, main_offset = util.by_pixel(-52, 83), shadow_offset = util.by_pixel(-52, 83), show_shadow = true }
      ),
    circuit_wire_max_distance = 30,
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__Moshine__/graphics/entity/quantum-computer/quantum-computer.png",
            width = 400,
            height = 420,
            shift = util.by_pixel(0, -6),
            line_length = 8,
            priority = "high",
            animation_speed = 0.5,
            frame_count = 48,
            scale = 0.5,
          },
          {
            filename = "__Moshine__/graphics/entity/quantum-computer/quantum-computer-sh.png",
            width = 402,
            height = 362,
            shift = util.by_pixel(6, 10),
            line_length = 1,
            priority = "high",
            frame_count = 1,
            repeat_count = 48,
            draw_as_shadow = true,
            scale = 0.5,
          },
          {
            filename = "__Moshine__/graphics/entity/quantum-computer/quantum-computer-glow.png",
            width = 400,
            height = 420,
            shift = util.by_pixel(0, -6),
            line_length = 8,
            priority = "high",
            animation_speed = 0.5,
            frame_count = 48,
            scale = 0.5,
            draw_as_glow = true,
          },
          {
            filename = "__Moshine__/graphics/entity/quantum-computer/quantum-computer-light.png",
            width = 400,
            height = 420,
            shift = util.by_pixel(0, -6),
            line_length = 8,
            priority = "high",
            animation_speed = 0.5,
            frame_count = 48,
            scale = 0.5,
            draw_as_light = true,
          },
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 36,
          shift = util.by_pixel(0, 20),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },



  {
    type = "plant",
    name = "processing-grid-process-equation",
    icon = "__Moshine__/graphics/icons/processing-grid-process-equation.png",
    flags = {"placeable-neutral"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.2,
      results = {{type = "item", name = "datacell-solved-equation", amount = 1}},
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = {
                {
                  type = "play-sound",
                  sound = sound_variations("__Moshine__/sound/entity/agricultural-tower/cervo", 13, 0.9),
                  damage_type_filters = "fire"
                }
              }
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__Moshine__/sound/entity/agricultural-tower/cervo", 13, 0.9), --sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__Moshine__/sound/entity/agricultural-tower/cervo", 13, 0.9), --sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 4 * minutes,
    --harvest_emissions = plant_harvest_emissions,
    --emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    --collision_mask = {layers={player=true, ground_tile=true, train=true}},
    selection_box = {{-1, -1}, {1, 1}},
    sticker_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "moshine-processes",
    order = "lll",
    impact_category = "tree",
    --factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
    autoplace =
    {
      --control = "gleba_plants",
      --order = "a[tree]-b[forest]-a",
      --probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      --richness_expression = "random_penalty_at(3, 1)",
      probability_expression = 0,
      tile_restriction = {"processing-tile"},
    },
    tile_buildability_rules = {
      {
        area = {{-0.5, -0.5}, {0.5, 0.5}},
        required_tiles = {layers = {ground_tile = true}},
      }
    },
    --variations = gleba_tree_variations("yumako-tree", 8, 4, 1.3),
    stateless_visualisation_variations = {
      make_process_size_speed_shift(5, 3, 0, 0),
      make_process_size_speed_shift(6, 3, 0, 0),
      make_process_size_speed_shift(4, 3, 0, 0),
      make_process_size_speed_shift(4.5, 3, 0, 0),
      make_process_size_speed_shift(5.5, 3, 0, 0),
      make_process_size_speed_shift(5, 3, 0, 0),


      make_process_size_speed_shift(5, 4, 0, 0),
      make_process_size_speed_shift(6, 4, 0, 0),
      make_process_size_speed_shift(4, 4, 0, 0),
      make_process_size_speed_shift(4.5, 4, 0, 0),
      make_process_size_speed_shift(5.5, 4, 0, 0),

      make_process_size_speed_shift(5, 2, 0, 0),
      make_process_size_speed_shift(6, 2, 0, 0),
      make_process_size_speed_shift(4, 2, 0, 0),
      make_process_size_speed_shift(4.5, 2, 0, 0),
      make_process_size_speed_shift(5.5, 2, 0, 0),

      make_process_size_speed_shift(5, 3, 2, 3),
      make_process_size_speed_shift(6, 3, -3, 2),
      make_process_size_speed_shift(4, 3, 3, -2),
      make_process_size_speed_shift(4.5, 3, -3, -2),
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__Moshine__/graphics/empty.png",
          width = 1,
          height = 1,
        }
      }
    },


    --[[colors = minor_tints(),
    agricultural_tower_tint =
    {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },]]
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-yumako-soil", "artificial-yumako-soil"}, remove_on_collision = true} },
    --[[ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/yumako-tree", 6, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },]]--
    map_color = {255, 255, 255},
  },






--[[
  {
    type = "tile-effect",
    name = "processing-tile",
    shader = "water",
    water =
    {
      shader_variation = "lava",
      textures =
      {
        {
          filename = "__Moshine__/graphics/entity/processing-tile/coolingmat-noise-texture-poly.png",
          width = 512,
          height = 512
        },
        {
          filename = "__Moshine__/graphics/entity/processing-tile/hr_solarfloor.png",
          width = 512,
          height = 512
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 1,
      secondary_texture_variations_rows = 1,

      animation_speed = 0.3,
      animation_scale = { 1, 1 },
      tick_scale = 1,

      specular_lightness = { 30, 48, 22 },
      foam_color = { 73, 5, 5 },
      foam_color_multiplier = 1,

      dark_threshold = { 0.755, 0.755 },
      reflection_threshold = { 1, 1 },
      specular_threshold = { 0.889, 0.291 },

      near_zoom = 1 / 16,
      far_zoom = 1 / 16
    }
  },



  {
    type = "tile",
    name = "processing-tile",
    icon = "__Moshine__/graphics/icons/processing-tile.png",
    icon_size = 64,
    order = "a[artificial]-b[tier-2]-a[concrete]",
    effect = "processing-tile",
    effect_color = { 167, 59, 27 },
    effect_color_secondary = { 49, 80, 14 },

    subgroup = "artificial-tiles",
    needs_correction = false,
    minable = {mining_time = 0.1, result = "concrete"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    walking_speed_modifier = 1.4,
    layer = 255,
    layer_group = "top",
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 100,


    variants =
    {
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_inner-corner.png",
            count = 1,
            scale = 0.5,
          },
          outer_corner =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_outer-corner.png",
            count = 1,
            scale = 0.5,
          },
          side =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_side.png",
            count = 1,
            scale = 0.5,
          },
          u_transition =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_u.png",
            count = 1,
            scale = 0.5,
          },
          o_transition =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_o.png",
            count = 1,
            scale = 0.5,
          }
        },
        mask_layout =
        {
          inner_corner =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_inner-corner-mask.png",
            count = 1,
            scale = 0.5,
          },
          outer_corner =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_outer-corner-mask.png",
            count = 1,
            scale = 0.5,
          },
          side =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_side-mask.png",
            count = 1,
            scale = 0.5,
          },
          u_transition =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_u-mask.png",
            count = 1,
            scale = 0.5,
          },
          o_transition =
          {
            spritesheet = ENTITYPATH .. "/processing-tile/hr_solarfloor_o-mask.png",
            count = 1,
            scale = 0.5,
          }
        }
      },

      material_background =
      {
        picture = ENTITYPATH .. "/processing-tile/hr_solarfloor.png",
        count = 1,
        scale = 0.5,
      }
    },

    --transitions = concrete_transitions,
    --transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound = concrete_sounds,
    driving_sound = concrete_driving_sound,
    build_sound = concrete_tile_build_sounds,
    map_color={10, 10, 10},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    --vehicle_friction_modifier = concrete_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.concrete_trigger_effect()
  },
]]--

--[[
  {
    type = "tile",
    name = "processing-tile",
    order = "a[artificial]-c[tier-3]-a[refined-concrete]",
    subgroup = "artificial-tiles",
    needs_correction = false,
    minable = {mining_time = 0.1, result = "processing-tile"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    collision_mask = tile_collision_masks.ground(),
    --walking_speed_modifier = 1.5,
    layer = 17,
    layer_group = "ground-artificial",
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 1, --0.25,
    variants =
    {
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-inner-corner.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-outer-corner.png",
            count = 8,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-side.png",
            count = 16,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-u.png",
            count = 8,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-o.png",
            count = 4,
            scale = 0.5
          }
        },
        mask_layout =
        {
          inner_corner =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
            count = 8,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-side-mask.png",
            count = 16,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-u-mask.png",
            count = 8,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-o-mask.png",
            count = 4,
            scale = 0.5
          }
        }
      },

      material_background =
      {
        picture = "__Moshine__/graphics/terrain/concrete/space-platform-2x2.png",
        count = 16,
        scale = 0.5
      }
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound = tile_sounds.walking.refined_concrete,
    driving_sound = tile_sounds.driving.concrete,
    build_sound = tile_sounds.building.concrete,

    map_color={49, 48, 45},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000},
    vehicle_friction_modifier = concrete_vehicle_speed_modifier,

    trigger_effect = tile_trigger_effects.concrete_trigger_effect()
  },
]]



--[[
  {
    type = "tile",
    name = "processing-tile",
    order = "a[artificial]-d[utility]-b[space-platform-foundation]",
    subgroup = "artificial-tiles",
    minable = {mining_time = 0.5, result = "processing-tile"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    --is_foundation = true,
    allows_being_covered = false,
    max_health = 50,
    weight = 200,
    collision_mask = tile_collision_masks.ground(),
    layer = 17,
    layer_group = "ground-artificial",
    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.99, --0.25,
    -- transitions = landfill_transitions,
    -- transitions_between_transitions = landfill_transitions_between_transitions,
    dying_explosion = "space-platform-foundation-explosion",
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    bound_decoratives =
    {
      "space-platform-decorative-pipes-2x1",
      "space-platform-decorative-pipes-1x2",
      "space-platform-decorative-pipes-1x1",
      "space-platform-decorative-4x4",
      "space-platform-decorative-2x2",
      "space-platform-decorative-1x1",
      "space-platform-decorative-tiny",
    },

    --build_animations = space_platform_tile_animations.top_animation,
    --build_animations_background = space_platform_tile_animations.animation,
    --built_animation_frame = 0,

    sprite_usage_surface = "any",
    variants =
    {
      transition =
      {
        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-inner-corner.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-outer-corner.png",
            count = 16,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-side.png",
            count = 32,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-u.png",
            count = 4,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-o.png",
            count = 1,
            scale = 0.5
          }
        },
        mask_layout =
        {
          inner_corner =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-side-mask.png",
            count = 32,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-u-mask.png",
            count = 4,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__Moshine__/graphics/terrain/concrete/concrete-o-mask.png",
            count = 1,
            scale = 0.5
          }
        }
      },

      material_background =
      {
        picture = "__Moshine__/graphics/terrain/concrete/refined-concrete.png",
        count = 1,
        scale = 0.5
      }
    },

    walking_sound = tile_sounds.walking.concrete,
    build_sound = space_age_tile_sounds.building.space_platform,
    map_color = {63, 61, 59},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000}
  },
  ]]


})
