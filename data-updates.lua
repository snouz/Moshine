local recycling = require("__quality__.prototypes.recycling")

if mods["se-space-trains"] then
  if data.raw["technology"]["tech-space-trains"] then
    table.insert(data.raw["technology"]["tech-space-trains"].prerequisites, "moshine-tech-magnet")
  end
  if data.raw["recipe"]["space-locomotive"] then
    table.insert(data.raw["recipe"]["space-locomotive"].ingredients, {type = "item", name = "magnet", amount = 5})
  end
  if data.raw["recipe"]["space-fluid-wagon"] then
    table.insert(data.raw["recipe"]["space-fluid-wagon"].ingredients, {type = "item", name = "magnet", amount = 5})
  end
  if data.raw["recipe"]["space-cargo-wagon"] then
    table.insert(data.raw["recipe"]["space-cargo-wagon"].ingredients, {type = "item", name = "magnet", amount = 5})
  end
  if data.raw["item-with-entity-data"]["space-locomotive"] then
    data.raw["item-with-entity-data"]["space-locomotive"].order = "c[rolling-stock]-e[space-locomotive]"
  end
  if data.raw["item-with-entity-data"]["space-cargo-wagon"] then
    data.raw["item-with-entity-data"]["space-cargo-wagon"].order = "c[rolling-stock]-f[space-cargo-wagon]"
  end
  if data.raw["item-with-entity-data"]["space-fluid-wagon"] then
    data.raw["item-with-entity-data"]["space-fluid-wagon"].order = "c[rolling-stock]-g[space-fluid-wagon]"
  end

  recycling.generate_recycling_recipe(data.raw["recipe"]["space-locomotive"])
  recycling.generate_recycling_recipe(data.raw["recipe"]["space-cargo-wagon"])
  recycling.generate_recycling_recipe(data.raw["recipe"]["space-fluid-wagon"])
  recycling.generate_recycling_recipe(data.raw["recipe"]["space-train-battery-charging-station"])
  recycling.generate_recycling_recipe(data.raw["recipe"]["space-train-battery-pack"])
end

if mods["maraxsis"] then
  if data.raw.item["maraxsis-glass-panes"] then
    data.raw.item["maraxsis-glass-panes"].localised_name = {"item-name.maraxsis-reinforced-glass"}
  end
end

if mods["bzsilicon"] then

  local util = require("__bzsilicon__.data-util")
  
  if data.raw["recipe"]["optical-cable"] and data.raw["item"]["optical-fiber"] then
    data.raw["recipe"]["optical-cable"].ingredients = {
      {type = "item", name = "optical-fiber", amount = 1},
      {type = "item", name = "silicon-carbide", amount = 1},
      {type = "item", name = "glass", amount = 1},
    }
  end

  data.extend({
    {
      type = "recipe",
      name = "advanced-silicon",
      category = "smelting",
      energy_required = 5,
      ingredients = {
        {type = "item", name = "silica", amount = 5}
      },
      results = {{type = "item", name = "hot-silicon", amount = 1}},
      allow_productivity = true,
      enabled = false,
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
          recipe = "advanced-silicon"
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
      type = "recipe",
      name = "optical-fiber",
      enabled = false,
      allow_productivity = true,
      ingredients = {util.item("silica", 1)},
      results = {util.item("optical-fiber",  1)},
      -- expensive =
      -- {
      --   enabled = false,
      --   ingredients = {{"silica", 2}},
      --   results = {util.item("optical-fiber",  1)},
      -- },
    },
    {
      type = "item",
      name = "optical-fiber",
      icon = "__bzsilicon__/graphics/icons/optical-fiber.png",
      icon_size = 64, icon_mipmaps = 3,
      subgroup = util.cablesg,
      order = "a[optical-fiber]",
      stack_size = util.get_stack_size(200),
      weight = 1*kg,
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
  })

  if mods["hot-metals"] then 
    data:extend({
      {
        type = "recipe",
        name = "advanced-silicon",
        category = "smelting",
        icon = "__Moshine__/graphics/technology/moshine-tech-silicon.png",
        icon_size = 256,
        energy_required = 5,
        ingredients = {
          {type = "item", name = "silica", amount = 5}
        },
        results = {{type = "item", name = "hot-silicon", amount = 1}},
        allow_productivity = true,
        enabled = false,
      },
      {
        type = "recipe",
        name = "silicon",
        category = "smelting",
        icon = "__Moshine__/graphics/technology/moshine-tech-silicon.png",
        icon_size = 256,
        energy_required = 5,
        ingredients = {
          {type = "item", name = "silica", amount = 10}
        },
        results = {{type = "item", name = "hot-silicon", amount = 1}},
        allow_productivity = true,
        enabled = false,
      },
    })
  else
    data:extend({
      {
        type = "recipe",
        name = "advanced-silicon",
        category = "chemistry",
        energy_required = 5,
        ingredients = {
          {type = "item", name = "silica", amount = 10},
          {type = "item", name = "coal", amount = 1}
        },
        results = {{type = "item", name = "silicon", amount = 1}},
        allow_productivity = true,
        enabled = false,
      },
      {
        type = "recipe",
        name = "silicon",
        category = "chemistry",
        icon = "__Moshine__/graphics/technology/moshine-tech-silicon.png",
        icon_size = 256,
        energy_required = 5,
        ingredients = {
          {type = "item", name = "silica", amount = 10},
          {type = "item", name = "coal", amount = 1}
        },
        results = {{type = "item", name = "silicon", amount = 1}},
        allow_productivity = true,
        enabled = false,
      },
    })
  end
end

if data.raw["agricultural-tower"]["agricultural-tower"] and not data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds then
  data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds = {}
  for _, seed in pairs(data.raw.item) do
    if seed.plant_result then
      if seed.name ~= "datacell-equation" and seed.name ~= "datacell-dna-raw" then
        table.insert(data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds, seed.name)
      end
    end
  end
  for _, seed in pairs(data.raw.tool) do
    if seed.plant_result then
      if seed.name ~= "datacell-equation" and seed.name ~= "datacell-dna-raw" then
        table.insert(data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds, seed.name)
      end
    end
  end
  for _, seed in pairs(data.raw.module) do
    if seed.plant_result then
      if seed.name ~= "datacell-equation" and seed.name ~= "datacell-dna-raw" then
        table.insert(data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds, seed.name)
      end
    end
  end
  for _, seed in pairs(data.raw.capsule) do
    if seed.plant_result then
      if seed.name ~= "datacell-equation" and seed.name ~= "datacell-dna-raw" then
        table.insert(data.raw["agricultural-tower"]["agricultural-tower"].accepted_seeds, seed.name)
      end
    end
  end
end