require 'main'

love.graphics.setDefaultFilter('nearest', 'nearest')

local gameName = {
    text = title,
    textX = cellSize * 10,
    textY = cellSize * 9
}

local options = {
    {
        text = "START",
        textX = cellSize * 20 - 8,
        textY = cellSize * 15 - 4,

        border = {
            cellSize*18, cellSize*14,
            cellSize*26, cellSize*14,
            cellSize*26, cellSize*17,
            cellSize*18, cellSize*17,
            cellSize*18, cellSize*14
        }
    },
    {
        text = "QUIT",
        textX = cellSize * 21 - 11,
        textY = cellSize * 19 - 4,

        border = {
            cellSize*18, cellSize*18,
            cellSize*26, cellSize*18,
            cellSize*26, cellSize*21,
            cellSize*18, cellSize*21,
            cellSize*18, cellSize*18
        }
    },

    count = 2,
    selected = 1

}

function love.draw()
    push:apply('start')

    sounds.music:play()

    -- draw the background
    love.graphics.setColor(colors.darkBlue)
    love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

    love.graphics.setColor(colors.white)
    love.graphics.line(border)

    -- print the title
    love.graphics.setFont(fonts.font30)
    love.graphics.setColor(colors.beige)
    love.graphics.print(gameName.text, gameName.textX, gameName.textY)

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
    if key == 'up' then
        if sounds.switchOption.isPlaying then
            sounds.switchOption:stop()
        end
        sounds.switchOption:play()
        options.selected = options.selected - 1
        if options.selected <= 0 then
            options.selected = options.count
        end
    elseif key == 'down' then
        if sounds.switchOption.isPlaying then
            sounds.switchOption:stop()
        end
        sounds.switchOption:play()
        options.selected = options.selected + 1
        if options.selected > options.count then
            options.selected = 1
        end
    elseif key == 'return' then
        if sounds.music.isPlaying then
            sounds.music:stop()
        end
        if options.selected == 1 then
            SwitchScene('GameStart')
        elseif options.selected == 2 then
            love.event.quit()
        end
    end
end