import java.util.*;
import ddf.minim.*;

Minim minim;
AudioPlayer biteMiss;
AudioPlayer bite;
AudioPlayer bounce1;
AudioPlayer bounce2;
AudioPlayer over;
AudioPlayer pop;
AudioPlayer click;
AudioPlayer charging;

Random randomBool = new Random();
boolean bool;

PFont woodstock;

//variables
int mode;

final int intro = 0;
final int game = 1;
final int options = 2;
final int gameOver = 3;
final int pause = 4;

color black = 0;
color bar;
color barBack;
color barOutline;
color barLines;

PImage cookie;
boolean cookie1;
float cookieSize;
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
int firstRow;

PVector quitButtonPos;
PVector quitButtonSize;
int quitTextSize;
int quitTextOffset;

PVector optionsButtonPos;
PVector optionsButtonSize;
int optionsTextSize;
int optionsTextOffset;
int labelTextSize;
int titleTextSize;
PVector titleTextPos;

PVector backButtonPos;
PVector backButtonSize;
int backTextSize;
int backTextOffset;

boolean bobUp;
boolean bobRight;

PImage alphaSave;
PVector cookieTesterPos;
boolean cookieSlideRight;

float sizeSliderX;
float speedSliderX;
int sliderY;
int sliderSize;
int sizeSliderLeft;
int sizeSliderRight;
int speedSliderLeft;
int speedSliderRight;
boolean onSize;
boolean onSpeed;
boolean sizePressed;
boolean speedPressed;

boolean crumbled;

void setup()
{
  size(800, 600, P2D);
  frameRate(60);
  
  minim = new Minim(this);
  biteMiss = minim.loadFile("8-bite.wav");
  bite = minim.loadFile("Bite.wav");
  bounce1 = minim.loadFile("bounce1.wav");
  bounce2 = minim.loadFile("bounce2.wav");
  over = minim.loadFile("over.wav");
  pop = minim.loadFile("pop.wav");
  click = minim.loadFile("click.wav");
  charging = minim.loadFile("rustle.wav");
  
  woodstock = createFont("Woodstock.ttf", 255);
  textFont(woodstock);
  
  //variables
  mode = intro;
  
  bar = #C99649;
  barBack = #8B6120;
  barOutline = #5D4521;
  barLines = #DBB582;
  
  cookie = loadImage("cookie1.png");
  cookie1 = true;
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
  
  speedController = 0.5;
  direction = new PVector(random(-1, 1), random(-1, 1));
  
  missTracker = 0;
  hitTracker = 0;
  totalClicks = 0;
  bestTime = 0;
  bestAccuracy = 0;
  difficulty = 0;
  
  retryButtonPos = new PVector(width / 2 + 100, 550);
  retryButtonSize = new PVector(170, 65);
  firstRow = 175;
  
  quitButtonPos = new PVector(85, 550);
  quitButtonSize = new PVector(130, 50);
  
  optionsButtonPos = new PVector(width - 130, 550);
  optionsButtonSize = new PVector(170, 65);
  labelTextSize = 30;
  titleTextSize = 75;
  titleTextPos = new PVector(width / 2, 115);
  
  backButtonPos = new PVector(92, 550);
  backButtonSize = new PVector(145, 50);
  
  bobUp = true;
  bobRight = true;
  
  cookieTesterPos = new PVector(width / 2, height / 2 - 40);
  cookieSlideRight = true;
  
  sizeSliderX = 212.5;
  speedSliderX = width - 212.5;
  sliderY = height / 2 + 100;
  sliderSize = 25;
  sizeSliderLeft = 75;
  sizeSliderRight = 350;
  speedSliderLeft = width - 350;
  speedSliderRight = width - 75;
  sizePressed = false;
  speedPressed = false;
  
  crumbled = false;
}

void draw()
{
  if(mode != game && mode != pause)
  {
    cookieSize = map(sizeSliderX, sizeSliderLeft, sizeSliderRight, 100, 150);
    speed = map(speedSliderX, speedSliderLeft, speedSliderRight, 1, 3);
  }
  
  if(bobUp)
  {
    if(mode != game && mode != pause)
    {
      cookiePos.y -= speed / 16;
      titleTextPos.y -= speed / 16;
    }
    
    if(cookiePos.y < height / 2 - 4)
      bobUp = false;
  }
  else
  {
    if(mode != game && mode != pause)
    {
      cookiePos.y += speed / 16;
      titleTextPos.y += speed / 16;
    }
    
    if(cookiePos.y > height / 2 + 4)
      bobUp = true;
  }
  if(bobRight)
  {
    if(mode != game && mode != pause)
    {
      cookiePos.x += speed / 16;
      titleTextPos.x += speed / 16;
    }
    
    if(cookiePos.x > (width / 2 - cookieSize / 2) + 3)
      bobRight = false;
  }
  else
  {
    if(mode != game && mode != pause)
    {
      cookiePos.x -= speed / 16;
      titleTextPos.x -= speed / 16;
    }
    
    if(cookiePos.x < (width / 2 - cookieSize / 2) - 3)
      bobRight = true;
  }
  
  if(mode == intro)
    intro();
  else if(mode == game)
    game();
  else if(mode == options)
    options();
  else if(mode == gameOver)
    gameOver();
  else if(mode == pause)
    pause();
  else
    println("Mode Error (Mode = " + mode + ")");
}

void mouseReleased()
{
  if(mode == intro)
    introMR();
  else if(mode == game)
    gameMR();
  else if(mode == options)
    optionsMR();
  else if(mode == gameOver)
    gameOverMR();
  else if(mode == pause)
    pauseMR();
  else
    println("MR Error (Mode = " + mode + ")");
}

boolean randomBool()
{
  bool = randomBool.nextBoolean();
  return bool;
}
