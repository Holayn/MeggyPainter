#include <MeggyJrSimple.h>

struct Point //declaring variables in a struct called Point
{
  int x;
  int y;
  int color;
};

Point s1 = {2,2,4};// //the computer drawn shape.
Point s2 = {1,3,4};//
Point s3 = {1,4,4};
Point s4 = {2,5,4};
Point s5 = {3,6,4};
Point s6 = {4,6,4};
Point s7 = {5,5,4};
Point s8 = {6,4,4};
Point s9 = {6,3,4};
Point s10 = {5,2,4};
Point s11 = {4,1,4};
Point s12 = {3,1,4};
Point s13 = {3,3,1};
Point s14 = {3,4,1};
Point s15 = {4,3,1};
Point s16 = {4,4,1};

Point Shape[16] = {s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16}; //array for the computer drawn shape
 


int playerx;
int playery;
int playercolor;
int whichpoint=1;

int xr;
int yr;
int colorr;

int mode;

Point p1 = {playerx,playery,playercolor}; //array for the player. the variable is changed each time within a point when button A is pressed.
Point p2 = {playerx,playery,playercolor};
Point p3 = {playerx,playery,playercolor};
Point p4 = {playerx,playery,playercolor};
Point p5 = {playerx,playery,playercolor};
Point p6 = {playerx,playery,playercolor};
Point p7 = {playerx,playery,playercolor};
Point p8 = {playerx,playery,playercolor};
Point p9 = {playerx,playery,playercolor};
Point p10 = {playerx,playery,playercolor};
Point p11 = {playerx,playery,playercolor};
Point p12 = {playerx,playery,playercolor};
Point p13 = {playerx,playery,playercolor};
Point p14 = {playerx,playery,playercolor};
Point p15 = {playerx,playery,playercolor};
Point p16 = {playerx,playery,playercolor};

Point DrawnShape[16] = {p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16};

void setup()
{
  MeggyJrSimpleSetup();
  int xr = 2; //the cursor
  int yr = 2;
  int colorr= 3;
  mode = 1;
  Serial.begin(9600);
  SetAuxLEDs(1 << colorr);
}

