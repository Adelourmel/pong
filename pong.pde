int ballX;
int ballY;
int playerY;
int colorR, colorG, colorB;
int animX = 5, animY = 6;
int nbPoint = 0;
int nbPointMachine = 0;
int i = 1;
int machineY;
int e;
int j;

void setup()
{
  ballX = 400;
  ballY = 250;
  size(850, 500);
  background(255);
}
void draw()
{
  //frameRate(15);
  clean();
  animation();
  intelligence();
  rebond();
  dessiner();
}
void clean()
{
  background(0);
}
void animation()
{
  if(i<0)
  {
    j=255;
  }
  if (i>0)
  {
    j=0;
  }
  
  playerY = (mouseY);
  playerY = playerY-42;
    
  if (playerY < 20)
  {
    playerY = 20;
  }
  if (playerY > height-105)
  {
    playerY = height-105;
  }
  ballX = ballX + animX;
  ballY = ballY + animY;  
}
void rebond()
{
  if (ballX > width-31)// Droite
  {
    nbPointMachine++;
    ballX = width/2;
    ballY = height/2;
    animX = -animX;
    
  }
  if (ballY < 18) //Haut
  {
    //animY = -animY;
    animY = abs(animY);
  }
  if (ballY > height-31)//Bas
  { 
    animY = -animY;
  }
  if (ballX < 20)
  {
    nbPoint++;
    ballX = width/2;
    ballY = height/2;
    animX = -animX;
  }
  if (ballY <= playerY + 85 && ballY >= playerY && ballX < 45)
  {
    animX = -animX;
    aleat();
  }

  
}
void dessiner()
{

  stroke(colorR, colorG, colorB);
  strokeWeight(2);
  fill(0);
  rect(15, 15, width-30, height-30);// ball
  line(width/2, 20, width/2, height-20);  
  rect(ballX, ballY, 15, 15);
  rect(20, playerY, 25, 85);
  rect(width-45, machineY, 25, 85);
  fill(colorR, colorG, colorB);
  noStroke();
  textSize(16);
  text(nbPoint, width/2 + 30, 45);
  text(nbPointMachine, width/2 - 30, 45);
  changeColor();
}
void aleat()
{
  float a;
  a = random(7);
  animY = (int)a;
  a = random(7);
  animX = 10-animY;
}
void changeColor()
{
    
  if (colorB == 1)
  {
    i = 1;
    colorG = 155;
  }
  if (colorB == 255)
  {
    i = -1;
    colorG = 255;
  }
  colorB = colorB + i;
  colorR = colorR - i;  
}
void intelligence()
{
  
  if (ballX > 200)
  {
    if (ballY > machineY)
    {
      machineY = machineY + 2;
    }
        if (ballY < machineY)
    {
      machineY = machineY - 2;
    }

  }
     if (ballY <= machineY + 85 && ballY >= machineY && ballX > width-65)
  {   
   aleat();
   animX = - abs(animX);
  }

  if (machineY < 20)
  {
    machineY = 20;
  }
  if (machineY > height-105)
  {
    machineY = height-105;
  }
}
  void mouseWheel(MouseEvent event)
  {
    e = event.getCount();
    println(e);
  }