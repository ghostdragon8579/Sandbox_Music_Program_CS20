void Music_Player_HoverOverColors () {
  color hoverOverColor=color(255, 255, 255, 64);
  if (mouseX>xPrevious && mouseX<xPrevious+widthPrevious && mouseY>yPrevious && mouseY<yPrevious+heightPrevious) {
    fill(hoverOverColor);
    rect(xPrevious, yPrevious, widthPrevious, heightPrevious);
    fill(resetDefaultInk);
   } else if (mouseX>xRewind && mouseX<xRewind+widthRewind && mouseY>yRewind && mouseY<yRewind+heightRewind) {
    fill(hoverOverColor);
    rect(xRewind, yRewind, widthRewind, heightRewind);
    fill(resetDefaultInk);
  } else if (mouseX>xPlayPause && mouseX<xPlayPause+widthPlayPause && mouseY>yPlayPause && mouseY<yPlayPause+heightPlayPause) {
    fill(hoverOverColor);
    rect(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
    fill(resetDefaultInk);
  } else if (mouseX>xFastForward && mouseX<xFastForward+widthFastForward && mouseY>yFastForward && mouseY<yFastForward+heightFastForward) {
    fill(hoverOverColor);
    rect(xFastForward, yFastForward, widthFastForward, heightFastForward);
    fill(resetDefaultInk);
  } else if (mouseX>xNext && mouseX<xNext+widthNext && mouseY>yNext && mouseY<yNext+heightNext) {
    fill(hoverOverColor);
    rect(xNext, yNext, widthNext, heightNext);
    fill(resetDefaultInk);
  } else if (mouseX>xQuit && mouseX<xQuit+widthQuit && mouseY>yQuit && mouseY<yQuit+heightQuit) {
    fill(hoverOverColor);
    rect(xQuit, yQuit, widthQuit, heightQuit);
    fill(resetDefaultInk);
  }
}
