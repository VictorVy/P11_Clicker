void intro()
{
  image(CCBG, 0, 0, width, height);
  
  if(dist(mouseX, mouseY, cookiePos.x + cookieSize / 2, cookiePos.y + cookieSize / 2) < cookieSize / 2)
    tint(200);
  else
    tint(255);
  
  if(bobUp)
  {
    cookiePos.y -= speed / 16;
    
    if(cookiePos.y < height / 2 - 4)
      bobUp = false;
  }
  else
  {
    cookiePos.y += speed / 16;
    
    if(cookiePos.y > height / 2 + 4)
      bobUp = true;
  }
  if(bobRight)
  {
    cookiePos.x += speed / 16;
    
    if(cookiePos.x > (width / 2 - cookieSize / 2) + 3)
      bobRight = false;
  }
  else
  {
    cookiePos.x -= speed / 16;
    
    if(cookiePos.x < (width / 2 - cookieSize / 2) - 3)
      bobRight = true;
  }
  
  image(cookie, cookiePos.x, cookiePos.y, cookieSize, cookieSize);
  
  tint(255);
  
  if(mouseX > quitButtonPos.x - quitButtonSize.x / 2 && mouseX < quitButtonPos.x + quitButtonSize.x / 2 && mouseY > quitButtonPos.y - quitButtonSize.y / 2 && mouseY < quitButtonPos.y + quitButtonSize.y / 2)
  {
    quitButtonSize.x = 141;
    quitButtonSize.y = 71;
    quitTextSize = 55;
    quitTextOffset = 15;
  }
  else
  {
    quitButtonSize.x = 130;
    quitButtonSize.y = 65;
    quitTextSize = 50;
    quitTextOffset = 14;
  }
  
  if(mouseX > optionsButtonPos.x - optionsButtonSize.x / 2 && mouseX < optionsButtonPos.x + optionsButtonSize.x / 2 && mouseY > optionsButtonPos.y - optionsButtonSize.y / 2 && mouseY < optionsButtonPos.y + optionsButtonSize.y / 2)
  {
    optionsButtonSize.x = 141;
    optionsButtonSize.y = 71;
    optionsTextSize = 55;
    optionsTextOffset = 15;
  }
  else
  {
    quitButtonSize.x = 130;
    quitButtonSize.y = 65;
    quitTextSize = 50;
    quitTextOffset = 14;
  }
  
  stroke(barOutline);
  strokeWeight(4);
  fill(bar);
  rectMode(CENTER);
  rect(quitButtonPos.x, quitButtonPos.y, quitButtonSize.x, quitButtonSize.y);
  rect(optionsButtonPos.x, optionsButtonPos.y, optionsButtonSize.x, optionsButtonSize.y);
  
  fill(barBack);
  textAlign(CENTER);
  textSize(quitTextSize);
  text("Quit", quitButtonPos.x, quitButtonPos.y + quitTextOffset);
  text("Options", optionsButtonPos.x, optionsButtonPos.y + optionsTextOffset);
}

void introMR()
{
  if(mouseButton == LEFT)
  {
    if(dist(mouseX, mouseY, cookiePos.x + cookieSize / 2, cookiePos.y + cookieSize / 2) < cookieSize / 2)
    {
      frameCount = 0;
      mode = game;
    }
  }
  
  if(mouseX > quitButtonPos.x - quitButtonSize.x / 2 && mouseX < quitButtonPos.x + quitButtonSize.x / 2 && mouseY > quitButtonPos.y - quitButtonSize.y / 2 && mouseY < quitButtonPos.y + quitButtonSize.y / 2)
  {
    exit();
  }
}
