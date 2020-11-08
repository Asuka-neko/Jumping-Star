require 'main'

love.graphics.setDefaultFilter('nearest', 'nearest')

local gameOver = {
    text = 'GAME OVER!',
    textX = cellSize * 13,
    textY = cellSize * 9
}

local options = {
    {
        text = "BACK",
        textX = cellSize * 13 + 7,
        textY = cellSize * 15 + 6,

        border = {
            cellSize*12, cellSize*15,
            cellSize*20, cellSize*15,
            cellSize*20, cellSize*18,
            cellSize*12, cellSize*18,
            cellSize*12, cellSize*15
        }
    },
    {
        text = "QUIT",
        textX = cellSize * 24 + 8,
        textY = cellSize * 15 + 6,

        border = {
            cellSize*23, cellSize*15,
            cellSize*31, cellSize*15,
            cellSize*31, cellSize*18,
            cellSize*23, cellSize*18,
            cellSize*23, cellSize*15
        }
    },
    count = 2,
    selected = 1
}

function love.load()
    sounds.kill:play()
end

function love.draw()
    push:apply('start')

    -- draw the background
    love.graphics.setColor(colors.darkBlue)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    love.graphics.setColor(colors.white)
    love.graphics.line(border)

    -- print the title
    love.graphics.setFont(fonts.font30)
    love.graphics.setColor(colors.beige)
    love.graphics.print(gameOver.text, gameOver.textX, gameOver.textY)

    love.graphics.setFont(fonts.font20)

    -- print the options
    for i = 1, options.count do
        if i == options.selected then
            love.graphics.setColor(colors.paleTurquoise)
        else
            love.graphics.setColor(colors.beige)
        end

        love.graphics.line(options[i].border)
        love.graphics.print(options[i].text, options[i].textX, options[i].textY)
    end
    push:apply('end')
end

function love.keypressed(key)

    if key == 'left' then

        if sounds.switchOption.isPlaying then
            sounds.switchOption:stop()
        end
        sounds.switchOption:play()

        options.selected = options.selected - 1
        if options.selected <= 0 then
            options.selected = options.count
        end

    elseif key == 'right' then

        if sounds.switchOption.isPlaying then
            sounds.switchOption:stop()
        end
        sounds.switchOption:play()

        options.selected = options.selected + 1
        if options.selected > options.count then
            options.selected = 1
        end
    elseif key == 'return' then
        if sounds.gameOver.isPlaying then
            sounds.gameOver:stop()
        end

        if options.selected == 1 then
            SwitchScene('Menu')
        elseif options.selected == 2 then
            love.event.quit()
        end
    end
end