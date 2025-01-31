


local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout


local lava_stone_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = lava_tile_type_names,
    transition_group = lava_transition_group_id,
    spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone.png",
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    layout = tile_spritesheet_layout.transition_16_16_16_4_4,
    lightmap_layout = { spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-lightmap.png" },
     -- this added the lightmap spritesheet
    effect_map_layout =
    {
      spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-mask.png",
      inner_corner_count = 8,
      outer_corner_count = 8,
      side_count = 8,
      u_transition_count = 2,
      o_transition_count = 1
    }
  },
  {
    to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/volcanic-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false
  }
}


local function transition_masks()
  return {
    mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
    mask_layout =
    {
      scale = 0.5,
      inner_corner =
      {
        count = 8,
      },
      outer_corner =
      {
        count = 8,
        x = 64*9
      },
      side =
      {
        count = 8,
        x = 64*9*2
      },
      u_transition =
      {
        count = 1,
        x = 64*9*3
      },
      o_transition =
      {
        count = 1,
        x = 64*9*4
      }
    }
  }
end

data:extend({



  --[[
  {
    type = "noise-expression",
    name = "moshine_neodymium_ore_probability",
    --expression = "(control:neodymium_ore:size > 0) * (1000 * ((1 + vulcanus_tungsten_ore_region) * random_penalty_between(0.9, 1, 1) - 1))"
    expression = "(control:calcite:size > 0) * (1000 * ((1 + vulcanus_calcite_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "moshine_neodymium_ore_richness",
    expression = "vulcanus_tungsten_ore_region * random_penalty_between(0.9, 1, 1)\z
                  * 10000 * vulcanus_starting_area_multiplier\z
                  * control:neodymium_ore:richness / vulcanus_tungsten_ore_size"
  },
  {
    type = "noise-expression",
    name = "moshine_quartz_ore_probability",
    expression = "(control:quartz_ore:size > 0) * (1000 * ((1 + vulcanus_coal_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "moshine_quartz_ore_richness",
    expression = "vulcanus_coal_region * random_penalty_between(0.9, 1, 1)\z
                  * 18000 * vulcanus_starting_area_multiplier\z
                  * control:quartz_ore:richness / vulcanus_coal_size"
  },]]
  --[[{
    type = "noise-expression",
    name = "moshine_calcite_probability",
    expression = "(control:calcite:size > 0) * (1000 * ((1 + vulcanus_calcite_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "moshine_calcite_richness",
    expression = "vulcanus_calcite_region * random_penalty_between(0.9, 1, 1)\z
                  * 24000 * vulcanus_starting_area_multiplier\z
                  * control:calcite:richness / vulcanus_calcite_size"
  },]]
  --[[{
    type = "noise-expression",
    name = "moshine_fulgoran_data_source_probability",
    expression = "(control:fulgoran_data_source:size > 0) * (0.025 * ((vulcanus_sulfuric_acid_region_patchy > 0) + 2 * vulcanus_sulfuric_acid_region_patchy))"
  },
  {
    type = "noise-expression",
    name = "moshine_fulgoran_data_source_richness",
    expression = "(vulcanus_sulfuric_acid_region > 0) * random_penalty_between(0.5, 1, 1)\z
                  * 80000 * 40 * vulcanus_richness_multiplier * vulcanus_starting_area_multiplier\z
                  * control:fulgoran_data_source:richness / vulcanus_sulfuric_acid_geyser_size"
  },]]


  ----- Shallow Oil
  {
    name = "moshine-hot-swamp",
    type = "tile",
    order = "a[oil]-b[shallow]",
    subgroup = "fulgora-tiles",
    collision_mask = {
      layers =
      {
        ground_tile = true,
        resource = true,
      }
    },
    autoplace = {probability_expression = "50 * fulgora_oil_mask * water_base(fulgora_coastline, 1000)"}, -- target coast at cliff elevation
    layer = 4,
    layer_group = "ground-natural",
    map_color = { 74, 42, 43},
    vehicle_friction_modifier = 4,
    walking_speed_modifier = 0.8,
    default_cover_tile = "foundation",
    absorptions_per_second = tile_pollution.fulgora,
    fluid = "steam",
    --effect = "moshine-hot-swamp",
    --effect_color = { 127, 127, 127, 254 },
    --effect_color_secondary = { 60, 13, 5, 255 },
    --trigger_effect = 
    particle_tints = tile_graphics.fulgora_oil_ocean_particle_tints,
    --sprite_usage_surface = "fulgora",
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__Moshine__/graphics/terrain/moshine-hot-swamp/oil-sand-8x.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    },
    --transitions = table.deepcopy(data.raw.tile["sand-1"].transitions),
    transitions = lava_stone_transitions,
    --transitions_between_transitions = table.deepcopy(data.raw.tile["sand-1"].transitions_between_transitions),
    transitions_between_transitions = fulgora_sand_transitions_between_transitions,
    walking_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 1.5)),
    landing_steps_sound = sound_variations("__base__/sound/walking/resources/oil", 7, 1, volume_multiplier("main-menu", 2.9)),
    driving_sound = oil_driving_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  ----------- "SHALLOW" LAVA
  {
    type = "tile",
    name = "moshine-lava",
    subgroup = "vulcanus-tiles",
    order = "a-b",
    collision_mask = tile_collision_masks.lava(),
    autoplace = {probability_expression = "100 * fulgora_oil_mask * water_base(fulgora_coastline - 50 - fulgora_coastline_drop / 2, 2000)"},
    effect = "lava",
    fluid = "lava",
    effect_color = { 167, 59, 27 },
    effect_color_secondary = { 49, 80, 14 },
    particle_tints = tile_graphics.lava_particle_tints,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    layer = 5,
    layer_group = "water-overlay",
    --sprite_usage_surface = "vulcanus",
    variants = tile_variations_template(
      "__space-age__/graphics/terrain/vulcanus/lava.png",
      "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    --allowed_neighbors={"lava-hot"},
    transitions = lava_stone_transitions,
    transitions_between_transitions = data.raw.tile["water"].transitions_between_transitions,
    walking_sound = data.raw.tile["water"].walking_sound,
    map_color = {r = 150, g = 49, b = 30},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    trigger_effect = tile_trigger_effects.hot_lava_trigger_effect(),
    default_cover_tile = "foundation",
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/tiles/lava", 10, 0.5 ),
        advanced_volume_control =
        {
          fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } }
        }
      },
      radius = 7.5,
      min_entity_count = 10,
      max_entity_count = 30,
      entity_to_sound_ratio = 0.1,
      average_pause_seconds = 3
    }
  },

  ----- Deep oil effect
  --[[
  {
    type = "tile-effect",
    name = "moshine-hot-swamp",
    shader = "water",
    water =
    {
      shader_variation = "oil",
      textures =
      {
        {
          filename = "__Moshine__/graphics/terrain/moshine-hot-swamp/oilNoise.png",
          width = 512,
          height = 512
        },
        {
          filename = "__Moshine__/graphics/terrain/moshine-hot-swamp/oil-ocean-deep-shader.png",
          width = 512 * 4,
          height = 512 * 2
        },
        --gradient map for thin film effect
        {
          filename = "__Moshine__/graphics/terrain/moshine-hot-swamp/oilGradient.png",
          width = 512,
          height = 32
        },
        --specular highligts
        {
          filename = "__Moshine__/graphics/terrain/moshine-hot-swamp/oil-ocean-deep-spec.png",
          width = 512 * 4,
          height = 512 * 2
        },
      },
      texture_variations_columns = 1,
      texture_variations_rows = 1,
      secondary_texture_variations_columns = 4,
      secondary_texture_variations_rows = 2,

      specular_lightness = { 2, 2, 2 },
      foam_color = {70,70,70}, -- #4e3838ff,
      foam_color_multiplier = 0.1,

      animation_speed = 1.000,
      animation_scale = {0, -1},

      dark_threshold = {2.000, 2.000},
      reflection_threshold = {5.00, 5.00},
      specular_threshold = {0.000, 0.000},
      tick_scale = 1.000,

      near_zoom = 0.063,
      far_zoom = 0.063,
    }
  }]]
})


