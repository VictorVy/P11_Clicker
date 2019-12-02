void intro()
{
  image(CCBG, 0, 0, width, height);
  
  if(dist(mouseX, mouseY, cookiePos.x + cookieSize / 2, cookiePos.y + cookieSize / 2) < cookieSize / 2)
    tint(200);
  else
    tint(255);
  
  image(cookie, cookiePos.x, cookiePos.y, cookieSize, cookieSize);
  
  tint(255);
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
}
