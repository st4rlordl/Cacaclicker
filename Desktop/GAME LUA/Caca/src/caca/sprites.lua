sprite = {}
sprite.upgrade = {}
sprite.cacaBackground = {}

function sprite:load()
    --  SPRITE BACKGROUND
    sprite.Background = love.graphics.newImage("sprites/background.png")
    
    -- SPRITE MENU
    sprite.menu = love.graphics.newImage("sprites/Interface_button.png")

    -- SPRITE FACTORY
    sprite.panneau = love.graphics.newImage("sprites/Interface_texte.png")
    sprite.caca = love.graphics.newImage("sprites/caca_sprite.png")
    sprite.toilette = love.graphics.newImage("sprites/toilette_sprite.png")


    --  SPRITE POUR MINI JEU TOILETTE
    sprite.factory = love.graphics.newImage("sprites/factory_sprite.png")
    sprite.toiletteMiniJeu = love.graphics.newImage("sprites/ToiletteMiniJeu.png")
    sprite.cacaMiniJeu = love.graphics.newImage("sprites/caca_sprite.png")

    --  SPRITE POUR LES UPGRADES
    for i = 1, 3 do
        sprite.upgrade[i] = love.graphics.newImage("sprites/Upgrade_" .. tostring(i) .. ".png")
    end
    
    sprite.Upgrades = love.graphics.newImage("sprites/Interface_upgrade.png")
    sprite.panneauUpgrade = love.graphics.newImage("sprites/panneau.png")
    sprite.upgradeDim = love.graphics.newImage("sprites/Upgrade_1.png")

    --  SPRITE POUR BACKGROUND 
    for i = 1, 250 do 
        sprite.cacaBackground[i] = love.graphics.newImage("sprites/caca_sprite.png")
    end
end