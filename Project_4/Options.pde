void options()
{
  image(alphaSave, 0, 0);
  noStroke();
  fill(255, 89);
  rect(width / 2, height / 2, width, height);
  
  if(mouseX > backButtonPos.x - backButtonSize.x / 2 && mouseX < backButtonPos.x + backButtonSize.x / 2 && mouseY > backButtonPos.y - backButtonSize.y / 2 && mouseY < backButtonPos.y + backButtonSize.y / 2)
  {
    backButtonSize.x = 158;
    backButtonSize.y = 71;
    backTextSize = 55;
    backTextOffset = 16;
  }
  else
  {
    backButtonSize.x = 145;
    backButtonSize.y = 65;
    backTextSize = 50;
    backTextOffset = 14;
  }
  
  stroke(barOutline);
  strokeWeight(4);
  fill(bar);
  rectMode(CENTER);
  rect(backButtonPos.x, backButtonPos.y, backButtonSize.x, backButtonSize.y);
  
  fill(barBack);
  textAlign(CENTER);
  textSize(backTextSize);
  text("Back", backButtonPos.x, backButtonPos.y + backTextOffset);
  
  sliders();
  
  if(cookieSlideRight)
  {
    cookieTesterPos.x += speed;
    
    if(cookieTesterPos.x + cookieSize / 2 > width - 250)
      cookieSlideRight = false;
  }
  else
  {
    cookieTesterPos.x -= speed;
    
    if(cookieTesterPos.x + cookieSize / 2 < 250)
      cookieSlideRight = true;
  }
  
  image(cookie, cookieTesterPos.x, cookieTesterPos.y, cookieSize, cookieSize);
}

void optionsMR()
{
  if(mouseX > backButtonPos.x - backButtonSize.x / 2 && mouseX < backButtonPos.x + backButtonSize.x / 2 && mouseY > backButtonPos.y - backButtonSize.y / 2 && mouseY < backButtonPos.y + backButtonSize.y / 2)
  {
    mode = intro;
  }
  
  sizePressed = false;
  speedPressed = false;
}

void sliders()
{
  if(dist(mouseX, mouseY, sizeSliderX, sliderHeight) < sliderSize / 2)
  {
    onSize = true;
    
    if(mousePressed)
      sizePressed = true;
  }
  else
    onSize = false;
  if(dist(mouseX, mouseY, speedSliderX, sliderHeight) < sliderSize / 2)
  {
    onSpeed = true;
    
    if(mousePressed)
      speedPressed = true;
  }
  else
    onSpeed = false;
  
  if(sizePressed)
  {
    sizeSliderX = mouseX;
  }
  if(speedPressed)
  {
    speedSliderX = mouseX;
  }
  
  stroke(barOutline);
  strokeWeight(5);
  line(75, sliderHeight, 350, sliderHeight);
  line(width - 350, sliderHeight, width - 75, height / 2);
  
  noStroke();
  if(onSize)
    fill(barBack);
  else
    fill(bar);
  ellipse(sizeSliderX, sliderHeight, sliderSize, sliderSize);
  if(onSpeed)
    fill(barBack);
  else
    fill(bar);
  ellipse(speedSliderX, sliderHeight, sliderSize, sliderSize);
}
