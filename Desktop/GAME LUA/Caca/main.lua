-- ALT+L = RUN THE PROJECT 
_G.love = require("love")
math.randomseed(os.time())

function love.load()
    game_font = love.graphics.newFont("font/DePixelKlein.ttf", 30)
    require("src/startup/gameStart")

    currentState = "factory"
    if currentState == "factory" then
        gameStart:load()
    elseif currentState == "toilette" then

    end
end

function love.update(dt)
    if currentState == "factory" then
        caca:update(dt)
        upgrade:update(dt)
    elseif currentState == "toilette" then

    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button)
   
    if x >= caca.x and x <= caca.x + caca.width and
    y >= caca.y and y <= caca.y + caca.height and not toilette.isClick  then
        caca.isClick = true
        caca.count = caca.count + caca.click
        cacaClickDraw()
        return
    end
    for i = 1, upgrade.nb do
        if x >= upgrade.x[i] and x <= upgrade.x[i] + upgrade.width*upgrade.scaleX[i] and
        y >= upgrade.y[i] and y <= upgrade.y[i] + upgrade.height*upgrade.scaleY[i] and not toilette.isClick then
            upgrade:buy(i)
            return
        end
    end

    if currentState == "factory" then
        if x >= toilette.x and x <= toilette.x + toilette.width and
        y >= toilette.y and y <= toilette.y + toilette.height then
            toilette.isClick = true
            currentState = "toilette"
            return
        end
    elseif currentState == "toilette" then
        if x >= factory.x and x <= factory.x + factory.width and
        y >= factory.y and y <= factory.y + factory.height then
            currentState = "factory"
            toilette.isClick = false
            return
        end
    end
end


function love.draw()
    if currentState == "toilette" then
        interface:toilette()
    elseif currentState == "factory" then
        gameStart:drawGame()
    end
end
