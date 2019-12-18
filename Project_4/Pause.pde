void pause()
{
  image(alphaSave, 0, 0);
  noStroke();
  fill(225, 96);
  rect(width / 2, height / 2, width, height);
  
  fill(barBack);
  textSize(titleTextSize);
  text("PAUSED", titleTextPos.x - 6, titleTextPos.y + 5);
  fill(bar);
  text("PAUSED", titleTextPos.x, titleTextPos.y);
  
  fill(black);
  textSize(25);
  
  textAlign(RIGHT);
  
  text("Clicks: ", width / 2, firstRow + 70);
  text("Hits: ", width / 2, firstRow + 120);
  text("Misses: ", width / 2, firstRow + 170);
  
  textAlign(LEFT);
  
  text(totalClicks, width / 2 + 5, firstRow + 70);
  text((int)hitTracker, width / 2 + 5, firstRow + 120);
  text((int)missTracker, width / 2 + 5, firstRow + 170);
  
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
  
  if (mouseX > quitButtonPos.x - quitButtonSize.x / 2 && mouseX < quitButtonPos.x + quitButtonSize.x / 2 && mouseY > quitButtonPos.y - quitButtonSize.y / 2 && mouseY < quitButtonPos.y + quitButtonSize.y / 2)
  {
    quitButtonSize.x = 141;
    quitButtonSize.y = 71;
    quitTextSize = 55;
    quitTextOffset = 15;
  } else
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
  rect(backButtonPos.x, backButtonPos.y, backButtonSize.x, backButtonSize.y);
  rect(quitButtonPos.x, quitButtonPos.y, quitButtonSize.x, quitButtonSize.y);
  
  fill(barBack);
  textAlign(CENTER);
  textSize(backTextSize);
  text("Back", backButtonPos.x, backButtonPos.y + backTextOffset);
  textSize(quitTextSize);
  text("Quit", quitButtonPos.x, quitButtonPos.y + quitTextOffset);
}

void pauseMR()
{
  if(mouseButton == LEFT)
  {
    if(mouseX > backButtonPos.x - backButtonSize.x / 2 && mouseX < backButtonPos.x + backButtonSize.x / 2 && mouseY > backButtonPos.y - backButtonSize.y / 2 && mouseY < backButtonPos.y + backButtonSize.y / 2)
    {
      click.rewind();
      click.play();
      
      mode = game;
    }
    
    if (mouseX > quitButtonPos.x - quitButtonSize.x / 2 && mouseX < quitButtonPos.x + quitButtonSize.x / 2 && mouseY > quitButtonPos.y - quitButtonSize.y / 2 && mouseY < quitButtonPos.y + quitButtonSize.y / 2)
    {
      click.rewind();
      click.play();
      
      exit();
    }
  }
  else if(mouseButton == RIGHT)
  {
    mode = game;
  }
}
