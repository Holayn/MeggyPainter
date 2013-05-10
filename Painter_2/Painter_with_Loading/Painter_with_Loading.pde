#include <MeggyJrSimple.h>

byte xc,yc;  //this is the cursor position
byte CurrentColor; //color of the dot to be painted down
byte BrushColor; //color of the brush

byte Brush; //the brush
unsigned long LastTime; //a long variable for time, in milliseconds

int whatsave = 1;

#define DelayTime_ms 50 //time between blinking of cursor

boolean load = false;

void setup() //run this once when meggy is turned on
{
  
  MeggyJrSimpleSetup();
  
  ClearSlate();
  
  xc = 3;
  yc = 3;
  CurrentColor = 0;
  BrushColor = 1;
  
  Brush = 0;
  
  LastTime = millis();
  
}

void loop()
{
  CheckButtonsPress();
  
  if (Button_Right)
  {
    whatsave = whatsave + 1;
    if (whatsave > 7)
    {
      whatsave = 0;
    }
  }
  
  if (Button_Left)
  {
    whatsave = whatsave - 1;
    if (whatsave < 1)
    {
      whatsave = 8;
    }
  }
  
  if (Button_A)
    load = true;
    
  AuxLights();  
  LoadPaint();
  
}
  
void AuxLights()
{
   if (whatsave == 1) SetAuxLEDsBinary(B10000000);    
   if (whatsave == 2) SetAuxLEDsBinary(B11000000);
   if (whatsave == 3) SetAuxLEDsBinary(B11100000); 
   if (whatsave == 4) SetAuxLEDsBinary(B11110000);   
   if (whatsave == 5) SetAuxLEDsBinary(B11111000);   
   if (whatsave == 6) SetAuxLEDsBinary(B11111100);
   if (whatsave == 7) SetAuxLEDsBinary(B11111110); 
   if (whatsave == 8) SetAuxLEDsBinary(B11111111); 
}

void LoadPaint()  
{
  if (load == true)
  {
    if (whatsave == 1)
    {
      BlankLoad();
    }
 /*   if (whatsave == 2)
    {
      Load1();
    }
    if (whatsave == 3)
    {
      Load2();
    }
    if (whatsave == 4)
    {
      Load3();
    }
    if (whatsave == 5)
    {
      Load4();
    }
    if (whatsave == 6)
    {
      Load5();
    }
    if (whatsave == 7)
    {
      Load6();
    }
    if (whatsave == 8)
    {
      Load7();
    }
    */
  }    
}
  
  
void BlankLoad()
{
  {
  
  byte CursorColor;
  
  
  CheckButtonsPress();
  
  if (Button_B)
  {
    BrushColor++; //increase the color
    
    if (BrushColor > White + 1)
      BrushColor = Dark;  
  }
  
  if (Button_A)
  {
    if (BrushColor <= White)
      
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
  
  if (CurrentColor == BrushColor)
    CursorColor = Dark;
  else   
    CursorColor = BrushColor;
  
  if ((millis() - LastTime) > DelayTime_ms)
  {
   Brush++;
   if (Brush > 2)
   {
     DrawPx(xc,yc,CursorColor); //display the cursor
     Brush = 0;
   }
   else
     DrawPx(xc,yc,CurrentColor);
     
   LastTime = millis();
  }
  }
  DisplaySlate(); 
}


/*void Load1()
{
 
}

void Load2()
{
  DrawPx(3,3,3)
}

void Load3()
{
  DrawPx(4,4,4)
}

void Load4()
{
  DrawPx(5,5,5)
}

void Load5()
{
  DrawPx(6,6,6)
}

void Load6()
{
  DrawPx(7,7,7)
}

void Load7()
{
  DrawPx(8,8,8)
}
*/
  
