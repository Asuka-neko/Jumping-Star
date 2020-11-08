Class = require 'class'
push = require 'push'

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

math.randomseed(os.time())

love.graphics.setDefaultFilter('nearest', 'nearest')

function love.load()

    cellSize = 10

    title = 'JUMPING STAR !'
    love.window.setTitle(title)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true
    })

    fonts = {
        font30 = love.graphics.newFont('fonts/font.TTF', 30),
        font20 = love.graphics.newFont('fonts/font.TTF', 20),
        font10 = love.graphics.newFont('fonts/font.TTF', 10)
    }

    sounds = {
        music = love.audio.newSource('sounds/music.wav', 'stream'),
        jump = love.audio.newSource('sounds/jump.wav', 'stream'),
        gameOver = love.audio.newSource('sounds/death.wav', 'stream'),
        levelUp = love.audio.newSource('sounds/coin.wav', 'stream'),
        switchOption = love.audio.newSource('sounds/pickup.wav', 'stream'),
        win = love.audio.newSource('sounds/win.wav', 'stream')
    }

    border = {
        1, 1,
        VIRTUAL_WIDTH-1, 1,
        VIRTUAL_WIDTH-1, VIRTUAL_HEIGHT-1,
        1, VIRTUAL_HEIGHT-1,
        1, 1
    }

    colors = {
        darkBlue = {0.25, 0.25, 0.4, 1},
        beige = {0.98, 0.91, 0.76, 1},
        white = {1, 1, 1, 1},
        paleTurquoise = {0.7, 0.7, 0.9, 1},
    }

    SwitchScene('Menu')
end

function SwitchScene(scene)
    love.update = nil
    love.draw = nil
    love.keyPressed = nil

    love.filesystem.load ('Scenes/'..scene..'.lua') ()
end

function love.resize(w, h)
    push:resize(w, h)
end