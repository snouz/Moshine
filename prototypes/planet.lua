


local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")


data:extend({



  {
    type = "noise-expression",
    name = "moshine_neodymium_ore_probability",
    expression = "(control:neodymium_ore:size > 0) * (1000 * ((1 + vulcanus_tungsten_ore_region) * random_penalty_between(0.9, 1, 1) - 1))"
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
  },
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
  {
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
  },



})


planet_map_gen.moshine = function()
  return
  {
    property_expression_names =
    {
      elevation = "vulcanus_elevation",
      temperature = "vulcanus_temperature",
      moisture = "vulcanus_moisture",
      aux = "vulcanus_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:neodymium-ore:probability"] = "moshine_neodymium_ore_probability",
      ["entity:neodymium-ore:richness"] = "moshine_neodymium_ore_richness",
      ["entity:quartz-ore:probability"] = "moshine_quartz_ore_probability",
      ["entity:quartz-ore:richness"] = "moshine_quartz_ore_richness",
      --["entity:calcite:probability"] = "moshine_calcite_probability",
      --["entity:calcite:richness"] = "moshine_calcite_richness",
      ["entity:fulgoran-data-source:probability"] = "moshine_fulgoran_data_source_probability",
      ["entity:fulgoran-data-source:richness"] = "moshine_fulgoran_data_source_richness",
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
    autoplace_controls =
    {
      ["quartz_ore"] = {},
      ["fulgoran_data_source"] = { frequency = 0.1, size = 0.1, richness = 10000000 },
      ["neodymium_ore"] = {},
      --["calcite"] = {},
      ["vulcanus_volcanism"] = {},
      --["rocks"] = {}, -- can't add the rocks control otherwise nauvis rocks spawn
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          --nauvis tiles
          ["volcanic-soil-dark"] = {},
          ["volcanic-soil-light"] = {},
          ["volcanic-ash-soil"] = {},
          --end of nauvis tiles
          ["volcanic-ash-flats"] = {},
          ["volcanic-ash-light"] = {},
          ["volcanic-ash-dark"] = {},
          ["volcanic-cracks"] = {},
          ["volcanic-cracks-warm"] = {},
          ["volcanic-folds"] = {},
          ["volcanic-folds-flat"] = {},
          ["lava"] = {},
          ["lava-hot"] = {},
          ["volcanic-folds-warm"] = {},
          ["volcanic-pumice-stones"] = {},
          ["volcanic-cracks-hot"] = {},
          ["volcanic-jagged-ground"] = {},
          ["volcanic-smooth-stone"] = {},
          ["volcanic-smooth-stone-warm"] = {},
          ["volcanic-ash-cracks"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
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
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["quartz-ore"] = {},
          --["calcite"] = {},
          ["fulgoran-data-source"] = {},
          ["neodymium-ore"] = {},
          ["huge-volcanic-rock"] = {},
          ["big-volcanic-rock"] = {},
          ["crater-cliff"] = {},
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
        from = {control = 0.35, volume_percentage = 0.0},
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
      fog = effects.default_fog_effect_properties(),
      -- clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        {0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        {0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
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
    from = "nauvis",
    to = "moshine",
    order = "a",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
})