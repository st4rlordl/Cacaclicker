sprite = {}

function sprite:load()
    sprite.upgrade = {}
    sprite.cacaBackground = {}
    sprite.caca = love.graphics.newImage("sprites/caca_sprite.png")
    sprite.toilette = love.graphics.newImage("sprites/toilette_sprite.png")
    sprite.factory = love.graphics.newImage("sprites/factory_sprite.png")
    sprite.panneau = love.graphics.newImage("sprites/Interface_texte.png")
    sprite.Upgrades = love.graphics.newImage("sprites/Interface_upgrade.png")
    sprite.Background = love.graphics.newImage("sprites/background.png")
    sprite.upgradeDim = love.graphics.newImage("sprites/Upgrade_1.png")
    sprite.menu = love.graphics.newImage("sprites/Interface_button.png")
    sprite.panneauUpgrade = love.graphics.newImage("sprites/panneau.png")
    for i = 1, 3 do
        sprite.upgrade[i] = love.graphics.newImage("sprites/Upgrade_" .. tostring(i) .. ".png")
    end
    for i = 1, 250 do 
        sprite.cacaBackground[i] = love.graphics.newImage("sprites/caca_sprite.png")
    end
end