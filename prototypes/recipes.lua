data:extend({


  {
    type = "recipe-category",
    name = "ai-training"
  },

-- entities
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
    enabled = false,
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
    surface_conditions =
    {
      {
        property = "magnetic-field",
        min = 0,
        max = 5
      }
    },
    results = {{type = "item", name = "data-processor", amount = 1}},
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
    --allow_productivity = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "optical-cable",
    energy_required = 3,
    ingredients = {
      {type = "item", name = "silicon", amount = 1},
      {type = "item", name = "silicon-carbide", amount = 1},
    },
    results = {{type = "item", name = "optical-cable", amount = 2}},
    --allow_productivity = true,
    enabled = false,
  },


  {
    type = "recipe",
    name = "processing-grid",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
    },
    results = {{type="item", name="processing-grid", amount=1}},
    enabled = true
  },

  {
    type = "recipe",
    name = "processing-tile",
    energy_required = 1,
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
    },
    results = {{type="item", name="processing-tile", amount=10}},
    allow_productivity = false,
    enabled = true,
  },

  {
    type = "recipe",
    name = "ai-trainer",
    energy_required = 1,
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 1},
    },
    results = {{type="item", name="ai-trainer", amount=10}},
    allow_productivity = false,
    enabled = true,
  },
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

-- post-nauvis

  {
    type = "recipe",
    name = "silicon",
    category = "smelting",
    energy_required = 5,
    ingredients = {
      {type = "item", name = "sand", amount = 1}
    },
    results = {{type = "item", name = "silicon", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
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
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "silicon", amount = 10},
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
      {type = "item", name = "neodymium", amount = 5},
      {type = "fluid", name = "molten-iron", amount = 2},
    },
    results = {{type = "item", name = "magnet", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "hard-drive",
    category = "electronics",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "magnet", amount = 5},
      {type = "item", name = "silicon-cell", amount = 5},
      {type = "item", name = "advanced-circuit", amount = 5},
    },
    results = {{type = "item", name = "hard-drive", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "3d-data-storage",
    category = "electronics",
    energy_required = 30,
    ingredients = {
      {type = "item", name = "magnet", amount = 30},
      {type = "item", name = "silicon-cell", amount = 30},
      {type = "item", name = "hard-drive", amount = 4},
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
    name = "ai-tier-02",
    icon = "__Moshine__/graphics/icons/ai-tier-02.png",
    category = "ai-training",
    energy_required = 3.2,
    ingredients = {{type = "item", name = "steel-plate", amount = 1}},
    results = {
      {type="item", name="ai-tier-02", amount=1, probability=0.5},
      {type="item", name="steel-plate", amount=1, probability=0.5},
    },
    allow_productivity = true
  },

  {
    type = "recipe",
    name = "processing-power-fluid",
    icon = "__Moshine__/graphics/icons/processing-power-fluid.png",
    category = "data-processing",
    energy_required = 0.1,
    ingredients = {},
    results = {
      {type="fluid", name="processing-power-fluid", amount=1000},
    },
    allow_productivity = true
  },

})