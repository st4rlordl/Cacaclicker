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
    if x >= upgrade.x and x <= upgrade.x + upgrade.width*upgrade.scaleX and
    y >= upgrade.y and y <= upgrade.y + upgrade.height*upgrade.scaleY then
       upgrade:buy()
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
