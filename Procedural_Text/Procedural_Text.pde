int shorterSide;
float xMusicTitle, yMusicTitle;
float xMusicAuthor, yMusicAuthor;
float[] rectDIVWidth = new float[2];
float[] rectDIVHeight = new float[2];
float baseFontAspectRatio(PFont font, float fontSize) {
  textFont(font, fontSize); // Set the font and size
  String sampleText = "A"; // Use a representative character or string
  float textWidthValue = textWidth(sampleText); // Measure the width of the text
  return textWidthValue / fontSize; // Aspect ratio = width / height
}
//
void setup() {
  //Display
  //fullScreen();
  size(700, 500);
  int appWidth = width; //displayWidth
  int appHeight = height; //displayHeight
  shorterSide = (appWidth >= appHeight) ? appHeight : appWidth ; //All 3 Geometries
  appFont = createFont("Times New Roman Bold", shorterSide);
  float aspectRatio = baseFontAspectRatio(appFont, shorterSide);
  println("Base Font Aspect Ratio:", aspectRatio);
  //
  textSetup1();
  //
  //DIV for Text, Population
  xMusicTitle = appWidth*2/7; yMusicTitle = appHeight*3/20; rectDIVWidth[0] = appWidth*3/7; rectDIVHeight[0] = appHeight*1/11;
  xMusicAuthor = appWidth*1/3; yMusicAuthor = yMusicTitle+rectDIVHeight[0]; rectDIVWidth[1] = appWidth*1/3; rectDIVHeight[1] = appHeight*1/18;
  //
  textSetup2();
  //
  rect(xMusicTitle, yMusicTitle, rectDIVWidth[0], rectDIVHeight[0]);
  rect(xMusicAuthor, yMusicAuthor, rectDIVWidth[1], rectDIVHeight[1]);
  //println(); //Skip a line
  //
  //Minimum Lines of code to format and draw text with colour
  color purpleInk = #2C08FF;
  fill(purpleInk); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(TitleFont, fontSize); //see variable note
  //textFont() has option to combine font declaration with textSize()
  //Drawing Text
  text(string[0], xMusicTitle, yMusicTitle, rectDIVWidth[0], rectDIVHeight[0]); //Height Aspect Ratio
  text(string[1], xMusicAuthor, yMusicAuthor, rectDIVWidth[1], rectDIVHeight[1]); //No Wraparound, will not show
  color whiteInk = #FFFFFF;
  fill(whiteInk); //reset
  //
  //Aspect Ratio of Specfic Font, calculations only to be entered in variables above
  println("Text Width:", textWidth(string[0]), "v rectWidth:", rectDIVWidth[0]); //Always smaller or cut off, if text is drawn, always drawn
  println("Text Height:", fontSize, "v. rectHeight:", rectDIVHeight[0]); //largest fontSize that will be draw, relative to rectHeight
  println("Harrington Aspect Ratio (fontSize/rect(height)):", fontSize/rectDIVHeight[0]); //Remember casting
  //
} //End setup
//
void draw() {
} //End draw
//
void mousePressed() {
} //End mousepressed
//
void keyPressed() {
} //End keyPressed
//
//End MAIN
