-- Enables light on cursor when in remote view
script.on_event(defines.events.on_player_controller_changed, function (event)
    local player = game.get_player(event.player_index) ---@cast player -?
    if player.controller_type == defines.controllers.remote then
        if settings.global["ds-remote-view-light"].value then
            player.enable_flashlight()
        else
            player.disable_flashlight()
        end
    end
end)