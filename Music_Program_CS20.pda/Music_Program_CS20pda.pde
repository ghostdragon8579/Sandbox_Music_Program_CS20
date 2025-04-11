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
  float xIcons8Location = xIconAttribution + textWidth("Loop, Shuffle, and Rewind icons by ");
  if (mouseX > xIcons8Location && mouseX < xIcons8Location + textWidth("Icons8") &&
      mouseY > yIconAttribution - appHeight*3/200 && mouseY < yIconAttribution + appHeight*3/200) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
  //
  //Song Auto Transition
  if (SongPlayList[SongPlaying].position() >= SongPlayList[SongPlaying].length() - 5000) {
    SongPlaying += 1;
    if (SongPlaying > SongNumber - 1) {
    SongPlaying = 0;
    }
    SongPlayList[SongPlaying].play();
  }
  //
  //Progress Bar
  if (SongPlayList[SongPlaying].isPlaying()) {
    SongTimeCounter=millis();
  }
  int AlteredCurrentSongLength = max(SongPlayList[SongPlaying].length() - 5000, 1);
  float ProgressWidth = map(SongPlayList[SongPlaying].position(), 0, AlteredCurrentSongLength, 0, widthMusicProgressBar);
  ProgressWidth = constrain(ProgressWidth, 0, widthMusicProgressBar);
  noStroke();
  fill(TextPurple);
  rect(xMusicProgressBar, yMusicProgressBar, ProgressWidth, heightMusicProgressBar);
  strokeWeight(4);
  stroke(Purple);
  noFill();
  rect(xMusicProgressBar, yMusicProgressBar,  widthMusicProgressBar, heightMusicProgressBar);
  strokeWeight(1);
  stroke(Black);
  fill(resetDefaultInk);
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
  if (key==CODED && keyCode == LEFT) SongPlayList[SongPlaying].skip(-5000);
  if (key==CODED && keyCode == RIGHT) SongPlayList[SongPlaying].skip(+5000);
  if (key=='1') {
    int TargetPosition1 = int(SongPlayList[SongPlaying].length() * 0.1) - 5000;
    TargetPosition1 = max(TargetPosition1, 0);
    SongPlayList[SongPlaying].cue(TargetPosition1);
  }
  if (key=='2') {
    int TargetPosition2 = int(SongPlayList[SongPlaying].length() * 0.2) - 5000;
    TargetPosition2 = max(TargetPosition2, 0);
    SongPlayList[SongPlaying].cue(TargetPosition2);
  }
  if (key=='3') {
    int TargetPosition3 = int(SongPlayList[SongPlaying].length() * 0.3) - 5000;
    TargetPosition3 = max(TargetPosition3, 0);
    SongPlayList[SongPlaying].cue(TargetPosition3);
  }
  if (key=='4') {
    int TargetPosition4 = int(SongPlayList[SongPlaying].length() * 0.4) - 5000;
    TargetPosition4 = max(TargetPosition4, 0);
    SongPlayList[SongPlaying].cue(TargetPosition4);
  }
  if (key=='5') {
    int TargetPosition5 = int(SongPlayList[SongPlaying].length() * 0.5) - 5000;
    TargetPosition5 = max(TargetPosition5, 0);
    SongPlayList[SongPlaying].cue(TargetPosition5);
  }
  if (key=='6') {
    int TargetPosition6 = int(SongPlayList[SongPlaying].length() * 0.6) - 5000;
    TargetPosition6 = max(TargetPosition6, 0);
    SongPlayList[SongPlaying].cue(TargetPosition6);
  }
  if (key=='7') {
    int TargetPosition7 = int(SongPlayList[SongPlaying].length() * 0.7) - 5000;
    TargetPosition7 = max(TargetPosition7, 0);
    SongPlayList[SongPlaying].cue(TargetPosition7);
  }
  if (key=='8') {
    int TargetPosition8 = int(SongPlayList[SongPlaying].length() * 0.8) - 5000;
    TargetPosition8 = max(TargetPosition8, 0);
    SongPlayList[SongPlaying].cue(TargetPosition8);
  }
  if (key=='9') {
    int TargetPosition9 = int(SongPlayList[SongPlaying].length() * 0.9) - 5000;
    TargetPosition9 = max(TargetPosition9, 0);
    SongPlayList[SongPlaying].cue(TargetPosition9);
  }
  //
} //End keyPressed
//
void mousePressed() {
  //
  //Icon Attribution
  float xIcons8Location = xIconAttribution + textWidth("Loop, Shuffle, and Rewind icons by ");
  if (mouseX > xIcons8Location && mouseX < xIcons8Location + textWidth("Icons8") && mouseY > yIconAttribution - appHeight*3/200 && mouseY < yIconAttribution + appHeight*3/200) {
    link("https://icons8.com/");
  }
  //
  if (mouseX>xPlayPause && mouseX<xPlayPause+widthPlayPause && mouseY>yPlayPause && mouseY<yPlayPause+heightPlayPause) {
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
  else if (mouseX>xNext && mouseX<xNext+widthNext && mouseY>yNext && mouseY<yNext+heightNext) {
    if (SongPlayList[SongPlaying].isPlaying()) {
      SongPlayList[SongPlaying].pause();
      SongPlayList[SongPlaying].rewind();
      SongPlaying += 1;
    if (SongPlaying > SongNumber -1) {
      SongPlaying = 0; }
      SongPlayList[SongPlaying].play();
    } else {
      SongPlayList[SongPlaying].pause();
      SongPlayList[SongPlaying].rewind();
      SongPlaying += 1;
    if (SongPlaying > SongNumber -1) {
      SongPlaying = 0; }
    }
  }
  else if (mouseX>xPrevious && mouseX<xPrevious+widthPrevious && mouseY>yPrevious && mouseY<yPrevious+heightPrevious) {
    if (SongPlayList[SongPlaying].isPlaying()) {
      SongPlayList[SongPlaying].pause();
      SongPlayList[SongPlaying].rewind();
      SongPlaying -= 1;
    if (SongPlaying < 0) {
      SongPlaying = SongNumber -1; }
      SongPlayList[SongPlaying].play(); 
    } else {
      SongPlayList[SongPlaying].pause();
      SongPlayList[SongPlaying].rewind();
      SongPlaying -= 1;
    if (SongPlaying < 0) {
      SongPlaying = SongNumber -1; } 
    }
  }
  else if (mouseX>xFastForward && mouseX<xFastForward+widthFastForward && mouseY>yFastForward && mouseY<yFastForward+heightFastForward) {
    SongPlayList[SongPlaying].skip(+5000);
  }
  else if (mouseX>xRewind && mouseX<xRewind+widthRewind && mouseY>yRewind && mouseY<yRewind+heightRewind) {
    SongPlayList[SongPlaying].skip(-5000);
  }
  else if (mouseX>xReplay && mouseX<xReplay+widthReplay && mouseY>yReplay && mouseY<yReplay+heightReplay) {
    SongPlayList[SongPlaying].rewind();
  }
  else if (mouseX>xShuffle && mouseX<xShuffle+widthShuffle && mouseY>yShuffle && mouseY<yShuffle+heightShuffle) {
    SongPlayList[SongPlaying].rewind();
    SongPlaying=int (random(0, SongNumber-1));
  }
  else if (mouseX>xQuit && mouseX<xQuit+widthQuit && mouseY>yQuit && mouseY<yQuit+heightQuit) exit();
  //
} //End mousePressed
//
//End MAIN Program
