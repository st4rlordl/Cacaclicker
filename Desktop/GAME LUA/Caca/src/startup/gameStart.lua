gameStart = {}
function gameStart:load()
    love.graphics.setDefaultFilter("nearest", "nearest") --better pixel scale

    require("src/startup/require")
    requireAll()

    sprite:load()
    caca:load()
    caca:loadCount()
    upgrade:load()
    interface:load()
    toilette:load()
    
end

function gameStart:drawGame()
    interface:draw()
    caca:draw()        
    upgrade:draw()
    toilette:draw()
end

function gameStart:drawToiletteGame()
    interface:toilette()
end

function gameStart:draw()
    gameStart:drawGame()
end