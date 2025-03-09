local techicons = "__Moshine__/graphics/technology/"


data:extend({
  {
    type = "technology",
    name = "moshine-tech-silicon",
    icon = "__Moshine__/graphics/technology/moshine-tech-silicon.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "silicon"
      },
    },
    prerequisites = {"planet-discovery-moshine"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "moshine-tech-glass",
    icon = "__Moshine__/graphics/technology/moshine-tech-glass.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "glass"
      },
    },
    prerequisites = {"planet-discovery-moshine"},
    unit =
    {
      count = 70,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "moshine-tech-silicon-carbide",
    icon = "__Moshine__/graphics/technology/moshine-tech-silicon-carbide.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "silicon-carbide"
      },
    },
    prerequisites = {"moshine-tech-silicon"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "moshine-tech-silicon-cell",
    icon = "__Moshine__/graphics/technology/moshine-tech-silicon-cell.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "silicon-cell"
      },
    },
    prerequisites = {"moshine-tech-silicon"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "moshine-tech-magnet",
    icon = "__Moshine__/graphics/technology/moshine-tech-magnet.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "magnet"
      },
    },
    prerequisites = {"planet-discovery-moshine"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "moshine-tech-hard-drive",
    icon = "__Moshine__/graphics/technology/moshine-tech-hard-drive.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "data-processor"
      },
      {
        type = "unlock-recipe",
        recipe = "hard-drive"
      },
      {
        type = "unlock-recipe",
        recipe = "datacell-add-raw-data"
      },
      {
        type = "unlock-recipe",
        recipe = "datacell-remove-raw-data"
      },
    },
    prerequisites = {"moshine-tech-magnet", "moshine-tech-silicon-cell"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "moshine-tech-supercomputer",
    icon = "__Moshine__/graphics/technology/moshine-tech-supercomputer.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "supercomputer"
      },
    },
    prerequisites = {"moshine-tech-hard-drive", "moshine-tech-silicon-carbide"},
    unit =
    {
      count = 500,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "moshine-tech-data-extractor",
    icon = "__Moshine__/graphics/technology/moshine-tech-data-extractor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "data-extractor"
      },
      {
        type = "unlock-recipe",
        recipe = "optical-cable"
      },
    },
    prerequisites = {"moshine-tech-supercomputer", "moshine-tech-glass"},
    unit =
    {
      count = 10,
      ingredients =
      {
        {"hard-drive", 1},
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "moshine-tech-3d-data-storage",
    icon = "__Moshine__/graphics/technology/moshine-tech-3d-data-storage.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "3d-data-storage"
      },
    },
    prerequisites = {"moshine-tech-data-extractor"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"datacell-raw-data", 1},
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "moshine-tech-data-processor",
    icon = "__Moshine__/graphics/technology/moshine-tech-data-processor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "model-unstable"
      },
      {
        type = "unlock-recipe",
        recipe = "model-stable"
      },
    },
    prerequisites = {"moshine-tech-3d-data-storage"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"datacell-raw-data", 1},
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "moshine-tech-processing-grid",
    icon = "__Moshine__/graphics/technology/moshine-tech-processing-grid.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "processing-grid"
      },
      {
        type = "unlock-recipe",
        recipe = "processing-tile"
      },
      {
        type = "unlock-recipe",
        recipe = "datacell-add-equation"
      },
    },
    prerequisites = {"moshine-tech-data-processor"},
    unit =
    {
      count = 10,
      ingredients =
      {
        {"datacell-raw-data", 10},
        {"model-stable", 1},
      },
      time = 20000
    }
  },
  {
    type = "technology",
    name = "moshine-tech-ai-trainer",
    icon = "__Moshine__/graphics/technology/moshine-tech-ai-trainer.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ai-trainer"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-0"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-1"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-2"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-3"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-4"
      },
    },
    prerequisites = {"moshine-tech-data-processor"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      },
      time = 80
    }
  },
  {
    type = "technology",
    name = "moshine-tech-advanced-ai-cores",
    icon = "__Moshine__/graphics/technology/moshine-tech-advanced-ai-cores.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ai-tier-5"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-6"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-7"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-8"
      },
      {
        type = "unlock-recipe",
        recipe = "ai-tier-9"
      },
    },
    prerequisites = {"moshine-tech-ai-trainer"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"model-stable", 1},
      },
      time = 16000
    }
  },
  {
    type = "technology",
    name = "moshine-tech-quantum-processor-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__Moshine__/graphics/technology/moshine-tech-quantum-processor-productivity.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "quantum-processor",
        change = 0.1
      },
    },
    prerequisites = {"moshine-tech-data-processor", "quantum-processor"},
    unit =
    {
      count_formula = "1.4^L*700",
      ingredients =
      {
        {"model-stable", 1},
        {"datacell-raw-data", 1},
      },
      time = 6000
    },
    max_level = "infinite",
    upgrade = true
  },

})



if mods["snouz-big-solar-panel"] then
  table.insert(data.raw["recipe"]["big-solar-panel"].ingredients, {type = "item", name = "silicon-cell", amount = 10})
  table.insert(data.raw["technology"]["big-solar-energy"].prerequisites, "moshine-tech-silicon-cell")
end

if mods["snouz-big-accumulator"] then
  table.insert(data.raw["recipe"]["big-accumulator"].ingredients, {type = "item", name = "magnet", amount = 10})
  table.insert(data.raw["technology"]["electric-energy-big-accumulators"].prerequisites, "moshine-tech-magnet")
end