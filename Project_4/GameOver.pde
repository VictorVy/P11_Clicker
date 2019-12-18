void gameOver()
{
  image(CCBG, 0, 0, width, height);
  
  if(!crumbled)
  {
    over.rewind();
    over.play();
    
    crumbled = true;
  }
  
  fill(barBack);
  textSize(titleTextSize);
  text("YOU CRUMBLED", titleTextPos.x - 6, titleTextPos.y - 10);
  fill(bar);
  text("YOU CRUMBLED", titleTextPos.x, titleTextPos.y - 15);
  
  fill(black);
  textSize(25);
  
  textAlign(RIGHT);
  
  text("Time: ", width / 2, firstRow);
  text("Accuracy: ",  width / 2, firstRow + 30);
  
  text("Clicks: ", width / 2, firstRow + 90);
  text("Hits: ", width / 2, firstRow + 120);
  text("Misses: ", width / 2, firstRow + 150);
  
  text("Best time: ", width / 2, firstRow + 210);
  text("Best accuracy: ", width / 2, firstRow + 240);
  
  textAlign(LEFT);
  
  text(timeScore + " seconds", width / 2 + 5, firstRow);
  text(accuracy + "%", width / 2 + 5, firstRow + 30);
  
  text(totalClicks, width / 2 + 5, firstRow + 90);
  text((int)hitTracker, width / 2 + 5, firstRow + 120);
  text((int)missTracker, width / 2 + 5, firstRow + 150);
  
  text(bestTime + " seconds", width / 2 + 5, firstRow + 210);
  text(bestAccuracy + "%", width / 2 + 5, firstRow + 240);
  
  if(mouseX > retryButtonPos.x - retryButtonSize.x / 2 && mouseX < retryButtonPos.x + retryButtonSize.x / 2 && mouseY > retryButtonPos.y - retryButtonSize.y / 2 && mouseY < retryButtonPos.y + retryButtonSize.y / 2)
  {
    retryButtonSize.x = 185;
    retryButtonSize.y = 71;
    retryTextSize = 55;
    retryTextOffset = 16;
  }
  else
  {
    retryButtonSize.x = 170;
    retryButtonSize.y = 65;
    retryTextSize = 50;
    retryTextOffset = 14;
  }
  
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
  
  stroke(barOutline);
  strokeWeight(4);
  fill(bar);
  rectMode(CENTER);
  rect(retryButtonPos.x + 7, retryButtonPos.y, retryButtonSize.x, retryButtonSize.y);
  rect(quitButtonPos.x + 7, quitButtonPos.y, quitButtonSize.x, quitButtonSize.y);
  
  fill(barBack);
  textAlign(CENTER);
  textSize(retryTextSize);
  text("Retry", retryButtonPos.x + 7, retryButtonPos.y + retryTextOffset);
  textSize(quitTextSize);
  text("Quit", quitButtonPos.x + 7, quitButtonPos.y + quitTextOffset);
  }

void gameOverMR()
{
  if(mouseButton == LEFT)
  {
    if(mouseX > retryButtonPos.x - retryButtonSize.x / 2 && mouseX < retryButtonPos.x + retryButtonSize.x / 2 && mouseY > retryButtonPos.y - retryButtonSize.y / 2 && mouseY < retryButtonPos.y + retryButtonSize.y / 2)
    {
      click.rewind();
      click.play();
      
      reset();
      mode = intro;
    }
    
    if(mouseX > quitButtonPos.x - quitButtonSize.x / 2 && mouseX < quitButtonPos.x + quitButtonSize.x / 2 && mouseY > quitButtonPos.y - quitButtonSize.y / 2 && mouseY < quitButtonPos.y + quitButtonSize.y / 2)
    {
      click.rewind();
      click.play();
      
      exit();
    }
  }
}

void reset()
{
  cookieSize = 125;
  cookieSizeController = 5;
  cookiePos = new PVector(width / 2 - cookieSize / 2, height / 2);
  
  hp = 100;
  hpDecrement = 1;
  hpDecrementController = 2;
  hpIncrement = 5;
  hpTracker = hp;
  
  barWidth = width;
  barHeight = 35;
  barPos = new PVector(0, height - barHeight);
  
  speedController = 0.5;
  direction = new PVector(random(-1, 1), random(-1, 1));
  
  missTracker = 0;
  hitTracker = 0;
  totalClicks = 0;
  difficulty = 0;
  
  retryButtonPos = new PVector(width / 2 + 100, 550);
  retryButtonSize = new PVector(170, 65);
  firstRow = 175;
  
  quitButtonPos.x = 85;
  
  titleTextPos = new PVector(width / 2, 115);
  
  bobUp = true;
  bobRight = true;
  
  cookieTesterPos = new PVector(width / 2, height / 2 - 40);
  cookieSlideRight = true;
  
  crumbled = false;
}
