interface = {}
factory = {}
panneau = {}
cacaBackground = {}

function interface:load()

    interface.textShop = "BOUTIQUE"
    factory:load()
    cacaBackground:load()
    panneau:load()
    interface:upgradeLoad()
end

function factory:load()
    factory.ScaleX = 4
    factory.ScaleY = 4
    factory.width = sprite.factory:getWidth()*factory.ScaleX
    factory.height = sprite.factory:getHeight()*factory.ScaleY 
    factory.x = 0
    factory.y = height - factory.height
    factory.isClick = false
end
function panneau:load()
    panneau.scaleX = 3.5
    panneau.scaleY = 3.5
    panneau.width = sprite.panneau:getWidth()*panneau.scaleX
    panneau.height = sprite.panneau:getHeight()*panneau.scaleY 
    panneau.x = width/2 - panneau.width
    panneau.y = 0
end

function cacaBackground:load()
    cacaBackground.width = sprite.cacaBackground[1]:getWidth()
    cacaBackground.height = sprite.cacaBackground[1]:getHeight()
    cacaBackground.x = {}
    cacaBackground.y = {}
    cacaBackground.nb = 250
    for i = 1, cacaBackground.nb do 
        cacaBackground.x[i] = math.random(cacaBackground.width, width - cacaBackground.width)
        cacaBackground.y[i] = math.random(cacaBackground.height, height - cacaBackground.height)
    end
end

function interface:upgradeLoad()
    interface.upgradeX = width-300
    interface.upgradeY = 0
    upgrade.y[1] = 160
    for i = 2, upgrade.nb do
        upgrade.y[i] = upgrade.y[i-1] + 105
    end
end


function interface:drawBackground()
    love.graphics.draw(sprite.Background, 0, 0, nil, 1, 1)
end

function interface:draw()
    interface:drawBackground()
    love.graphics.draw(sprite.panneau, panneau.x, panneau.y, nil, panneau.scaleX, panneau.scaleY)
    love.graphics.draw(sprite.Upgrades, interface.upgradeX, interface.upgradeY, nil, 1.5, 1.5)
    
end

-- DRAW INTERFACE TOILET
function interface:toilette() 
    interface:drawBackground()
    toilette:Jeudraw()
    love.graphics.draw(sprite.panneauUpgrade, 0, 550, nil, 1.5, 1.5)
    love.graphics.print("BALANCE LE CACA DANS \nLA CUVETTE", 10, 560, nil)
    love.graphics.draw(sprite.factory, factory.x, factory.y, nil, factory.ScaleX, factory.ScaleY)
    love.graphics.draw(sprite.cacaMiniJeu, width / 2, height - 100, nil, 2, 2)
end

function interface:cacaBackground()
    for i = 1, cacaBackground.nb do 
        love.graphics.draw(sprite.cacaBackground[i], cacaBackground.x[i],cacaBackground.y[i], nil, 1, 1)
    end
end

function interface:update(dt)
    for i = 1, cacaBackground.nb do 
        cacaBackground.y[i] = cacaBackground.y[i] + 150 * dt
        if cacaBackground.y[i] >= width - cacaBackground.width then
            cacaBackground.y[i] = 0
            cacaBackground.x[i] = math.random(cacaBackground.width, width - cacaBackground.width)
        end
    end
end