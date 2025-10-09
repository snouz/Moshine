data:extend({
  {
    type = "item-subgroup",
    name = "data-fluid",
    group = "fluids",
    order = "b[data]"
  },
  {
    type = "fluid",
    name = "raw-data",
    subgroup = "data-fluid",
    order = "a[raw-data]",
    default_temperature = 15,
    base_color = {26, 117, 64},
    flow_color = {26, 117, 64},
    icon = "__Moshine__/graphics/icons/raw-data.png",
    auto_barrel = false,
  },
})