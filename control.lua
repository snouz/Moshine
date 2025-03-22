function israil(entity)
    if entity and (entity.name == "straight-rail-minimal" or entity.name == "curved-rail-a-minimal" or entity.name == "curved-rail-b-minimal" or entity.name == "half-diagonal-rail-minimal") then
        return true
    else
        return false
    end
end

function place_hidden_pole(rail)
    local surface = rail.surface
    local position = rail.position
    local pole_name = "hidden-rail-pole"
    
    local existing_poles = surface.find_entities_filtered{position = position, name = pole_name}
    if #existing_poles == 0 then
        surface.create_entity{name = pole_name, position = position, force = rail.force}
    end
end

function remove_hidden_pole(rail)
    local surface = rail.surface
    local position = rail.position
    local pole_name = "hidden-rail-pole"
    
    -- Find and remove the hidden pole
    local poles = surface.find_entities_filtered{position = position, name = pole_name}
    for _, pole in pairs(poles) do
        pole.destroy()
    end
end

-- Register event for when a rail is built
script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, function(event)
    local entity = event.created_entity or event.entity
    if israil(entity) then
        place_hidden_pole(entity)
    end
end)

-- Register event for when a rail is removed
script.on_event({defines.events.on_player_mined_entity, defines.events.on_robot_mined_entity, defines.events.on_entity_died, defines.events.script_raised_destroy}, function(event)
    local entity = event.entity
    if israil(entity) then
        remove_hidden_pole(entity)
    end
end)