planet_map_gen.moshine = function()
  return
  {
    property_expression_names =
    {
      --elevation = "vulcanus_elevation",
      elevation = "fulgora_elevation",
      temperature = "vulcanus_temperature",
      --moisture = "vulcanus_moisture",
      moisture = "fulgora_moisture",
      --aux = "vulcanus_aux",
      aux = "fulgora_aux",
      --cliffiness = "cliffiness_basic",
      --cliffiness = "fulgora_cliffiness",
      --cliff_elevation = "cliff_elevation_from_elevation",
      --["entity:neodymium-ore:probability"] = "moshine_neodymium_ore_probability",
      --["entity:neodymium-ore:richness"] = "moshine_neodymium_ore_richness",
      --["entity:quartz-ore:probability"] = "moshine_quartz_ore_probability",
      --["entity:quartz-ore:richness"] = "moshine_quartz_ore_richness",
      --["entity:calcite:probability"] = "moshine_calcite_probability",
      --["entity:calcite:richness"] = "moshine_calcite_richness",
      --["entity:fulgoran-data-source:probability"] = "moshine_fulgoran_data_source_probability",
      --["entity:fulgoran-data-source:richness"] = "moshine_fulgoran_data_source_richness",
    },
    --[[cliff_settings =
    {
      name = "cliff-vulcanus",
      cliff_elevation_interval = 120,
      cliff_elevation_0 = 70
    },]]
    --[[territory_settings =
    {
      units = {"small-demolisher", "medium-demolisher", "big-demolisher"},
      territory_index_expression = "demolisher_territory_expression",
      territory_variation_expression = "demolisher_variation_expression",
      minimum_territory_size = 10
    },]]

    --[[cliff_settings =
    {
      name = "cliff-vulcanus",
      control = "fulgora_cliff",
      cliff_elevation_0 = 80,
      -- Ideally the first cliff would be at elevation 0 on the coastline, but that doesn't work,
      -- so instead the coastline is moved to elevation 80.
      -- Also there needs to be a large cliff drop at the coast to avoid the janky cliff smoothing
      -- but it also fails if a corner goes below zero, so we need an extra buffer of 40.
      -- So the first cliff is at 80, and terrain near the cliff shouln't go close to 0 (usually above 40).
      cliff_elevation_interval = 40,
      cliff_smoothing = 0.1, -- This is critical for correct cliff placement on the coast.
      richness = 0.1
    },]]
    autoplace_controls =
    {
      ["fulgoran_data_source"] = { frequency = 4, size = 0.1, richness = 150 },
      ["fulgora_islands"] = {},
      --["fulgora_cliff"] = {},
      ["multi_ore"] = { frequency = 600000000, size = 10000000, richness = 150500000 },
      --["neodymium_ore"] = { frequency = 20000000, size = 0.8, richness = 15500 },
      --["calcite"] = {},
      --["vulcanus_volcanism"] = {},
      --["rocks"] = {}, -- can't add the rocks control otherwise nauvis rocks spawn

    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          --nauvis tiles
          --["volcanic-soil-dark"] = {},
          --["volcanic-soil-light"] = {},
          --["volcanic-ash-soil"] = {},
          --end of nauvis tiles
          --["volcanic-ash-flats"] = {},
          --["volcanic-ash-light"] = {},
          --["volcanic-ash-dark"] = {},
          --["volcanic-cracks"] = {},
          --["volcanic-cracks-warm"] = {},
          --["volcanic-folds"] = {},
          --["volcanic-folds-flat"] = {},
          ["moshine-hot-swamp"] = {},
          ["moshine-lava"] = {},

          ["fulgoran-rock"] = {},
          --["fulgoran-dust"] = {},
          --["fulgoran-sand"] = {},
          --["fulgoran-dunes"] = {},
          --["fulgoran-walls"] = {},
          --["fulgoran-paving"] = {},
          --["fulgoran-conduit"] = {},
          --["fulgoran-machinery"] = {},

          --["volcanic-folds-warm"] = {},
          --["volcanic-pumice-stones"] = {},
          --["volcanic-cracks-hot"] = {},
          --["volcanic-jagged-ground"] = {},
          --["volcanic-smooth-stone"] = {},
          --["volcanic-smooth-stone-warm"] = {},
          --["volcanic-ash-cracks"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          --[[
          -- nauvis decoratives
          ["v-brown-carpet-grass"] = {},
          ["v-green-hairy-grass"] = {},
          ["v-brown-hairy-grass"] = {},
          ["v-red-pita"] = {},
          -- end of nauvis
          ["vulcanus-rock-decal-large"] = {},
          ["vulcanus-crack-decal-large"] = {},
          ["vulcanus-crack-decal-huge-warm"] = {},
          ["vulcanus-dune-decal"] = {},
          ["vulcanus-sand-decal"] = {},
          ["vulcanus-lava-fire"] = {},
          --["calcite-stain"] = {},
          --["calcite-stain-small"] = {},
          --["sulfur-stain"] = {},
          --["sulfur-stain-small"] = {},
          --["sulfuric-acid-puddle"] = {},
          --["sulfuric-acid-puddle-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          ["medium-volcanic-rock"] = {},
          ["tiny-volcanic-rock"] = {},
          --["tiny-rock-cluster"] = {},
          --["small-sulfur-rock"] = {},
          --["tiny-sulfur-rock"] = {},
          --["sulfur-rock-cluster"] = {},
          ["waves-decal"] = {},
          ]]
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["fulgoran-data-source"] = {},
          --["neodymium-ore"] = {},
          ["multi-ore"] = {},
          --["calcite"] = {},
          --["huge-volcanic-rock"] = {},
          --["big-volcanic-rock"] = {},
          --["crater-cliff"] = {},

          --["vulcanus-chimney"] = {},
          --["vulcanus-chimney-faded"] = {},
          --["vulcanus-chimney-cold"] = {},
          --["vulcanus-chimney-short"] = {},
          --["vulcanus-chimney-truncated"] = {},
          --["ashland-lichen-tree"] = {},
          --["ashland-lichen-tree-flaming"] = {},
        }
      }
    }
  }
