


local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout



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
  --[[{
    type = "noise-expression",
    name = "moshine_molten_iron_geyser_probability",
    expression = "(control:sulfuric_acid_geyser:size > 0) * (0.025 * ((vulcanus_sulfuric_acid_region_patchy > 0) + 2 * vulcanus_sulfuric_acid_region_patchy))"
  },
  {
    type = "noise-expression",
    name = "moshine_molten_iron_geyser_richness",
    expression = "(vulcanus_sulfuric_acid_region > 0) * random_penalty_between(0.5, 1, 1)\z
                  * 80000 * 40 * vulcanus_richness_multiplier * vulcanus_starting_area_multiplier\z
                  * control:sulfuric_acid_geyser:richness / vulcanus_sulfuric_acid_geyser_size"
  },]]

  {
    type = "noise-expression",
    name = "moshine_spot_size",
    expression = 8
  },
  {
    type = "noise-expression",
    name = "moshine_starting_mask",
    -- exclude random spots from the inner 300 tiles, 80 tile blur
    expression = "clamp((distance - 30) / 10, -1, 1)"
  },
  {
    type = "noise-expression",
    name = "moshine_molten_copper_geyser_spots",
    expression = "aquilo_spot_noise{seed = 567,\z
                                    count = 80,\z
                                    skip_offset = 0,\z
                                    region_size = 600 + 400 / control:molten_copper_geyser:frequency,\z
                                    density = 1,\z
                                    radius = moshine_spot_size * sqrt(control:molten_copper_geyser:size),\z
                                    favorability = 1}"
  },
  {
    type = "noise-expression",
    name = "moshine_starting_molten_copper_geyser",
    expression = "starting_spot_at_angle{angle = aquilo_angle, distance = 40, radius = moshine_spot_size * 0.8, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "moshine_molten_copper_geyser_probability",
    expression = "(control:molten_copper_geyser:size > 0)\z
                  * (max(moshine_starting_molten_copper_geyser * 0.08,\z
                         min(moshine_starting_mask, moshine_molten_copper_geyser_spots) * 0.015))"
  },
  {
    type = "noise-expression",
    name = "moshine_molten_copper_geyser_richness",
    expression = "max(moshine_starting_molten_copper_geyser * 1800000,\z
                      moshine_molten_copper_geyser_spots * 1440000) * control:molten_copper_geyser:richness"
  },

  {
    type = "noise-expression",
    name = "moshine_steam_geyser_spots",
    expression = "aquilo_spot_noise{seed = 567,\z
                                    count = 60,\z
                                    skip_offset = 1,\z
                                    region_size = 600 + 400 / control:steam_geyser:frequency,\z
                                    density = 1,\z
                                    radius = moshine_spot_size * 1.2 * sqrt(control:steam_geyser:size),\z
                                    favorability = 1}"
  },
  {
    type = "noise-expression",
    name = "moshine_starting_steam_geyser",
    expression = "starting_spot_at_angle{angle = aquilo_angle + 120, distance = 80, radius = moshine_spot_size * 0.6, x_distortion = 0, y_distortion = 0}"
  },
  {
    type = "noise-expression",
    name = "moshine_steam_geyser_probability",
    expression = "(control:steam_geyser:size > 0)\z
                  * (max(moshine_starting_steam_geyser * 1.3,\z
                         min(moshine_starting_mask, moshine_steam_geyser_spots) * 0.22))"
  },
  {
    type = "noise-expression",
    name = "moshine_steam_geyser_richness",
    expression = "max(moshine_starting_steam_geyser * 480000,\z
                      moshine_steam_geyser_spots * 7200000) * control:steam_geyser:richness"
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


  {
    type = "autoplace-control",
    name = "moshine_islands",
    order = "c-z-d",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "moshine_volcanism",
    order = "c-z-a",
    category = "terrain",
    can_be_disabled = false
  },
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
      cliffiness = "fulgora_cliffiness",
      cliff_elevation = "cliff_elevation_from_elevation",
      --["entity:neodymium-ore:probability"] = "moshine_neodymium_ore_probability",
      --["entity:neodymium-ore:richness"] = "moshine_neodymium_ore_richness",
      --["entity:quartz-ore:probability"] = "moshine_quartz_ore_probability",
      --["entity:quartz-ore:richness"] = "moshine_quartz_ore_richness",
      --["entity:calcite:probability"] = "moshine_calcite_probability",
      --["entity:calcite:richness"] = "moshine_calcite_richness",
      --["entity:fulgoran-data-source:probability"] = "moshine_fulgoran_data_source_probability",
      --["entity:fulgoran-data-source:richness"] = "moshine_fulgoran_data_source_richness",

      --["entity:molten-iron-geyser:probability"] = "moshine_molten_iron_geyser_probability",
      --["entity:molten-iron-geyser:richness"] = "moshine_molten_iron_geyser_richness",

      ["entity:molten-copper-geyser:probability"] = "moshine_molten_copper_geyser_probability",
      ["entity:molten-copper-geyser:richness"] = "moshine_molten_copper_geyser_richness",

      ["entity:steam-geyser:probability"] = "moshine_steam_geyser_probability",
      ["entity:steam-geyser:richness"] = "moshine_steam_geyser_richness",

      ["entity:multi-ore:probability"] = "moshine_multi_ore_probability",
      ["entity:multi-ore:richness"] = "moshine_multi_ore_richness",
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

    cliff_settings =
    {
      name = "cliff-moshine",
      control = "fulgora_cliff",
      cliff_elevation_0 = 80,
      -- Ideally the first cliff would be at elevation 0 on the coastline, but that doesn't work,
      -- so instead the coastline is moved to elevation 80.
      -- Also there needs to be a large cliff drop at the coast to avoid the janky cliff smoothing
      -- but it also fails if a corner goes below zero, so we need an extra buffer of 40.
      -- So the first cliff is at 80, and terrain near the cliff shouln't go close to 0 (usually above 40).
      cliff_elevation_interval = 40,
      cliff_smoothing = 0, -- This is critical for correct cliff placement on the coast.
      richness = 1
    },
    autoplace_controls =
    {
      --["molten_iron_geyser"] = {},
      ["molten_copper_geyser"] = {richness = 1500000000},
      ["steam_geyser"] = {richness = 1500000000},
      ["fulgoran_data_source"] = { frequency = 4, size = 0.1, richness = 1500000000 },
      ["moshine_islands"] = {},
      ["fulgora_cliff"] = {},
      ["multi_ore"] = {richness = 1500000000},-- frequency = 600000000, size = 10000000, richness = 150500000 },

      --["neodymium_ore"] = { frequency = 20000000, size = 0.8, richness = 15500 },
      --["calcite"] = {},
      --["moshine_volcanism"] = {},
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
          ["moshine-rock"] = {},
          ["moshine-hot-swamp"] = {},
          ["moshine-lava"] = {},

          ["moshine-dust"] = {},
          ["moshine-sand"] = {},
          ["moshine-dunes"] = {},
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
          ["moshine-medium-fulgora-rock"] = {},
          ["moshine-small-fulgora-rock"] = {},
          ["moshine-tiny-fulgora-rock"] = {},
          
          ["moshine-barnacles-decal"] = {},
          ["moshine-rock-decal-large"] = {},
          ["moshine-snow-drift-decal"] = {},
          -- nauvis decoratives
          --["v-brown-carpet-grass"] = {},
          --["v-green-hairy-grass"] = {},
          --["v-brown-hairy-grass"] = {},
          --["v-red-pita"] = {},
          -- end of nauvis
          --["moshine-crack-decal-large"] = {},
          --["vulcanus-crack-decal-huge-warm"] = {},
          --["vulcanus-lava-fire"] = {},
          --["calcite-stain"] = {},
          --["calcite-stain-small"] = {},
          --["sulfur-stain"] = {},
          --["sulfur-stain-small"] = {},
          --["sulfuric-acid-puddle"] = {},
          --["sulfuric-acid-puddle-small"] = {},
          ["moshine-crater-small"] = {},
          ["moshine-crater-large"] = {},

          --["moshine-pumice-relief-decal"] = {},
          --["moshine-dune-decal"] = {},
          --["moshine-sand-decal"] = {},


          --["small-volcanic-rock"] = {},
          --["medium-volcanic-rock"] = {},
          --["tiny-volcanic-rock"] = {},
          --["tiny-rock-cluster"] = {},
          --["small-sulfur-rock"] = {},
          --["tiny-sulfur-rock"] = {},
          --["sulfur-rock-cluster"] = {},
          --["moshine-waves-decal"] = {},
          
        }
      },
      ["entity"] =
      {
        settings =
        {
          --["molten-iron-geyser"] = {},
          ["molten-copper-geyser"] = {},
          ["steam-geyser"] = {},
          ["fulgoran-data-source"] = {},
          --["neodymium-ore"] = {},
          ["multi-ore"] = {},
          --["calcite"] = {},


          ["moshine-huge-volcanic-rock"] = {},
          ["moshine-big-fulgora-rock"] = {}
          --["big-volcanic-rock"] = {},
          --["moshine-crater-cliff"] = {},

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
      ["day-night-cycle"] = 15 * minute,
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
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 1.5)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 1.0)},
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
        opacity = 0.15,
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
        color1 = {1, 1, 0.8},
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
        {0.0, "__Moshine__/graphics/terrain/moshine-1-day.png"},
        {0.35, "__Moshine__/graphics/terrain/moshine-4-partialday.png"},
        {0.40, "__Moshine__/graphics/terrain/moshine-3-dusk.png"},
        {0.45, "__Moshine__/graphics/terrain/moshine-2-night.png"},
        {0.60, "__Moshine__/graphics/terrain/moshine-2-night.png"},
        {0.70, "__Moshine__/graphics/terrain/moshine-4-partialday.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__Moshine__/graphics/terrain/moshine-tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.6, 0.6, 0.3, 0.3 },
        scale_u = { 3, 1, 1, 1 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.4,
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
