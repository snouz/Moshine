data:extend({

-- entities
  {
    type = "recipe",
    name = "supercomputer",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "lab", amount = 1},
      {type = "item", name = "heat-shielding", amount = 40},
      {type = "item", name = "magnet", amount = 20},

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
      --{type = "item", name = "quantum-processor", amount = 5},
    },
    results = {{type = "item", name = "data-processor", amount = 1}},
    enabled = false,
  },
  {
    type = "recipe",
    name = "data-extractor",
    ingredients = {
      {type = "item", name = "iron-plate", amount = 2},
    },
    results = {{type = "item", name = "data-extractor", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "optical-fiber",
    ingredients = {
      {type = "item", name = "iron-plate", amount = 1},
    },
    results = {{type = "item", name = "optical-fiber", amount = 1}},
    enabled = false,
  },


-- post-nauvis

  {
    type = "recipe",
    name = "silicon",
    category = "smelting",
    energy_required = 3.2,
    ingredients = {
      {type = "item", name = "quartz-ore", amount = 1}
    },
    results = {{type = "item", name = "silicon", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
  {
    type = "recipe",
    name = "heat-shielding",
    ingredients =
    {
      {type = "item", name = "silicon", amount = 5},
      {type = "item", name = "low-density-structure", amount = 2},
    },
    results = {{type = "item", name = "heat-shielding", amount = 1}},
    enabled = false,
  },

  {
    type = "recipe",
    name = "silicon-cell",
    ingredients =
    {
      {type = "item", name = "silicon", amount = 10},
      {type = "item", name = "electronic-circuit", amount = 1},
    },
    results = {{type = "item", name = "silicon-cell", amount = 1}},
    enabled = false,
  },




---post fulgora

  {
    type = "recipe",
    name = "magnet",
    category = "electromagnetics", -- only electromagnetic plant
    energy_required = 3.2,
    ingredients = {
      {type = "item", name = "neodymium", amount = 5},
    },
    results = {{type = "item", name = "magnet", amount = 1}},
    enabled = false,
  },
  {
    type = "recipe",
    name = "hard-drive",
    category = "electronics",
    energy_required = 3.2,
    ingredients = {
      {type = "item", name = "magnet", amount = 5},
      {type = "item", name = "silicon-cell", amount = 5},
    },
    results = {{type = "item", name = "hard-drive", amount = 1}},
    enabled = false,
  },
  {
    type = "recipe",
    name = "3d-data-storage",
    category = "electronics",
    energy_required = 3.2,
    ingredients = {
      {type = "item", name = "magnet", amount = 5},
      {type = "item", name = "silicon-cell", amount = 5},
      {type = "item", name = "hard-drive", amount = 5},
    },
    results = {{type = "item", name = "hard-drive", amount = 1}},
    enabled = false,
  },
  {
    type = "recipe",
    name = "3d-data-storage",
    category = "electronics",
    energy_required = 3.2,
    ingredients = {
      {type = "item", name = "magnet", amount = 5},
      {type = "item", name = "silicon-cell", amount = 5},
      {type = "item", name = "hard-drive", amount = 5},
    },
    results = {{type = "item", name = "3d-data-storage", amount = 1}},
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
    energy_required = 30,
    ingredients = {
      {type = "fluid", name = "raw-data", amount = 500},
      {type = "item", name = "3d-data-storage", amount = 5},
      {type = "item", name = "hard-drive", amount = 5},
    },
    results = {{type = "item", name = "model-unstable", amount = 1}},
    enabled = false,
  },
  {
    type = "recipe",
    name = "model-stable",
    category = "data-processing",
    energy_required = 300,
    ingredients = {
      {type = "item", name = "model-unstable", amount = 1},
      {type = "fluid", name = "raw-data", amount = 1000},
    },
    results = {{type = "item", name = "model-stable", amount = 1}},
    enabled = false,
  },

})