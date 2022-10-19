local love = require "love"

local ballPos_X = 10
local ballPos_Y = 10

local ballSpeed = 5
local ballGoDown = true
local ballGoRight = true

local player_x = 50
local player_y = 50
local mouse_x

local playertop = 0
local playerbot = 0
local playerleft = 70

local enemy_x = love.graphics.getWidth() - 70
local enemy_y = 50

local enemy_top = 0
local enemy_bot = 0
local enemy_right = love.graphics.getWidth() - 70

local pPiont = 0
local cPoint = 0


function love.load()
    love.window.setTitle("Pong")
    love.mouse.setVisible(false)    

end


function love.update()
    local enemy_mid = enemy_y + 30

    playertop = player_y
    playerbot = player_y + 60

    enemy_top = enemy_y
    enemy_bot = enemy_y + 60


    if ballPos_Y > enemy_mid then enemy_y = enemy_y + 4.8 end
    if ballPos_Y < enemy_mid then enemy_y = enemy_y - 4.8 end

    if ballPos_X == playerleft then if ballPos_Y >= playertop and ballPos_Y <= playerbot then ballGoRight = true end end

    if ballPos_X == enemy_right then if ballPos_Y >= enemy_top and ballPos_Y <= enemy_bot then ballGoRight = false end end

    mouse_x, player_y = love.mouse.getPosition()
    --mouse_x, enemy_y = love.mouse.getPosition()

    if ballPos_Y >= love.graphics.getHeight() then ballGoDown = false end
    if ballPos_Y <= 0 then ballGoDown = true end
    --if ballPos_X >= love.graphics.getWidth() then ballGoRight = false end
    --if ballPos_X <= 0 then ballGoRight = true end

    if ballGoDown == true then ballPos_Y = ballPos_Y + ballSpeed else ballPos_Y = ballPos_Y - ballSpeed end
    if ballGoRight == true then ballPos_X = ballPos_X + ballSpeed else ballPos_X = ballPos_X - ballSpeed end

    if ballPos_X > 900 then pPiont = pPiont + 1 end
    if ballPos_X < 0 then cPoint = cPoint + 1 end

    if ballPos_X > 900 then ballGoRight = false end
    if ballPos_X < 0 then ballGoRight = true end

    if ballPos_X > 900 then ballPos_X = 450 end
    if ballPos_X < 0 then ballPos_X = 450 end

    
end

function love.draw()
    love.graphics.setColor(1,0,0)
    --love.graphics.print("playerTop "..playertop.." playerbot "..playerbot,10,10,0)
    --love.graphics.print("ballPos_X "..ballPos_X.." ballPos_Y "..ballPos_Y,10,40,0)
    love.graphics.print("player points "..pPiont.." - "..cPoint.. " comuter points",300,60,0)


    --love.graphics.print("enemy_mid "..enemy_mid,10,60,0)

    love.graphics.circle("fill",ballPos_X,ballPos_Y,10)
    love.graphics.rectangle("fill",player_x,player_y,20,60)
    love.graphics.rectangle("fill",enemy_x,enemy_y,20,60)



end