void ImageMusicAttributions () {
  //Image Attributions
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  textFont(TitleFont, FontSizes[5]);
  text(Text[4], xIconAttribution, yIconAttribution, TextDIVWidth[4], TextDIVHeight[4]);
  text(Text[5], xBackgroundAttribution, yBackgroundAttribution, TextDIVWidth[5], TextDIVHeight[5]);
  //Song Attributions
  text(Text[6], xSongAttribution1, ySongAttribution1, TextDIVWidth[6], TextDIVHeight[6]);
  text(Text[12], xSongAttribution1Line2, ySongAttribution1Line2, TextDIVWidth[12], TextDIVHeight[12]);
  text(Text[7], xSongAttribution2, ySongAttribution2, TextDIVWidth[7], TextDIVHeight[7]);
  text(Text[13], xSongAttribution2Line2, ySongAttribution2Line2, TextDIVWidth[13], TextDIVHeight[13]);
  text(Text[8], xSongAttribution3, ySongAttribution3, TextDIVWidth[8], TextDIVHeight[8]);
  text(Text[14], xSongAttribution3Line2, ySongAttribution3Line2, TextDIVWidth[14], TextDIVHeight[14]);
  text(Text[9], xSongAttribution4, ySongAttribution4, TextDIVWidth[9], TextDIVHeight[9]);
  text(Text[15], xSongAttribution4Line2, ySongAttribution4Line2, TextDIVWidth[15], TextDIVHeight[15]);
  text(Text[10], xSongAttribution5, ySongAttribution5, TextDIVWidth[10], TextDIVHeight[10]);
  text(Text[16], xSongAttribution5Line2, ySongAttribution5Line2, TextDIVWidth[16], TextDIVHeight[16]);
  text(Text[11], xSongAttribution6, ySongAttribution6, TextDIVWidth[11], TextDIVHeight[11]);
  text(Text[17], xSongAttribution6Line2, ySongAttribution6Line2, TextDIVWidth[17], TextDIVHeight[17]);
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
