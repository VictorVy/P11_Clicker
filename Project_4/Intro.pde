void intro()
{
  background(introBG);
  
  image(cookie, cookiePos.x, cookiePos.y, cookieSize, cookieSize);
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
