upgrade = {}

function upgrade:load()
    upgrade.count = {}
    upgrade.prices = {}
    upgrade.countMore = {}
    upgrade.x = {}
    upgrade.y = {}
    upgrade.scaleX = {}
    upgrade.scaleY = {}
    upgrade.width = {}
    upgrade.height = {}
    upgrade.nb = 3
    upgrade.textCount = {}
    upgrade.pricesText = {}
    upgrade:loadUpgrade()
    upgrade:boucle()
end

function upgrade:loadUpgrade()
    upgrade.count[1] = 0
    upgrade.prices[1] = 100
    upgrade.countMore[1] = 1
    upgrade.x[1] = 840
    upgrade.y[1] = 120
    upgrade.scaleX[1] = 0.7
    upgrade.scaleY[1] = 0.7
    upgrade.width[1] = sprite.upgrade1:getWidth()*upgrade.scaleX[1]
    upgrade.height[1] = sprite.upgrade1:getHeight()*upgrade.scaleY[1]
    upgrade.textCount[1] = tostring(upgrade.count[1])
    upgrade.pricesText[1] = tostring(upgrade.prices[1]) .. " caca requis"
end

function upgrade:boucle()
    for i = 2, upgrade.nb do
    upgrade.count[i] = 0
    upgrade.prices[i] = math.floor(upgrade.prices[i - 1]*10)
    upgrade.countMore[i] = upgrade.countMore[i - 1] + 10
    upgrade.x[i] = 840
    upgrade.y[i] = upgrade.y[i - 1] + 150
    upgrade.scaleX[i] = 0.7
    upgrade.scaleY[i] = 0.7
    upgrade.width[i] = sprite.upgrade1:getWidth() * upgrade.scaleX[i]
    upgrade.height[i] = sprite.upgrade1:getHeight() * upgrade.scaleY[i]
    end
end

function upgrade:update(dt)
    local mouseX, mouseY = love.mouse.getPosition()
    local requireMouse = false

    print("X" .. tostring(mouseX))
    print("Y" .. tostring(mouseY))
    

    for i = 1, upgrade.nb do
        if mouseX >= upgrade.x[i] and mouseX <= upgrade.x[i] + upgrade.width[i] and
        mouseY >= upgrade.y[i] and mouseY <= upgrade.y[i] + upgrade.height[i] then
            requireMouse = true
            upgrade:mouseOver(i, dt)
        end
    end

    if not requireMouse then
        for i = 1, upgrade.nb do
            if upgrade.scaleX[i] >= 0.7 then
                upgrade.scaleX[i] = math.max(upgrade.scaleX[i] - 10 * dt, 0.7)  
                upgrade.scaleY[i] = math.max(upgrade.scaleY[i] - 10 * dt, 0.7)  
            end
        end
    end

    for i = 1, upgrade.nb do
        upgrade.textCount[i] = tostring(upgrade.count[i])
        upgrade.pricesText[i] = tostring(upgrade.prices[i]) .. " caca requis"
    end
end

function upgrade:mouseOver(i, dt)
    if upgrade.scaleX[i] <= 1.2 then  
        upgrade.scaleX[i] = math.min(upgrade.scaleX[i] + 10 * dt, 0.9)  
        upgrade.scaleY[i] = math.min(upgrade.scaleY[i] + 10 * dt, 0.9)  
    end
end

function upgrade:buy(i)
    if caca.count >= upgrade.prices[i] then
        upgrade.count[i] = upgrade.count[i] + upgrade.countMore[i]
        caca.count = caca.count - upgrade.prices[i]
        caca.countPerSecond = caca.countPerSecond + upgrade.countMore[i]
        upgrade.prices[i] = math.floor(upgrade.prices[i] * 1.05)
    end
end
function upgrade:draw()
    for i = 1, upgrade.nb do
        love.graphics.draw(sprite.upgrade1, upgrade.x[i], upgrade.y[i], nil, upgrade.scaleX[i], upgrade.scaleY[i])
        love.graphics.print(upgrade.textCount[i], upgrade.x[i] - upgrade.width[i] * 2, upgrade.y[i] + upgrade.height[i] / 2, nil)
        love.graphics.print(upgrade.pricesText[i], upgrade.x[i] - 55, upgrade.y[i]+100, nil, 0.5, 0.5)
    end
end