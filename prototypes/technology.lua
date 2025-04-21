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
      count = 200,
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
    research_trigger =
    {
      type = "craft-item",
      item = "silicon",
      count = 60
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
    prerequisites = {"moshine-tech-magnet", "moshine-tech-silicon-cell", "moshine-tech-silicon-carbide"},
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
    prerequisites = {"moshine-tech-hard-drive"},
    research_trigger =
    {
      type = "craft-item",
      item = "data-processor",
      count = 1
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
      time = 30
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
      time = 10
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
    prerequisites = {"moshine-tech-ai-tier-2"},
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
    },
    prerequisites = {"moshine-tech-data-processor"},
    unit =
    {
      count = 50,
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
    name = "moshine-tech-ai-tier-1",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-1.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-0" }},
    prerequisites = {"moshine-tech-ai-trainer"},
    research_trigger =
    {
      type = "craft-item",
      item = "ai-trainer",
      count = 1
    },
    --unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-2",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-2.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-1" }},
    prerequisites = {"moshine-tech-ai-tier-1"},
    unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-3",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-3.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-2" }},
    prerequisites = {"moshine-tech-ai-tier-2"},
    unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-4",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-4.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-3" }},
    prerequisites = {"moshine-tech-ai-tier-3"},
    unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-5",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-5.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-4" }},
    prerequisites = {"moshine-tech-ai-tier-4"},
    unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-6",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-6.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-5" }},
    prerequisites = {"moshine-tech-ai-tier-5"},
    unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-7",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-7.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-6" }},
    prerequisites = {"moshine-tech-ai-tier-6"},
    unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-8",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-8.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-7" }},
    prerequisites = {"moshine-tech-ai-tier-7"},
    unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-9",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-9.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-8" }},
    prerequisites = {"moshine-tech-ai-tier-8"},
    unit = {},
    upgrade = true,
  },
  {
    type = "technology",
    name = "moshine-tech-ai-tier-10",
    icon = "__Moshine__/graphics/technology/ai-tiers/tier-10.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ai-tier-9" }},
    prerequisites = {"moshine-tech-ai-tier-9"},
    unit = {},
    upgrade = true,
  },
  --[[{
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
  },]]
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
    prerequisites = {"moshine-tech-processing-grid", "quantum-processor"},
    unit =
    {
      count_formula = "1.4^L*700",
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"datacell-solved-equation", 1},
      },
      time = 60000
    },
    max_level = "infinite",
    upgrade = true
  },

})



if data.raw.technology["long-stack-inserter"] then
  table.insert(data.raw.technology["long-stack-inserter"].prerequisites, "moshine-tech-processing-grid")
  data.raw.technology["long-stack-inserter"].unit =
    {
      count = 10,
      ingredients =
      {
        {"datacell-raw-data", 1},
        {"datacell-solved-equation", 1},
      },
      time = 2000
    }
end

if mods["aai-industry"] and data.raw["technology"]["glass-processing"] then
  data.raw["technology"]["moshine-tech-data-extractor"].prerequisites = {"moshine-tech-supercomputer", "glass-processing"}
  data.raw["technology"]["moshine-tech-glass"].enabled = false
end



local function add_tech_unit(tech, count, time, ingredients)
  if data.raw["technology"][tech] and count and time and ingredients then
    data.raw["technology"][tech].unit =
    {
      count = count,
      ingredients = ingredients,
      time = time,
    }
  end
end

add_tech_unit("moshine-tech-data-extractor", 40, 60, {{"hard-drive", 1}} )
add_tech_unit("moshine-tech-3d-data-storage", 200, 60,      {{"datacell-raw-data", 1}} )
add_tech_unit("moshine-tech-data-processor", 1000, 10,      {{"datacell-raw-data", 1}} )
add_tech_unit("moshine-tech-ai-trainer", 50, 80,            {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-2", 10, 2*1000,         {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-3", 15, 16*1000,        {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-4", 20, 54*1000,        {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-5", 25, 128*1000,       {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-6", 30, 250*1000,       {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-7", 35, 432*1000,       {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-8", 40, 686*1000,       {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-9", 45, 1024*1000,      {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-ai-tier-10", 50, 1458*1000,     {{"datacell-raw-data", 1}, {"model-stable", 1}} )
add_tech_unit("moshine-tech-processing-grid", 10, 145*1000, {{"datacell-raw-data", 10},{"model-stable", 1}} )
add_tech_unit("long-stack-inserter", 1000, 2.45*1000,          {{"datacell-raw-data", 1}, {"datacell-solved-equation", 1}} )