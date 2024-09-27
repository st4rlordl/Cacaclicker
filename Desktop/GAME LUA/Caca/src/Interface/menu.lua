menu = {}
function menu:load()
    menu.scaleX = 2
    menu.scaleY = 2
    menu.width = sprite.menu:getWidth()*menu.scaleX
    menu.height = sprite.menu:getHeight()*menu.scaleY
    menu.x = width/2 - menu.width + 100 
    menu.y = {}
    menu.y[0] = 0
    menu.textButton = {}
    menu.textButton[1] = "JOUER"
    menu.textButton[2] = "OPTION"
    menu.textButton[3] = "QUITTER"
    menu:button()
end
function menu:button()
    for i = 1, 3 do
        menu.y[i] = menu.y[i - 1] + 150
    end
end

function menu:click(i)
    if i == 1 then
        currentState = "factory"
    elseif i == 2 then

    elseif i == 3 then
        love.window.close()
    end
end

function menu:draw()
    interface:drawBackground()

    for i = 1, 3 do
        love.graphics.draw(sprite.menu, menu.x, menu.y[i], nil, menu.scaleX, menu.scaleY)
        love.graphics.print(menu.textButton[i], menu.x + 40, menu.y[i] + 40)
    end
end