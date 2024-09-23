upgrade = {}

function upgrade:load()
    upgrade.count = 0
    upgrade.price = 100
    upgrade.countMore = 1
    upgrade.x = 800
    upgrade.y = 60
    upgrade.scaleX = 2
    upgrade.scaleY = 2
    upgrade.width = sprite.upgrade1:getWidth()*upgrade.scaleX
    upgrade.height = sprite.upgrade1:getHeight()*upgrade.scaleY 
end

function upgrade:update(dt)
    upgrade.text = tostring(upgrade.count)
    upgrade.priceText = tostring(upgrade.price) .. " caca requis"
end
function upgrade:buy()
    if caca.count >= 100 then
        upgrade.count = upgrade.count + 1
        caca.count = caca.count - 100
        caca.countPerSecond = caca.countPerSecond + 1 
    end
end
function upgrade:draw()
    love.graphics.draw(sprite.upgrade1, upgrade.x, upgrade.y, nil, upgrade.scaleX, upgrade.scaleY)
    love.graphics.print(upgrade.text, upgrade.x, upgrade.y+65, nil)
    love.graphics.print(upgrade.priceText, upgrade.x - 55, upgrade.y+100, nil, 0.5, 0.5)
end