//Global Variables
Boolean MusicPlayerPopup=false;
//
void MusicPlayerSetup() {
  //
}//End setup
//
void MusicPlayerDraw() {
  println("The Music is now Playing, are you able to hear it?");
}//End draw
//
void MusicPlayerMousePressed() {
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
