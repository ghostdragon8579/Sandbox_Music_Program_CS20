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
float xPlayPause, yPlayPause, widthPlayPause, heightPlayPause;
float xText, yText, widthText, heightText;
PImage NeonBackground;
PImage PlayButton;
PFont TitleFont;
color resetDefaultInk=#FFFFFF;
color DarkRed=#AA021B;
int appWidth, appHeight;
int size;
int SongNumber = 2;
int SoundEffectNumber = 0;
Boolean SongLooping=false;
Minim minim;
AudioPlayer song1;
AudioPlayer[] song = new AudioPlayer[SongNumber];
AudioPlayer[] soundEffect = new AudioPlayer[SoundEffectNumber];
AudioMetaData[] songMetaData = new AudioMetaData[SongNumber];
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
  String PlayImage = "play.png";
  NeonBackground = loadImage(Imagepathway + ImageFolder + open + NeonImage);
  PlayButton = loadImage(Imagepathway + ImageFolder + open + PlayImage);
  //
  xRectBackground = appWidth*0;
  yRectBackground = appHeight*0;
  widthRectBackground = appWidth-1;
  heightRectBackground = appHeight-1;
  //
  xPlayPause = appWidth*6/13;
  yPlayPause = appHeight*9/13;
  widthPlayPause = appWidth*1/13;
  heightPlayPause = appHeight*1/11;
  //
  xText = appWidth*1/5;
  yText = appHeight*1/5;
  widthText = appWidth*3/5;
  heightText = appHeight*1/5;
  //
  song[0] = minim.loadFile(Pathway);
  songMetaData[0] = song[0].getMetaData();
  //
  println("File Name", songMetaData[0].fileName()); //Data Verified
  println("Song Length (in milliseconds)", songMetaData[0].length());
  println("Song Length (in seconds)", songMetaData[0].length()/1000);
  println("Song Length (in minutes and seconds)", songMetaData[0].length()/1000/60, "minutes", songMetaData[0].length()/1000 - ((songMetaData[0].length()/1000/60)*60), "seconds");
  println("Song Title", songMetaData[0].title());
  println("Author", songMetaData[0].author());
  println("Composer", songMetaData[0].composer());
  println("Orchestra", songMetaData[0].orchestra());
  println("Album", songMetaData[0].album());
  println("Disc", songMetaData[0].disc());
  println("Publisher", songMetaData[0].publisher());
  println("Date Released", songMetaData[0].date());
  println("Copyright", songMetaData[0].copyright());
  println("Comments", songMetaData[0].comment());
  println("Lyrics", songMetaData[0].lyrics());
  println("Track", songMetaData[0].track());
  println("Genre", songMetaData[0].genre());
  println("Encoded", songMetaData[0].encoded());
  //
  TitleFont = createFont("Times New Roman Bold", 55);
  //
} //End setup
//
void draw() {
  //
  rect(xRectBackground, yRectBackground, widthRectBackground, heightRectBackground);
  image(NeonBackground, xRectBackground, yRectBackground, widthRectBackground, heightRectBackground);
  rect(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
  image(PlayButton, xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
  rect(xText, yText, widthText, heightText);
  if ( song[0].isLooping() && song[0].loopCount()!=-1 ) println("There are", song1.loopCount(), "loops left.");
  if ( song[0].isLooping() && song[0].loopCount()==-1 ) println("Looping Infinitely");
  if ( song[0].isPlaying() && !song[0].isLooping() ) println("Play Once");
  //
  fill(DarkRed);
  textAlign(CENTER, CENTER); 
  size = 120;
  textFont(TitleFont, size); 
  text(songMetaData[0].title(), xText, yText, widthText, heightText);
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
  if (SongLooping==true) song[0].loop(LoopNumber);
  //
    if ( key=='1' || key=='9' ) {
    String keystr = String.valueOf(key);
    println(keystr);
    int loopNum = int(keystr);
    song[0].loop(loopNum);   
    //
    }
    if (key=='m' || key=='M') {
    if (song[0].isMuted() && (key=='m' || key=='M') ) {
     if (song[0].isPlaying()) song[0].unmute();
    } else { 
     if (song[0].isPlaying()) song[0].mute();
    }
    }
    //
    if (key=='P' || key=='p'); {
      if (song[0].isPlaying()) {
      song[0].pause();
    } else {
      song[0].play(song[0].position());
    }
    }
    //
    if (key=='R' || key=='r'); {
      if (song[0].isPlaying()) {
      song[0].rewind();
    }
    }
    //
    if (key=='T' || key=='t'); song[0].skip(song1.position()+1000);
    if (key=='Y' || key=='y'); song[0].skip(song1.position()-1000);
    if (key=='F' || key=='f'); song[0].play();
    //
} //End keyPressed
void keyReleased() {
  //
}
void mousePressed() {} //End mousePressed
//
//End MAIN Program
