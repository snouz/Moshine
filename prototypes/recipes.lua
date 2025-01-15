data:extend({

{
  type = "recipe",
  name = "supercomputer",
  energy_required = 10,
  ingredients =
  {
    {type = "item", name = "lab", amount = 1}
  },
  results = {{type="item", name="supercomputer", amount=1}},
  --enabled = false
},
{
  type = "recipe",
  name = "data-processor",
  energy_required = 10,
  ingredients =
  {
    {type = "item", name = "lab", amount = 1}
  },
  results = {{type="item", name="data-processor", amount=1}},
  --enabled = false
},
{
  type = "recipe",
  name = "optical-fiber",
  ingredients = {{type = "item", name = "iron-plate", amount = 1}},
  results = {{type="item", name="optical-fiber", amount=1}},
  --enabled = false
},
})