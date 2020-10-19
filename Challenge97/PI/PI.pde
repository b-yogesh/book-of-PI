import processing.pdf.*;
String pi;

PGraphics canvas;
void setup(){
  size(850, 1150, PDF, "bookofpi.pdf");
  PGraphicsPDF pdf = (PGraphicsPDF) g;

  int cols = 90;
  int rows = 90;
  
  float w = float(width)/cols;
  float h = float(height)/rows;
  int index = 0;
  pi = loadStrings("pi-1million.txt")[0];
  colorMode(HSB, 1.0);
  
  int totalPages = pi.length() / (cols*rows);

  for (int i = 0; i < totalPages; i++) {

  for(float y=10;y<height-10;y+=(h)){
    for(float x=10;x<width-10;x+=(w+35)){
      String s = ""+ pi.charAt(index);
      int digit = int(s);
      float hue = digit/10.0;
      
      // for color uncomment this
      //fill(hue,1,1); 
      
      // for black color uncomment this
      fill(0);
      
      noStroke();
      String morse = getMorse(digit);      
      text(morse, x,y);
      index++;
       if (index >= pi.length()) {
          print("Finished");
          return;
        }
    }
  }
  pdf.nextPage();
  println(index);
  }
}

String getMorse(int digit){
  int len = 5;
  String morse = "";
  if(digit<6){
    for(int i = 0; i<digit;i++){
      morse += ".";
    }    
    int rem = len-morse.length();
    for(int j = 0; j<rem;j++){
      morse += "_";
    }
  }
  else{
   for(int i = 0; i<digit-len;i++){
      morse += "_";
    }
    int rem = len-morse.length();
    for(int i = 0; i<rem;i++){
      morse += ".";
    }
  }
  return morse;
}
