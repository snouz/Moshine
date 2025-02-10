local explosion_animations = require("__space-age__.prototypes.entity.explosion-animations")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
require ("sound-util")
local hit_effects = require("__base__.prototypes.entity.hit-effects")








data:extend({
  {
    type = "damage-type",
    name = "solar-flare"
  },




  {
    type = "lightning-attractor",
    name = "solar-flare-rod",
    efficiency = 0.2,
    range_elongation = 19.0,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "500MJ",
      usage_priority = "primary-output",
      output_flow_limit = "500MJ",
      drain = "2.5MJ"
    },
    icon = "__space-age__/graphics/icons/lightning-rod.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "lightning-rod"},
    max_health = 100,
    corpse = "lightning-rod-remnants",
    dying_explosion = "medium-electric-pole-explosion",
    factoriopedia_simulation = simulations.factoriopedia_lightning_rod,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "electric",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    lightning_strike_offset = {0, -4.1},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2},{0.2, 0.2}}),
    drawing_box_vertical_extension = 4.3,
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    working_sound =
    {
      main_sounds =
      {
        {
          sound =
          {
            filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-charge.ogg",
            volume = 0.5,
            audible_distance_modifier = 0.5,
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 2, inverted = true},
        },
        {
          sound =
          {
            filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-discharge.ogg",
            volume = 0.5,
            audible_distance_modifier = 0.5,
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 1},
        }
      },
      max_sounds_per_prototype = 3,
    },
    chargable_graphics = require("__space-age__.prototypes.entity.lightning-rod-graphics"),
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/lightning-rod/lightning-rod-reflection.png",
        priority = "extra-high",
        width = 11,
        height = 30,
        shift = util.by_pixel(0, 50),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },

  {
    type = "lightning",
    name = "solar-flare",
    icon = "__space-age__/graphics/icons/lightning.png",
    subgroup = "obstacles",
    factoriopedia_simulation = simulations.factoriopedia_lightning,
    damage = 100,
    energy = "1MJ",
    time_to_damage = 0,
    effect_duration = 50,
    source_offset = {0, -25},
    source_variance = {30, 6},
    sound =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/explosions/lightning-effect", 5, 0.25, 0.8),
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 50.0}, to = {2.5, 100.0 }}},
      },
      aggregation = {max_count = 3, remove = true, count_already_playing = true},
      audible_distance_modifier = 2.25
    },
    attracted_volume_modifier = 0.4,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "camera-effect",
          duration = 20,
          ease_in_duration = 10,
          ease_out_duration = 7,
          delay = 0,
          strength = 0.75,
          full_strength_max_distance = 10,
          max_distance = 70
        }
      }
    },
    strike_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "fulgora-stone-particle-big",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.3,
            initial_vertical_speed = 0.03,
            initial_vertical_speed_deviation = 0.15,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "fulgora-stone-particle-medium",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.15,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "fulgora-stone-particle-small",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "big-rock-stone-particle-tiny",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            only_when_visible = true
          },
          {
            type = "create-trivial-smoke",
            smoke_name = "fire-smoke-without-glow",
            offsets = {{0, -0.5}},
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
            speed = {0, -0.5},
            initial_height = 0.5,
            speed_from_center = 0.008,
            speed_from_center_deviation = 0.015
          }
        }
      }
    },
    graphics_set =
    {
      relative_cloud_fork_length = 0.30,
      cloud_fork_orientation_variance = 0.2,
      cloud_detail_level = 4,
      bolt_detail_level = 5,
      bolt_half_width = 0.04,
      bolt_midpoint_variance = 0.05,
      max_bolt_offset = 0.25,
      max_fork_probability = 1,
      fork_intensity_multiplier = 0.5,
      min_ground_streamer_distance = 2,
      max_ground_streamer_distance = 4,
      ground_streamer_variance = 4,
      shader_configuration =
      {
        {color = {0.0, 0.6, 1, 0.8}, distortion =  0.20, thickness = 0.20, power = 0.25},
        {color = {0.0, 0.6, 1, 1.0}, distortion =  0.40, thickness = 1.00, power = 0.25},
        {color = {0.2, 0.6, 1, 1.0}, distortion =  0.55, thickness = 1.00, power = 0.25},
        {color = {0.7, 0.6, 1, 0.6}, distortion =  0.70, thickness = 0.75, power = 0.25},
        {color = {0.4, 0.2, 1, 0.3}, distortion =  1.00, thickness = 0.50, power = 0.10},
        {color = {0.0, 0.2, 1, 0.0}, distortion = 20.00, thickness = 0.50, power = 0.01}
      },
      cloud_background = util.sprite_load("__space-age__/graphics/entity/lightning/lightning-cloud",
                                          {
                                            draw_as_glow = true,
                                            scale = 1,
                                            frame_count = 4,
                                            tint = {0.5, 0.5, 0.5, 0.5}
                                          }),
      explosion =
      {
        util.sprite_load("__space-age__/graphics/entity/lightning/lightning-explosion",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
        }),
        util.sprite_load("__space-age__/graphics/entity/lightning/lightning-explosion-2",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         })
      },
      attractor_hit_animation = util.sprite_load("__space-age__/graphics/entity/lightning/lightning-attractor-hit-anim",{
        draw_as_glow = true,
        scale = 1,
        frame_count = 36
      }),
      ground_streamers =
      {
        util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-1",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-2",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-3",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-4",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-5",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-6",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-7",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__space-age__/graphics/entity/lightning/lightning-streamer-8",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
      },
      light = {intensity = 5.0, size = 50, color = {0.1, 0.15, 1}}
    }
  },

})