end

local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")



data:extend({
  {
    type = "planet",
    name = "moshine",
    icon = "__Moshine__/graphics/icons/moshine.png",

    starmap_icon = "__Moshine__/graphics/icons/starmap-planet-moshine.png",
    starmap_icon_size = 512,
    gravity_pull = 15,
    distance = 5,
    orientation = 0.2,
    magnitude = 0.9,
    order = "e[moshine]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.moshine(),
    pollutant_type = nil,
    solar_power_in_space = 6000,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_vulcanus,
    surface_properties =
    {
      ["day-night-cycle"] = 1 * minute,
      ["magnetic-field"] = 25,
      ["solar-power"] = 4000,
      pressure = 800,
      gravity = 8
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-vulcanus.ogg", volume = 0.8},
      wind = {filename = "__space-age__/sound/wind/wind-vulcanus.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 10.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 0.6)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 1.1)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 7.0
        }
      }
    },
    surface_render_parameters =
    {
      clouds =
      {
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },

        warp_sample_1 = { scale = 0.8 / 16 },
        warp_sample_2 = { scale = 3.75 * 0.8 / 32, wind_speed_factor = 0 },
        warped_shape_sample = { scale = 2 * 0.18 / 32 },
        additional_density_sample = { scale = 1.5 * 0.18 / 32, wind_speed_factor = 1.77 },
        detail_sample_1 = { scale = 1.709 / 32, wind_speed_factor = 0.2 / 1.709 },
        detail_sample_2 = { scale = 2.179 / 32, wind_speed_factor = 0.33 / 2.179 },

        scale = 1,
        movement_speed_multiplier = 0.75,
        opacity = 0.25,
        opacity_at_night = 0.25,
        density_at_night = 1,
        detail_factor = 1.5,
        detail_factor_at_night = 2,
        shape_warp_strength = 0.06,
        shape_warp_weight = 0.4,
        detail_sample_morph_duration = 0,
      },
      fog = {
        shape_noise_texture =
        {
          filename = "__core__/graphics/clouds-noise.png",
          size = 2048
        },
        detail_noise_texture =
        {
          filename = "__core__/graphics/clouds-detail-noise.png",
          size = 2048
        },
        color1 = {1, 1, 1},
        color2 = {1, 1, 1},
        tick_factor = 0.000005,
      },
      -- clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.0, "__Moshine__/graphics/lut/moshine-1-day.png"},
        {0.25, "__Moshine__/graphics/lut/moshine-1-day.png"},
        {0.45, "__Moshine__/graphics/lut/moshine-2-night.png"},
        {0.55, "__Moshine__/graphics/lut/moshine-2-night.png"},
        {0.75, "__Moshine__/graphics/lut/moshine-1-day.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.5, 0.2, 0.3, 1.0 },
        scale_u = { 3, 1, 1, 1 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.3,
        global_scale = 0.1,
        zoom_factor = 3,
        zoom_intensity = 0.6
      }
    }
  },
  {
    type = "space-connection",
    name = "nauvis-moshine",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "moshine",
    order = "a",
    length = 3000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
  {
    type = "space-connection",
    name = "vulcanus-moshine",
    subgroup = "planet-connections",
    from = "vulcanus",
    to = "moshine",
    order = "a",
    length = 7000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
})



table.insert(lava_tile_type_names, "moshine-lava")
table.insert(water_tile_type_names, "moshine-lava")
table.insert(water_tile_type_names, "moshine-hot-swamp")
