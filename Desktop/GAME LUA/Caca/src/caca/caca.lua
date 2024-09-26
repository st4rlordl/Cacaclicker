caca = {}

function caca:load()
    math.randomseed(os.time())
    width, height = love.graphics.getDimensions()
    caca.x = width/5
    caca.y = height/3
    caca.ScaleX = 10
    caca.ScaleY = 10
    caca.width = sprite.caca:getWidth()*caca.ScaleX
    caca.height = sprite.caca:getHeight()*caca.ScaleY 
    caca.timer = 0
    caca.timerClick = false
    caca.isClick = false
    caca.rotate = 0
    caca.ClickcountX = math.random(caca.x-10, caca.x+10)
    caca.ClickcountY = math.random(caca.y-10, caca.y+10)
    caca.textCount = {}
end

function caca:loadCount()
     caca.count = 20000
    caca.click = 1
    caca.countPerSecond = 0
end

function caca:update(dt)
    caca.text = tostring(math.floor(caca.count)) .. " caca" 
    caca.textCountPerSecond = tostring(math.floor(caca.countPerSecond)) .. " caca par seconde"  

    if caca.timerClick then
        caca.timer = caca.timer + dt
    end
    cacaClick(dt)
    caca.textCount = "+" .. tostring(caca.click)
    caca.count = caca.count + (caca.countPerSecond*dt)
end


function cacaClick(dt)
    if caca.isClick then
        if not caca.timerClick then
            caca.ScaleX = caca.ScaleX - 500 * dt  
            caca.ScaleY = caca.ScaleY - 500 * dt 
            caca.timerClick = true 
          
        end
        
        if caca.timer >= 0.8 then    
            caca.ScaleX = 10
            caca.ScaleY = 10
            caca.timer = 0 
            caca.timerClick = false 
            caca.isClick = false
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
    love.graphics.draw(sprite.caca, caca.x, caca.y, caca.rotate, caca.ScaleX, caca.ScaleY)
    love.graphics.print(caca.text, 270, 100)
    love.graphics.print(caca.textCountPerSecond, 225, 194, nil, 0.8, 0.8)
    cacaClickDraw()
end