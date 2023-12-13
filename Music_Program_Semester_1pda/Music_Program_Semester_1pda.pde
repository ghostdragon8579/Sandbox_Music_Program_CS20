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
float xText, yText, widthText, heightText;
PImage NeonBackground;
PFont TitleFont;
color resetDefaultInk=#FFFFFF;
color DarkRed=#AA021B;
int appWidth, appHeight;
int size;
Boolean SongLooping=false;
Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer soundEffect1;
AudioMetaData songMetaData1;
//
void setup() {
  //
  size(1200, 1000);
  appWidth = width;
  appHeight = height;
  //
  minim = new Minim(this);
  String Path = "../Audio Files/";
  String Eureka = "Eureka.mp3";
  String Pathway = sketchPath(Path + Eureka);
  String up = "..";
  String open = "/";
  String ImageFolder = "Images2";
  String Imagepathway = up + open;
  String NeonImage = "NeonBackground.jpg";
  NeonBackground = loadImage(Imagepathway + ImageFolder + open + NeonImage);
  //
  xRectBackground = appWidth*0;
  yRectBackground = appHeight*0;
  widthRectBackground = appWidth-1;
  heightRectBackground = appHeight-1;
  //
  xText = appWidth*1/5;
  yText = appHeight*2/5;
  widthText = appWidth*3/5;
  heightText = appHeight*1/5;
  //
  song1 = minim.loadFile(Pathway);
  songMetaData1 = song1.getMetaData();
  //
  println("File Name", songMetaData1.fileName()); //Data Verified
  println("Song Length (in milliseconds)", songMetaData1.length());
  println("Song Length (in seconds)", songMetaData1.length()/1000);
  println("Song Length (in minutes and seconds)", songMetaData1.length()/1000/60, "minutes", songMetaData1.length()/1000 - ((songMetaData1.length()/1000/60)*60), "seconds");
  println("Song Title", songMetaData1.title());
  println("Author", songMetaData1.author());
  println("Composer", songMetaData1.composer());
  println("Orchestra", songMetaData1.orchestra());
  println("Album", songMetaData1.album());
  println("Disc", songMetaData1.disc());
  println("Publisher", songMetaData1.publisher());
  println("Date Released", songMetaData1.date());
  println("Copyright", songMetaData1.copyright());
  println("Comments", songMetaData1.comment());
  println("Lyrics", songMetaData1.lyrics());
  println("Track", songMetaData1.track());
  println("Genre", songMetaData1.genre());
  println("Encoded", songMetaData1.encoded());
  //
  TitleFont = createFont("Times New Roman Bold", 55);
  //
} //End setup
//
void draw() {
  //
  rect(xRectBackground, yRectBackground, widthRectBackground, heightRectBackground);
  image(NeonBackground, xRectBackground, yRectBackground, widthRectBackground, heightRectBackground);
  rect(xText, yText, widthText, heightText);
  if ( song1.isLooping() && song1.loopCount()!=-1 ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isLooping() && song1.loopCount()==-1 ) println("Looping Infinitely");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  fill(DarkRed);
  textAlign(CENTER, CENTER); 
  size = 120;
  textFont(TitleFont, size); 
  text(songMetaData1.title(), xText, yText, widthText, heightText);
  fill(resetDefaultInk);
  //
  //println( "Song Position", song1.position(), "Song Length", song1.length() );
  //
} //End draw
//
void keyPressed() {
  //
  int LoopNumber = 0;
  if (key=='L' || key=='l') SongLooping=true;
  if (key=='R' || key=='r') SongLooping=false;
  if (SongLooping==true) song1.loop(LoopNumber);
  //
    if ( key=='1' || key=='9' ) {
    String keystr = String.valueOf(key);
    println(keystr);
    int loopNum = int(keystr);
    song1.loop(loopNum);   
    //
    }
    if (key=='m' || key=='M') {
    if (song1.isMuted() && (key=='m' || key=='M') ) {
     if (song1.isPlaying()) song1.unmute();
    } else { 
     if (song1.isPlaying()) song1.mute();
    }
    }
    //
    if (key=='P' || key=='p'); {
      if (song1.isPlaying()) {
      song1.pause();
    } else {
      song1.play(song1.position());
    }
    }
    //
    if (key=='R' || key=='r'); {
      if (song1.isPlaying()) {
      song1.rewind();
    }
    }
    //
    if (key=='T' || key=='t'); song1.skip(song1.position()+1000);
    if (key=='Y' || key=='y'); song1.skip(song1.position()-1000);
    if (key=='F' || key=='f'); song1.play();
    //
} //End keyPressed
void keyReleased() {
  //
}
void mousePressed() {} //End mousePressed
//
//End MAIN Program
