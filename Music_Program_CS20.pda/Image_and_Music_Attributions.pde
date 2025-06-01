void ImageMusicAttributions () {
  //Image Attributions
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  textFont(TitleFont, FontSizes[5]);
  text(Text[4], xIconAttribution, yIconAttribution, TextDIVWidth[4], TextDIVHeight[4]);
  textFont(TitleFont, FontSizes[5]);
  text(Text[5], xBackgroundAttribution, yBackgroundAttribution, TextDIVWidth[5], TextDIVHeight[5]);
  fill(resetDefaultInk);
  //
}
void ImageMusicAttributionsMousePressed () {
  //Attribution Links
  if (MouseIsOver(xIcons8Location, yIconAttribution - appHeight*3/200, textWidth("Icons8"), appHeight*3/100)) {
    link("https://icons8.com/");
  } else if (MouseIsOver(xIcons8Location, yBackgroundAttribution - appHeight*3/200, textWidth("Vecteezy"), appHeight*3/100)) {
    link("https://www.vecteezy.com/members/earthtin");
  }
}
