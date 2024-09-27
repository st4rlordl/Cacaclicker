interface = {}
factory = {}
function interface:load()
    interface.textShop = "BOUTIQUE"
    factory:load()
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

function interface:drawBackground()
    love.graphics.draw(sprite.Background, 0, 0, nil, 1, 1)
end

function interface:draw()
    interface:drawBackground()
    love.graphics.draw(sprite.Interfaces, width/6, 0, nil, 3.5, 3.5)
    love.graphics.draw(sprite.Upgrades, width-300, 0, nil, 1.5, 1.5)
    love.graphics.print(interface.textShop, width-245, 30)
    
end

function interface:toilette()
    interface:drawBackground()
    love.graphics.draw(sprite.factory, factory.x, factory.y, nil, factory.ScaleX, factory.ScaleY)
end