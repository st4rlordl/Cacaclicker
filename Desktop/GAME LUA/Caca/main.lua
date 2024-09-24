-- ALT+L = RUN THE PROJECT 
_G.love = require("love")
math.randomseed(os.time())

function love.load()
    game_font = love.graphics.newFont("font/DePixelKlein.ttf", 30)
    require("src/startup/gameStart")
    gameStart()
    
    sprite:load()
    caca:load()
    upgrade:load()
    interface:load()

end

function love.update(dt)
    caca:update(dt)
    upgrade:update(dt)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button)
    for i = 1, upgrade.nb do
        if x >= upgrade.x[i] and x <= upgrade.x[i] + upgrade.width*upgrade.scaleX[i] and
        y >= upgrade.y[i] and y <= upgrade.y[i] + upgrade.height*upgrade.scaleY[i] then
            upgrade:buy(i)
        end
    end
    if x >= caca.x and x <= caca.x + caca.width and
    y >= caca.y and y <= caca.y + caca.height then
        caca.isClick = true
        caca.count = caca.count + caca.click
        cacaClickDraw()
    end
end


function love.draw()
    interface:draw()  
    caca:draw()
    upgrade:draw()
end