data.raw["planet"]["moshine"].lightning_properties =
{
  lightnings_per_chunk_per_tick = 1 / (60 * 30), --cca once per chunk every 30 seconds (600 ticks)
  search_radius = 10.0,
  lightning_types = {"solar-flare"},

  priority_rules =
  {
    {
      type = "prototype",
      string = "solar-flare-rod",
      priority_bonus = 10000
    },
    {
      type = "prototype",
      string = "pipe",
      priority_bonus = 1
    },
    {
      type = "prototype",
      string = "pump",
      priority_bonus = 1
    },
    {
      type = "prototype",
      string = "offshore-pump",
      priority_bonus = 1
    },
    {
      type = "prototype",
      string = "electric-pole",
      priority_bonus = 10
    },
    {
      type = "prototype",
      string = "power-switch",
      priority_bonus = 10
    },
    {
      type = "prototype",
      string = "logistic-robot",
      priority_bonus = 100
    },
    {
      type = "prototype",
      string = "construction-robot",
      priority_bonus = 100
    },
    {
      type = "impact-soundset",
      string = "metal",
      priority_bonus = 1
    }
  },
  exemption_rules =
  {
    {
      type = "prototype",
      string = "rail-support",
    },
    {
      type = "prototype",
      string = "legacy-straight-rail",
    },
    {
      type = "prototype",
      string = "legacy-curved-rail",
    },
    {
      type = "prototype",
      string = "straight-rail",
    },
    {
      type = "prototype",
      string = "curved-rail-a",
    },
    {
      type = "prototype",
      string = "curved-rail-b",
    },
    {
      type = "prototype",
      string = "half-diagonal-rail",
    },
    {
      type = "prototype",
      string = "rail-ramp",
    },
    {
      type = "prototype",
      string = "elevated-straight-rail",
    },
    {
      type = "prototype",
      string = "elevated-curved-rail-a",
    },
    {
      type = "prototype",
      string = "elevated-curved-rail-b",
    },
    {
      type = "prototype",
      string = "elevated-half-diagonal-rail",
    },
    {
      type = "prototype",
      string = "rail-signal",
    },
    {
      type = "prototype",
      string = "rail-chain-signal",
    },
    {
      type = "prototype",
      string = "locomotive",
    },
    {
      type = "prototype",
      string = "artillery-wagon",
    },
    {
      type = "prototype",
      string = "cargo-wagon",
    },
    {
      type = "prototype",
      string = "fluid-wagon",
    },
    {
      type = "prototype",
      string = "land-mine",
    },
    {
      type = "prototype",
      string = "wall",
    },
    {
      type = "prototype",
      string = "tree",
    },
    {
      type = "countAsRockForFilteredDeconstruction",
      string = "true",
    },
  }
}
