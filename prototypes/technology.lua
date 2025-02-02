local techicons = "__Moshine__/graphics/technology/"


data:extend({
  {
    type = "technology",
    name = "planet-discovery-moshine",
    icons = util.technology_icon_constant_planet(techicons .. "moshine-tech-moshine.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "moshine",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {"space-platform-thruster"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },


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
  name = "moshine-tech-heat-shielding",
  icon = "__Moshine__/graphics/technology/moshine-tech-heat-shielding.png",
  icon_size = 256,
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "heat-shielding"
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
  prerequisites = {"planet-discovery-moshine", "electromagnetic-plant"},
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
  prerequisites = {"moshine-tech-hard-drive", "moshine-tech-heat-shielding"},
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
      recipe = "optical-fiber"
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

})



if mods["snouz-big-solar-panel"] then
  table.insert(data.raw["recipe"]["big-solar-panel"].ingredients, {type = "item", name = "silicon-cell", amount = 10})
  table.insert(data.raw["technology"]["big-solar-energy"].prerequisites, "moshine-tech-silicon-cell")
end