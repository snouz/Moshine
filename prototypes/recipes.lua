local aicorecolors = {
  {168,161,159}, --1
  {150,124,177}, --2
  {87,85,218},   --3
  {127,130,206}, --4
  {165,181,137}, --5
  {164,106,161}, --6
  {98,82,190},   --7
  {122,163,177}, --8
  {73,167,214},  --9
  {72,91,188},  --10
}

data:extend({


  {
    type = "recipe-category",
    name = "ai-training"
  },

-- entities
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
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 0,
        max = 5
      }
    },
    results = {{type = "item", name = "data-processor", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "supercomputer",
    energy_required = 120,
    ingredients =
    {
      {type = "item", name = "lab", amount = 1},
      {type = "item", name = "silicon-carbide", amount = 40},
      {type = "item", name = "magnet", amount = 20},
      {type = "item", name = "processing-unit", amount = 50},
      {type = "item", name = "hard-drive", amount = 100},

    },
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 0,
        max = 5
      }
    },
    results = {{type="item", name="supercomputer", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "data-extractor",
    energy_required = 30,
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
    name = "processing-tile",
    energy_required = 10,
    category = "crafting",
    ingredients =
    {
      {type = "item", name = "model-stable", amount = 1},
      {type = "item", name = "space-platform-foundation", amount = 1},
      {type = "item", name = "processing-unit", amount = 1},
      {type = "item", name = "optical-cable", amount = 1},
    },
    results = {{type="item", name="processing-tile", amount=1}},
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "ai-trainer",
    energy_required = 20,
    category = "crafting",
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
    name = "hard-drive", -- datacell empty
    category = "electronics",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "magnet", amount = 1},
      {type = "item", name = "silicon-cell", amount = 1},
      {type = "item", name = "advanced-circuit", amount = 1},
    },
    results = {{type = "item", name = "hard-drive", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "datacell-add-raw-data",
    icon = "__Moshine__/graphics/icons/datacell-add-raw-data.png",
    category = "data-processing",
    subgroup = "moshine-processes",
    order = "ggb",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "hard-drive", amount = 1},
      {type = "fluid", name = "raw-data", amount = 1000},
    },
    results = {{type = "item", name = "datacell-raw-data", amount = 1}},
    allow_productivity = false,
    auto_recycle = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "datacell-remove-raw-data",
    icon = "__Moshine__/graphics/icons/datacell-remove-raw-data.png",
    category = "data-processing",
    subgroup = "moshine-processes",
    order = "ggb",
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "datacell-raw-data", amount = 1},
    },
    results = {
      {type = "item", name = "hard-drive", amount = 1},
      {type = "fluid", name = "raw-data", amount = 1000},
    },
    allow_productivity = false,
    auto_recycle = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "datacell-add-equation",
    icon = "__Moshine__/graphics/icons/datacell-add-equation.png",
    category = "data-processing",
    subgroup = "moshine-processes",
    order = "ggc",
    --hide_from_player_crafting = true,
    energy_required = 1000,
    ingredients = {
      {type = "item", name = "hard-drive", amount = 1},
    },
    results = {{type = "item", name = "datacell-equation", amount = 1}},
    allow_productivity = false,
    auto_recycle = false,
    enabled = false,
  },
  {
    type = "recipe",
    name = "3d-data-storage",
    category = "electronics",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "magnet", amount = 3},
      {type = "item", name = "silicon-cell", amount = 3},
      {type = "item", name = "hard-drive", amount = 4},
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
  },
  {
    type = "recipe",
    name = "ai-tier-0",
    icons = {
      {icon = "__Moshine__/graphics/icons/aicores/tier-1.png", icon_size = 64, scale = 0.5},
      {icon = "__Moshine__/graphics/icons/tiers/tier-1.png", icon_size = 64, scale = 0.35, shift = {0,0.3}},
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
      {type="item", name="model-stable", amount=1, probability=0.50},
      {type="item", name="ai-tier-1", amount=1, probability=0.50},
    },
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = {primary = aicorecolors[1]},
  },
  {
    type = "recipe",
    name = "ai-tier-1",
    icons = {
      {icon = "__Moshine__/graphics/icons/aicores/tier-2.png", icon_size = 64, scale = 0.5},
      {icon = "__Moshine__/graphics/icons/tiers/tier-2.png", icon_size = 64, scale = 0.35, shift = {0,0.3}},
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
      --{type="item", name="ai-tier-3", amount=1, probability=0.13},
      {type="item", name="model-unstable", amount=1, probability=0.01},
    },
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = {primary = aicorecolors[2]},
  },
})

for i=2,9 do
  data:extend({
    {
      type = "recipe",
      name = "ai-tier-" .. i,
      icons = {
        {icon = "__Moshine__/graphics/icons/aicores/tier-" .. i+1 .. ".png", icon_size = 64, scale = 0.5},
        {icon = "__Moshine__/graphics/icons/tiers/tier-" .. i+1 .. ".png", icon_size = 64, scale = 0.35, shift = {0,0.3}},
        {icon = "__Moshine__/graphics/icons/training-arrows.png", icon_size = 64, scale = 0.5},
      },
      hide_from_player_crafting = true,
      hidden_in_factoriopedia = false,
      category = "ai-training",
      subgroup = "moshine-processes",
      order = "kkk",
      energy_required = 10,
      ingredients = {{type = "item", name = "ai-tier-" .. i, amount = 1}},
      results = {
        {type="item", name="ai-tier-" .. i, amount=1, probability=0.49},
        {type="item", name="ai-tier-" .. i+1, amount=1, probability= (0.32 - i/100) },
        {type="item", name="ai-tier-" .. i-1, amount=1, probability= (0.18 + i/100) },
        {type="item", name="model-unstable", amount=1, probability=0.01},
      },
      allow_productivity = false,
      enabled = false,
      crafting_machine_tint = {primary = aicorecolors[i+1]},
    },
  })
end