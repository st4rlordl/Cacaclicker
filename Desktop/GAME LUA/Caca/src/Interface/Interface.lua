interface = {}

function interface:load()
    interface.textShop = "MARKET" 
end

function interface:draw()
    love.graphics.setFont(game_font)

    love.graphics.draw(sprite.Background, 0, 0, nil, 1, 1)
    love.graphics.draw(sprite.Interfaces, -50, 0, nil, 9, 3)
    love.graphics.draw(sprite.Upgrades, width-300, 0, nil, 1.5, 1.5)
    love.graphics.print(interface.textShop, width-245, 30)
    
end