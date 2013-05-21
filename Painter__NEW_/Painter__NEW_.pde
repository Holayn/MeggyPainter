#include <MeggyJrSimple.h>

struct Point
{
  int x;
  int y;
  int color;
};

Point s1 = {3,3,2};
Point s2 = {3,4,3};
Point s3 = {3,5,4};

Point Shape[3] = {s1,s2,s3};
 


int playerx=9;
int playery=9;
int playercolor=0;
int whichpoint=1;

int xr;
int yr;
int colorr;

int mode;

Point p1 = {playerx,playery,playercolor};
Point p2 = {playerx,playery,playercolor};
Point p3 = {playerx,playery,playercolor};

Point DrawnShape[3] = {p1,p2,p3};

void setup()
{
  MeggyJrSimpleSetup();
//  playerx=2;
//  playery=2;
//  playercolor=1;
//  whichpoint=1;

  int xr = 2;
  int yr = 2;
  int colorr= 15;
  mode = 1;
  Serial.begin(9600);
}

void loop()
{
  CheckButtonsPress();
  if (mode == 1)
  {
    DrawPx(Shape[0].x,Shape[0].y,Shape[0].color);
    DrawPx(Shape[1].x,Shape[1].y,Shape[1].color);
    DrawPx(Shape[2].x,Shape[2].y,Shape[2].color);
    mode = mode + 1;
    DisplaySlate();
    delay(5000);
    ClearSlate();
  }
  if (mode > 1)
  {   
    if (Button_Up)
    {
      DrawPx(xr,yr,colorr);
      yr++;
      if (yr > 7)
        yr = 0;
      Tone_Start(ToneE3, 50);
      DisplaySlate();
    }
    if (Button_Down)
    {
      DrawPx(xr,yr,colorr);
      yr--;
      if (yr < 0)
        yr = 7;
      Tone_Start(ToneE3, 50);
    }
    if (Button_Left)
    {
      DrawPx(xr,yr,colorr);
      xr--;
      if (xr < 0)
        xr = 7;
      Tone_Start(ToneE3, 50);
    }
    if (Button_Right)
    {
      DrawPx(xr,yr,colorr);
      xr++;
      if (xr > 7)
        xr = 0;
      Tone_Start(ToneE3, 50);
    }
    if (Button_A) //setting the array. whatever coordinate the player is at, it stores it into the array
    {
      Serial.println("A");
      CheckButtonsDown();
      if (Button_B) CheckWin();
      else {
        boolean skip = false;
      for (int i=0; i<3; i++)
      {
        if (DrawnShape[i].x == xr && DrawnShape[i].y == yr && DrawnShape[i].color == colorr ){
          skip = true;
        }
      }
      if (!skip){
      if (whichpoint == 1)
      {
        DrawnShape[0].x = xr;
        DrawnShape[0].y = yr;
        DrawnShape[0].color = colorr;
      }
      else if (whichpoint == 2)
      {
        DrawnShape[1].x = xr;
        DrawnShape[1].y = yr;
        DrawnShape[1].color = colorr;
      }
      else if (whichpoint == 3)
      {
        DrawnShape[2].x = xr;
        DrawnShape[2].y = yr;
        DrawnShape[2].color = colorr;
      }
      whichpoint = whichpoint+1;
      if (whichpoint > 3)
        whichpoint = 1;
      }
      }
    }
      
    if (Button_B)
    {
      Serial.println("B");
     for (int i=0; i<7; i++) 
      {
        colorr = colorr + 1;
         if (colorr > 7)
         {
           colorr = 0;
         }
      }
    }
    
    ClearSlate();
    DrawPx(xr,yr,colorr);
    for (int i = 0; i < 3; i++)
    {
      DrawPx(DrawnShape[i].x,DrawnShape[i].y,DrawnShape[i].color);
    }
    DisplaySlate();
  }
}

void CheckWin() //what to run when game is won
{
  boolean correctShape = false;
  for (int i=0; i < 3; i++)
  {
    Serial.print("DrawnShape[i].x = ");
    Serial.print(DrawnShape[i].x);
    Serial.print("\n");
    Serial.print("DrawnShape[i].y = ");
    Serial.print(DrawnShape[i].y);
    Serial.print("\n");
    Serial.print("DrawnShape[i].color = ");
    Serial.print(DrawnShape[i].color);
    Serial.print("\n");
    
    for (int j=0; j<3; j++){
      if (DrawnShape[i].x == Shape[j].x && DrawnShape[i].y == Shape[j].y && DrawnShape[i].color == Shape[j].color){
        correctShape = true;
        Serial.print("correct");
        break;
      }
      else{
        correctShape = false;
        Serial.print("incorrect");
      }
    }
  }
    if (correctShape)
    {
       DrawPx(1,7,Green); //a green box for correct
       DrawPx(6,7,Green);
       DrawPx(6,2,Green);
       DrawPx(1,2,Green);
       DrawPx(2,7,Green);
       DrawPx(3,7,Green);
       DrawPx(4,7,Green);
       DrawPx(5,7,Green);
       DrawPx(6,6,Green);
       DrawPx(6,5,Green);
       DrawPx(6,4,Green);
       DrawPx(6,3,Green);
       DrawPx(5,2,Green);
       DrawPx(4,2,Green);
       DrawPx(3,2,Green);
       DrawPx(2,2,Green);
       DrawPx(1,3,Green);
       DrawPx(1,4,Green);
       DrawPx(1,5,Green);
       DrawPx(1,6,Green);
    }
    else //an x sign for incorrect
    {
       DrawPx(0,7,Red);
       DrawPx(1,6,Red);
       DrawPx(2,5,Red);
       DrawPx(3,4,Red);
       DrawPx(4,3,Red);
       DrawPx(5,2,Red);
       DrawPx(6,1,Red);
       DrawPx(7,0,Red);
       DrawPx(0,0,Red);
       DrawPx(1,1,Red);
       DrawPx(2,2,Red);
       DrawPx(3,3,Red);
       DrawPx(4,4,Red);
       DrawPx(5,5,Red);
       DrawPx(6,6,Red);
       DrawPx(7,7,Red);
    }
    DisplaySlate();
    delay(250);
  }

