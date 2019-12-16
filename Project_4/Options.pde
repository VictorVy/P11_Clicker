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
  
  textSize(labelTextSize);
  text("Size", sizeSliderLeft + ((sizeSliderRight - sizeSliderLeft) / 2), height / 2 + 45);
  text("Speed", speedSliderLeft + ((speedSliderRight - speedSliderLeft) / 2), height / 2 + 45);
  
  sliders();
  
  if(cookieSlideRight)
  {
    cookieTesterPos.x += speed;
    
    if(cookieTesterPos.x > width - 225)
      cookieSlideRight = false;
  }
  else
  {
    cookieTesterPos.x -= speed;
    
    if(cookieTesterPos.x < 225)
      cookieSlideRight = true;
  }
  
  if(dist(mouseX, mouseY, cookieTesterPos.x, cookieTesterPos.y) < cookieSize / 2)
    tint(200);
  else
    tint(255);
  
  imageMode(CENTER);
  image(cookie, cookieTesterPos.x, cookieTesterPos.y, cookieSize, cookieSize);
  imageMode(CORNER);
  noTint();
}

void optionsMR()
{
  if(dist(mouseX, mouseY, cookieTesterPos.x, cookieTesterPos.y) < cookieSize / 2)
  {
    changeCostume();
  }
  
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
    
    if(sizeSliderX < sizeSliderLeft)
      sizeSliderX = sizeSliderLeft;
    else if(sizeSliderX > sizeSliderRight)
      sizeSliderX = sizeSliderRight;
  }
  if(speedPressed)
  {
    speedSliderX = mouseX;
    
    if(speedSliderX < speedSliderLeft)
      speedSliderX = speedSliderLeft;
    else if(speedSliderX > speedSliderRight)
      speedSliderX = speedSliderRight;
  }
  
  stroke(barOutline);
  strokeWeight(5);
  line(sizeSliderLeft, sliderHeight, sizeSliderRight, sliderHeight);
  line(speedSliderLeft, sliderHeight, speedSliderRight, height / 2);
  
  noStroke();
  if(onSize || sizePressed)
    fill(barBack);
  else
    fill(bar);
  ellipse(sizeSliderX, sliderHeight, sliderSize, sliderSize);
  if(onSpeed || speedPressed)
    fill(barBack);
  else
    fill(bar);
  ellipse(speedSliderX, sliderHeight, sliderSize, sliderSize);
}

void changeCostume()
{
  cookie1 = !cookie1;
}
