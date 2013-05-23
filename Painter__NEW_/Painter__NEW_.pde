//Meggy Painter Game! by Kai Wong
//Paint to match up the picture that is shown!
//Hold down BA to check!

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
 


int playerx=9;
int playery=9;
int playercolor;
int whichpoint=1;

int xc;
int yc;
int colorc=1;

int mode;

//int level;

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
  int xc = 2; //the cursor
  int yc = 2;
  int colorc= 3;
  mode = 1;
  Serial.begin(9600);//my brother helped a lot with the debugging process
  //SetAuxLEDs(1 << colorc);
}

void loop()
{
  CheckButtonsPress();
  
  if (mode == 1)
    {
      Tone_Start(ToneD8,1500);
      for (int x=0; x<8; x++)
        { 
          DrawPx(x,0,3);
          DrawPx(x,1,13);
          DrawPx(x,2,3);
          DrawPx(x,3,13);
          DrawPx(x,4,3);
          DrawPx(x,5,13);
          DrawPx(x,6,3);
          DrawPx(x,7,13);
        }
      DisplaySlate();
      delay(2000);
      ClearSlate();
      mode = mode + 1;
        
    }


  if (mode == 2) //this is for the computer to draw the shape
  {
    Tone_Start(ToneE8,500);
    for (int i = 0; i<16; i++)
    {
      DrawPx(Shape[i].x,Shape[i].y,Shape[i].color); //for all 16 points in array, draw it.
    }
    mode = mode + 1; //increase the mode by one
    DisplaySlate();
    delay(5000);
    ClearSlate();
  }
  if (mode == 3) //since the mode was increased by one, now the player can move.
  {  
    if (Button_Up)
    {
      DrawPx(xc,yc,colorc);
      yc++;
      if (yc > 7)
        yc = 0;
      Tone_Start(ToneE3, 50);
      DisplaySlate();
    }
    if (Button_Down)
    {
      DrawPx(xc,yc,colorc);
      yc--;
      if (yc < 0)
        yc = 7;
      Tone_Start(ToneE3, 50);
    }
    if (Button_Left)
    {
      DrawPx(xc,yc,colorc);
      xc--;
      if (xc < 0)
        xc = 7;
      Tone_Start(ToneE3, 50);
    }
    if (Button_Right)
    {
      DrawPx(xc,yc,colorc);
      xc++;
      if (xc > 7)
        xc = 0;
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
        if (DrawnShape[i].x == xc && DrawnShape[i].y == yc && DrawnShape[i].color == colorc ){
          skip = true; //since skip is now true, the dot will not be drawn if Button A is pressed.
        }
      }
      if (!skip){ //if skip is not true, pressing Button A will draw a dot.
      if (whichpoint == 1)
      {
        DrawnShape[0].x = xc; //gets the first point of the player DrawnShape array and changes up the values to equal the cursor value
        DrawnShape[0].y = yc;
        DrawnShape[0].color = colorc;
      }
      else if (whichpoint == 2)
      {
        DrawnShape[1].x = xc;
        DrawnShape[1].y = yc;
        DrawnShape[1].color = colorc;
      }
      else if (whichpoint == 3)
      {
        DrawnShape[2].x = xc;
        DrawnShape[2].y = yc;
        DrawnShape[2].color = colorc;  
      }
      else if (whichpoint == 4)
      {
        DrawnShape[3].x = xc;
        DrawnShape[3].y = yc;
        DrawnShape[3].color = colorc;
      }
      else if (whichpoint == 5)
      {
        DrawnShape[4].x = xc;
        DrawnShape[4].y = yc;
        DrawnShape[4].color = colorc;
      }
      else if (whichpoint == 6)
      {
        DrawnShape[5].x = xc;
        DrawnShape[5].y = yc;
        DrawnShape[5].color = colorc;
      }
      else if (whichpoint == 7)
      {
        DrawnShape[6].x = xc;
        DrawnShape[6].y = yc;
        DrawnShape[6].color = colorc;
      }
      else if (whichpoint == 8)
      {
        DrawnShape[7].x = xc;
        DrawnShape[7].y = yc;
        DrawnShape[7].color = colorc;
      }
      else if (whichpoint == 9)
      {
        DrawnShape[8].x = xc;
        DrawnShape[8].y = yc;
        DrawnShape[8].color = colorc;
      }
      else if (whichpoint == 10)
      {
        DrawnShape[9].x = xc;
        DrawnShape[9].y = yc;
        DrawnShape[9].color = colorc;
      }
      else if (whichpoint == 11)
      {
        DrawnShape[10].x = xc;
        DrawnShape[10].y = yc;
        DrawnShape[10].color = colorc;
      }
      else if (whichpoint == 12)
      {
        DrawnShape[11].x = xc;
        DrawnShape[11].y = yc;
        DrawnShape[11].color = colorc;
      }
      else if (whichpoint == 13)
      {
        DrawnShape[12].x = xc;
        DrawnShape[12].y = yc;
        DrawnShape[12].color = colorc;
      }
      else if (whichpoint == 14)
      {
        DrawnShape[13].x = xc;
        DrawnShape[13].y = yc;
        DrawnShape[13].color = colorc;
      }
      else if (whichpoint == 15)
      {
        DrawnShape[14].x = xc;
        DrawnShape[14].y = yc;
        DrawnShape[14].color = colorc;
      }
      else if (whichpoint == 16)
      {
        DrawnShape[15].x = xc;
        DrawnShape[15].y = yc;
        DrawnShape[15].color = colorc;
      }
      else if (whichpoint == 17)
      {
        DrawnShape[16].x = xc;
        DrawnShape[16].y = yc;
        DrawnShape[16].color = colorc;
      }
      whichpoint = whichpoint+1; //cycles around and around, changing different points every time you press A.
      if (whichpoint > 16)
        whichpoint = 1;
      }
      }
    }
    
