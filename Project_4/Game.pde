void game()
{
  background(gameBG);
  image(cookie, cookiePos.x, cookiePos.y, cookieSize, cookieSize);
  
  bar();
  
  if(frameCount % 5 == 0)
  {
    hp -= hpDecrement / 12;
    
    if(hp == 0 || hp < 0)
      mode = gameOver;
  }
  
  if(hp == 100 || hp > 100)
    hp = 100;
}

void gameMR()
{
  if(mouseButton == LEFT)
  {
    if(dist(mouseX, mouseY, cookiePos.x + cookieSize / 2, cookiePos.y + cookieSize / 2) < cookieSize / 2)
      hp += hpIncrement;
  }
}

void bar()
{
  barOffset = map(hp, 100, 0, 0, barWidth);
  
  noStroke();
  
  fill(barBack);
  rect(barPos.x, barPos.y, barWidth, barHeight);
  
  fill(bar);
  rect(barPos.x, barPos.y, barWidth - barOffset, barHeight);
  
  stroke(#5D4521);
  strokeWeight(4);
  line(barPos.x, barPos.y, barPos.x + width, barPos.y);
}
