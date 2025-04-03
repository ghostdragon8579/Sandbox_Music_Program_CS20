//Global Variables
int appWidth, appHeight;
int size;
//
void setup() {
  //
  size(1200, 800);
  appWidth = width;
  appHeight = height;
  //
  MusicPlayerSetup();
  //
} //End setup
//
void draw() {
  //
  if (MusicPlayerPopup==true) {
  MusicPlayerDraw();
  }
  //
} //End draw
//
void keyPressed() {
  //
  MusicPlayerKeyPressed();
  //
} //End keyPressed
//
void mousePressed() {
  //
  if (MusicPlayerPopup==true) {
  MusicPlayerMousePressed();
  }
  //
} //End mousePressed
//
//End MAIN Program
