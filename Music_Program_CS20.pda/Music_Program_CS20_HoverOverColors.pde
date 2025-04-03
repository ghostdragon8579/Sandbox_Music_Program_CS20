void Music_Program_CS20_HoverOverColors () {
  color hoverOverColor=resetDefaultInk;
  if (mouseX>xPrevious && mouseX<xPrevious+widthPrevious && mouseY>yPrevious && mouseY<yPrevious+heightPrevious) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xPrevious, yPrevious, widthPrevious, heightPrevious);
    fill(resetDefaultInk);
   } else if (mouseX>xRewind && mouseX<xRewind+widthRewind && mouseY>yRewind && mouseY<yRewind+heightRewind) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xRewind, yRewind, widthRewind, heightRewind);
    fill(resetDefaultInk);
  } else if (mouseX>xPlayPause && mouseX<xPlayPause+widthPlayPause && mouseY>yPlayPause && mouseY<yPlayPause+heightPlayPause) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
    fill(resetDefaultInk);
  } else if (mouseX>xFastForward && mouseX<xFastForward+widthFastForward && mouseY>yFastForward && mouseY<yFastForward+heightFastForward) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xFastForward, yFastForward, widthFastForward, heightFastForward);
    fill(resetDefaultInk);
  } else if (mouseX>xNext && mouseX<xNext+widthNext && mouseY>yNext && mouseY<yNext+heightNext) {
    hoverOverColor = LightGray;
    fill(hoverOverColor);
    rect(xNext, yNext, widthNext, heightNext);
    fill(resetDefaultInk);
  }
}
