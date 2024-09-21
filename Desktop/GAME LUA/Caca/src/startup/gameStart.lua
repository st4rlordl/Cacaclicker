function gameStart()

    love.graphics.setDefaultFilter("nearest", "nearest") --better pixel scale

    require("src/startup/require")
    requireAll()

    
end