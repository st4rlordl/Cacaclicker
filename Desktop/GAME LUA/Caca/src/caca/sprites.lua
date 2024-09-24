sprite = {}

function sprite:load()
    sprite.upgrade = {}
    sprite.caca = love.graphics.newImage("sprites/caca_sprite.png")
    sprite.Interfaces = love.graphics.newImage("sprites/Interface_texte.png")
    sprite.Upgrades = love.graphics.newImage("sprites/Interface_upgrade.png")
    sprite.Background = love.graphics.newImage("sprites/background.png")
    sprite.upgradeDim = love.graphics.newImage("sprites/Upgrade_1.png")
    for i = 1, 3 do
        sprite.upgrade[i] = love.graphics.newImage("sprites/Upgrade_" .. tostring(i) .. ".png")
    end
    
end