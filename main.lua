--main.lua

function love.load()
    anim8 = require('libraries/anim8')
    tileSize = 32
    batterySizeX = 80
    batterySizeY = 40
    map = { -- 1 = ground, 2 = wall 
        {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,2},
        {2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2},
        {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
    }

    love.graphics.setDefaultFilter("nearest", "nearest")

    playerSprite = love.graphics.newImage("assets/player.png")
    wallSprite = love.graphics.newImage("assets/wall.png")
    groundSprite = love.graphics.newImage("assets/ground.png")
    sprites = {groundSprite,wallSprite,playerSprite}

    player = {
        x = 2,
        y = 2,
        speed = 2.8,
        sprint = 5,
        stamina = 10,
        grid = anim8.newGrid( 16,16, 64,64),
        animations = {},
    }
    player.animations.down = anim8.newAnimation( player.grid('1-3', 1), .1 )
    player.animations.right = anim8.newAnimation( player.grid('1-3', 2), .1 )
    player.animations.up = anim8.newAnimation( player.grid('1-3', 3), .1 )
    player.animations.left = anim8.newAnimation( player.grid('1-3', 4), .1 )

    player.anim = player.animations.down
end

function love.update(dt)
    local isMoving = false
    if not love.keyboard.isDown("w") or not love.keyboard.isDown("a") or not love.keyboard.isDown("s") or not love.keyboard.isDown("d")then
        player.stamina = player.stamina + 1.5 * dt
    end
    if love.keyboard.isDown("lshift")  and player.stamina > 0 then -- sprint key
        player.stamina = player.stamina - 3 * dt

        if love.keyboard.isDown("w") then
            player.y = player.y - player.sprint * dt
            player.anim = player.animations.up
            isMoving = true
        end

        if love.keyboard.isDown("a") then
            player.x = player.x - player.sprint * dt
            player.anim = player.animations.left
            isMoving = true
        end

        if love.keyboard.isDown("s") then
            player.y = player.y + player.sprint * dt
            player.anim = player.animations.down
            isMoving = true
        end

        if love.keyboard.isDown("d") then
            player.x = player.x + player.sprint * dt
            player.anim = player.animations.right
            isMoving = true
        end
    else -- normal walk
        if love.keyboard.isDown("w") then
            player.y = player.y - player.speed * dt
            player.anim = player.animations.up
            isMoving = true
        end

        if love.keyboard.isDown("a") then
            player.x = player.x - player.speed * dt
            player.anim = player.animations.left
            isMoving = true
        end

        if love.keyboard.isDown("s") then
            player.y = player.y + player.speed * dt
            player.anim = player.animations.down
            isMoving = true
        end

        if love.keyboard.isDown("d") then
            player.x = player.x + player.speed * dt
            player.anim = player.animations.right
            isMoving = true
        end
    end
    if player.stamina > 11 then
        player.stamina = 11
    end
    if isMoving == false then
        player.anim:gotoFrame(1)
    end
    player.anim:update(dt)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.setColor(1,1,1)
    for rowIndex, row in ipairs(map) do
        for columnIndex, column in ipairs(row) do
            if column > 0 then
                love.graphics.setColor(1,1,1)
                local sprite = sprites[column]

                local x = columnIndex * tileSize
                local y = rowIndex * tileSize
                local imageWidth, imageHeight = sprite:getDimensions()
                local scaleX =  tileSize / imageWidth
                local scaleY =  tileSize / imageHeight

                local px = player.x * tileSize
                local py = player.y * tileSize

                love.graphics.draw(sprite,x,y,nil,scaleX,scaleY)

                player.anim:draw(playerSprite, px,py, nil, tileSize / 12,tileSize / 12)
            end
        end
    end
    love.graphics.setColor(.2,.2,.2)
    love.graphics.rectangle("fill", 10,10, batterySizeX,batterySizeY)
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle("fill", 16,16, player.stamina * 6, batterySizeY - 11)
    print(player.stamina)
end