void intro()
{
  image(CCBG, 0, 0, width, height);

  if (dist(mouseX, mouseY, cookiePos.x + cookieSize / 2, cookiePos.y + cookieSize / 2) < cookieSize / 2)
    tint(200);
  else
    tint(255);

  image(cookie, cookiePos.x, cookiePos.y, cookieSize, cookieSize);

  tint(255);

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

  if (mouseX > optionsButtonPos.x - optionsButtonSize.x / 2 && mouseX < optionsButtonPos.x + optionsButtonSize.x / 2 && mouseY > optionsButtonPos.y - optionsButtonSize.y / 2 && mouseY < optionsButtonPos.y + optionsButtonSize.y / 2)
  {
    optionsButtonSize.x = 238;
    optionsButtonSize.y = 71;
    optionsTextSize = 55;
    optionsTextOffset = 15;
  } else
  {
    optionsButtonSize.x = 218;
    optionsButtonSize.y = 65;
    optionsTextSize = 50;
    optionsTextOffset = 14;
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
  textSize(optionsTextSize);
  text("Options", optionsButtonPos.x, optionsButtonPos.y + optionsTextOffset);
  
  textSize(titleTextSize);
  text("COOKIE", titleTextPos.x - 6, titleTextPos.y - 5);
  text("CLlCKER", titleTextPos.x - 6, titleTextPos.y + 55);
  fill(bar);
  text("COOKIE", titleTextPos.x, titleTextPos.y - 10);
  text("CLlCKER", titleTextPos.x, titleTextPos.y + 50);
}

void introMR()
{
  if (mouseButton == LEFT)
  {
    if (dist(mouseX, mouseY, cookiePos.x + cookieSize / 2, cookiePos.y + cookieSize / 2) < cookieSize / 2)
    {
      pop.rewind();
      pop.play();
      
      frameCount = 0;
      mode = game;
    }

    if (mouseX > quitButtonPos.x - quitButtonSize.x / 2 && mouseX < quitButtonPos.x + quitButtonSize.x / 2 && mouseY > quitButtonPos.y - quitButtonSize.y / 2 && mouseY < quitButtonPos.y + quitButtonSize.y / 2)
    {
      click.rewind();
      click.play();
      
      exit();
    }

    if (mouseX > optionsButtonPos.x - optionsButtonSize.x / 2 && mouseX < optionsButtonPos.x + optionsButtonSize.x / 2 && mouseY > optionsButtonPos.y - optionsButtonSize.y / 2 && mouseY < optionsButtonPos.y + optionsButtonSize.y / 2)
    {
      click.rewind();
      click.play();
      
      alphaSave = get(0, 0, width, height);

      mode = options;
    }
  }
}
