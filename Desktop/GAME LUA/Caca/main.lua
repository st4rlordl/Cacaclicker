-- ALT+L = RUN THE PROJECT 
_G.love = require("love")
math.randomseed(os.time())

function love.load()
    require("src/startup/gameStart")
    currentState = "menu"
    if currentState == "factory" then
        gameStart:load()
    elseif currentState == "toilette" then
    
    elseif currentState == "menu" then
        gameStart:load()
        
    end
end

function love.update(dt)
    if currentState == "factory" then
        menu.textButton[1] = "RETOUR"
        caca:update(dt)
        upgrade:update(dt)
    elseif currentState == "menu" then
        menu:update(dt)
        interface:update(dt)
        upgrade:update(dt)
        interface:upgradeLoad()
    elseif currentState == "toilette" then
        interface:upgradeLoad()
    end
end

function love.keypressed(key)
    if key == 'escape' and not (currentState == "menu")  then
        currentState = "menu"
    elseif key == 'escape' and currentState == "menu"  then
        currentState = "factory"
    end
end

function love.mousepressed(x, y, button)
   
    if currentState == "factory" then
        if x >= caca.x and x <= caca.x + caca.width and
        y >= caca.y and y <= caca.y + caca.height then
            caca.isClick = true
            caca.count = caca.count + caca.click
            caca.timerTextClick = true
            cacaClickDraw()           
            return
        end

        for i = 1, upgrade.nb do
            if x >= upgrade.x[i] and x <= upgrade.x[i] + upgrade.width and
            y >= upgrade.y[i] and y <= upgrade.y[i] + upgrade.height then
                upgrade:buy(i)
                return
            end
        end

        if x >= toilette.x and x <= toilette.x + toilette.width and
        y >= toilette.y and y <= toilette.y + toilette.height then
            currentState = "toilette"
            return
        end

    elseif currentState == "toilette" then
        if x >= factory.x and x <= factory.x + factory.width and
        y >= factory.y and y <= factory.y + factory.height then
            currentState = "factory"
            return
        end
    elseif currentState == "menu" then
        for i = 1, 3 do
            if x >= menu.x and x <= menu.x + menu.width and
            y >= menu.y[i] and y <= menu.y[i] + menu.height then
                menu:click(i)
                return
            end
        end
    end
 
end

function love.wheelmoved(x, y)
    if currentState == "factory" then
        if y > 0 and interface.upgradeY >= -600 then -- Mouse wheel moved up
            interface.upgradeY = interface.upgradeY - 25
            for i = 1, 3 do
            upgrade.y[i] = upgrade.y[i] - 25
            end
        elseif y < 0 and interface.upgradeY <= -50  then -- Mouse wheel moved down
            print(tostring(interface.upgradeY))
            interface.upgradeY = interface.upgradeY + 25
            for i = 1, 3 do
                upgrade.y[i] = upgrade.y[i] + 25
            end
        end

    end
end

function love.draw()
    if currentState == "toilette" then
        interface:toilette()
    elseif currentState == "factory" then
        gameStart:drawFactory()
    elseif currentState == "menu" then
        gameStart:drawMenu()
    end
end
