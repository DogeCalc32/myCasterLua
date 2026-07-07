-- drawStuff.lua

drawStuff = {}

function drawStuff.drawMap()
    for rowIndex, row in ipairs(map.layer1) do
        for columnIndex, column in ipairs(row) do
            if column > 0 then
                love.graphics.setColor(1,1,1)
                local sprite = sprites[column]

                local x = columnIndex * tileSize
                local y = rowIndex * tileSize
                local imageWidth, imageHeight = sprite:getDimensions()
                local scaleX =  tileSize / imageWidth
                local scaleY =  tileSize / imageHeight

                love.graphics.draw(sprite,x,y,nil,scaleX,scaleY)
            end
        end
    end
    for rowIndex, row in ipairs(map.layer2) do
        for columnIndex, column in ipairs(row) do
            if column > 0 then
                love.graphics.setColor(1,1,1)
                local sprite = sprites[column]

                local x = columnIndex * tileSize
                local y = rowIndex * tileSize
                local imageWidth, imageHeight = sprite:getDimensions()
                local scaleX =  tileSize / imageWidth
                local scaleY =  tileSize / imageHeight

                love.graphics.draw(sprite,x,y,nil,scaleX,scaleY)
            end
        end
    end
end

function drawStuff.drawPlayer()
    local px = player.x * tileSize
    local py = player.y * tileSize
    local psx, psy = playerSprite:getDimensions() / 30

    player.anim:draw(playerSprite, px,py, nil, psx,psy)-- do tileSize / 16 for size args if you forget
    love.graphics.setColor(.2,.2,.2)
    love.graphics.rectangle("fill", 10,10, batterySizeX,batterySizeY)
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", 16,16, player.stamina * 6, batterySizeY - 11)
    love.graphics.print("FPS: ".. love.timer.getFPS(),5, h/2)
end

return drawStuff