//    if (colorc == (0 + 1))
//      SetAuxLEDs(0);
      
    if (Button_B)
    {
      Serial.println("B");
//     for (int i=0; i<7; i++) //cycles through the colors
//      {
        colorc = colorc + 1;
         if (colorc > 7)
         {
           colorc = 1;
         }
      //}
    }
    
    ClearSlate();
    DrawPx(xc,yc,colorc);//draw the cursor
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
       Tone_Start(ToneC8, 50);
       Tone_Start(ToneC7, 50);
       Tone_Start(ToneC8, 50);
       Tone_Start(ToneC7, 1000);
       DrawPx(0,0,Green);
       DrawPx(0,1,Green);
       DrawPx(0,2,Green);
       DrawPx(0,3,Green);
       DrawPx(0,4,Green);
       DrawPx(0,5,Green);
       DrawPx(0,6,Green);
       DrawPx(0,7,Green);
       DrawPx(1,7,Green);
       DrawPx(2,7,Green);
       DrawPx(3,7,Green);
       DrawPx(4,7,Green);
       DrawPx(5,7,Green);
       DrawPx(6,7,Green);
       DrawPx(7,7,Green);
       DrawPx(7,6,Green);
       DrawPx(7,5,Green);
       DrawPx(7,4,Green);
       DrawPx(7,3,Green);
       DrawPx(7,2,Green);
       DrawPx(7,1,Green);
       DrawPx(7,0,Green);
       DrawPx(6,0,Green);
       DrawPx(5,0,Green);
       DrawPx(4,0,Green);
       DrawPx(3,0,Green);
       DrawPx(2,0,Green);
       DrawPx(1,0,Green);
       DisplaySlate();
       delay(2000);
       mode = mode + 1;

    
    }
    else //an x sign for incorrect
    {
       Tone_Start(ToneA3, 1000);
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
  

