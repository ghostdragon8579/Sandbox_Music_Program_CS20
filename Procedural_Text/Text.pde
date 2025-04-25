PFont appFont;
PFont TitleFont;
float fontSize;
float[] fontSizes = new float[rectDIVHeight.length];
String[] string = new String[2];
//
void textSetup1() {
  /* Fonts from OS
  println("Start of Console");
  String[] fontList = PFont.list(); //To list all fonts available on system
  printArray(fontList); //For listing all possible fonts to choose, then createFont
  */
  fontSize = shorterSide;
  appFont = createFont("Harrington", fontSize);
  TitleFont = createFont("Times New Roman Bold", fontSize);
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
  for (int i=0; i<rectDIVHeight.length; i++) {
    if (fontSize > rectDIVHeight[i]) fontSize = rectDIVHeight[i];
  }
  float TimesNewRomanBoldAspectRatio = 1.04;
  fontSize = fontSize * TimesNewRomanBoldAspectRatio;
  //
  for (int i = 0; i < rectDIVHeight.length; i++) {
    float tempFontSize = rectDIVHeight[i];
    textFont(appFont, tempFontSize);
    while (textWidth(string[i]) > rectDIVWidth[i]) {
      tempFontSize *= 0.99;
      textFont(appFont, tempFontSize);
    }
    fontSizes[i] = tempFontSize;
    textFont(appFont, tempFontSize);
  }
} //End Text Setup
//
void textDraw() {
} //End Text Draw
//
//End Text Subprogram
