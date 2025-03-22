local HiddenRailPole = table.deepcopy(data.raw["electric-pole"]["small-electric-pole"])
HiddenRailPole.name = "hidden-rail-pole"
HiddenRailPole.hidden_in_factoriopedia = true
HiddenRailPole.selection_box = {{-0.3, -0.3}, {0.3 ,0.3}}
HiddenRailPole.collision_box = nil
HiddenRailPole.collision_mask = {layers={}, not_colliding_with_itself=true}
HiddenRailPole.icon = "__core__/graphics/empty.png"
HiddenRailPole.icon_size = 1
HiddenRailPole.minable = nil
HiddenRailPole.draw_copper_wires = false
HiddenRailPole.draw_circuit_wires = true
HiddenRailPole.supply_area_distance = 0
HiddenRailPole.maximum_wire_distance = 7
HiddenRailPole.pictures.layers = {
  {
    filename = "__core__/graphics/empty.png",
    priority = "high",
    width = 1,
    height = 1,
    direction_count = 1,
  },
}
HiddenRailPole.water_reflection = nil
HiddenRailPole.integration_patch_render_layer = "decals"
HiddenRailPole.integration_patch =
{
  filename = "__Moshine__/graphics/entity/hidden-rail-pole/hidden-rail-pole.png",
  priority="high",
  width = 32,
  height = 32,
  shift = util.by_pixel(0, 0),
  scale = 0.5
}
HiddenRailPole.connection_points =
{
  {
    shadow =
    {
      copper = nil,
      green = util.by_pixel(2, 0),
      red = util.by_pixel(-2, 0)
    },
    wire =
    {
      copper = {0, 0},
      green = util.by_pixel(2, 0),
      red = util.by_pixel(-2, 0)
    }
  },
}
HiddenRailPole.flags = {"not-on-map", "placeable-off-grid", "not-blueprintable", "not-deconstructable"}
data:extend({HiddenRailPole})