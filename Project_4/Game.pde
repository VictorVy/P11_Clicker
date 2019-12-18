void game()
{
  image(CCBG, 0, 0, width, height);
  
  if(dist(mouseX, mouseY, cookiePos.x + cookieSize / 2, cookiePos.y + cookieSize / 2) < cookieSize / 2)
    tint(200);
  else
    tint(255);
  
  image(cookie, cookiePos.x, cookiePos.y, cookieSize, cookieSize);
  
  tint(255);
  
  move();
  
  bar();
  timer();
  
  hp -= hpDecrement / 60;
  totalClicks = (int)hitTracker + (int)missTracker;
  
  if(hp == 0 || hp < 0)
  {
    cookiePos = new PVector(width / 2 - cookieSize / 2, height / 2);
    
    timeScore = frameCount / 60.0;
    
    if(timeScore > bestTime)
    {
      bestTime = timeScore;
    }
    
    if(totalClicks != 0)
      accuracy = (hitTracker / totalClicks) * 100;
    else
      accuracy = 0;
    
    if(accuracy > bestAccuracy)
    {
      bestAccuracy = accuracy;
    }
    
    quitButtonPos.x = width / 2 - 100;
    
    mode = gameOver;
  }
  
  if(hp == 100 || hp > 100)
    hp = 100;
}

void gameMR()
{
  if(mouseButton == LEFT)
  {
    if(mouseY > barPos.y) {}
    else if(dist(mouseX, mouseY, cookiePos.x + cookieSize / 2, cookiePos.y + cookieSize / 2) < cookieSize / 2)
    {
      bite.rewind();
      bite.play();
      
      hp += hpIncrement;
      hitTracker++;
    }
    else
    {
      biteMiss.rewind();
      biteMiss.play();
      
      hp -= hpIncrement / 2;
      missTracker++;
    }
  }
  else if(mouseButton == RIGHT)
  {
    timeScore = frameCount / 60.0;
    
    if(totalClicks != 0)
      accuracy = (hitTracker / totalClicks) * 100;
    else
      accuracy = 0;
    
    quitButtonPos.x = width - 85;
    
    alphaSave = get(0, 0, width, height);
    
    mode = pause;
  }
}

void move()
{
  if(direction.x <= 0)
    cookiePos.x -= speed;
  else if(direction.x > 0)
    cookiePos.x += speed;
  if(direction.y <= 0)
    cookiePos.y += speed;
  else if(direction.y > 0)
    cookiePos.y -= speed;
  
  if(cookiePos.x + cookieSize == width || cookiePos.x + cookieSize >= width)
  {
    direction.x = -1;
    bounceSound();
  }
  else if(cookiePos.x == 0 || cookiePos.x <= 0)
  {
    direction.x = 1;
    bounceSound();
  }
  if(cookiePos.y + cookieSize == barPos.y || cookiePos.y + cookieSize >= barPos.y)
  {
    direction.y = 1;
    bounceSound();
  }
  else if(cookiePos.y == 0 || cookiePos.y <= 0)
  {
    direction.y = -1;
    bounceSound();
  }
}

void bar()
{
  barOffset = map(hp, 100, 0, 0, barWidth);
  
  noStroke();
  rectMode(CORNER);
  
  fill(barBack);
  rect(barPos.x, barPos.y, barWidth, barHeight);
  
  fill(bar);
  rect(barPos.x, barPos.y, barWidth - barOffset, barHeight);
  
  stroke(barOutline);
  strokeWeight(4);
  line(barPos.x, barPos.y, barPos.x + width, barPos.y);
  
  stroke(barLines);
  strokeWeight(3);
  
  for(int k = 0; k < width; k += width / 10)
  {
    line(k, height, k, height - barHeight * 0.60);
  }
  for(int k = 0; k < width; k += width / 40)
  {
    line(k, height, k, height - barHeight / 4);
  }
}

void timer()
{
  if(frameCount > 10 && frameCount % 360 == 0)
  {
    difficulty++;
    hpDecrement += hpDecrementController;
    if(difficulty > 1)
      speed += speedController;
    if(difficulty > 2 && cookieSize < 50)
      cookieSize -= cookieSizeController;
  }
}

void bounceSound()
{
  if(randomBool())
    {
      bounce1.rewind();
      bounce1.play();
    }
    else
    {
      bounce2.rewind();
      bounce2.play();
    }
}
