-- src/player/update.lua

playerSRC = {}

function playerSRC.update(dt)
    local isMoving = false
    if not love.keyboard.isDown("w") or not love.keyboard.isDown("a") or not love.keyboard.isDown("s") or not love.keyboard.isDown("d")then
        player.stamina = player.stamina + 1.5 * dt
    end
    if love.keyboard.isDown("lshift")  and player.stamina > 0 then -- sprint key

        if love.keyboard.isDown("w") then
            player.y = player.y - player.sprint * dt
            player.anim = player.animations.up
            isMoving = true
            player.stamina = player.stamina - 3 * dt
        end

        if love.keyboard.isDown("a") then
            player.x = player.x - player.sprint * dt
            player.anim = player.animations.left
            isMoving = true
            player.stamina = player.stamina - 3 * dt
        end

        if love.keyboard.isDown("s") then
            player.y = player.y + player.sprint * dt
            player.anim = player.animations.down
            isMoving = true
            player.stamina = player.stamina - 3 * dt
        end

        if love.keyboard.isDown("d") then
            player.x = player.x + player.sprint * dt
            player.anim = player.animations.right
            isMoving = true
            player.stamina = player.stamina - 3 * dt
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
    player.anim:update(dt)
    if isMoving == false then
        player.anim:gotoFrame(1)
    end
end

return playerSRC.update