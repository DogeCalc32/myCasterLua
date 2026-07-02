function love.load()
    tileSize = 32
    map = {
        {1,1,1,1,1,1},
        {1,0,0,1,1,1},
        {1,0,0,1,1,1},
        {1,0,0,0,0,1},
        {1,2,0,0,0,1},
        {1,1,1,1,1,1},
    }

    love.graphics.setDefaultFilter("nearest", "nearest")
    steveSprite = love.graphics.newImage("assets/steve.png")
    wallSprite = love.graphics.newImage("assets/wall.png")
    sprites = {wallSprite,steveSprite}

    player = {
        x = 2,
        y = 2,
        speed = 1,
        fov = math.rad(60),
    }
end

function love.update(dt)
end

function love.draw()
    for rowIndex, row in ipairs(map) do
        for columnIndex, column in ipairs(row) do
            if column > 0 then
                local sprite = sprites[column]

                local x = columnIndex * tileSize
                local y = rowIndex * tileSize
                local imageWidth, imageHeight = sprite:getDimensions()
                local scaleX =  tileSize / imageWidth
                local scaleY =  tileSize / imageHeight

                love.graphics.draw(sprite,x,y,nil,scaleX,scaleY)
                -- love.graphics.print("testing",10,10)
                if column == 2 then
                    print("testing ".. scaleX)
                end
            end
        end
    end
end