//Libraries
//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
float xRectBackground, yRectBackground, widthRectBackground, heightRectBackground;
int appWidth, appHeight;
Boolean SongLooping=false;
Minim minim;
AudioPlayer song1;
//
void setup() {
  //
  size(1200, 1000);
  appWidth = width;
  appHeight = height;
  //
  minim = new Minim(this);
  String path = "../Audio Files/";
  String Luxery = "Luxery.mp3";
  String extension = ".mp3";
  String Pathway = sketchPath(path + Luxery);
  //
  xRectBackground = appWidth*0;
  yRectBackground = appHeight*0;
  widthRectBackground = appWidth-1;
  heightRectBackground = appHeight-1;
  //
  song1 = minim.loadFile(Pathway);
  //
} //End setup
//
void draw() {
  //
  rect(xRectBackground, yRectBackground, widthRectBackground, heightRectBackground);
  //
} //End draw
//
void keyPressed() {
  //
  int LoopNumber = 0;
  if (key=='F' || key=='f') song1.play();
  if (key=='L' || key=='l') SongLooping=true;
  if (key=='R' || key=='r') SongLooping=false;
  if (SongLooping=true) song1.loop(LoopNumber);
  if (SongLooping=false) stop();
  //
} //End keyPressed
void keyReleased() {
  //
  if (SongLooping=false) stop();
  //
}
void mousePressed() {} //End mousePressed
//
//End MAIN Program
