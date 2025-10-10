data:extend({

  {
    type = "recipe-category",
    name = "ai-training"
  },

-- entities
  {
    type = "recipe",
    name = "concrete-from-molten-iron-and-sand",
    category = "metallurgy",
    icon = "__Moshine__/graphics/icons/concrete-from-molten-iron-and-sand.png",
    subgroup = "moshine-processes",
    order = "aab",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-iron", amount = 20},
      {type = "fluid", name = "water", amount = 100},
      {type = "item", name = "sand", amount = 80},
    },
    energy_required = 10,
    results = {{type = "item", name = "concrete", amount = 10}},
    allow_decomposition = false,
    auto_recycle = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "petroleum-from-sand-sulfur-steam-carbon",
    category = "oil-processing",
    icon = "__Moshine__/graphics/icons/petroleum-from-sand-sulfur-steam-carbon.png",
    subgroup = "moshine-processes",
    order = "aac",
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "steam", amount = 50},
      {type = "item", name = "sand", amount = 40},
      {type = "item", name = "sulfur", amount = 10},
      {type = "item", name = "coal", amount = 5},
    },
    energy_required = 3,
    results = {
      {type = "fluid", name = "petroleum-gas", amount = 100, show_details_in_recipe_tooltip = true},
      {type = "item", name = "carbon", amount = 2, show_details_in_recipe_tooltip = false},
    },
    main_product = "petroleum-gas",
    allow_decomposition = false,
    auto_recycle = false,
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "data-processor",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "assembling-machine-3", amount = 1},
      {type = "item", name = "productivity-module-2", amount = 5},
      {type = "item", name = "silicon-carbide", amount = 5},
    },
    results = {
      {type = "item", name = "data-processor", amount = 1}
    },
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "neural_computer",
    energy_required = 30,
    ingredients =
    {
      {type = "item", name = "lab", amount = 1},
      {type = "item", name = "silicon-carbide", amount = 40},
      {type = "item", name = "magnet", amount = 20},
      {type = "item", name = "processing-unit", amount = 50},
      {type = "item", name = "datacell-empty", amount = 100},

    },
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    results = {{type = "item", name = "neural_computer", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "data-extractor",
    energy_required = 10,
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    ingredients = {
      {type = "item", name = "display-panel", amount = 10},
      {type = "item", name = "magnet", amount = 5},
      {type = "item", name = "constant-combinator", amount = 4},
      {type = "item", name = "processing-unit", amount = 4},
    },
    results = {{type = "item", name = "data-extractor", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "optical-cable",
    energy_required = 3,
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    ingredients = {
      {type = "item", name = "silicon", amount = 1},
      {type = "item", name = "silicon-carbide", amount = 1},
      {type = "item", name = "glass", amount = 1},
    },
    results = {{type = "item", name = "optical-cable", amount = 2}},
    allow_productivity = false,
    enabled = false,
  },


  {
    type = "recipe",
    name = "processing-grid",
    energy_required = 20,
    category = "crafting",
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    ingredients =
    {
      {type = "item", name = "data-processor", amount = 1},
      {type = "item", name = "model-stable", amount = 50},
      {type = "item", name = "silicon-carbide", amount = 10},
      {type = "item", name = "processing-unit", amount = 5},
    },
    results = {{type="item", name="processing-grid", amount=1}},
    allow_productivity = false,
    enabled = false,
  },
  
  {
    type = "recipe",
    name = "webbed_processor_tile",
    energy_required = 2,
    category = "crafting",
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    ingredients =
    {
      {type = "item", name = "model-stable", amount = 1},
      {type = "item", name = "space-platform-foundation", amount = 1},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "optical-cable", amount = 1},
    },
    results = {
      {type = "item", name = "webbed_processor_tile", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "ai-trainer",
    energy_required = 20,
    category = "crafting",
    surface_conditions = {{ property = "pressure", min = 701, max = 701}},
    ingredients =
    {
      {type = "item", name = "model-unstable", amount = 1},
      {type = "item", name = "model-stable", amount = 10},
      {type = "item", name = "data-processor", amount = 1},
      {type = "item", name = "processing-unit", amount = 50},
      {type = "item", name = "concrete", amount = 100},
      {type = "item", name = "glass", amount = 100},
    },
    results = {{type="item", name="ai-trainer", amount=1}},
    allow_productivity = false,
    enabled = false,
  },
  --[[
  {
    type = "recipe",
    name = "ai-support",
    energy_required = 1,
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
    },
    results = {{type="item", name="ai-support", amount=10}},
    allow_productivity = false,
    enabled = true,
  },
  ]]

-- post-nauvis

  {
    type = "recipe",
    name = "silicon",
    category = "chemistry",
    energy_required = 2,
    ingredients = {
      {type = "item", name = "sand", amount = 5},
      {type = "item", name = "coal", amount = 1},
      {type = "fluid", name = "steam", amount = 10},
    },
    results = {{type = "item", name = "silicon", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
})

if not data.raw.recipe["glass"] then
  data:extend({
    {
      type = "recipe",
      name = "glass",
      category = "smelting",
      energy_required = 4,
      ingredients = {
        {type = "item", name = "sand", amount = 4}
      },
      results = {{type = "item", name = "glass", amount = 1}},
      allow_productivity = true,
      enabled = false,
    },
  })
end

data:extend({
  {
    type = "recipe",
    name = "silicon-carbide",
    category = "crafting-with-fluid",
    energy_required = 8,
    ingredients =
    {
      {type = "item", name = "silicon", amount = 2},
      {type = "item", name = "carbon", amount = 1},
      {type = "fluid", name = "sulfuric-acid", amount = 10},
    },
    results = {{type = "item", name = "silicon-carbide", amount = 2}},
    allow_productivity = true,
    enabled = false,
  },

  {
    type = "recipe",
    name = "silicon-cell",
    category = "electronics",
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "silicon", amount = 5},
      {type = "item", name = "electronic-circuit", amount = 1},
    },
    results = {{type = "item", name = "silicon-cell", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },




---post fulgora

  {
    type = "recipe",
    name = "magnet",
    category = "electromagnetics", -- only electromagnetic plant
    energy_required = 5,
    ingredients = {
      {type = "item", name = "neodymium", amount = 1},
      {type = "fluid", name = "molten-iron", amount = 10},
    },
    results = {{type = "item", name = "magnet", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "datacell-empty", -- datacell empty
    category = "electronics",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "magnet", amount = 1},
      {type = "item", name = "silicon-cell", amount = 1},
      {type = "item", name = "advanced-circuit", amount = 1},
    },
    results = {{type = "item", name = "datacell-empty", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "datacell-raw-data",
    icon = "__Moshine__/graphics/icons/datacell-raw-data.png",
    category = "data-processing",
    --subgroup = "moshine-processes",
    --order = "ggb",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-empty", amount = 1},
      {type = "fluid", name = "raw-data", amount = 1000},
    },
    results = {{type = "item", name = "datacell-raw-data", amount = 1}},
    allow_productivity = false,
    auto_recycle = false,
    enabled = false,
    crafting_machine_tint = {primary = {109, 209, 94}}, --#6dd15e
  },
  {
    type = "recipe",
    name = "datacell-remove-raw-data",
    icon = "__Moshine__/graphics/icons/datacell-remove-raw-data.png",
    category = "data-processing",
    subgroup = "moshine-processes",
    order = "ggb",
    hide_from_player_crafting = true,
    hide_from_stats = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-raw-data", amount = 1},
    },
    results = {
      {type = "item", name = "datacell-empty", amount = 1},
      {type = "fluid", name = "raw-data", amount = 1000},
    },
    allow_productivity = false,
    auto_recycle = false,
    enabled = false,
    crafting_machine_tint = {primary = {109, 209, 94}}, --#6dd15e
  },

  {
    type = "recipe",
    name = "datacell-ai-model-data",
    icon = "__Moshine__/graphics/icons/datacell-ai-model-data.png",
    category = "data-processing",
    --subgroup = "moshine-processes",
    --order = "ggc",
    --hide_from_player_crafting = true,
    energy_required = 10,
    ingredients = {
      {type = "item", name = "datacell-empty", amount = 1},
      {type = "item", name = "model-stable", amount = 1},
    },
    results = {
      {type = "item", name = "3d-data-storage", amount = 1},
      {type = "item", name = "datacell-ai-model-data", amount = 1}
    },
    main_product = "datacell-ai-model-data",
    allow_productivity = false,
    auto_recycle = false,
    enabled = false,
    crafting_machine_tint = {primary = {106, 196, 230}}, --#6ac4e6
  },
  {
    type = "recipe",
    name = "datacell-equation",
    icon = "__Moshine__/graphics/icons/datacell-equation.png",
    category = "data-processing",
    --subgroup = "moshine-processes",
    --order = "ggd",
    --hide_from_player_crafting = true,
    energy_required = 1000,
    ingredients = {
      {type = "item", name = "datacell-empty", amount = 1},
    },
    results = {
      {type = "item", name = "datacell-equation", amount = 1}
    },
    allow_productivity = false,
    auto_recycle = false,
    enabled = false,
    crafting_machine_tint = {primary = {66, 125, 235}}, --#427deb
  },

  {
    type = "recipe",
    name = "3d-data-storage",
    category = "electronics",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "magnet", amount = 3},
      {type = "item", name = "silicon-cell", amount = 3},
      {type = "item", name = "datacell-empty", amount = 4},
      {type = "item", name = "glass", amount = 5},
    },
    results = {{type = "item", name = "3d-data-storage", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },




  {
    type = "recipe-category",
    name = "data-processing"
  },

  {
    type = "recipe",
    name = "model-unstable",
    category = "data-processing",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "3d-data-storage", amount = 1},
      {type = "fluid", name = "raw-data", amount = 500},
    },
    results = {{type = "item", name = "model-unstable", amount = 1}},
    enabled = false,
    crafting_machine_tint = {primary = {255, 0, 0}}, --#ff0000
  },






  {
    type = "recipe",
    name = "model-stable",
    category = "data-processing",
    energy_required = 40,
    ingredients = {
      {type = "item", name = "model-unstable", amount = 1},
      {type = "fluid", name = "raw-data", amount = 1000},
    },
    results = {{type = "item", name = "model-stable", amount = 1}},
    enabled = false,
    crafting_machine_tint = {primary = {20, 251, 255}}, --#14fbff
  },
  {
    type = "recipe",
    name = "ai-tier-1",
    icons = {
      {icon = "__Moshine__/graphics/icons/aicores/tier-1.png", icon_size = 64, scale = 0.5},
      --{icon = "__Moshine__/graphics/icons/tiers/tier-1.png", icon_size = 64, scale = 0.35, shift = {0,0.3}},
      {icon = "__Moshine__/graphics/icons/training-arrows.png", icon_size = 64, scale = 0.5},
    },
    --hide_from_player_crafting = true,
    --hidden_in_factoriopedia = true,
    category = "ai-training",
    subgroup = "moshine-processes",
    order = "kkk",
    energy_required = 10,
    ingredients = {{type = "item", name = "model-stable", amount = 1}},
    results = {
      {type = "item", name = "model-stable", amount = 1, probability = 0.50},
      {type = "item", name = "ai-tier-1", amount = 1, probability = 0.50},
    },
    main_product = "ai-tier-1",
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint =
    {
      primary = {40, 66, 65, 255},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 0, g = 0, b = 0, a = 0},
    },
  },
  {
    type = "recipe",
    name = "ai-tier-2",
    icons = {
      {icon = "__Moshine__/graphics/icons/aicores/tier-2.png", icon_size = 64, scale = 0.5},
      --{icon = "__Moshine__/graphics/icons/tiers/tier-2.png", icon_size = 64, scale = 0.35, shift = {0,0.3}},
      {icon = "__Moshine__/graphics/icons/training-arrows.png", icon_size = 64, scale = 0.5},
    },
    hide_from_player_crafting = true,
    hidden_in_factoriopedia = false,
    category = "ai-training",
    subgroup = "moshine-processes",
    order = "kkk",
    energy_required = 10,
    ingredients = {{type = "item", name = "ai-tier-1", amount = 1}},
    results = {
      {type="item", name="ai-tier-1", amount=1, probability=0.59},
      {type="item", name="ai-tier-2", amount=1, probability=0.40},
      {type="item", name="model-unstable", amount=1, probability=0.01},
    },
    main_product = "ai-tier-2",
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = 
    {
      primary = {70, 128, 124, 255},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 0, g = 0, b = 0, a = 0},
    },
  },
})

