//Libraries
//
import java.io.*;
//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
float xBackground, yBackground, widthBackground, heightBackground;
float xActivationButton, yActivationButton, widthActivationButton, heightActivationButton;
int appWidth, appHeight;
int size;
//
void setup() {
  //
  size(1200, 800);
  appWidth = width;
  appHeight = height;
  //
  //ActivationButton
  xBackground = appWidth*0; yBackground = appHeight*0; widthBackground = appWidth-1; heightBackground = appHeight-1;
  xActivationButton = appWidth*9/20; yActivationButton = appHeight*9/20; widthActivationButton = appWidth*1/10; heightActivationButton = widthActivationButton;
  //
  MusicPlayerSetup();
  //
} //End setup
//
void draw() {
  //
  shapeMode(CENTER);
  //
  if (MusicPlayerPopup==true) {
  MusicPlayerDraw();
  } else {
    rect(xBackground, yBackground, widthBackground, heightBackground);
    rect(xActivationButton, yActivationButton, widthActivationButton, heightActivationButton);
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
  if (mouseX>xActivationButton && mouseX<xActivationButton+widthActivationButton && mouseY>yActivationButton && mouseY<yActivationButton+heightActivationButton) {
    if (MusicPlayerPopup==true) {
      MusicPlayerPopup=false;
    } else {
      MusicPlayerPopup=true;
    }
  }
  //
  if (MusicPlayerPopup==true) {
    MusicPlayerMousePressed();
  } else {
    println("Music is no longer playing");
  }
  //
} //End mousePressed
//
//End MAIN Program
