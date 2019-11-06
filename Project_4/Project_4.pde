int mode;

final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameOver = 3;

color introBG;

PImage cookie;
int cookieSize;
PVector cookiePos;

void setup()
{
  size(800, 600);
  
  mode = intro;
  
  introBG = 225;
  
  cookie = loadImage("cookie.png");
  cookieSize = 150;
  cookiePos = new PVector(width / 2 - cookieSize / 2, height / 2);
}

void draw()
{
  if(mode == intro)
    intro();
  else if(mode == game)
    game();
  else if(mode == pause)
    pause();
  else if(mode == gameOver)
    gameOver();
  else
    println("Mode Error (Mode = " + mode + ")");
}
