caca = {}

function caca:load()
    math.randomseed(os.time())
    width, height = love.graphics.getDimensions()
    caca.x = width/4
    caca.y = height/4
    caca.count = 300
    caca.click = 1
    caca.countPerSecond = 0
    caca.ScaleX = 10
    caca.ScaleY = 10
    caca.width = sprite.caca:getWidth()*caca.ScaleX
    caca.height = sprite.caca:getHeight()*caca.ScaleY 
    caca.timer = 0
    caca.timerClick = false
    caca.isClick = false
    caca.ClickcountX = math.random(caca.x-10, caca.x+10)
    caca.ClickcountY = math.random(caca.y-10, caca.y+10)
end

function caca:update(dt)
    caca.text = tostring(math.floor(caca.count)) .. " caca" 
    caca.textCountPerSecond = tostring(math.floor(caca.countPerSecond)) .. " caca per second" 
    caca.textCount = "+" .. tostring(caca.click)
    if caca.timerClick then
        caca.timer = caca.timer + dt
    end
    cacaClick()
    caca.count = caca.count + (caca.countPerSecond*dt)
end

function cacaClick()
    
    if caca.isClick then
        
        if not caca.timerClick then
            caca.ScaleX = caca.ScaleX / 2
            caca.ScaleY = caca.ScaleY / 2
            caca.timerClick = true 
            caca.x = caca.x*1.35
            caca.y = caca.y*1.35
        end
        
        if caca.timer >= 0.8 then
        
            caca.ScaleX = caca.ScaleX * 2
            caca.ScaleY = caca.ScaleY * 2
            caca.timer = 0 
            caca.timerClick = false 
            caca.isClick = false
            caca.x = width/4
            caca.y = height/4
        end
        
        
    end
end

function cacaClickDraw()
    if caca.isClick then
        love.graphics.print(caca.textCount, caca.ClickcountX, caca.ClickcountY, nil)
        caca.ClickcountX = caca.ClickcountX - 0.1
        caca.ClickcountY = caca.ClickcountY - 0.1
    else
        caca.ClickcountX = math.random(caca.x*2.35, caca.x)
        caca.ClickcountY = math.random(caca.y*2.35, caca.y)
    end
end

function caca:draw()
    
    love.graphics.draw(sprite.caca, caca.x, caca.y, nil, caca.ScaleX, caca.ScaleY)
    love.graphics.print(caca.text, 300, 50)
    love.graphics.print(caca.textCountPerSecond, 200, 100)
    cacaClickDraw()
end