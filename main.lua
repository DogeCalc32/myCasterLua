--main.lua
function love.load()
    tileSize = 32
    map = {
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
        {1,2,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
        {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
    }

    love.graphics.setDefaultFilter("nearest", "nearest")
    playerSprite = love.graphics.newImage("assets/player.png")
    wallSprite = love.graphics.newImage("assets/wall.png")
    sprites = {wallSprite,playerSprite}

    player = {
        x = 2,
        y = 2,
        speed = .2,
        sprint = 1,
    }
end

function canCollide()
    -- put collision logic here
end

function love.update(dt)
    if love.keyboard.isDown("lshift") then -- sprint key
        if love.keyboard.isDown("w" or "up") then
            player.y = player.y - player.sprint * dt
        end
        if love.keyboard.isDown("a" or "left") then
            player.x = player.x - player.sprint * dt
        end

        if love.keyboard.isDown("s" or "down") then
            player.y = player.y + player.sprint * dt
        end
        if love.keyboard.isDown("d" or "right") then
            player.x = player.x + player.sprint * dt
        end
    else -- normal walk
        if love.keyboard.isDown("w" or "up") then
            player.y = player.y - player.speed * dt
        end
        if love.keyboard.isDown("a" or "left") then
            player.x = player.x - player.speed * dt
        end

        if love.keyboard.isDown("s" or "down") then
            player.y = player.y + player.speed * dt
        end
        if love.keyboard.isDown("d" or "right") then
            player.x = player.x + player.speed * dt
        end
    end
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
            end
        end
    end
end