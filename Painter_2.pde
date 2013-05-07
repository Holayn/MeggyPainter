#include <MeggyJrSimple.h>

byte xc,yc;  //this is the cursor position
byte CurrentColor; //color of the dot to be painted down
byte BrushColor; //color of the brush
byte Brush; //the brush

unsigned long LastTime;



void setup()
{
  
  MeggyJrSimpleSetup();
  
  ClearSlate();
  
  xc = 3;
  yc = 3;
  CurrentColor = 0;
  BrushColor = 1;
  
}


void loop()
{
  
  CheckButtonsPress();
  
  if (Button_B)
  {
    BrushColor++; //increase the color
    
    if (BrushColor > White + 1)
      BrushColor = Dark;  
  }
  
  if (Button_A)
  {
    if (BrushColor > White)
      
      if (CurrentColor != BrushColor)
      {
        CurrentColor = BrushColor;
      }
      else
      {
        CurrentColor = Dark;
      }
  }
  
  if (Button_Up)
  {
    DrawPx(xc,yc,CurrentColor);
   
    if (yc < 7)
      yc++;
    else
      yc = 0;
    CurrentColor = ReadPx(xc,yc);
  }
  
  if (Button_Down)
  {
    DrawPx(xc,yc,CurrentColor);
   
    if (yc > 0)
      yc--;
    else
      yc = 7;
    CurrentColor = ReadPx(xc,yc);
  }
  
  if (Button_Right)
  {
    DrawPx(xc,yc,CurrentColor);
   
    if (xc < 7)
      xc++;
    else
      xc = 0;
    CurrentColor = ReadPx(xc,yc);
  }
  
  if (Button_Left)
  {
    DrawPx(xc,yc,CurrentColor);
   
    if (xc > 0)
      xc--;
    else
      xc = 7;
    CurrentColor = ReadPx(xc,yc);
  }
  
  byte CursorColor;
  
  DrawPx(xc,yc,BrushColor);
  
  DisplaySlate();
  

  
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
