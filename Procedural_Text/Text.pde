PFont appFont;
PFont TitleFont;
float fontSize;
String[] string = new String[2];
//
void textSetup1() {
   /* Fonts from OS
   println("Start of Console");
   String[] fontList = PFont.list(); //To list all fonts available on system
   printArray(fontList); //For listing all possible fonts to choose, then createFont
   */
  fontSize = shorterSide;
  appFont = createFont("Harrington", fontSize); //Verify font exists
  //Tools / Create Font / Find Font / Do Not Press "OK", known bug
  //
  stringVarsEntry();
  //
} //End Text Setup
//
void stringVarsEntry() {
  string[0] = "Title";
  string[1] = "Author";
}
//
void textSetup2() {
   /* Aspect Ratio Manipulations (changes to variables), Font Size relative to rect(Height)
   - choose Aspect Ratio that must be mutliplied: fontSize/titleHeight
   - Rewriting fontSize with formulae
   */
  fontSize = shorterSide;
  //Finds the smallest rect(height); might cause issue with text font formatting
  for ( int i=0; i<rectDIVHeight.length; i++ ) {
    if ( fontSize > rectDIVHeight[i] ) fontSize = rectDIVHeight[i];
  }
  float harringtonAspectRatio = 1.04;
  fontSize = fontSize * harringtonAspectRatio;
  //
  //println("Aspect Ratio:", harringtonAspectRatio);
  textFont(appFont, fontSize); //Manditory, for textWidth()
  float fontSize_temp=fontSize;
  for ( int i=0; i<rectDIVWidth.length; i++ ) {
    if ( rectDIVWidth[i] < textWidth( string[i] ) ) {
      while ( rectDIVWidth[i] < textWidth( string[i] ) ) {
        fontSize_temp = fontSize*0.74609375;
        textFont(appFont, fontSize_temp); //Manditory, for textWidth()
      }
      fontSize = fontSize_temp;
    }
    textFont(appFont, fontSize);
  }
} //End Text Setup
//
void textDraw() {
} //End Text Draw
//
//End Text Subprogram
