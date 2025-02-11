require ("sound-util")
require ("circuit-connector-sprites")
require ("util")
require ("__space-age__.prototypes.entity.circuit-network")
require ("__space-age__.prototypes.entity.space-platform-hub-cockpit")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__base__.prototypes.tile.tile-trigger-effects")


local ENTITYPATH = "__Moshine__/graphics/entity"


local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end

local seconds = 60
local minutes = 60*seconds
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}
local gleba_tree_underwater_things = {}

local function gleba_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local shift = shift or util.by_pixel(52, -40)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-harvest.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-normal.png",
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        surface = "gleba",
        filenames =
        {
          "__space-age__/graphics/entity/plant/"..name.."/"..name.."-harvest-shadow.png",
          "__space-age__/graphics/entity/plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      underwater       = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].underwater or nil,
      water_reflection = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].water_reflection or nil,

      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        particle_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.01,
        frame_speed = 0.4,
        repeat_count = 15
      }
    }
    table.insert(variations, variation)
  end
  return variations
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
  origin = {0.5, -0.55, 4.6},
  shadow_direction = {-0.59502, 0.009124, 0.803659},

  speed =
  {
    arm =
    {
      turn_rate = 0.02,
      extension_speed = 0.05
    },
    grappler =
    {
      vertical_turn_rate = 0.02,
      horizontal_turn_rate = 0.1,
      extension_speed = 0.01,
      allow_transpolar_movement = true
    }
  },
  min_arm_extent = 0.0,
  min_grappler_extent = 0.2,
  operation_angle = 10,--in degrees
  telescope_default_extention = 0.5,

  parts =
  {
    {
      rotated_sprite =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-1",
      {
        priority = "very-low",
        dice = 4,
        direction_count = 128,
        scale = 0.5
      }),
      rotated_sprite_shadow =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-1-shadow",
      {
        priority = "very-low",
        direction_count = 64,
        scale = 1,
        draw_as_shadow = true
      }),
      rotated_sprite_reflection =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-1-reflection",
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
    {
      rotated_sprite =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-3",
      {
        priority = "very-low",
        direction_count = 128,
        scale = 0.5
      }),
      rotated_sprite_shadow =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-3-shadow",
        {
          priority = "very-low",
          direction_count = 32,
          scale = 1,
          draw_as_shadow = true
      }),
      rotated_sprite_reflection =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-3-reflection",
        {
          priority = "very-low",
          direction_count = 8,
          scale = 5
      }),
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
      rotated_sprite =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-4",
      {
        priority = "very-low",
        direction_count = 128,
        scale = 0.5
      }),
      rotated_sprite_shadow =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-4-shadow",
      {
        priority = "very-low",
        direction_count = 32,
        scale = 1,
        draw_as_shadow = true
      }),
      rotated_sprite_reflection =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-4-reflection",
        {
          priority = "very-low",
          direction_count = 8,
          scale = 5
      }),
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
      rotated_sprite =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-5",
      {
        priority = "very-low",
        direction_count = 128,
        scale = 0.5
      }),
      rotated_sprite_shadow =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-5-shadow",
      {
        priority = "very-low",
        direction_count = 32,
        scale = 1,
        draw_as_shadow = true
      }),
      rotated_sprite_reflection =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-5-reflection",
        {
          priority = "very-low",
          direction_count = 8,
          scale = 5
      }),
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
      rotated_sprite =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-6",
      {
        priority = "very-low",
        direction_count = 128,
        scale = 0.5
      }),
      rotated_sprite_shadow =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-6-shadow",
      {
        priority = "very-low",
        direction_count = 32,
        scale = 1,
        draw_as_shadow = true
      }),
      rotated_sprite_reflection =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-6-reflection",
        {
          priority = "very-low",
          direction_count = 8,
          scale = 5
      }),
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
      rotated_sprite =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-7",
      {
        priority = "very-low",
        direction_count = 128,
        scale = 0.5
      }),
      rotated_sprite_shadow =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-7-shadow",
      {
        priority = "very-low",
        direction_count = 32,
        scale = 1,
        draw_as_shadow = true
      }),
      rotated_sprite_reflection =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-7-reflection",
        {
          priority = "very-low",
          direction_count = 8,
          scale = 5
      }),
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
      rotated_sprite =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-8",
      {
        priority = "very-low",
        direction_count = 64,
        scale = 0.5
      }),
      rotated_sprite_shadow =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-8-shadow",
      {
        priority = "very-low",
        direction_count = 32,
        scale = 1,
        draw_as_shadow = true
      }),
      sprite_reflection =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-8-reflection",
        {
          priority = "very-low",
          scale = 5
      }),
      layer = -1,
      relative_position = {0.0, 0.0, -0.17 },
      static_length_grappler = {0, 0, -0.6 },
      dying_effect = default_dying_effect,
      name = "grappler-hub"
    },
    {
      sprite =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-9",
      {
        priority = "very-low",
        scale = 0.5
      }),
      sprite_shadow =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-9-shadow",
      {
        priority = "very-low",
        scale = 1,
        draw_as_shadow = true
      }),
      sprite_reflection =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-9-reflection",
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
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-10",
      {
        priority = "very-low",
        scale = 0.5
      }),
      sprite_shadow =
      util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-10",
      {
        priority = "very-low",
        scale = 0.5,
        draw_as_shadow = true
      }),
      sprite_reflection =
        util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-crane-10-reflection",
        {
          priority = "very-low",
          scale = 5
      }),
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
    name = "computer-farm",
    icon = "__space-age__/graphics/icons/agricultural-tower.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "computer-farm"},
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
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    --growth_grid_tile_size = 3,
    radius = 6,
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
    heating_energy = "100kW",
    energy_usage = "100kW",
    crane_energy_usage = "100kW",
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-hub-loop.ogg",
        volume = 0.7,
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    central_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-loop.ogg", volume = 0.3},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-stop.ogg", volume = 0.5}
    },
    central_orienting_sound_source = "hub",
    arm_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-loop.ogg", volume = 0.25},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-stop.ogg", volume = 0.6}
    },
    arm_extending_sound_source = "arm_central_joint",
    grappler_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-loop.ogg", volume = 0.25},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-stop.ogg", volume = 0.4}
    },
    grappler_orienting_sound_source = "grappler-hub",
    grappler_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-loop.ogg", volume = 0.4},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-stop.ogg", volume = 0.45}
    },
    grappler_extending_sound_source = "grappler-hub",
    planting_sound = sound_variations("__space-age__/sound/entity/agricultural-tower/agricultural-tower-planting", 5, 0.7),
    harvesting_sound = sound_variations("__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting", 6, 0.6),
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
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
    circuit_connector = circuit_connector_definitions["agricultural-tower"],
    circuit_wire_max_distance = 30,
    graphics_set =
    {
      animation =
      {
        layers =
        {
          util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
          {
            priority = "high",
            animation_speed = 0.25,
            frame_count = 64,
            scale = 0.5
          }),
          util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-shadow",
          {
            priority = "high",
            frame_count = 1,
            repeat_count = 64,
            draw_as_shadow = true,
            scale = 0.5
          })
        }
      },
      recipe_not_set_tint = { primary = {r = 0.6, g = 0.6, b =  0.5, a = 1}, secondary = {r = 0.6, g =  0.6, b = 0.5, a = 1} },
      working_visualisations =
      {
        {
          always_draw = true,
          fog_mask = { rect = {{-30, -30}, {30, -2.75}}, falloff = 1 },
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base",
          {
            frame_count = 1,
            scale = 0.5
          }),
        },

        {
          --constant_speed = true,
          always_draw = true,
          apply_recipe_tint = "primary",
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-plant-mask",
          {
            priority = "high",
            frame_count = 64,
            animation_speed = 0.25,
            tint_as_overlay = true,
            scale = 0.5
          }),
        },
        {
          --constant_speed = true,
          apply_recipe_tint = "secondary",
          effect = "flicker",
          fadeout = true,
          animation = util.sprite_load("__space-age__/graphics/entity/agricultural-tower/agricultural-tower-base-light",
          {
            priority = "high",
            frame_count = 64,
            animation_speed = 0.25,
            blend_mode = "additive",
            scale = 0.5
          }),
        },
        {
          effect = "flicker",
          fadeout = true,
          light = {intensity = 1.0, size = 6, shift = {-0.45, -0.25}, color = {r = 1, g = 1, b = 1}}
        },
        {
          apply_recipe_tint = "secondary",
          effect = "flicker",
          fadeout = true,
          light = {intensity = 1.0, size = 16, shift = {-1.2, -0.5}, color = {r = 1, g = 1, b = 1}}
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
    name = "computer-farm-server", -- food
    icon = "__space-age__/graphics/icons/yumako-tree.png",
    flags = {"placeable-neutral"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results = {{type = "item", name = "computer-farm-server", amount = 1}},
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 10 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    --collision_mask = {layers={player=true, ground_tile=true, train=true}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[gleba]-a[seedable]-a[yumako-tree]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
    autoplace =
    {
      --control = "gleba_plants",
      --order = "a[tree]-b[forest]-a",
      --probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      --richness_expression = "random_penalty_at(3, 1)",
      probability_expression = 0,
      tile_restriction = {"coolingmat"}
    },
    --variations = gleba_tree_variations("yumako-tree", 8, 4, 1.3),
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 214,
          height = 226,
          --frame_count = 32,
          --line_length = 8,
          shift = util.by_pixel(0, 2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 190,
          height = 165,
          --line_length = 1,
          --repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5),
          scale = 0.5
        }
      }
    },


    colors = minor_tints(),
    agricultural_tower_tint =
    {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-yumako-soil", "artificial-yumako-soil"}, remove_on_collision = true} },
    ambient_sounds =
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
    },
    map_color = {255, 255, 255},
  },







  {
    type = "tile-effect",
    name = "coolingmat",
    shader = "water",
    water =
    {
      shader_variation = "lava",
      textures =
      {
        {
          filename = "__Moshine__/graphics/entity/coolingmat/coolingmat-noise-texture.png",
          width = 512,
          height = 512
        },
        {
          filename = "__Moshine__/graphics/entity/coolingmat/hr_solarfloor.png",
          width = 512,
          height = 512
        }
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      animation_speed = 0.5,
      animation_scale = { 0.75, 0.75 },
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
  name = "coolingmat",
  icon = "__Moshine__/graphics/icons/coolingmat.png",
  icon_size = 64,
  order = "a[artificial]-b[tier-2]-a[concrete]",
  effect = "coolingmat",
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
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_inner-corner.png",
          count = 1,
          scale = 0.5,
        },
        outer_corner =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_outer-corner.png",
          count = 1,
          scale = 0.5,
        },
        side =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_side.png",
          count = 1,
          scale = 0.5,
        },
        u_transition =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_u.png",
          count = 1,
          scale = 0.5,
        },
        o_transition =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_o.png",
          count = 1,
          scale = 0.5,
        }
      },
      mask_layout =
      {
        inner_corner =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_inner-corner-mask.png",
          count = 1,
          scale = 0.5,
        },
        outer_corner =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_outer-corner-mask.png",
          count = 1,
          scale = 0.5,
        },
        side =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_side-mask.png",
          count = 1,
          scale = 0.5,
        },
        u_transition =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_u-mask.png",
          count = 1,
          scale = 0.5,
        },
        o_transition =
        {
          spritesheet = ENTITYPATH .. "/coolingmat/hr_solarfloor_o-mask.png",
          count = 1,
          scale = 0.5,
        }
      }
    },

    material_background =
    {
      picture = ENTITYPATH .. "/coolingmat/hr_solarfloor.png",
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



})