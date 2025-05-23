float TitleFontSize;
float[] InitialFontSizes = new float[TextDIVHeight.length];
float[] FontSizes = new float[TextDIVHeight.length];
String[] Text = new String[3];
void MusicPanelTextSetup1() {
  //
  TitleFontSize = ShorterSide;
  TitleFont = createFont("Times New Roman Bold", TitleFontSize);
  //
  stringVarsEntry();
}
void stringVarsEntry() {
  Text[0] = SongPlayListMetaData[SongPlaying].title();
  Text[1] = "Author: "+SongPlayListMetaData[SongPlaying].author();
  Text[2] = "Released in: "+SongPlayListMetaData[SongPlaying].date();
}
void MusicPanelTextSetup2() {
  TitleFontSize = ShorterSide;
  for (int i=0; i<TextDIVHeight.length; i++) {
    if (TitleFontSize > TextDIVHeight[i]) TitleFontSize = TextDIVHeight[i];
  }
  float TimesNewRomanBoldAspectRatio = 1.04;
  TitleFontSize = TitleFontSize * TimesNewRomanBoldAspectRatio;
  //
  for (int i = 0; i < TextDIVHeight.length; i++) {
    float TemporaryFontSize = TextDIVHeight[i];
    textFont(TitleFont, TemporaryFontSize);
    while (textWidth(Text[i]) > TextDIVWidth[i]) {
      TemporaryFontSize *= 0.99;
      textFont(TitleFont, TemporaryFontSize);
    }
    FontSizes[i] = TemporaryFontSize;
    textFont(TitleFont, TemporaryFontSize);
  }
}
void Music_Program_CS20_HoverOver () {
  color hoverOverColor=color(255, 255, 255, 64);
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
