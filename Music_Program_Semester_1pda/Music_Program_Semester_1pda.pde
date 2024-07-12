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
float xRectBackground, yRectBackground, widthRectBackground, heightRectBackground;
float xPlayPause, yPlayPause, widthPlayPause, heightPlayPause;
float xFastForward, yFastForward, widthFastForward, heightFastForward;
float xRewind, yRewind, widthRewind, heightRewind;
float xNext, yNext, widthNext, heightNext;
float xPrevious, yPrevious, widthPrevious, heightPrevious;
float xShuffle, yShuffle, widthShuffle, heightShuffle;
float xText, yText, widthText, heightText;
float xAuthor, yAuthor, widthAuthor, heightAuthor;
float xRelease, yRelease, widthRelease, heightRelease;
PImage NeonBackground;
PImage PlayButton, PauseButton;
PImage FastForward, Rewind;
PImage Next, Previous;
PImage Shuffle;
PFont TitleFont;
color resetDefaultInk=#FFFFFF;
color DarkRed=#AA021B;
color Gray=#C9C9C9;
color LightGray=#BCBCBC;
color Black=#000000;
int appWidth, appHeight;
int size;
int SongPlaying = 0;
int SongNumber = 6;
int SoundEffectNumber = 1;
int SoundEffectPlaying = 0;
File file;
File AudioFiles;
File SoundEffectFiles;
Minim minim;
AudioPlayer song1;
AudioPlayer[] Song = new AudioPlayer[SongNumber];
AudioPlayer[] SongPlayList = new AudioPlayer[SongNumber];
AudioMetaData[] SongMetaData = new AudioMetaData[SongNumber];
AudioMetaData[] SongPlayListMetaData = new AudioMetaData[SongNumber];
AudioPlayer[] SoundEffect = new AudioPlayer[SoundEffectNumber];
AudioPlayer[] SoundEffectPlayList = new AudioPlayer[SoundEffectNumber];
AudioMetaData[] SoundEffectMetaData = new AudioMetaData[SoundEffectNumber];
AudioMetaData[] SoundEffectPlayListMetaData = new AudioMetaData[SoundEffectNumber];
//
void setup() {
  //
  size(1200, 1000);
  appWidth = width;
  appHeight = height;
  //
  minim = new Minim(this);
  String up = "..";
  String open = "/";
  String ImageFolder = "Images2";
  String Imagepathway = up + open;
  String NeonImage = "NeonBackground.jpg";
  String PlayImage = "play.png";
  String PauseImage = "pause.png";
  String FastForwardImage = "FastForward.png";
  String RewindImage = "FastRewind.png";
  String NextImage = "skip.png";
  String PreviousImage = "prev.png";
  String ShuffleImage = "Shuffle.png";
  NeonBackground = loadImage(Imagepathway + ImageFolder + open + NeonImage);
  PlayButton = loadImage(Imagepathway + ImageFolder + open + PlayImage);
  PauseButton = loadImage(Imagepathway + ImageFolder + open + PauseImage);
  FastForward = loadImage(Imagepathway + ImageFolder + open + FastForwardImage);
  Rewind = loadImage(Imagepathway + ImageFolder + open + RewindImage);
  Next = loadImage(Imagepathway + ImageFolder + open + NextImage);
  Previous = loadImage(Imagepathway + ImageFolder + open + PreviousImage);
  Shuffle = loadImage(Imagepathway + ImageFolder + open + ShuffleImage);
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
  xFastForward = appWidth*8/13;
  yFastForward = yPlayPause;
  widthFastForward = widthPlayPause;
  heightFastForward = heightPlayPause;
  //
  xRewind = appWidth*4/13;
  yRewind = yPlayPause;
  widthRewind = widthPlayPause;
  heightRewind = heightPlayPause;
  //
  xNext = appWidth*10/13;
  yNext = yPlayPause;
  widthNext = widthPlayPause;
  heightNext = heightPlayPause;
  //
  xPrevious = appWidth*2/13;
  yPrevious = yPlayPause;
  widthPrevious = widthPlayPause;
  heightPrevious = heightPlayPause;
  //
  xShuffle = xPlayPause;
  yShuffle = appHeight*11/13;
  widthShuffle = widthPlayPause;
  heightShuffle = heightPlayPause;
  //
  xText = appWidth*1/5;
  yText = appHeight*1/5;
  widthText = appWidth*3/5;
  heightText = appHeight*1/6;
  //
  xAuthor = appWidth*3/10;
  yAuthor = appHeight*11/30;
  widthAuthor = appWidth*4/10;
  heightAuthor = appHeight*1/16;
  //
  xRelease = xAuthor;
  yRelease = appHeight*11/30+appHeight*1/16;
  widthRelease = widthAuthor;
  heightRelease = heightAuthor;
  //
  String RelativeMusicPathway = "../Audio Files/";
  String AbsoluteMusicPathway = sketchPath(RelativeMusicPathway);
    AudioFiles = new File(AbsoluteMusicPathway);
  int AudioFileCount = AudioFiles.list().length;
    File[] SongFiles = AudioFiles.listFiles();
  String[] SongFilePathway = new String[AudioFileCount];
  for (int i = SongPlaying; i < SongFiles.length; i++) {
    SongFilePathway[i] = (SongFiles[i].toString());
  }
  //
  String PathDirectory = sketchPath(AbsoluteMusicPathway);
  println("Main Directory to Music Folder", PathDirectory);
  file = new File(PathDirectory);
  int fileCount = file.list().length;
  println("File Count of the Music Folder:", fileCount);
  File[] files = file.listFiles();
  printArray(files);
  for (int i = SongPlaying; i < files.length; i++) {
    println("File Name", files[i].getName());
  }
  //
    for (int i=SongPlaying; i<AudioFileCount; i++) {
    SongPlayList[i]= minim.loadFile(SongFilePathway[i]);
    SongPlayListMetaData[i] = SongPlayList[i].getMetaData();
  }
  //
  String RelativeSoundEffectPathway = "../Sound Effects/";
  String AbsoluteSoundEffectPathway = sketchPath(RelativeSoundEffectPathway);
    SoundEffectFiles = new File(AbsoluteSoundEffectPathway);
  int SoundEffectFileCount = SoundEffectFiles.list().length;
    File[] SoundEffectfiles2 = SoundEffectFiles.listFiles();
  String[] SoundEffectFilePathway = new String[SoundEffectFileCount];
  for (int i = SoundEffectPlaying; i < SoundEffectfiles2.length; i++) {
    SoundEffectFilePathway[i] = (SoundEffectfiles2[i].toString());
  }
  //
  String SoundEffectPathDirectory = sketchPath(AbsoluteSoundEffectPathway);
  println("Main Directory to Sound Effect Folder", SoundEffectPathDirectory);
  file = new File(SoundEffectPathDirectory);
  int SoundEffectfileCount = file.list().length;
  println("File Count of the Sound Effect Folder:", SoundEffectfileCount);
  File[] SoundEffectfiles = file.listFiles();
  for (int i = SoundEffectPlaying; i < SoundEffectfiles.length; i++) {
    println("File Name", SoundEffectfiles[i].getName());
  }
  //
    for (int i=SoundEffectPlaying; i<SoundEffectFileCount; i++) {
    SoundEffectPlayList[i]= minim.loadFile(SoundEffectFilePathway[i]);
    SoundEffectPlayListMetaData[i] = SoundEffectPlayList[i].getMetaData();
  }
  //
  println("File Name", SongPlayListMetaData[SongPlaying].fileName()); //Data Verified
  println("Song Length (in milliseconds)", SongPlayListMetaData[SongPlaying].length());
  println("Song Length (in seconds)", SongPlayListMetaData[SongPlaying].length()/1000);
  println("Song Length (in minutes and seconds)", SongPlayListMetaData[SongPlaying].length()/1000/60, "minutes", SongPlayListMetaData[SongPlaying].length()/1000 - ((SongPlayListMetaData[SongPlaying].length()/1000/60)*60), "seconds");
  println("Song Title", SongPlayListMetaData[SongPlaying].title());
  println("Author", SongPlayListMetaData[SongPlaying].author());
  println("Composer", SongPlayListMetaData[SongPlaying].composer());
  println("Orchestra", SongPlayListMetaData[SongPlaying].orchestra());
  println("Album", SongPlayListMetaData[SongPlaying].album());
  println("Disc", SongPlayListMetaData[SongPlaying].disc());
  println("Publisher", SongPlayListMetaData[SongPlaying].publisher());
  println("Date Released", SongPlayListMetaData[SongPlaying].date());
  println("Copyright", SongPlayListMetaData[SongPlaying].copyright());
  println("Comments", SongPlayListMetaData[SongPlaying].comment());
  println("Lyrics", SongPlayListMetaData[SongPlaying].lyrics());
  println("Track", SongPlayListMetaData[SongPlaying].track());
  println("Genre", SongPlayListMetaData[SongPlaying].genre());
  println("Encoded", SongPlayListMetaData[SongPlaying].encoded());
  //
  //println("Effect Length", SoundEffectPlayListMetaData[SoundEffectPlaying].length());
  //
  println(SongPlaying);
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
  rect(xFastForward, yFastForward, widthFastForward, heightFastForward);
  rect(xRewind, yRewind, widthRewind, heightRewind);
  rect(xNext, yNext, widthNext, heightNext);
  rect(xPrevious, yPrevious, widthPrevious, heightPrevious);
  rect(xShuffle, yShuffle, widthShuffle, heightShuffle);
  fill(Black);
  rect(xAuthor, yAuthor, widthAuthor, heightAuthor);
  rect(xRelease, yRelease, widthRelease, heightRelease);
  rect(xText, yText, widthText, heightText);
  fill(resetDefaultInk);
  //
  if (SongPlaying<SongNumber-SongNumber) {
      SongPlaying=SongNumber-1;
    } else if (SongPlaying>SongNumber+1) {
      SongPlaying=SongNumber-SongNumber;
    } else {
    }
  //
  fill(resetDefaultInk);
  textAlign(CENTER, CENTER); 
  size = 97;
  textFont(TitleFont, size); 
  text(SongPlayListMetaData[SongPlaying].title(), xText, yText, widthText, heightText);
  fill(resetDefaultInk);
  //
  fill(resetDefaultInk);
  textAlign(CENTER, CENTER); 
  size = 40;
  textFont(TitleFont, size); 
  text("Author: "+SongPlayListMetaData[SongPlaying].author(), xAuthor, yAuthor, widthAuthor, heightAuthor);
  fill(resetDefaultInk);
  //
  fill(resetDefaultInk);
  textAlign(CENTER, CENTER); 
  size = 40;
  textFont(TitleFont, size); 
  text("Released in: "+SongPlayListMetaData[SongPlaying].date(), xRelease, yRelease, widthRelease, heightRelease);
  fill(resetDefaultInk);
  //
  color hoverOverColor=resetDefaultInk;
  if (mouseX>xPlayPause && mouseX<xPlayPause+widthPlayPause && mouseY>yPlayPause && mouseY<yPlayPause+heightPlayPause) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
    fill(resetDefaultInk);
  } else if (mouseX>xShuffle && mouseX<xShuffle+widthShuffle && mouseY>yShuffle && mouseY<yShuffle+heightShuffle) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xShuffle, yShuffle, widthShuffle, heightShuffle);
    fill(resetDefaultInk);
  } else if (mouseX>xFastForward && mouseX<xFastForward+widthFastForward && mouseY>yFastForward && mouseY<yFastForward+heightFastForward) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xFastForward, yFastForward, widthFastForward, heightFastForward);
    fill(resetDefaultInk);
  } else if (mouseX>xRewind && mouseX<xRewind+widthRewind && mouseY>yRewind && mouseY<yRewind+heightRewind) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xRewind, yRewind, widthRewind, heightRewind);
    fill(resetDefaultInk);
  } else if (mouseX>xNext && mouseX<xNext+widthNext && mouseY>yNext && mouseY<yNext+heightNext) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xNext, yNext, widthNext, heightNext);
    fill(resetDefaultInk);
  } else if (mouseX>xPrevious && mouseX<xPrevious+widthPrevious && mouseY>yPrevious && mouseY<yPrevious+heightPrevious) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xPrevious, yPrevious, widthPrevious, heightPrevious);
    fill(resetDefaultInk);
  }
  //
  image(PlayButton, xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
  image(FastForward, xFastForward, yFastForward, widthFastForward, heightFastForward);
  image(Rewind, xRewind, yRewind, widthRewind, heightRewind);
  image(Next, xNext, yNext, widthNext, heightNext);
  image(Previous, xPrevious, yPrevious, widthPrevious, heightPrevious);
  image(Shuffle, xShuffle, yShuffle, widthShuffle, heightShuffle);
  //
} //End draw
//
void keyPressed() {
    //
    if (key=='m' || key=='M') {
    if (SongPlayList[SongPlaying].isMuted() && (key=='m' || key=='M') ) {
     if (SongPlayList[SongPlaying].isPlaying()) SongPlayList[SongPlaying].unmute();
    } else { 
     if (SongPlayList[SongPlaying].isPlaying()) SongPlayList[SongPlaying].mute();
    }
    }
    //
    if (key==CODED && keyCode == LEFT || keyCode == RIGHT) {
    if (key==CODED && keyCode == RIGHT) SongPlayList[SongPlaying].skip(+5000);
    if (key==CODED && keyCode == LEFT) SongPlayList[SongPlaying].skip(-5000);
    }
    //
    if (key=='F' || key=='f' && SongPlayList[SongPlaying].isPlaying()) {
      SongPlayList[SongPlaying].pause();
    } else {
      SongPlayList[SongPlaying].play(SongPlayList[SongPlaying].position());
    }
    //
    /*
    if (key=='P' || key=='p'); {
      if (SongPlayList[SongPlaying].isPlaying()) {
      SongPlayList[SongPlaying].pause();
    } else {
      SongPlayList[SongPlaying].play(SongPlayList[SongPlaying].position());
    }
    }
    //
    if (key=='R' || key=='r'); {
      if (SongPlayList[SongPlaying].isPlaying()) {
      SongPlayList[SongPlaying].rewind();
    }
    */
    //
} //End keyPressed
void keyReleased() {
  //
}
void mousePressed() {
  //
  if (mouseX>xPlayPause && mouseX<xPlayPause+widthPlayPause && mouseY>yPlayPause && mouseY<yPlayPause+heightPlayPause && SongPlayList[SongPlaying].isPlaying()) {
      SongPlayList[SongPlaying].pause();
    } else {
      SongPlayList[SongPlaying].play(SongPlayList[SongPlaying].position());
    }
  if (mouseX>xNext && mouseX<xNext+widthNext && mouseY>yNext && mouseY<yNext+heightNext) {
    SoundEffectPlayList[SoundEffectPlaying].rewind();
    SoundEffectPlayList[SoundEffectPlaying].skip(+1441);
    SoundEffectPlayList[SoundEffectPlaying].play();
    SongPlayList[SongPlaying].pause();
    SongPlayList[SongPlaying].rewind();
    SongPlaying+=1;
    if (SongPlaying<0) {
      SongPlaying=5;
    } else if (SongPlaying>5) {
      SongPlaying=0;
    } else {
    }
    SongPlayList[SongPlaying].play();
  }
  if (mouseX>xPrevious && mouseX<xPrevious+widthPrevious && mouseY>yPrevious && mouseY<yPrevious+heightPrevious) {
    SoundEffectPlayList[SoundEffectPlaying].rewind();
    SoundEffectPlayList[SoundEffectPlaying].skip(+1441);
    SoundEffectPlayList[SoundEffectPlaying].play();
    SongPlayList[SongPlaying].pause();
    SongPlayList[SongPlaying].rewind();
    SongPlaying-=1;
    if (SongPlaying<0) {
      SongPlaying=5;
    } else if (SongPlaying>5) {
      SongPlaying=0;
    } else {
    }
    SongPlayList[SongPlaying].play();
  }
  if (mouseX>xFastForward && mouseX<xFastForward+widthFastForward && mouseY>yFastForward && mouseY<yFastForward+heightFastForward) {
  SoundEffectPlayList[SoundEffectPlaying].rewind();
  SoundEffectPlayList[SoundEffectPlaying].skip(+1441);
  SoundEffectPlayList[SoundEffectPlaying].play();
  SongPlayList[SongPlaying].skip(+5000);
  }
  if (mouseX>xRewind && mouseX<xRewind+widthRewind && mouseY>yRewind && mouseY<yRewind+heightRewind) {
  SoundEffectPlayList[SoundEffectPlaying].rewind();
  SoundEffectPlayList[SoundEffectPlaying].skip(+1441);
  SoundEffectPlayList[SoundEffectPlaying].play();
  SongPlayList[SongPlaying].skip(-5000);
  }
  if (mouseX>xShuffle && mouseX<xShuffle+widthShuffle && mouseY>yShuffle && mouseY<yShuffle+heightShuffle) {
    SoundEffectPlayList[SoundEffectPlaying].rewind();
    SoundEffectPlayList[SoundEffectPlaying].skip(+1441);
    SoundEffectPlayList[SoundEffectPlaying].play();
    SongPlayList[SongPlaying].pause();
    SongPlayList[SongPlaying].rewind();
    SongPlaying=int (random(0, SongNumber));
    SongPlayList[SongPlaying].play();
  }
  //
} //End mousePressed
  //
void mouseReleased() {
  //
}
//
//End MAIN Program