local one =
{
  primary = {179, 255, 250, 255},
  secondary = {r = 0, g = 0, b = 0, a = 0},
  tertiary = {r = 0, g = 0, b = 0, a = 0},
  quaternary = {r = 0, g = 0, b = 0, a = 0},
}
local two =
{
  primary = {r = 0, g = 0, b = 0, a = 0},
  secondary = {r = 1, g = 1, b = 1, a = 1},
  tertiary = {r = 0, g = 0, b = 0, a = 0},
  quaternary = {r = 0, g = 0, b = 0, a = 0},
}
local three =
{
  primary = {r = 0, g = 0, b = 0, a = 0},
  secondary = {r = 0, g = 0, b = 0, a = 0},
  tertiary = {r = 1, g = 1, b = 1, a = 1},
  quaternary = {r = 0, g = 0, b = 0, a = 0},
}
local four =
{
  primary = {r = 0, g = 0, b = 0, a = 0},
  secondary = {r = 0, g = 0, b = 0, a = 0},
  tertiary = {r = 0, g = 0, b = 0, a = 0},
  quaternary = {r = 1, g = 1, b = 1, a = 1},
}

for i=2,9 do

  local typeofanim = one

  if i >= 8 then
    typeofanim = four
  elseif i >= 6 then
    typeofanim = three
  elseif i >= 3 then
    typeofanim = two
  end


  data:extend({
    {
      type = "recipe",
      name = "ai-tier-" .. i+1,
      icons = {
        {icon = "__Moshine__/graphics/icons/aicores/tier-" .. i+1 .. ".png", icon_size = 64, scale = 0.5},
        --{icon = "__Moshine__/graphics/icons/tiers/tier-" .. i+1 .. ".png", icon_size = 64, scale = 0.35, shift = {0,0.3}},
        {icon = "__Moshine__/graphics/icons/training-arrows.png", icon_size = 64, scale = 0.5},
      },
      hide_from_player_crafting = true,
      hidden_in_factoriopedia = false,
      category = "ai-training",
      --subgroup = "moshine-processes",
      --order = "kkk",
      energy_required = 10,
      ingredients = {
        {type = "item", name = "ai-tier-" .. i, amount = 1}
      },
      results = {
        {type = "item", name = "ai-tier-" .. i,   amount = 1, probability = 0.47},
        {type = "item", name = "ai-tier-" .. i+1, amount = 1, probability = (0.32 - i/100) },
        {type = "item", name = "ai-tier-" .. i-1, amount = 1, probability = (0.20 + i/100) },
        {type = "item", name = "model-unstable",  amount = 1, probability = 0.01},
      },
      main_product = "ai-tier-" .. i+1,
      allow_productivity = false,
      enabled = false,
      crafting_machine_tint = typeofanim,


    },


  })
end