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
    research_trigger =
    {
      type = "mine-entity",
      entity = "multi-ore"
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
    research_trigger =
    {
      type = "mine-entity",
      entity = "multi-ore"
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
        recipe = "hard-drive"
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
    prerequisites = {"moshine-tech-supercomputer"},
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
    prerequisites = {"moshine-tech-hard-drive"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"hard-drive", 1},
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
        recipe = "data-processor"
      },
      {
        type = "unlock-recipe",
        recipe = "model-unstable"
      },
      {
        type = "unlock-recipe",
        recipe = "model-stable"
      },
    },
    prerequisites = {"moshine-tech-data-extractor", "moshine-tech-3d-data-storage"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"hard-drive", 1},
      },
      time = 60
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
    },
    prerequisites = {"moshine-tech-data-processor"},
    unit =
    {
      count = 100,
      ingredients =
      {
        {"model-stable", 1},
      },
      time = 80
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
      count_formula = "1.4^L*200",
      ingredients =
      {
        {"model-stable", 1},
      },
      time = 60
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