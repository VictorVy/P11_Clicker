void game()
{
  background(gameBG);
  image(cookie, cookiePos.x, cookiePos.y, cookieSize, cookieSize);
  
  move();
  
  bar();
  timer();
  
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

void move()
{
  //if(direction.x <= 0)
  //  cookiePos.x -= speed;
  //else if(direction.x > 0)
  //  cookiePos.x += speed;
  //if(direction.y <= 0)
  //  cookiePos.y -= speed;
  //else if(direction.y > 0)
  //  cookiePos.y += speed;



  //cookiePos.add(direction);
  
  
  if(cookiePos.x + cookieSize == width || cookiePos.x + cookieSize >= width)
    direction.x = 0;
  else if(cookiePos.x - cookieSize == 0 || cookiePos.x - cookieSize <= 0)
    direction.x = 1;
  if(cookiePos.y + cookieSize == barPos.x || cookiePos.y + cookieSize >= barPos.x)
    direction.y = 0;
  else if(cookiePos.y - cookieSize == 0 || cookiePos.y - cookieSize <= 0)
    direction.y = 1;
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

void timer()
{
  if(second() != 0 && second() % 10 == 0)
  {
    hpDecrement += 0.1;
  }
}
