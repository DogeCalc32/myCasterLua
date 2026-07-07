--src/map/draw.lua
mapSRC = {}

function mapSRC.draw()
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

return mapSRC.draw