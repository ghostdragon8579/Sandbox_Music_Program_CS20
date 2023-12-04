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
//int appWidth, appHeight;
Minim minim;
AudioPlayer song1;
//
void setup() {
  //
  //size(1200, 1000);
  //appWidth = width;
  //appHeight = height;
  //
  minim = new Minim(this);
  String pathway = "../Audio Files/";
  String Luxery = "Luxery.mp3";
  String extension = ".mp3";
  song1 = minim.loadFile(pathway + Luxery);
  //
} //End setup
//
void draw() {} //End draw
//
void keyPressed() {
  //
  song1.loop(0);
  //
} //End keyPressed
//
void mousePressed() {} //End mousePressed
//
//End MAIN Program
