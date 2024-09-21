-- ALT+L = RUN THE PROJECT 
_G.love = require("love")

function love.load()
    
    require("src/startup/gameStart")
    gameStart()
    caca:load()
end

function love.update(dt)
    caca:update(dt)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.4,0,0.4)
    caca:draw()

end
