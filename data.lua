require ("prototypes.technology")
require ("prototypes.items")
require ("prototypes.recipes")
--require ("prototypes.entities")

require ("sound-util")
require ("prototypes.entity.opticalfiber")
require ("prototypes.entity.supercomputer")
require ("prototypes.entity.dataprocessor")
require ("prototypes.entity.computerfarm")
require ("prototypes.entity.webbedprocessor")
require ("prototypes.entity.dataextractor")
require ("prototypes.entity.aitrainer")
--require ("prototypes.entity.rails")

require ("prototypes.achievements")
require ("prototypes.menu-simulations")

require ("prototypes.compatibility")


if mods["quality-seeds"] then
  if quality_seeds and quality_seeds.ignore_plants then
    table.insert(quality_seeds.ignore_plants, "processing-grid-process-equation")
  end
end