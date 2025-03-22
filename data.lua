
--require "prototypes.terrain"
--require "prototypes.decoratives"
--require "prototypes.resources"
--require "prototypes.planet"
--require "prototypes.music"
require ("prototypes.technology")
require ("prototypes.items")
--require "prototypes.fluid"
require ("prototypes.recipes")
require ("prototypes.entities")

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

  data.raw["curved-rail-b"]["curved-rail-b-minimal"].max_health = 3000
  data.raw["curved-rail-a"]["curved-rail-a-minimal"].max_health = 3000
  data.raw["half-diagonal-rail"]["half-diagonal-rail-minimal"].max_health = 2000
  data.raw["straight-rail"]["straight-rail-minimal"].max_health = 1000

  data.raw["curved-rail-b"]["curved-rail-b-minimal"].fast_replaceable_group = "curved-rail-b"
  data.raw["curved-rail-a"]["curved-rail-a-minimal"].fast_replaceable_group = "curved-rail-a"
  data.raw["half-diagonal-rail"]["half-diagonal-rail-minimal"].fast_replaceable_group = "half-diagonal-rail"
  data.raw["straight-rail"]["straight-rail-minimal"].fast_replaceable_group = "straight-rail"

  data.raw["curved-rail-b"]["curved-rail-b"].fast_replaceable_group = "curved-rail-b"
  data.raw["curved-rail-a"]["curved-rail-a"].fast_replaceable_group = "curved-rail-a"
  data.raw["half-diagonal-rail"]["half-diagonal-rail"].fast_replaceable_group = "half-diagonal-rail"
  data.raw["straight-rail"]["straight-rail"].fast_replaceable_group = "straight-rail"

  data.raw["curved-rail-b"]["curved-rail-b"].next_upgrade = "curved-rail-b-minimal"
  data.raw["curved-rail-a"]["curved-rail-a"].next_upgrade = "curved-rail-a-minimal"
  data.raw["half-diagonal-rail"]["half-diagonal-rail"].next_upgrade = "half-diagonal-rail-minimal"
  data.raw["straight-rail"]["straight-rail"].next_upgrade = "straight-rail-minimal"

  if data.raw["technology"]["minimalist-rails"] then
    table.insert(data.raw["technology"]["minimalist-rails"].prerequisites, "moshine-tech-silicon-carbide")
    table.insert(data.raw["technology"]["minimalist-rails"].unit.ingredients, {"utility-science-pack", 1})
    table.insert(data.raw["technology"]["minimalist-rails"].unit.ingredients, {"space-science-pack", 1})
  end
end
