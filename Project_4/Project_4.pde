import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer bite;

//variables
int mode;

final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameOver = 3;

color introBG;
color gameBG;
color pauseBG;
color gameOverBG;
color bar;
color barBack;

PImage cookie;
int cookieSize;
PVector cookiePos;

float hp;
float hpDecrement;
float hpIncrement;
float hpTracker;

PVector barPos;
int barWidth;
int barHeight;
float barOffset;

float speed;
PVector direction;

void setup()
{
  size(800, 600);
  frameRate(60);
  
  minim = new Minim(this);
  
  //variables
  mode = intro;
  
  introBG = 225;
  gameBG = 225;
  pauseBG = 225;
  gameOverBG = 225;
  bar = #C99649;
  barBack = #8B6120;
  
  cookie = loadImage("cookie.png");
  cookieSize = 125;
  cookiePos = new PVector(width / 2 - cookieSize / 2, height / 2);
  
  hp = 100;
  hpDecrement = 1;
  hpIncrement = 10;
  hpTracker = hp;
  
  barWidth = width;
  barHeight = 35;
  barPos = new PVector(0, height - barHeight);
  
  speed = 2; 
  direction = new PVector(random(-1, 1), random(-1, 1));
  println(direction, cookiePos);
  //direction.setMag(5);
  //direction.rotate(random(0, TWO_PI));
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

void mouseReleased()
{
  if(mode == intro)
    introMR();
  else if(mode == game)
    gameMR();
  else if(mode == pause)
    pauseMR();
  else if(mode == gameOver)
    gameOverMR();
  else
    println("MR Error (Mode = " + mode + ")");
}
