PImage bg, startNormal, startHover, lose, win, restart, ship;

final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int GAME_WIN = 3;
int gameState = GAME_START;

final int BUTTON_TOP = 210;
final int BUTTON_BOTTOM = 280;
final int BUTTON_LEFT = 115;
final int BUTTON_RIGHT = 450;

boolean upPressed, downPressed, rightPressed, leftPressed;

float shipX, shipY;
float shipSpeed = 5;
float shipWidth = 50;

float wall1Speed = 1;
float wall2Speed = 2;
float wall3Speed = 3;

float wall1Y = 100;
float wall2Y = 200;
float wall3Y = 300;

float wall1HoleWidth = 300;
float wall2HoleWidth = 200;
float wall3HoleWidth = 100;

float winningLineY = 400;

color wallColor;

void setup() {
  size(600, 500);
  bg=loadImage("img/bg.png");
  startNormal=loadImage("img/start1.png");
  startHover=loadImage("img/start2.png");
  lose=loadImage("img/lose.png");
  win=loadImage("img/win.png");
  restart=loadImage("img/restart.png");
  ship=loadImage("img/ship.png");

  shipX = width / 2 - shipWidth / 2;
  shipY = 0;
  
  wallColor = color(247, 210, 60);
}

void draw() {
  switch(gameState){
    case GAME_START:
      if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
      && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
        image(startHover, 0, 0);
        if(mousePressed){
          gameState = GAME_RUN;
        }
      }else{
        image(startNormal, 0, 0);
      }
    break;
    
    case GAME_RUN:
    
      image(bg, 0, 0);
 
      
      // ship movement
      if (upPressed){
        shipY -= shipSpeed;
        if(shipY < 0) shipY = 0;
      }
      if (downPressed){
        shipY += shipSpeed;
        if(shipY + shipWidth > height) shipY = height - shipWidth;
      }
      if (leftPressed){
        shipX -= shipSpeed;
        if(shipX < 0) shipX = 0;
      }
      if (rightPressed){
        shipX += shipSpeed;
        if(shipX + shipWidth > width) shipX = width - shipWidth;
      }
      
      // detect goal
      if (shipY + shipWidth > winningLineY){
          gameState = GAME_WIN;
      }
      
      // draw ship
      image(ship, shipX, shipY);
      
      
     
      
      break;
      
      
    case GAME_WIN:
      image(win, 0, 0);
      break;
      
    case GAME_OVER:
      image(lose, 0, 0);
      break;
  }
}

void keyPressed(){
  switch(keyCode){
    case UP:
      upPressed = true;
      break;  
    case DOWN:
      downPressed = true;
      break;  
    case RIGHT:
      rightPressed = true;
      break;  
    case LEFT:
      leftPressed = true;
      break;   
  }
}

void keyReleased(){
  switch(keyCode){
    case UP:
      upPressed = false;
      break;  
    case DOWN:
      downPressed = false;
      break;  
    case RIGHT:
      rightPressed = false;
      break;  
    case LEFT:
      leftPressed = false;
      break;  
  }
}