void loop()
{
  CheckButtonsPress(); 
  if (mode == 1) //this is for the computer to draw the shape
  {
    for (int i = 0; i<16; i++)
    {
      DrawPx(Shape[i].x,Shape[i].y,Shape[i].color); //for all 16 points in array, draw it.
    }
    mode = mode + 1; //increase the mode by one
    DisplaySlate();
    delay(5000);
    ClearSlate();
  }
  if (mode > 1) //since the mode was increased by one, now the player can move.
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
      Tone_Start(ToneC3, 50);
      Serial.println("A");
      CheckButtonsDown(); //checks for the player holding down the buttons
      if (Button_B) CheckWin(); //if button A and B are being held down, run CheckWin
      else {
        boolean skip = false; //new true false statement. for button A, it's either pressing button B at the same time or not. if not, skip is false, and pressing button A will now****
      for (int i=0; i<16; i++)
      {
        if (DrawnShape[i].x == xr && DrawnShape[i].y == yr && DrawnShape[i].color == colorr ){
          skip = true; //since skip is now true, the dot will not be drawn if Button A is pressed.
        }
      }
      if (!skip){ //if skip is not true, pressing Button A will draw a dot.
      if (whichpoint == 1)
      {
        DrawnShape[0].x = xr; //gets the first point of the player DrawnShape array and changes up the values to equal the cursor value
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
      else if (whichpoint == 4)
      {
        DrawnShape[3].x = xr;
        DrawnShape[3].y = yr;
        DrawnShape[3].color = colorr;
      }
      else if (whichpoint == 5)
      {
        DrawnShape[4].x = xr;
        DrawnShape[4].y = yr;
        DrawnShape[4].color = colorr;
      }
      else if (whichpoint == 6)
      {
        DrawnShape[5].x = xr;
        DrawnShape[5].y = yr;
        DrawnShape[5].color = colorr;
      }
      else if (whichpoint == 7)
      {
        DrawnShape[6].x = xr;
        DrawnShape[6].y = yr;
        DrawnShape[6].color = colorr;
      }
      else if (whichpoint == 8)
      {
        DrawnShape[7].x = xr;
        DrawnShape[7].y = yr;
        DrawnShape[7].color = colorr;
      }
      else if (whichpoint == 9)
      {
        DrawnShape[8].x = xr;
        DrawnShape[8].y = yr;
        DrawnShape[8].color = colorr;
      }
      else if (whichpoint == 10)
      {
        DrawnShape[9].x = xr;
        DrawnShape[9].y = yr;
        DrawnShape[9].color = colorr;
      }
      else if (whichpoint == 11)
      {
        DrawnShape[10].x = xr;
        DrawnShape[10].y = yr;
        DrawnShape[10].color = colorr;
      }
      else if (whichpoint == 12)
      {
        DrawnShape[11].x = xr;
        DrawnShape[11].y = yr;
        DrawnShape[11].color = colorr;
      }
      else if (whichpoint == 13)
      {
        DrawnShape[12].x = xr;
        DrawnShape[12].y = yr;
        DrawnShape[12].color = colorr;
      }
      else if (whichpoint == 14)
      {
        DrawnShape[13].x = xr;
        DrawnShape[13].y = yr;
        DrawnShape[13].color = colorr;
      }
      else if (whichpoint == 15)
      {
        DrawnShape[14].x = xr;
        DrawnShape[14].y = yr;
        DrawnShape[14].color = colorr;
      }
      else if (whichpoint == 16)
      {
        DrawnShape[15].x = xr;
        DrawnShape[15].y = yr;
        DrawnShape[15].color = colorr;
      }
      else if (whichpoint == 17)
      {
        DrawnShape[16].x = xr;
        DrawnShape[16].y = yr;
        DrawnShape[16].color = colorr;
      }
      whichpoint = whichpoint+1; //cycles around and around, changing different points every time you press A.
      if (whichpoint > 16)
        whichpoint = 1;
      }
      }
    }
    
    if (colorr == (0 + 1))
      SetAuxLEDs(0);
      
    if (Button_B)
    {
      Serial.println("B");
     for (int i=0; i<7; i++) //cycles through the colors
      {
        colorr = colorr + 1;
         if (colorr > 7)
         {
           colorr = 0;
         }
      }
    }
    
    ClearSlate();
    DrawPx(xr,yr,colorr);//draw the cursor
    for (int i = 0; i < 16; i++) 
    {
      DrawPx(DrawnShape[i].x,DrawnShape[i].y,DrawnShape[i].color); //draw what the player has drawn so far into the player array
    }
    DisplaySlate();
  }
}

void CheckWin() //what to run when game is won
{
  boolean correctShape = false;
  for (int i=0; i < 16; i++)
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
    
    for (int j=0; j<16; j++){
      if (DrawnShape[i].x == Shape[j].x && DrawnShape[i].y == Shape[j].y && DrawnShape[i].color == Shape[j].color){ //checking to see if all of these are equal to each other
        correctShape = true; //changing statement to true
        Serial.print("correct");
        break;
      }
      else{
        correctShape = false; //if it's not true, then it's false...
        Serial.print("incorrect");
      }
    }
  }
    if (correctShape) //if the correctShape is true, then run this.
    {
       Tone_Start(ToneC3, 50);
       Tone_Start(ToneCs3, 50);
       Tone_Start(ToneC3, 50);
       Tone_Start(ToneCs3, 50);
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
       delay(5000);
       ClearSlate();
       DisplaySlate();
       correctShape = false;
    }
    else //an x sign for incorrect
    {
       Tone_Start(ToneF3, 1000);
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

