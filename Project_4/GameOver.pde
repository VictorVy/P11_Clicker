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
  text(bestAccuracy + "%", width / 2 + 0, 300);
}

void gameOverMR()
{
  
}
