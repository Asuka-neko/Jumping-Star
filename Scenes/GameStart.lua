require 'Map'
require 'Player'
push = require 'push'

map = Map()

function love.load()

end

function love.update(dt)
    map:update(dt)

    love.keyboard.keyPressed = {}
    love.keyboard.keyReleased = {}

end

function love.draw()
    push:apply('start')

    love.graphics.clear(colors.darkBlue)
    love.graphics.translate(math.floor(-map.camX + 0.5), math.floor(-map.camY + 0.5))
    map:render()

    love.graphics.setFont (fonts.font10)
    love.graphics.setColor (colors.beige)
    love.graphics.print (map.currentCoin.text, map.currentCoin.textX, map.currentCoin.textY)
    love.graphics.print (map.currentCoin.score, map.currentCoin.scoreX, map.currentCoin.scoreY)

    push:apply('end')
end

