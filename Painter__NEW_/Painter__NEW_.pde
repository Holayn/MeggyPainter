#include <MeggyJrSimple.h>

struct Point
{
  int x;
  int y;
  int color;
};

Point s1 = {0,0,1};
Point s2 = {1,1,2};
Point s3 = {2,2,3};

Point Shape[3] = {s1,s2,s3};



int playerx;
int playery;
int playercolor;



Point p1 = {playerx,playery,playercolor};
Point p2 = {playerx,playery,playercolor};
Point p3 = {playerx,playery,playercolor};

Point DrawnShape[3] = {p1,p2,p3};

void setup()
{
  MeggyJrSimpleSetup();
  playerx=2;
  playery=2;
  playercolor=1;
}

void loop()
{
  ClearSlate();
  if (Button_Up)
  {
    DrawPx(playerx,playery,playercolor);
    playery++;
    if (playery > 7)
      playery = 0;
    Tone_Start(ToneE3, 50);
  }
  if (Button_Down)
  {
    DrawPx(playerx,playery,playercolor);
    playery--;
    if (playery < 0)
      playery = 7;
    Tone_Start(ToneE3, 50);
  }
  if (Button_Left)
  {
    DrawPx(playerx,playery,playercolor);
    playerx--;
    if (playerx < 0)
      playerx = 7;
    Tone_Start(ToneE3, 50);
  }
  if (Button_Right)
  {
    DrawPx(playerx,playery,playercolor);
    playerx++;
    if (playerx > 7)
      playerx = 0;
    Tone_Start(ToneE3, 50);
  }
  if (Button_A)
  //store
  if (Button_B)
  {
   for (int i=0; i<7; i++) 
    {
      playercolor = playercolor + 1;
       if (playercolor > 7)
       {
         playercolor = 0;
       }
    }
  }
  for (int i = 0; i < 4; i++)
  {
    DrawPx(DrawnShape[i].x, DrawnShape[i].y, DrawnShape[i].color);
  }
  DisplaySlate();
}
