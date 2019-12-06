void gameOver()
{
  background(gameOverBG);
  
  fill(black);
  textSize(25);
  
  textAlign(RIGHT);
  
  text("Time: ", width / 2, 60);
  text("Accuracy: ",  width / 2, 90);
  
  text("Clicks: ", width / 2, 150);
  text("Number of hits: ", width / 2, 180);
  text("Number of misses: ", width / 2, 210);
  
  text("Best time: ", width / 2, 270);
  text("Best accuracy: ", width / 2, 300);
  
  textAlign(LEFT);
  
  text(timeScore + " seconds", width / 2 + 5, 60);
  text(accuracy + "%", width / 2 + 5, 90);
  
  text(totalClicks, width / 2 + 5, 150);
  text((int)hitTracker, width / 2 + 5, 180);
  text((int)missTracker, width / 2 + 5, 210);
  
  text(bestTime + " seconds", width / 2 + 5, 270);
  text(bestAccuracy + "%", width / 2 + 5, 300);
  
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
  rect(retryButtonPos.x, retryButtonPos.y, retryButtonSize.x, retryButtonSize.y);
  rect(quitButtonPos.x, quitButtonPos.y, quitButtonSize.x, quitButtonSize.y);
  
  fill(barBack);
  textAlign(CENTER);
  textSize(retryTextSize);
  text("Retry", retryButtonPos.x, retryButtonPos.y + retryTextOffset);
  textSize(quitTextSize);
  text("Quit", quitButtonPos.x, quitButtonPos.y + quitTextOffset);
  }

void gameOverMR()
{
  if(mouseX > retryButtonPos.x - retryButtonSize.x / 2 && mouseX < retryButtonPos.x + retryButtonSize.x / 2 && mouseY > retryButtonPos.y - retryButtonSize.y / 2 && mouseY < retryButtonPos.y + retryButtonSize.y / 2)
  {
    reset();    
    mode = intro;
  }
  
  if(mouseX > quitButtonPos.x - quitButtonSize.x / 2 && mouseX < quitButtonPos.x + quitButtonSize.x / 2 && mouseY > quitButtonPos.y - quitButtonSize.y / 2 && mouseY < quitButtonPos.y + quitButtonSize.y / 2)
  {
    exit();
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
  
  speed = 2;
  speedController = 0.5;
  direction = new PVector(random(-1, 1), random(-1, 1));
  
  missTracker = 0;
  hitTracker = 0;
  totalClicks = 0;
  difficulty = 0;
  
  retryButtonPos = new PVector(width / 2, 400);
  retryButtonSize = new PVector(170, 65);
  
  quitButtonPos = new PVector(85, 550);
  quitButtonSize = new PVector(170, 50);
}
