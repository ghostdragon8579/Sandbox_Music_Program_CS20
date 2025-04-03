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
float xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground;
float xMusicPanel, yMusicPanel, widthMusicPanel, heightMusicPanel;
float xMusicTitle, yMusicTitle, widthMusicTitle, heightMusicTitle;
float xMusicAuthor, yMusicAuthor, widthMusicAuthor, heightMusicAuthor;
float xMusicPublishDate, yMusicPublishDate, widthMusicPublishDate, heightMusicPublishDate;
float xMusicImage, yMusicImage, widthMusicImage, heightMusicImage;
float xPlayPause, yPlayPause, widthPlayPause, heightPlayPause;
float xFastForward, yFastForward, widthFastForward, heightFastForward;
float xRewind, yRewind, widthRewind, heightRewind;
float xNext, yNext, widthNext, heightNext;
float xPrevious, yPrevious, widthPrevious, heightPrevious;
float xQuit, yQuit, widthQuit, heightQuit;
PImage NeonBackground2;
PImage PlayButton, PauseButton;
PImage FastForward, Rewind;
PImage Next, Previous;
PImage Quit;
PFont TitleFont;
color resetDefaultInk=#FFFFFF;
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
  size(1200, 800);
  appWidth = width;
  appHeight = height;
  //
  minim = new Minim(this);
  String up = "..";
  String open = "/";
  String ImageFolder = "Music_Program_Images";
  String Imagepathway = up + open;
  String NeonImage2 = "NeonBackground2.jpg";
  String QuitImage = "exit.png";
  NeonBackground2 = loadImage(Imagepathway + ImageFolder + open + NeonImage2);
  Quit = loadImage(Imagepathway + ImageFolder + open + QuitImage);
  //
  //Background
  xPopupBackground = appWidth*0; yPopupBackground = appHeight*0; widthPopupBackground = appWidth-1; heightPopupBackground = appHeight-1;
  //
  //Music Panel
  xMusicPanel = appWidth*2/27; yMusicPanel = appHeight*1/10; widthMusicPanel = appWidth*23/27; heightMusicPanel = appHeight*4/5;
  xMusicTitle = appWidth*2/7; yMusicTitle = appHeight*3/20; widthMusicTitle = appWidth*3/7; heightMusicTitle = appHeight*1/11;
  xMusicAuthor = appWidth*1/3; yMusicAuthor = yMusicTitle+heightMusicTitle; widthMusicAuthor = appWidth*1/3; heightMusicAuthor = appHeight*1/18;
  xMusicPublishDate = xMusicAuthor; yMusicPublishDate = yMusicAuthor+heightMusicAuthor; widthMusicPublishDate = widthMusicAuthor; heightMusicPublishDate = heightMusicAuthor;
  xMusicImage = appWidth*1/3; yMusicImage = yMusicPublishDate+heightMusicPublishDate; widthMusicImage = appWidth*1/3; heightMusicImage = appHeight*1/6;
  //
  //Buttons
  xQuit = appWidth*15/16; yQuit = appHeight*0; widthQuit = appWidth*1/16; heightQuit = appHeight*1/24;
  xPrevious = appWidth*5/26; yPrevious = appHeight*24/40; widthPrevious = appWidth*1/26; heightPrevious = widthPrevious;
  xRewind = appWidth*9/26; yRewind = yPrevious; widthRewind = widthPrevious; heightRewind = heightPrevious;
  xPlayPause = appWidth*25/52; yPlayPause = yPrevious; widthPlayPause = widthPrevious; heightPlayPause = heightPrevious;
  xFastForward = appWidth*16/26; yFastForward = yPlayPause; widthFastForward = widthPlayPause; heightFastForward = heightPlayPause;
  xNext = appWidth*20/26; yNext = yPrevious; widthNext = widthPrevious; heightNext = heightPrevious;
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
  println("File Name", SongPlayListMetaData[SongPlaying].fileName());
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
  println(SongPlaying);
  //
  TitleFont = createFont("Times New Roman Bold", 55);
  //
} //End setup
void draw() {
  //
  shapeMode(CENTER);
  //
  //Background
  fill(Black);
  rect(xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground);
  image(NeonBackground2, xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground);
  fill(resetDefaultInk);
  //
  //Music Player Panel
  rect(xMusicPanel, yMusicPanel, widthMusicPanel, heightMusicPanel);
  rect(xMusicTitle, yMusicTitle, widthMusicTitle, heightMusicTitle);
  rect(xMusicAuthor, yMusicAuthor, widthMusicAuthor, heightMusicAuthor);
  rect(xMusicPublishDate, yMusicPublishDate, widthMusicPublishDate, heightMusicPublishDate);
  rect(xMusicImage, yMusicImage, widthMusicImage, heightMusicImage);
  //
  //Buttons
  rect(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
  rect(xFastForward, yFastForward, widthFastForward, heightFastForward);
  rect(xRewind, yRewind, widthRewind, heightRewind);
  rect(xNext, yNext, widthNext, heightNext);
  rect(xPrevious, yPrevious, widthPrevious, heightPrevious);
  rect(xQuit, yQuit, widthQuit, heightQuit);
  //
  //Button Images
  image(Quit, xQuit, yQuit, widthQuit, heightQuit);
  //
  //Music MetaData Display
  fill(Black);
  textAlign(CENTER, CENTER); 
  size = 50;
  textFont(TitleFont, size); 
  text(SongPlayListMetaData[SongPlaying].title(), xMusicTitle, yMusicTitle, widthMusicTitle, heightMusicTitle);
  fill(resetDefaultInk);
  //
  fill(Black);
  textAlign(CENTER, CENTER);
  size = 25;
  textFont(TitleFont, size); 
  text("Author: "+SongPlayListMetaData[SongPlaying].author(), xMusicAuthor, yMusicAuthor, widthMusicAuthor, heightMusicAuthor);
  fill(resetDefaultInk);
  //
  fill(Black);
  textAlign(CENTER, CENTER);
  size = 25;
  textFont(TitleFont, size); 
  text("Released in: "+SongPlayListMetaData[SongPlaying].date(), xMusicPublishDate, yMusicPublishDate, widthMusicPublishDate, heightMusicPublishDate);
  fill(resetDefaultInk);
  //
  Music_Program_CS20_HoverOverColors ();
  //
} //End draw
//
void keyPressed() {
  //
} //End keyPressed
//
void mousePressed() {
  //
} //End mousePressed
//
//End MAIN Program
