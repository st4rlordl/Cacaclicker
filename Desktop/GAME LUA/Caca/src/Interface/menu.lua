menu = {}
function menu:load()
    menu.scaleX = {}
    menu.scaleY = {}
    menu.textButton = {}
    menu.textButton[1] = "LANCER"
    menu.textButton[2] = "OPTIONS"
    menu.textButton[3] = "QUITTER"
    menu.y = {}
    menu.y[0] = 0
    menu:button()
    menu.x = width/2 - menu.width + 100 
end
function menu:button()
    for i = 1, 3 do
        menu.y[i] = menu.y[i - 1] + 150
        menu.scaleX[i] = 2
        menu.scaleY[i] = 2
        menu.width = sprite.menu:getWidth()*menu.scaleX[i]
        menu.height = sprite.menu:getHeight()*menu.scaleY[i]
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

function menu:update(dt)
    local mouseX, mouseY = love.mouse.getPosition()
    local requireMouse = false

    for i = 1, 3 do
        if mouseX >= menu.x and mouseX <=  menu.x + menu.width and
        mouseY >= menu.y[i] and mouseY <= menu.y[i] + menu.height then
            requireMouse = true
            menu:mouseOver(i, dt)
        end
    end
        if not requireMouse then
            for i = 1, 3 do
                if menu.scaleX[i] >= 2 then
                    menu.scaleX[i] = math.max(menu.scaleX[i] - 10 * dt, 2)  
                    menu.scaleY[i] = math.max(menu.scaleX[i] - 10 * dt, 2)  
                end
            end
        end

end


function menu:mouseOver(i, dt)
    if currentState == "menu" then
        if menu.scaleX[i] <= 2.5 then  
            menu.scaleX[i] = math.min(menu.scaleX[i] + 10 * dt, 2.3)  
            menu.scaleY[i] = math.min(menu.scaleY[i] + 10 * dt, 2.3)  
        end
    end
end


function menu:draw()
    for i = 1, 3 do
        love.graphics.draw(sprite.menu, menu.x, menu.y[i], nil, menu.scaleX[i], menu.scaleY[i])
        love.graphics.print(menu.textButton[i], menu.x + 40, menu.y[i] + 40, nil,  menu.scaleX[i]/2, menu.scaleY[i]/2)
    end
end