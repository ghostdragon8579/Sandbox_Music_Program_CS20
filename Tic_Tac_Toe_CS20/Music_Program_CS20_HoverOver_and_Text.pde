float[] InitialFontSizes2 = new float[TextDIVHeight.length];
float[] FontSizes2 = new float[TextDIVHeight.length];
String[] MusicPlayerText = new String[18];
void MusicPanelTextSetup1() {
  //
  TitleFontSize = ShorterSide;
  TitleFont = createFont("Times New Roman Bold", TitleFontSize);
  //
  stringVarsEntry2();
}
void stringVarsEntry2() {
  MusicPlayerText[0] = SongPlayListMetaData[SongPlaying].title();
  MusicPlayerText[1] = "Author: "+SongPlayListMetaData[SongPlaying].author();
  MusicPlayerText[2] = "Released in: "+SongPlayListMetaData[SongPlaying].date();
  if (!Attributions) {
  MusicPlayerText[3] = "Attributions";
  } else if (Attributions) {
  MusicPlayerText[3] = "Return";
  }
  MusicPlayerText[4] = "Loop, Shuffle, and Rewind icons by Icons8";
  MusicPlayerText[5] = "Background Image by Tinnapon Wuttichaikitcharoen on Vecteezy";
  MusicPlayerText[6] = "Song: NIVIRO - The Guardian Of Angels [NCS Release] Music provided by NoCopyrightSounds";
  MusicPlayerText[7] = "Song: NIVIRO - The Return [NCS Release] Music provided by NoCopyrightSounds";
  MusicPlayerText[8] = "Song: Clarx - H.A.Y [NCS Release] Music provided by NoCopyrightSounds";
  MusicPlayerText[9] = "Song: Lost Sky - Where We Started (feat. Jex) [NCS Release] Music provided by NoCopyrightSounds";
  MusicPlayerText[10] = "Song: Dirty Palm - Oblivion (feat. Micah Martin) [NCS Release] Music provided by NoCopyrightSounds";
  MusicPlayerText[11] = "Song: Cartoon, Jéja - Why We Lose (feat. Coleman Trapp) [NCS Release] Music provided by";
  MusicPlayerText[12] = "Free Download/Stream: http://ncs.io/TGOA Watch: http://youtu.be/yHU6g3-35IU";
  MusicPlayerText[13] = "Free Download/Stream: http://ncs.io/TheReturn Watch: http://youtu.be/R0QkZOyuqIs";
  MusicPlayerText[14] = "Free Download/Stream: http://ncs.io/HAY Watch: http://youtu.be/mj9KRKSvdbk";
  MusicPlayerText[15] = "Free Download/Stream: http://ncs.io/WhereWeStarted Watch: http://youtu.be/U9pGr6KMdyg";
  MusicPlayerText[16] = "Free Download/Stream: http://ncs.io/Oblivion Watch: http://youtu.be/8Yue9YYdNLM";
  MusicPlayerText[17] = "NoCopyrightSounds Free Download/Stream: http://ncs.io/whywelose Watch: http://youtu.be/zyXmsVwZqX4";
}
void MusicPanelTextSetup2() {
  TitleFontSize = ShorterSide;
  for (int i=0; i<TextDIVHeight.length; i++) {
    if (TitleFontSize > TextDIVHeight[i]) TitleFontSize = TextDIVHeight[i];
  }
  float TimesNewRomanBoldAspectRatio = 1.04;
  TitleFontSize = TitleFontSize * TimesNewRomanBoldAspectRatio;
  //
  for (int i = 0; i<TextDIVHeight.length; i++) {
    float TemporaryFontSize = TextDIVHeight[i];
    textFont(TitleFont, TemporaryFontSize);
    while (textWidth(Text[i]) > TextDIVWidth[i]) {
      TemporaryFontSize *= 0.99;
      if (TemporaryFontSize < 8) {
        TemporaryFontSize = 8;
        break;
      }
      textFont(TitleFont, TemporaryFontSize);    
    }
    if (TemporaryFontSize < 8) TemporaryFontSize = 8;
    FontSizes2[i] = TemporaryFontSize;
    textFont(TitleFont, TemporaryFontSize);
  }
}
void Music_Program_CS20_HoverOver () {
  color hoverOverColor=color(255, 255, 255, 64);
  if (!Attributions) {
  if (MouseIsOver(xPrevious, yPrevious, widthPrevious, heightPrevious)) {
    fill(hoverOverColor);
    rect(xPrevious, yPrevious, widthPrevious, heightPrevious);
    fill(resetDefaultInk);
   } else if (MouseIsOver(xRewind, yRewind, widthRewind, heightRewind)) {
    fill(hoverOverColor);
    rect(xRewind, yRewind, widthRewind, heightRewind);
    fill(resetDefaultInk);
  } else if (MouseIsOver(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause)) {
    fill(hoverOverColor);
    rect(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
    fill(resetDefaultInk);
  } else if (MouseIsOver(xFastForward, yFastForward, widthFastForward, heightFastForward)) {
    fill(hoverOverColor);
    rect(xFastForward, yFastForward, widthFastForward, heightFastForward);
    fill(resetDefaultInk);
  } else if (MouseIsOver(xNext, yNext, widthNext, heightNext)) {
    fill(hoverOverColor);
    rect(xNext, yNext, widthNext, heightNext);
    fill(resetDefaultInk);
  } else if (MouseIsOver(xQuit, yQuit, widthQuit, heightQuit)) {
    fill(hoverOverColor);
    rect(xQuit, yQuit, widthQuit, heightQuit);
    fill(resetDefaultInk);
  } else if (MouseIsOver(xShuffle, yShuffle, widthShuffle, heightShuffle)) {
    fill(hoverOverColor);
    rect(xShuffle, yShuffle, widthShuffle, heightShuffle);
    fill(resetDefaultInk);
  } else if (MouseIsOver(xReplay, yReplay, widthReplay, heightReplay)) {
    fill(hoverOverColor);
    rect(xReplay, yReplay, widthReplay, heightReplay);
    fill(resetDefaultInk);
  } else if (MouseIsOver(xLoop, yLoop, widthLoop, heightLoop)) {
    fill(hoverOverColor);
    rect(xLoop, yLoop, widthLoop, heightLoop);
    fill(resetDefaultInk);
  }
  }
  if (MouseIsOver(xAttributions, yAttributions, TextDIVWidth[3], TextDIVHeight[3])) {
    fill(hoverOverColor);
    rect(xAttributions, yAttributions, TextDIVWidth[3], TextDIVHeight[3]);
    fill(resetDefaultInk);
  }
}
