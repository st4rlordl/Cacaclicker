caca = {}
cacaCountText = {}

function caca:load()
    math.randomseed(os.time())
    caca.x = width/5
    caca.y = height/3
    caca.ScaleX = width/100
    caca.ScaleY = height/100
    caca.width = sprite.caca:getWidth()*caca.ScaleX
    caca.height = sprite.caca:getHeight()*caca.ScaleY 
    caca.timer = 0
    caca.timerClick = false
    caca.isClick = false
    caca.rotate = 0
    caca.ClickcountX = math.random(caca.x-caca.width, caca.x+10)
    caca.ClickcountY = math.random(caca.y, caca.y+10)
    caca.textCount = {}
end

function cacaCountText:load()
    panneau:load()
    cacaCountText.text = {}
    cacaCountText.width = {}
    cacaCountText.x = {}
    cacaCountText.text[0] = tostring(math.floor(caca.count)) .. " caca" 
    cacaCountText.text[1] = tostring(math.floor(caca.countPerSecond)) .. " caca/s"
    local game_font = love.graphics.newFont("font/DePixelKlein.ttf", 30)
    cacaCountText.font = game_font
    for i = 0, 1 do 
        cacaCountText.width[i] = cacaCountText.font:getWidth(cacaCountText.text[i])
        cacaCountText.x[i] = panneau.x + cacaCountText.width[i]/2
        if i == 1 then
            cacaCountText.x[i] = panneau.x + cacaCountText.width[i]/1.4
        end
    end
end

function caca:loadCount()
    caca.count = 20000
    caca.click = 1
    caca.countPerSecond = 0
    cacaCountText:load()
end

function caca:update(dt)
    cacaCountText.text[0] = tostring(math.floor(caca.count)) .. " caca" 
    cacaCountText.text[1] = tostring(caca.countPerSecond) .. " caca/s"

    if caca.timerClick then
        caca.timer = caca.timer + dt
    end
    cacaClick(dt)
    caca.count = caca.count + (caca.countPerSecond*dt)
    caca.textCount = "+" .. tostring(caca.click)

end

function cacaClick(dt)
    if caca.isClick then
        if not caca.timerClick then
            caca.ScaleX = caca.ScaleX - 50 * dt  
            caca.ScaleY = caca.ScaleY - 50 * dt 
            caca.timerClick = true 
          
        end
        
        if caca.timer >= 0.25 then
            caca.ScaleX = width/100
            caca.ScaleY = height/100
            caca.timer = 0 
            caca.timerClick = false 
            caca.isClick = false
        end
    end
end

function cacaClickDraw()
    if caca.isClick then
            love.graphics.print(caca.textCount, caca.ClickcountX, caca.ClickcountY, nil)   
            caca.ClickcountX = caca.ClickcountX - 1
            caca.ClickcountY = caca.ClickcountY - 1
        
    else
        caca.ClickcountX = math.random(caca.x, caca.x + caca.width)
        caca.ClickcountY = math.random(caca.y, caca.y + caca.height)
    end
end

function caca:draw()
    love.graphics.draw(sprite.caca, caca.x, caca.y, caca.rotate, caca.ScaleX, caca.ScaleY)
    love.graphics.print(cacaCountText.text[0], cacaCountText.x[0], 100)
    love.graphics.print(cacaCountText.text[1], cacaCountText.x[1], 194)
    cacaClickDraw()
end