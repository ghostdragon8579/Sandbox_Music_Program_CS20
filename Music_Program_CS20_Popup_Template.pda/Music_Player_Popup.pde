//Global Variables
//
float xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground;
float xMusicPanel, yMusicPanel, widthMusicPanel, heightMusicPanel;
float xQuit, yQuit, widthQuit, heightQuit;
PImage NeonBackground2;
PImage Quit;
PFont TitleFont;
color resetDefaultInk=#FFFFFF;
color Gray=#C9C9C9;
color LightGray=#CECECE;
color Black=#000000;
color Purple=#B031E8;
color TextPurple=#F986FF;
int SongNumber = 6;
int SongPlaying = SongNumber - SongNumber;
int SoundEffectNumber = 1;
int SoundEffectPlaying = 0;
Boolean MusicPlayerPopup=false;
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
void MusicPlayerSetup() {
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
  //
  //Buttons
  xQuit = appWidth*15/16; yQuit = appHeight*0; widthQuit = appWidth*1/16; heightQuit = appHeight*1/24;
  //
}//End setup
//
void MusicPlayerDraw() {
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
  //
  //Buttons
  rect(xQuit, yQuit, widthQuit, heightQuit);
  //
  //Music Button Icons
  strokeWeight(1);
  stroke(Black);
  fill(resetDefaultInk);
  //
  //Images
  image(Quit, xQuit, yQuit, widthQuit, heightQuit);
  //
  println("The Music is now Playing, are you able to hear it?");
  //
}//End draw
//
void MusicPlayerMousePressed() {
  //
  if (mouseX>xQuit && mouseX<xQuit+widthQuit && mouseY>yQuit && mouseY<yQuit+heightQuit && MusicPlayerPopup==true) {
  MusicPlayerPopup=false;
  }
  //
}//End mousePressed
//
void MusicPlayerKeyPressed() {
  //
  if (key=='L' || key=='l') {
    if (MusicPlayerPopup==true) {
      MusicPlayerPopup=false;
    } else {
      MusicPlayerPopup=true;
    }
  }
}//End keyPressed
