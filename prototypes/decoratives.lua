local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require ("__base__.prototypes.entity.sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local base_decorative_sprite_priority = "extra-high"
local decal_tile_layer = 255

local function combine_tint(table_1, table_2)
  local t1 = table_1[1]-(1-table_2[1])
  local t2 = table_1[2]-(1-table_2[2])
  local t3 = table_1[3]-(1-table_2[3])
  return {t1,t2,t3}
end
local vulcanus_base_tint = {1,1,1}

local green_hairy_tint = {.85,.6,.7}
local brown_hairy_tint = {.7,.7,.7}
local brown_carpet_tint = {1,.9,1}
local red_pita_tint = {.8,.75,.75}
local tintable_rock_tint = {0.2588, 0.2588, 0.2588}
local sulfur_rock_tint = {0.788, 0.627, 0.167} --{0.968, 0.807, 0.247}
local tungsten_rock_tint = {.7,.7,.7}

green_hairy_tint = combine_tint(vulcanus_base_tint, green_hairy_tint)
brown_hairy_tint = combine_tint(vulcanus_base_tint, brown_hairy_tint)
brown_carpet_tint = combine_tint(vulcanus_base_tint, brown_carpet_tint)
red_pita_tint =  combine_tint(vulcanus_base_tint, red_pita_tint)
tintable_rock_tint = combine_tint(vulcanus_base_tint, tintable_rock_tint)
tungsten_rock_tint = combine_tint(vulcanus_base_tint, tungsten_rock_tint)

data:extend({
  {
    name = "moshine-rock-decal-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -1,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-f[cracked-rock]-b[cold]",
      probability_expression = "vulcanus_rock_decal_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-rock-decal/vulcanus-rock-decal-", "large-", 256, 5)
  },
    --- LARGE CRACK DECALS
  {
    name = "moshine-crack-decal-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -4,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-g[cracks]-b[cold]-a[large]",
      probability_expression = "vulcanus_crack_decal_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks-cold/vulcanus-cracks-cold-", "huge-", 256, 20)
  },
  {
    name = "moshine-dune-decal",
    type = "optimized-decorative",
    order = "a[fulgora]-b[decorative]",
    collision_box = {{-5, -5}, {5, 5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-h[dune]-a[relief]",
      probability_expression = "vulcanus_dune_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-dune-decal/vulcanus-dune-decal-", "", 512, 20)
  },
  {
    name = "moshine-sand-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    walking_sound = sounds.sand,
    autoplace = {
      order = "d[ground-surface]-h[dune]-b[patch]",
      probability_expression = "vulcanus_sand_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-sand-decal/vulcanus-sand-decal-", "", 256, 23)
  },
  --- WAVES
  {
    name = "moshine-waves-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-8, -8}, {8, 8}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-d[relief]-a[waves]",
      probability_expression = "waves_decal"
    },
    pictures = {
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-01.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-02.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-03.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-04.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-05.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-06.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-07.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__space-age__/graphics/decorative/waves-relief/waves-08.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      }
    }
  },





  --- TINTABLE ROCKS
  --- BIG ROCKS
  {
    name = "moshine-huge-volcanic-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/huge-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-f[huge-volcanic-rock]",
    collision_box = {{-1.5, -1.1}, {1.5, 1.1}},
    selection_box = {{-1.7, -1.3}, {1.7, 1.3}},
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results =
      {
        {type = "item", name = "stone", amount_min = 6, amount_max = 18},
        {type = "item", name = "iron-ore", amount_min = 9, amount_max = 27},
        {type = "item", name = "copper-ore", amount_min = 6, amount_max = 18},
        {type = "item", name = "tungsten-ore", amount_min = 3, amount_max = 15}
      },
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    max_health = 2000,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace = {
      order = "a[landscape]-c[rock]-a[huge]",
      probability_expression = "vulcanus_rock_huge"
    },
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-05.png",
        width = 201,
        height = 179,
        scale = 0.5,
        shift = {0.25, 0.0625},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-06.png",
        width = 233,
        height = 171,
        scale = 0.5,
        shift = {0.429688, 0.046875},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-07.png",
        width = 240,
        height = 192,
        scale = 0.5,
        shift = {0.398438, 0.03125},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-08.png",
        width = 219,
        height = 175,
        scale = 0.5,
        shift = {0.148438, 0.132812},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-09.png",
        width = 240,
        height = 208,
        scale = 0.5,
        shift = {0.3125, 0.0625},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-10.png",
        width = 243,
        height = 190,
        scale = 0.5,
        shift = {0.1875, 0.046875},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-11.png",
        width = 249,
        height = 185,
        scale = 0.5,
        shift = {0.398438, 0.0546875},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-12.png",
        width = 273,
        height = 163,
        scale = 0.5,
        shift = {0.34375, 0.0390625},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-13.png",
        width = 275,
        height = 175,
        scale = 0.5,
        shift = {0.273438, 0.0234375},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-14.png",
        width = 241,
        height = 215,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-15.png",
        width = 318,
        height = 181,
        scale = 0.5,
        shift = {0.523438, 0.03125},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-16.png",
        width = 217,
        height = 224,
        scale = 0.5,
        shift = {0.0546875, 0.0234375},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-17.png",
        width = 332,
        height = 228,
        scale = 0.5,
        shift = {0.226562, 0.046875},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-18.png",
        width = 290,
        height = 243,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-19.png",
        width = 349,
        height = 225,
        scale = 0.5,
        shift = {0.609375, 0.0234375},
        tint = tungsten_rock_tint
      },
      {
        filename = "__space-age__/graphics/decorative/huge-volcanic-rock/huge-volcanic-rock-20.png",
        width = 287,
        height = 250,
        scale = 0.5,
        shift = {0.132812, 0.03125},
        tint = tungsten_rock_tint
      }
    }
  },
  --- SMALL CRATERS
  {
    name = "moshine-crater-small",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-a[small]",
      probability_expression = "crater_small"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-crater/vulcanus-crater-", "", 128, 20)
  },
  --- LARGE CRATERS
  {
    name = "moshine-crater-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-a[large]",
      probability_expression = "crater_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-crater/vulcanus-crater-", "huge-", 512, 14)
  },
  {
    name = "moshine-pumice-relief-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-5, -5}, {5, 5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    walking_sound = sounds.pebble,
    autoplace = {
      order = "d[ground-surface]-d[relief]-b[rocky]",
      probability_expression = "pumice_relief_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-relief-decal/vulcanus-pumice-relief-", "", 1024, 19)
  },

  scaled_cliff_crater(
  {
    mod_name = "__space-age__",
    name = "moshine-crater-cliff",
    icon = "__space-age__/graphics/icons/crater-cliff.png",
    map_color = {r=144, g=119, b=87},
    subfolder = "vulcanus",
    prefix = "vulcanus-crater-section",
    scale = 1.0,
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    has_lower_layer = true,
    sprite_size_multiplier = 2,
    flags = { "placeable-off-grid", "placeable-neutral" },
    factoriopedia_simulation = simulations.factoriopedia_crater_cliff,

    crater_radius = 7, --3.5,
    crater_edge_thickness = 5,
    crater_segment_orientation_offset = 0, --1 / 16,
    --segment_probability = 1,
    autoplace =
    {
      order = "a[landscape]-a[cliff]-b[crater]",
      probability_expression = "crater_cliff"
    }
  })

})