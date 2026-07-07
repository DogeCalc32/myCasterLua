-- src/player/draw.lua 
playerSRC = {}

function playerSRC.draw()
    local px = player.x * tileSize
    local py = player.y * tileSize
    local ps = tileSize /16

    player.anim:draw(playerSprite, px,py, nil, ps,ps)-- do tileSize / 16 for size args if you forget
    love.graphics.setColor(.2,.2,.2)
    love.graphics.rectangle("fill", 10,10, batterySizeX,batterySizeY)
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", 16,16, player.stamina * 6, batterySizeY - 11)
    love.graphics.print("FPS: ".. love.timer.getFPS(),5, h/2 - h/4)
end

return playerSRC.draw