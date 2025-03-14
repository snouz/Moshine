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
end

if mods["minimalist-rails"] then

  if data.raw["recipe"]["rail-minimal"] then
    data.raw["recipe"]["rail-minimal"].ingredients = {
      {type = "item", name = "silicon-carbide", amount = 1},
      {type = "item", name = "neodymium", amount = 1},
    }
  end

  if data.raw["item"]["rail-minimal"] then
    data.raw["item"]["rail-minimal"].default_import_location = "moshine"
  end

  --local railmcollision = {layers={floor=true, item=true, object=true, is_lower_object=true}} --, rail=true, water_tile=true

--[[{layers={
  water_tile=true,
  item=true,
  resource=true,
  player=true,
  doodad=true,
  --object=true,
  lava_tile=true,
  rail=true -- to prevent rail supports from being buildable on lava, guarded by TEST(RailSupportOverTilesAssumptions)
}}]]


  --data.raw["curved-rail-b"]["curved-rail-b-minimal"].collision_mask = railmcollision
  --data.raw["curved-rail-a"]["curved-rail-a-minimal"].collision_mask = railmcollision
  --data.raw["half-diagonal-rail"]["half-diagonal-rail-minimal"].collision_mask = railmcollision
  --data.raw["straight-rail"]["straight-rail-minimal"].collision_mask = railmcollision


  table.insert(data.raw["technology"]["minimalist-rails"].prerequisites, "moshine-tech-silicon-carbide")

end

--[[
--fix for AAI industries sand -> glass, makes silicon a normal craft then
for _, rec in pairs(data.raw.recipe) do
  if rec.name ~= "silicon" then
    if rec.category and rec.category == "smelting" then
      if rec.ingredients and rec.ingredients[1] and rec.ingredients[1].name == "sand" then
        data.raw["recipe"]["silicon"].category = "crafting"
      end
    end
  end
end
]]

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

-- disable ai-speed module from everything where it's not manually added
local moduled_building_types = { "beacon", "assembling-machine", "rocket-silo", "furnace", "lab", "mining-drill" }

for _, moduled_building_type in pairs(moduled_building_types) do
  for _,moduled_building in pairs(data.raw[moduled_building_type]) do
    if moduled_building then
      if not moduled_building.allowed_module_categories then
        moduled_building.allowed_module_categories = {}
        for _, module_cat in pairs(data.raw["module-category"]) do
          --log(moduled_building.name .. " - " .. module_cat.name)
          if not (module_cat.name == "ai-speed") then
            table.insert(moduled_building.allowed_module_categories, module_cat.name)
            --log(moduled_building.name .. " - " .. module_cat.name)
          end
        end
      end
    end
  end
end

