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
float xMusicProgressBar, yMusicProgressBar, widthMusicProgressBar, heightMusicProgressBar;
float xIconAttribution, yIconAttribution, widthIconAttribution, heightIconAttribution;
float xPlayPause, yPlayPause, widthPlayPause, heightPlayPause;
float xPlayPauseTriangle1, yPlayPauseTriangle1, xPlayPauseTriangle2, yPlayPauseTriangle2, xPlayPauseTriangle3, yPlayPauseTriangle3;
float xFastForward, yFastForward, widthFastForward, heightFastForward;
float xFastForwardTriangleOne1, yFastForwardTriangleOne1, xFastForwardTriangleOne2, yFastForwardTriangleOne2, xFastForwardTriangleOne3, yFastForwardTriangleOne3;
float xFastForwardTriangleTwo1, yFastForwardTriangleTwo1, xFastForwardTriangleTwo2, yFastForwardTriangleTwo2, xFastForwardTriangleTwo3, yFastForwardTriangleTwo3;
float xRewind, yRewind, widthRewind, heightRewind;
float xRewindTriangleOne1, yRewindTriangleOne1, xRewindTriangleOne2, yRewindTriangleOne2, xRewindTriangleOne3, yRewindTriangleOne3;
float xRewindTriangleTwo1, yRewindTriangleTwo1, xRewindTriangleTwo2, yRewindTriangleTwo2, xRewindTriangleTwo3, yRewindTriangleTwo3;
float xNext, yNext, widthNext, heightNext;
float xNextTriangleOne1, yNextTriangleOne1, xNextTriangleOne2, yNextTriangleOne2, xNextTriangleOne3, yNextTriangleOne3;
float xNextTriangleTwo1, yNextTriangleTwo1, xNextTriangleTwo2, yNextTriangleTwo2, xNextTriangleTwo3, yNextTriangleTwo3;
float xPrevious, yPrevious, widthPrevious, heightPrevious;
float xPreviousTriangleOne1, yPreviousTriangleOne1, xPreviousTriangleOne2, yPreviousTriangleOne2, xPreviousTriangleOne3, yPreviousTriangleOne3;
float xPreviousTriangleTwo1, yPreviousTriangleTwo1, xPreviousTriangleTwo2, yPreviousTriangleTwo2, xPreviousTriangleTwo3, yPreviousTriangleTwo3;
float xQuit, yQuit, widthQuit, heightQuit;
float xShuffle, yShuffle, widthShuffle, heightShuffle;
float xReplay, yReplay, widthReplay, heightReplay;
float xLoop, yLoop, widthLoop, heightLoop;
float xIcons8Location;
float ProgressWidth;
PImage NeonBackground2;
PImage Quit;
PImage Shuffle;
PImage Loop;
PImage Replay;
PFont TitleFont;
color resetDefaultInk=#FFFFFF;
color Gray=#C9C9C9;
color LightGray=#CECECE;
color Black=#000000;
color Purple=#B031E8;
color TextPurple=#F986FF;
int appWidth, appHeight;
int size;
int SongNumber = 6;
int SongPlaying = SongNumber - SongNumber;
int SoundEffectNumber = 1;
int SoundEffectPlaying = 0;
int SongTimeCounter;
int SongLengthAlteration;
int AlteredCurrentSongLength;
int KeySongPosition;
int SongSkipTime;
Boolean SongLoop = false;
Boolean FastForwardHeld = false;
Boolean RewindHeld = false;
boolean FastForwardKeyHeldCheck = false;
boolean RewindKeyHeldCheck = false;
boolean MouseIsOver(float xVariable, float yVariable, float widthVariable, float heightVariable) {
  return mouseX > xVariable && mouseX < xVariable + widthVariable && mouseY > yVariable && mouseY < yVariable + heightVariable;
}
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
  String ShuffleImage = "icons8-shuffle.png";
  String LoopImage = "icons8-loop.png";
  String ReplayImage = "icons8-replay.png";
  NeonBackground2 = loadImage(Imagepathway + ImageFolder + open + NeonImage2);
  Quit = loadImage(Imagepathway + ImageFolder + open + QuitImage);
  Shuffle = loadImage(Imagepathway + ImageFolder + open + ShuffleImage);
  Loop = loadImage(Imagepathway + ImageFolder + open + LoopImage);
  Replay = loadImage(Imagepathway + ImageFolder + open + ReplayImage);
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
  xMusicProgressBar = appWidth*5/26; yMusicProgressBar = appHeight*13/16; widthMusicProgressBar = appWidth*8/13; heightMusicProgressBar = appHeight*1/48;
  xIconAttribution = xMusicPanel+appWidth*1/70; yIconAttribution = appHeight*9/10-appHeight*1/30;  widthIconAttribution = widthMusicPanel*1/3; heightIconAttribution = appHeight*1/36;
  //
  //Buttons
  xQuit = appWidth*15/16; yQuit = appHeight*0; widthQuit = appWidth*1/16; heightQuit = appHeight*1/24;
  xPrevious = appWidth*5/26; yPrevious = appHeight*24/40; widthPrevious = appWidth*1/26; heightPrevious = widthPrevious; 
  xRewind = appWidth*9/26; yRewind = yPrevious; widthRewind = widthPrevious; heightRewind = heightPrevious;
  xPlayPause = appWidth*25/52; yPlayPause = yPrevious; widthPlayPause = widthPrevious; heightPlayPause = heightPrevious;
  xFastForward = appWidth*16/26; yFastForward = yPlayPause; widthFastForward = widthPrevious; heightFastForward = heightPrevious;
  xNext = appWidth*20/26; yNext = yPrevious; widthNext = widthPrevious; heightNext = heightPrevious;
  xShuffle = xPlayPause; yShuffle = yPlayPause+heightPrevious*2; widthShuffle = widthPrevious; heightShuffle = heightPrevious;
  xReplay = xRewind; yReplay = yShuffle; widthReplay = widthPrevious; heightReplay = heightPrevious;
  xLoop = xFastForward; yLoop = yShuffle; widthLoop = widthPrevious; heightLoop = heightPrevious;
  //
  //Music Button Icons
  xPlayPauseTriangle1 = xPlayPause+widthPlayPause*1/5; yPlayPauseTriangle1 = yPlayPause+heightPlayPause*1/5;
  xPlayPauseTriangle2 = xPlayPauseTriangle1; yPlayPauseTriangle2 = yPlayPause+heightPlayPause*4/5;
  xPlayPauseTriangle3 = xPlayPause+widthPlayPause*4/5; yPlayPauseTriangle3 = yPlayPause+heightPlayPause*1/2;
  xFastForwardTriangleOne1 = xFastForward+widthFastForward*1/6; yFastForwardTriangleOne1 = yPlayPauseTriangle1;
  xFastForwardTriangleOne2 = xFastForwardTriangleOne1; yFastForwardTriangleOne2 = yPlayPauseTriangle2;
  xFastForwardTriangleOne3 = xFastForward+widthFastForward*1/2; yFastForwardTriangleOne3 = yPlayPauseTriangle3;
  xFastForwardTriangleTwo1 = xFastForwardTriangleOne3; yFastForwardTriangleTwo1 = yPlayPauseTriangle1;
  xFastForwardTriangleTwo2 = xFastForwardTriangleOne3; yFastForwardTriangleTwo2 = yPlayPauseTriangle2;
  xFastForwardTriangleTwo3 = xFastForward+widthFastForward*5/6; yFastForwardTriangleTwo3 = yPlayPauseTriangle3;
  xRewindTriangleOne1 = xRewind+widthRewind*1/6; yRewindTriangleOne1 = yPlayPauseTriangle3;
  xRewindTriangleOne2 = xRewind+widthRewind*1/2; yRewindTriangleOne2 = yPlayPauseTriangle1;
  xRewindTriangleOne3 = xRewindTriangleOne2; yRewindTriangleOne3 = yPlayPauseTriangle2;
  xRewindTriangleTwo1 = xRewindTriangleOne2; yRewindTriangleTwo1 = yPlayPauseTriangle3;
  xRewindTriangleTwo2 = xRewind+widthRewind*5/6; yRewindTriangleTwo2 = yPlayPauseTriangle1;
  xRewindTriangleTwo3 = xRewindTriangleTwo2; yRewindTriangleTwo3 = yPlayPauseTriangle2;
  xNextTriangleOne1 = xNext+widthNext*1/6; yNextTriangleOne1 = yPlayPauseTriangle1;
  xNextTriangleOne2 = xNextTriangleOne1; yNextTriangleOne2 = yPlayPauseTriangle2;
  xNextTriangleOne3 = xNext+widthNext*3/4; yNextTriangleOne3 = yPlayPauseTriangle3;
  xNextTriangleTwo1 = xNext+widthNext*5/6; yNextTriangleTwo1 = yPlayPauseTriangle1;
  xNextTriangleTwo2 = xNextTriangleTwo1; yNextTriangleTwo2 = yPlayPauseTriangle2;
  xNextTriangleTwo3 = xNextTriangleTwo1; yNextTriangleTwo3 = yPlayPauseTriangle3;
  xPreviousTriangleOne1 = xPrevious+widthPrevious*5/6; yPreviousTriangleOne1 = yPlayPauseTriangle1;
  xPreviousTriangleOne2 = xPreviousTriangleOne1; yPreviousTriangleOne2 = yPlayPauseTriangle2;
  xPreviousTriangleOne3 = xPrevious+widthPrevious*1/4; yPreviousTriangleOne3 = yPlayPauseTriangle3;
  xPreviousTriangleTwo1 = xPrevious+widthPrevious*1/6; yPreviousTriangleTwo1 = yPlayPauseTriangle1;
  xPreviousTriangleTwo2 = xPreviousTriangleTwo1; yPreviousTriangleTwo2 = yPlayPauseTriangle2;
  xPreviousTriangleTwo3 = xPreviousTriangleTwo1; yPreviousTriangleTwo3 = yPlayPauseTriangle3;
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
  xIcons8Location = xIconAttribution + textWidth("Loop, Shuffle, and Rewind icons by ");
  //
  SongSkipTime = 5000;
  SongLengthAlteration = 5000;
  AlteredCurrentSongLength = max(SongPlayList[SongPlaying].length() - SongLengthAlteration, 1);
  SongTimeCounter = 0; 
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
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  rect(xMusicPanel, yMusicPanel, widthMusicPanel, heightMusicPanel);
  rect(xMusicTitle, yMusicTitle, widthMusicTitle, heightMusicTitle);
  rect(xMusicAuthor, yMusicAuthor, widthMusicAuthor, heightMusicAuthor);
  rect(xMusicPublishDate, yMusicPublishDate, widthMusicPublishDate, heightMusicPublishDate);
  rect(xMusicImage, yMusicImage, widthMusicImage, heightMusicImage);
  noStroke();
  rect(xIconAttribution, yIconAttribution, widthIconAttribution, heightIconAttribution);
  //
  //Buttons
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  rect(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
  rect(xFastForward, yFastForward, widthFastForward, heightFastForward);
  rect(xRewind, yRewind, widthRewind, heightRewind);
  rect(xNext, yNext, widthNext, heightNext);
  rect(xPrevious, yPrevious, widthPrevious, heightPrevious);
  rect(xQuit, yQuit, widthQuit, heightQuit);
  rect(xShuffle, yShuffle, widthShuffle, heightShuffle);
  rect(xLoop, yLoop, widthLoop, heightLoop);
  rect(xReplay, yReplay, widthReplay, heightReplay);
  //
  //Music Button Icons
  stroke(TextPurple);
  fill(TextPurple);
  triangle(xPlayPauseTriangle1, yPlayPauseTriangle1, xPlayPauseTriangle2, yPlayPauseTriangle2, xPlayPauseTriangle3, yPlayPauseTriangle3);
  triangle(xFastForwardTriangleOne1, yFastForwardTriangleOne1, xFastForwardTriangleOne2, yFastForwardTriangleOne2, xFastForwardTriangleOne3, yFastForwardTriangleOne3);
  triangle(xFastForwardTriangleTwo1, yFastForwardTriangleTwo1, xFastForwardTriangleTwo2, yFastForwardTriangleTwo2, xFastForwardTriangleTwo3, yFastForwardTriangleTwo3);
  triangle(xRewindTriangleOne1, yRewindTriangleOne1, xRewindTriangleOne2, yRewindTriangleOne2, xRewindTriangleOne3, yRewindTriangleOne3);
  triangle(xRewindTriangleTwo1, yRewindTriangleTwo1, xRewindTriangleTwo2, yRewindTriangleTwo2, xRewindTriangleTwo3, yRewindTriangleTwo3);
  triangle(xNextTriangleOne1, yNextTriangleOne1, xNextTriangleOne2, yNextTriangleOne2, xNextTriangleOne3, yNextTriangleOne3);
  triangle(xNextTriangleTwo1, yNextTriangleTwo1, xNextTriangleTwo2, yNextTriangleTwo2, xNextTriangleTwo3, yNextTriangleTwo3);
  triangle(xPreviousTriangleOne1, yPreviousTriangleOne1, xPreviousTriangleOne2, yPreviousTriangleOne2, xPreviousTriangleOne3, yPreviousTriangleOne3);
  triangle(xPreviousTriangleTwo1, yPreviousTriangleTwo1, xPreviousTriangleTwo2, yPreviousTriangleTwo2, xPreviousTriangleTwo3, yPreviousTriangleTwo3);
  strokeWeight(1);
  stroke(Black);
  fill(resetDefaultInk);
  //
  //Images
  image(Quit, xQuit, yQuit, widthQuit, heightQuit);
  image(Shuffle, xShuffle, yShuffle, widthShuffle, heightShuffle);
  image(Loop, xLoop, yLoop, widthLoop, heightLoop);
  image(Replay, xReplay, yReplay, widthReplay, heightReplay);
  //
  //Music MetaData Display
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  size = 50;
  textFont(TitleFont, size);
  text(SongPlayListMetaData[SongPlaying].title(), xMusicTitle, yMusicTitle, widthMusicTitle, heightMusicTitle);
  fill(resetDefaultInk);
  //
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  size = 25;
  textFont(TitleFont, size);
  text("Author: "+SongPlayListMetaData[SongPlaying].author(), xMusicAuthor, yMusicAuthor, widthMusicAuthor, heightMusicAuthor);
  fill(resetDefaultInk);
  //
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  size = 25;
  textFont(TitleFont, size);
  text("Released in: "+SongPlayListMetaData[SongPlaying].date(), xMusicPublishDate, yMusicPublishDate, widthMusicPublishDate, heightMusicPublishDate);
  fill(resetDefaultInk);
  //
  //Icon Attribution
  fill(TextPurple);
  textAlign(LEFT, LEFT);
  size = 12;
  textFont(TitleFont, size);
  String AttributionText = "Loop, Shuffle, and Rewind icons by Icons8";
  text(AttributionText, xIconAttribution, yIconAttribution+heightIconAttribution*3/4);
  fill(resetDefaultInk);
  //
  if (MouseIsOver(xIcons8Location, yIconAttribution - appHeight*3/200, textWidth("Icons8"), appHeight*3/100)) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
  //
  //Song Auto Transition
  if (SongPlayList[SongPlaying].position() >= AlteredCurrentSongLength && SongLoop == false) {
    SongPlaying += 1;
    if (SongPlaying > SongNumber - 1) {
    SongPlaying = 0;
    }
    SongPlayList[SongPlaying].play();
    } else if (SongPlayList[SongPlaying].position() >= AlteredCurrentSongLength && SongLoop == true) {
    SongPlayList[SongPlaying].rewind();
  }
  //
  //Progress Bar and Progress Timer
  Music_Program_CS20_ProgressBar ();
  Music_Program_CS20_ProgressTimer ();
  //
  Music_Program_CS20_HoverOverColors ();
  //
} //End draw
//
void keyPressed() {
  //
  if (key=='p' || key=='P') {
    if (SongPlayList[SongPlaying].isPlaying()) {
      SongPlayList[SongPlaying].pause();
    } else {
    if (SongPlayList[SongPlaying].position() == 0) {
      SongPlayList[SongPlaying].play();
    } else {
      SongPlayList[SongPlaying].play(SongPlayList[SongPlaying].position());
      }
    }
  }
  if (key=='r' || key=='R') {
    SongPlayList[SongPlaying].rewind();
  }
  if (key == CODED && keyCode == RIGHT) {
    SongPlayList[SongPlaying].skip(+SongSkipTime);
  }
  if (key == CODED && keyCode == LEFT) {
    SongPlayList[SongPlaying].skip(-SongSkipTime);
  }
  if (key >= '1' && key <= '9') {
    KeySongPosition = int(SongPlayList[SongPlaying].length() * (key - '0') * 0.1) - 5000;
    SongPlayList[SongPlaying].cue(max(KeySongPosition, 0));
  }
  //
} //End keyPressed
//
void keyReleased() {
  //
  //Key Held Reset
  if (key == CODED && keyCode == RIGHT) {
    FastForwardKeyHeldCheck = false;
    FastForwardHeld = false;
  }
  if (key == CODED && keyCode == LEFT) {
    RewindKeyHeldCheck = false;
    RewindHeld = false;
  }
  //
} //End keyReleased
//
void mousePressed() {
  //
  //Icon Attribution
  if (MouseIsOver(xIcons8Location, yIconAttribution - appHeight * 3 / 200, textWidth("Icons8"), appHeight * 3 / 100)) {
    link("https://icons8.com/");
  }
  //
  //Buttons
  if (MouseIsOver(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause)) {
    PlayPauseFunction();
  } else if (MouseIsOver(xNext, yNext, widthNext, heightNext)) {
    NextSongFunction();
  } else if (MouseIsOver(xPrevious, yPrevious, widthPrevious, heightPrevious)) {
    PreviousSongFunction();
  } else if (MouseIsOver(xFastForward, yFastForward, widthFastForward, heightFastForward)) {
    SongPlayList[SongPlaying].skip(SongSkipTime);
  } else if (MouseIsOver(xRewind, yRewind, widthRewind, heightRewind)) {
    SongPlayList[SongPlaying].skip(-SongSkipTime);
  } else if (MouseIsOver(xReplay, yReplay, widthReplay, heightReplay)) {
    SongPlayList[SongPlaying].rewind();
  } else if (MouseIsOver(xShuffle, yShuffle, widthShuffle, heightShuffle)) {
    ShuffleSongFunction();
  } else if (MouseIsOver(xLoop, yLoop, widthLoop, heightLoop)) {
      SongLoop = true;
    } else if (SongLoop == true) {
      SongLoop = false;
  } else if (MouseIsOver(xQuit, yQuit, widthQuit, heightQuit)) {
    exit();
  }
  //
} //End mousePressed
//
//End MAIN Program
