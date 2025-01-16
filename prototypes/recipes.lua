data:extend({

-- entities
  {
    type = "recipe",
    name = "supercomputer",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "lab", amount = 1},
    },
    results = {{type="item", name="supercomputer", amount = 1}},
    --enabled = false,
  },
  {
    type = "recipe",
    name = "data-processor",
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "lab", amount = 1},
    },
    results = {{type = "item", name = "data-processor", amount = 1}},
    --enabled = false,
  },
  {
    type = "recipe",
    name = "data-collector",
    ingredients = {
      {type = "item", name = "iron-plate", amount = 2},
    },
    results = {{type = "item", name = "iron-gear-wheel", amount = 1}},
    allow_productivity = true
    --enabled = false,
  },
  {
    type = "recipe",
    name = "optical-fiber",
    ingredients = {
      {type = "item", name = "iron-plate", amount = 1},
    },
    results = {{type = "item", name = "optical-fiber", amount = 1}},
    --enabled = false,
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
    --enabled = false,
  },
  {
    type = "recipe",
    name = "heat-shielding",
    ingredients =
    {
      {type = "item", name = "silicon", amount = 5}
      {type = "item", name = "low-density-structure", amount = 2},
    },
    results = {{type = "item", name = "heat-shielding", amount = 1}},
    --enabled = false,
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
    --enabled = false,
  },



-- post-vulcanus

  {
    type = "recipe",
    name = "neodymium-ingot",
    icon = "__Moshine__/graphics/icons/neodymium-ingot.png",
    category = "metallurgy", -- only foundtry
    energy_required = 3.2,
    ingredients = {
      {type = "fluid", name = "lava", amount = 50},
      {type = "item", name = "iron-ore", amount = 1},
    },
    results = {
      {type = "item", name = "neodymium-ingot", amount = 1},
      {type = "item", name = "stone", amount = 10},
    },
    allow_productivity = true,
    --enabled = false,
  },

---post fulgora

  {
    type = "recipe",
    name = "magnet",
    category = "electromagnetics", -- only electromagnetic plant
    energy_required = 3.2,
    ingredients = {
      {type = "item", name = "neodymium-ingot", amount = 1},
    },
    results = {{type = "item", name = "optical-fiber", amount = 1}},
    --enabled = false,
  },
})