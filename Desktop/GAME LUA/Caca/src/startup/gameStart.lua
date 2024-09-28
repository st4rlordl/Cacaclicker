gameStart = {}
function gameStart:load()
    love.graphics.setDefaultFilter("nearest", "nearest") --better pixel scale
    width, height = love.graphics.getDimensions()
    require("src/startup/require")
    requireAll()

    sprite:load()
    menu:load()
    caca:load()
    caca:loadCount()
    upgrade:load()
    interface:load()
    toilette:load()

end

function gameStart:drawFactory()
    interface:draw()
    caca:draw()        
    upgrade:draw()
    toilette:draw()
end

function gameStart:drawToiletteGame()
    interface:toilette()
end

function gameStart:drawMenu()
    game_font = love.graphics.newFont("font/DePixelKlein.ttf", 30)
    love.graphics.setFont(game_font)
    love.graphics.setShader(blur1)
    gameStart:drawFactory()
    --aplique du blur
    love.graphics.setShader()
    interface:cacaBackground()
    menu:draw()
  
end
