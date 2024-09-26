toilette = {}

function toilette:load()
    toilette.ScaleX = 2
    toilette.ScaleY = 2
    toilette.rotate = 0
    toilette.width = sprite.toilette:getWidth()*toilette.ScaleX
    toilette.height = sprite.toilette:getHeight()*toilette.ScaleY 
    toilette.x = 0
    toilette.y = height - toilette.height
    toilette.isClick = false
end

function toilette:draw()
    love.graphics.draw(sprite.toilette, toilette.x, toilette.y, toilette.rotate, toilette.ScaleX, toilette.ScaleY)
end

