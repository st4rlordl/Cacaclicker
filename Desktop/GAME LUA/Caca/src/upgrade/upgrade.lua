upgrade = {}
-- IDEE PRESTIGE UPGRADE -- 

function upgrade:load()
    upgrade.count = {}
    upgrade.nbCount = {}
    upgrade.prices = {}
    upgrade.countMore = {}
    upgrade.x = {}
    upgrade.y = {}
    upgrade.scaleX = {}
    upgrade.scaleY = {}
    upgrade.nb = 4
    upgrade.textCount = {}
    upgrade.pricesText = {}
    upgrade:loadUpgrade()
    upgrade:boucle()
end

function upgrade:loadUpgrade()
    upgrade.count[1] = 0
    upgrade.nbCount[1] = 0
    upgrade.prices[1] = 100
    upgrade.countMore[1] = 0.1
    upgrade.countMore[2] = 0.5
    upgrade.countMore[3] = 1
    upgrade.countMore[4] = 5
    upgrade.x[1] = width - 80
    upgrade.y[1] = 160
    upgrade.scaleX[1] = 0.5
    upgrade.scaleY[1] = 0.5
    upgrade.width = sprite.upgradeDim:getWidth() * upgrade.scaleX[1]
    upgrade.height = sprite.upgradeDim:getHeight() * upgrade.scaleY[1]
    upgrade.textCount[1] = tostring(upgrade.nbCount[1])
    upgrade.pricesText[1] = tostring(upgrade.prices[1]) .. " caca requis"
end

function upgrade:boucle()
    for i = 2, upgrade.nb do
    upgrade.count[i] = 0
    upgrade.nbCount[i] = 0
    upgrade.prices[i] = math.floor(upgrade.prices[i - 1]*3)
    upgrade.countMore[i] = upgrade.countMore[i - 1]*2
    upgrade.x[i] = width - 80
    upgrade.y[i] = upgrade.y[i - 1] + 105
    upgrade.textCount[i] = tostring(upgrade.nbCount[i])
    upgrade.scaleX[i] = 0.5
    upgrade.scaleY[i] = 0.5
    end
end

function upgrade:update(dt)
    local mouseX, mouseY = love.mouse.getPosition()
    local requireMouse = false

    for i = 1, upgrade.nb do
        if mouseX >= upgrade.x[i] and mouseX <= upgrade.x[i] + upgrade.width and
        mouseY >= upgrade.y[i] and mouseY <= upgrade.y[i] + upgrade.height then
            requireMouse = true
            upgrade:mouseOver(i, dt)
        end
    end

    if not requireMouse then
        for i = 1, upgrade.nb do
            if upgrade.scaleX[i] >= 0.5 then
                upgrade.scaleX[i] = math.max(upgrade.scaleX[i] - 10 * dt, 0.5)  
                upgrade.scaleY[i] = math.max(upgrade.scaleY[i] - 10 * dt, 0.5)  
            end
        end
    end

    for i = 1, upgrade.nb do
        upgrade.textCount[i] = tostring(upgrade.nbCount[i])
        upgrade.pricesText[i] = tostring(upgrade.prices[i]) .. " caca requis"
    end
end


function upgrade:mouseOver(i, dt)
    if currentState == "factory" then
        if upgrade.scaleX[i] <= 0.8 then  
            upgrade.scaleX[i] = math.min(upgrade.scaleX[i] + 10 * dt, 0.6)  
            upgrade.scaleY[i] = math.min(upgrade.scaleY[i] + 10 * dt, 0.6)  
        end
    end
end

function upgrade:buy(i)
    if caca.count >= upgrade.prices[i] then
        upgrade.count[i] = upgrade.count[i] + upgrade.countMore[i]
        caca.count = caca.count - upgrade.prices[i]
        caca.countPerSecond = caca.countPerSecond + upgrade.countMore[i]
        upgrade.nbCount[i] = upgrade.nbCount[i] + 1  
        upgrade.prices[i] = math.floor(upgrade.prices[i] * 1.2)
    end
end
function upgrade:draw()
    for i = 1, 3 do
        
        love.graphics.draw(sprite.upgrade[i], upgrade.x[i], upgrade.y[i], nil, upgrade.scaleX[i], upgrade.scaleY[i])
        love.graphics.print(upgrade.textCount[i], upgrade.x[i] - upgrade.width*2, upgrade.y[i] + 15, nil)

        love.graphics.print(upgrade.pricesText[i], upgrade.x[i] - upgrade.width*3, upgrade.y[i] + upgrade.height, nil, 0.5, 0.5)
    end
    love.graphics.draw(sprite.panneauUpgrade, width-300, 5, nil, 1.4, 1.5)
    love.graphics.print(interface.textShop, width - 200, 50)
end