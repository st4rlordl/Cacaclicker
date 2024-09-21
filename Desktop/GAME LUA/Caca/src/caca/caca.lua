caca = {}

function caca:load()
    width, height = love.graphics.getDimensions()
    caca.sprite = love.graphics.newImage("sprites/caca_sprite.png")
    caca.x = width/4
    caca.y = height/4
    caca.count = 0
    caca.click = 1
    caca.r = 100
    caca.width = caca.sprite:getWidth()
    caca.height = caca.sprite:getHeight()
    caca.font = love.graphics.newFont(24)
end

function caca:update(dt)
    caca.text = "Nombre de caca :" .. tostring(caca.count)
end

function love.mousepressed(x, y, button)

    if x >= caca.x and x <= caca.x + caca.width and
     y >= caca.y and y <= caca.y + caca.height then
        caca.count = caca.count + caca.click
        --caca.width = caca.sprite:setWidth()
        --caca.height = caca.sprite:setWidth()
    end
end


function caca:draw()

    love.graphics.draw(caca.sprite, caca.x, caca.y, nil)

    love.graphics.setFont(caca.font)
    love.graphics.print(caca.text, 100, 100)
end