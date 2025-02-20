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
  String PlayImage = "play.png";
  String PauseImage = "pause.png";
  String FastForwardImage = "FastForward.png";
  String RewindImage = "FastRewind.png";
  String NextImage = "skip.png";
  String PreviousImage = "prev.png";
  String QuitImage = "exit.png";
  NeonBackground2 = loadImage(Imagepathway + ImageFolder + open + NeonImage2);
  PlayButton = loadImage(Imagepathway + ImageFolder + open + PlayImage);
  PauseButton = loadImage(Imagepathway + ImageFolder + open + PauseImage);
  FastForward = loadImage(Imagepathway + ImageFolder + open + FastForwardImage);
  Rewind = loadImage(Imagepathway + ImageFolder + open + RewindImage);
  Next = loadImage(Imagepathway + ImageFolder + open + NextImage);
  Previous = loadImage(Imagepathway + ImageFolder + open + PreviousImage);
  Quit = loadImage(Imagepathway + ImageFolder + open + QuitImage);
  //
  xPopupBackground = appWidth*0; yPopupBackground = appHeight*0; widthPopupBackground = appWidth-1; heightPopupBackground = appHeight-1;
  xQuit = appWidth*15/16; yQuit = appHeight*0; widthQuit = appWidth*1/16; heightQuit = appHeight*1/24;
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
  fill(Black);
  rect(xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground);
  image(NeonBackground2, xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground);
  fill(resetDefaultInk);
  rect(xQuit, yQuit, widthQuit, heightQuit);
  //
  image(Quit, xQuit, yQuit, widthQuit, heightQuit);
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
