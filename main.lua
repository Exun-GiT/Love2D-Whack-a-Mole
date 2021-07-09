function love.load()
  target = {}
  target.x = 200
  target.y = 200
  target.img = love.graphics.newImage("mole.png")
  score = 0
  timer = 0
  scoreFont = love.graphics.newFont("Minecraft.ttf",36)
  popSound = love.audio.newSource("pop.wav", "static")
  timer = 0
  won = false
  respawnTime = 0.5
end

function love.mousepressed(x, y, button)
  if button == 1 and won == false then
    if ((x-(target.x+32))^2 + (y-(target.y+32))^2) < 4000 then
      score = score+1
      popSound:play()
      setMolePosition()
    end
  end
end

function love.update(dt)
  if score >= 10 then
    won = true
  end
  if won == false then
    timer= timer + dt
    if timer >= respawnTime then
      setMolePosition()
      if score>0 then
        score = score -1
      end
    end
  end
end

function setMolePosition()
  timer = 0
  target.x = math.random(100 ,love.graphics.getWidth()-100)
  target.y = math.random(100 ,love.graphics.getHeight()-100)
end

function love.draw()
  love.graphics.setBackgroundColor(0.4,0.63,0.93)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(scoreFont)
  if won == false then
    love.graphics.print(score,0,0)
  else
    love.graphics.print("you win",0,0)
  end
  love.graphics.draw(target.img, target.x, target.y)
end
