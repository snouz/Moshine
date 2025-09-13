local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
 
data:extend({
  {
    type = "furnace",
    name = "ai-trainer", --stone-furnace
    icon = "__Moshine__/graphics/icons/ai-trainer.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "ai-trainer"},
    fast_replaceable_group = "ai-trainer",
    --next_upgrade = "steel-furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector
      (
        universal_connector_template,
        {
          { variation = 18, main_offset = util.by_pixel(0, 97), shadow_offset = util.by_pixel(27.5, 117), show_shadow = true },
          { variation = 18, main_offset = util.by_pixel(0, 97), shadow_offset = util.by_pixel(27.5, 117), show_shadow = true },
          { variation = 18, main_offset = util.by_pixel(0, 97), shadow_offset = util.by_pixel(27.5, 117), show_shadow = true },
          { variation = 18, main_offset = util.by_pixel(0, 97), shadow_offset = util.by_pixel(27.5, 117), show_shadow = true }
        }
      ),
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
    energy_usage = "600kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    result_inventory_size = 12,
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
          apply_recipe_tint = "primary",
          animation =
          {
            layers =
            {
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim-under.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                scale = 0.5,
              },
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim1.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
              },
            }
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          apply_recipe_tint = "secondary",
          animation =
          {
            layers =
            {
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim-under.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                scale = 0.5,
              },
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim2.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
              },
            }
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          apply_recipe_tint = "tertiary",
          animation =
          {
            layers =
            {
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim-under.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                scale = 0.5,
              },
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim3.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
              },
            }
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          apply_recipe_tint = "quaternary",
          animation =
          {
            layers =
            {
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim-under.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                scale = 0.5,
              },
              {
                filename = "__Moshine__/graphics/entity/ai-trainer/ai-trainer-anim4.png",
                width = 620,
                height = 620,
                frame_count = 16,
                line_length = 4,
                animation_speed = 0.4,
                draw_as_glow = true,
                blend_mode = "additive",
                scale = 0.5,
              },
            }
          }
        },
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
})