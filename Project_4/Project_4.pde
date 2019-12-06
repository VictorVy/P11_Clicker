import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer biteMiss;
AudioPlayer bite;

PFont woodstock;

//variables
int mode;

final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameOver = 3;

color black = 0;
color pauseBG;
color gameOverBG;
color bar;
color barBack;
color barOutline;
color barLines;

PImage cookie;
int cookieSize;
int cookieSizeController;
PVector cookiePos;
float cookieDir;

PImage CCBG;

float hp;
float hpDecrement;
float hpDecrementController;
float hpIncrement;
float hpTracker;

PVector barPos;
int barWidth;
int barHeight;
float barOffset;

float speed;
float speedController;
PVector direction;

float missTracker;
float hitTracker;
int totalClicks;
float timeScore;
float bestTime;
float accuracy;
float bestAccuracy;
int difficulty;

PVector retryButtonPos;
PVector retryButtonSize;
int retryTextSize;
int retryTextOffset;

PVector quitButtonPos;
PVector quitButtonSize;
int quitTextSize;
int quitTextOffset;

PVector optionsButtonPos;
PVector optionsButtonSize;
int optionsTextSize;
int optionsTextOffset;

boolean bobUp;
boolean bobRight;

void setup()
{
  size(800, 600, P2D);
  frameRate(60);
  
  minim = new Minim(this);
  biteMiss = minim.loadFile("8-bite.wav");
  bite = minim.loadFile("Bite.wav");
  
  woodstock = createFont("Woodstock.ttf", 255);
  textFont(woodstock);
  
  //variables
  mode = intro;
  
  pauseBG = 225;
  gameOverBG = 225;
  bar = #C99649;
  barBack = #8B6120;
  barOutline = #5D4521;
  barLines = #DBB582;
  
  cookie = loadImage("cookie.png");
  cookieSize = 125;
  cookieSizeController = 5;
  cookiePos = new PVector(width / 2 - cookieSize / 2, height / 2);
  
  CCBG = loadImage("CCBG.jpg");
  
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
  bestTime = 0;
  bestAccuracy = 0;
  difficulty = 0;
  
  retryButtonPos = new PVector(width / 2, 400);
  retryButtonSize = new PVector(170, 65);
  
  quitButtonPos = new PVector(85, 550);
  quitButtonSize = new PVector(170, 50);
  
  optionsButtonPos = new PVector(width - 85, 550);
  optionsButtonSize = new PVector(170, 65);
  
  bobUp = true;
  bobRight = true;
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
