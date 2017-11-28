import controlP5.*;
ControlP5 controlP5;
ControlP5 controlP52;
RadioButton r;
RadioButton r2;
RadioButton r3;
RadioButton r4;

import processing.video.*;

Capture cam;
//these are for not allowing the computer to pick the same outfit two days in a row. 
int rand = 0;
int rand2 = 0;
int rand3 = 0;
int rand4 = 0;
String [] list = {"rand", "rand2", "rand3", "rand4"};
//create rectangles
float x = 250;
float y = 60;
float w = 150;
float h = 80;
//Get images to load
String num = "";
//String prompts/information
String myString = "Please Enter Your Username";
String myString2 = "";
String myString3 = "";
String text1 = "";
String text2 = "";
String myString4 = "go";
//not sure
//String[] names = {"Welcome"};
//not using this right now
//PrintWriter output;
//create images
PImage img;
PImage img2;
PImage img3;
PImage img4;
//value
int val = 0;
//get camera image to pop up
int camera = 0;
//get the weather/clothing articles to wear
String weather = "";
String type = "";
String clothing = "";
String dressweather = "";


void setup(){
  //size of app
 size(800,800);
 //white background
 background(255);
 stroke(0);
 noFill();
 //String[] lines = loadStrings("/Users/jamieleong/Desktop/output.rtf");
 //output=createWriter("/Users/jamieleong/Desktop/output.rtf");
 //Athletic or regular clothes
 
  controlP5 = new ControlP5(this); //set up checkboxes
  // CheckBox = multiple choice
  // RadioButton = single choice
  // Radio has been deprecated, should not be used anymore
  r = controlP5.addRadioButton("radio",100,190); //set up new checkbox
  r.addItem("Athletic Clothes", 1);
  r.addItem("Regular Clothes", 2);

//Cold or Warm clothes  
    controlP52 = new ControlP5(this);
    controlP52.setColorBackground(color(255,255,255)); 
  // CheckBox = multiple choice
  // RadioButton = single choice
  // Radio has been deprecated, should not be used anymore
  r2 = controlP52.addRadioButton("radio1",55,310);
  r2.addItem("Warm Clothes", 1);
  r2.addItem("Cold Clothes", 2);
  
  //Athletic or Regular Clothes
    controlP52 = new ControlP5(this);
    controlP52.setColorBackground(color(255,255,255));
  // CheckBox = multiple choice
  // RadioButton = single choice
  // Radio has been deprecated, should not be used anymore
  r3 = controlP52.addRadioButton("radio2",205,310);
  r3.addItem("Athletic Clothes", 1);
  r3.addItem("Regular Clothes", 2);
  
   //Top/Bottom/Shoes Clothes
    controlP52 = new ControlP5(this);
    controlP52.setColorBackground(color(255,255,255));
  // CheckBox = multiple choice
  // RadioButton = single choice
  // Radio has been deprecated, should not be used anymore
  r4 = controlP52.addRadioButton("radio3",355,310);
  r4.addItem("Top", 1);
  r4.addItem("Bottom", 2);
  r4.addItem("Dress", 3);
  r4.addItem("Jacket", 4);
 
 
  //camera
    String[] cameras = Capture.list();
  //makes sure there are cameras available to use
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }
}

void draw(){
  //set white background
 background(255);
 //make all rectangles with labels!
 fill(0, 102, 153);
 rect(90, 180, 100, 75);
 fill(255);
fill(0, 102, 153);
 rect(50, 60, 150, 80);
 fill(255);
 textSize(16);
 text("Let's Shop!", 70, 100);
fill(0, 102, 153);
 rect(x,y,w,h);
 fill(255);
 textSize(16);
 text("Get Dressed!", 275, 100);
fill(0, 102, 153);
 rect(450, 60, 150,80); 
 fill(255);
 textSize(16);
 text("I Went Shopping!", 460, 100);
fill(0, 102, 153);
fill(0, 102, 153);
textSize(32);
text("Welcome!", 250, 30); 
fill(0, 102, 153);
//user input for username
textSize(16);
text(myString, 225, 50);
fill(0, 102, 153);
textSize(16);
text(myString2, 170, 170);
fill(0, 102, 153);
textSize(16);
text(myString3, 200, 190);
fill(0, 102, 153);
//load an image
if (num == "") {
  img = loadImage("/home/pi/421_521_final-project/clothes/white.jpg");
  image(img, 300, 210);
}
// if the user wants to wear athletic or regular clothes
if (num == "Athletic") {
  //get number of files in each folder
    File theDir = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Athletic/Tops"); //get all files in the folder
    String[] theList = theDir.list();
    int fileCount = theList.length; //get number of files
    //get new file count
    File theDir2 = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Athletic/Tops");
   String[] theList2 = theDir2.list();
   int fileCount2 = theList2.length;
   
   //pick a random Athletic outfit
  for (int i = 0; i < 3; i++) {
    rand = int(random(1,fileCount)); //pick an oufit based on the number of files in the folders
    rand2 = int(random(1,fileCount2));
    String [] check = loadStrings("/home/pi/421_521_final-project/Processing_421/nouns.txt");
 //check to see if you are picking the same clothing pieces
    for (int j = 0 ; j < check.length; j++) {
      println(check[i]);
    }
    if (check[0] == str(rand) && rand <fileCount-1){
      rand = rand +1;
    }
    else if (check[0] == str(rand) && rand ==fileCount-1){
      rand = rand-1;
    }
    if (check[1] == str(rand2) && rand <fileCount2-1){
      rand = rand +1;
    }
    else if (check[1] == str(rand2) && rand ==fileCount2-1){
      rand = rand-1;
    }
  }
      img = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Tops/" + rand + ".JPG");
      img.resize(100,200);
      image(img, 300, 400);
      img2 = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Bottoms/" + rand2 + ".JPG");
      img2.resize(100,200);
      image(img2, 300, 600);
      //put the file numbers back
      list[0] = str(rand);
      list [1] = str(rand2);
      list [2] = str(rand3);
    list [3] = str(rand4);
    //String[] words = split(list,' ');
    
    // Writes the strings to a file, each on a separate line
    saveStrings("/Users/jamieleong/Documents/Processing/project/nouns.txt", list); //save it to the txt file
    }
else if (num == "Regular" && dressweather == "Cold") {
  
    //get number of files in each folder
    File theDir3 = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Regular/Tops");
    String[] theList3 = theDir3.list();
    int fileCount3 = theList3.length;
    //get new file count
    File theDir4 = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Regular/Bottoms");
   String[] theList4 = theDir4.list();
   int fileCount4 = theList4.length;
     //get number of files in each folder
    File theDir5 = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Regular/Jackets");
    String[] theList5 = theDir5.list();
    int fileCount5 = theList5.length;
    //get new file count
    File theDir6 = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Regular/Dresses");
   String[] theList6 = theDir6.list();
   int fileCount6 = theList6.length;
   
    for (int i = 0; i < 3; i++) {
    rand = int(random(1,fileCount3));
    rand2 = int(random(1,fileCount4));
    rand3 = int(random(1,fileCount5));
    rand4 = int(random(1,fileCount6));
    String [] check = loadStrings("/home/pi/421_521_final-project/Processing_421/nouns.txt");
 
    for (int j = 0 ; j < check.length; j++) {
      println(check[i]);
    }
    if (check[0] == str(rand) && rand <3){
      rand = rand +1;
    }
    else if (check[0] == str(rand) && rand ==3){
      rand = rand-1;
    }
    if (check[1] == str(rand2) && rand <3){
      rand = rand +1;
    }
    else if (check[1] == str(rand2) && rand ==3){
      rand = rand-1;
    }
    if (check[2] == str(rand3) && rand <3){
      rand = rand +1;
    }
    else if (check[2] == str(rand3) && rand ==3){
      rand = rand-1;
    }
    if (check[3] == str(rand4) && rand <3){
      rand = rand +1;
    }
    else if (check[3] == str(rand4) && rand ==3){
      rand = rand-1;
    }
  }
      img = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Tops/" + rand + ".JPG");
      img.resize(100, 200);
      image(img, 300, 400);
      img2 = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Bottoms/" + rand2 + ".JPG");
      img2.resize(100, 200);
      image(img2, 300, 600);
      img3 = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Jackets/" + rand3 + ".JPG");
      img3.resize(100, 200);
      image(img3, 400, 400);
      img4 = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Dresses/" + rand4 + ".JPG");
      img4.resize(100, 200);
      image(img4, 400, 600);
list[0] = str(rand);
list [1] = str(rand2);
list [2] = str(rand3);
list [3] = str(rand4);
//String[] words = split(list,' ');

// Writes the strings to a file, each on a separate line
saveStrings("/home/pi/421_521_final-project/Processing_421/nouns.txt", list);
}

else if (num == "Regular" && dressweather == "Warm") {
  
    //get number of files in each folder
    File theDir3 = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Regular/Tops");
    String[] theList3 = theDir3.list();
    int fileCount3 = theList3.length;
    //get new file count
    File theDir4 = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Regular/Bottoms");
   String[] theList4 = theDir4.list();
   int fileCount4 = theList4.length;
    //get new file count
    File theDir6 = new File("/home/pi/421_521_final-project/clothes/" + dressweather + "/Regular/Dresses");
   String[] theList6 = theDir6.list();
   int fileCount6 = theList6.length;
   
    for (int i = 0; i < 3; i++) {
    rand = int(random(1,fileCount3));
    rand2 = int(random(1,fileCount4));
    rand4 = int(random(1,fileCount6));
    String [] check = loadStrings("/home/pi/421_521_final-project/Processing_421/nouns.txt");
 
    for (int j = 0 ; j < check.length; j++) {
      println(check[i]);
    }
    if (check[0] == str(rand) && rand <3){
      rand = rand +1;
    }
    else if (check[0] == str(rand) && rand ==3){
      rand = rand-1;
    }
    if (check[1] == str(rand2) && rand <3){
      rand = rand +1;
    }
    else if (check[1] == str(rand2) && rand ==3){
      rand = rand-1;
    }
    if (check[3] == str(rand4) && rand <3){
      rand = rand +1;
    }
    else if (check[3] == str(rand4) && rand ==3){
      rand = rand-1;
    }
  }
      img = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Tops/" + rand + ".JPG");
      img.resize(100, 200);
      image(img, 300, 400);
      img2 = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Bottoms/" + rand2 + ".JPG");
      img2.resize(100, 200);
      image(img2, 300, 600);
      img4 = loadImage("/home/pi/421_521_final-project/clothes/" + dressweather + "/" + num + "/Dresses/" + rand4 + ".JPG");
      img4.resize(100, 200);
      image(img4, 400, 400);
list[0] = str(rand);
list [1] = str(rand2);
list [3] = str(rand4);
//String[] words = split(list,' ');

// Writes the strings to a file, each on a separate line
saveStrings("/home/pi/421_521_final-project/Processing_421/nouns.txt", list);
}

    
     //camera
     println(camera);
  if (cam.available() == true && camera == 1) {
    cam.read();
  }
  image(cam, 0, 400);
   //do stuff 
   if (camera == 1) {
     fill(0, 102, 153);
   rect(50, 300, 100, 75);
    fill(0, 102, 153);
   rect(200, 300, 100, 75);
    fill(0, 102, 153);
   rect(350, 300, 100, 75);
    fill(0, 102, 153);
   rect(500, 300, 100, 75);
   
   fill(255);
   textSize(16);
 text("Press enter", 505, 320);
 fill(255);
   textSize(16);
 text("to take the", 505, 335);
 fill(255);
   textSize(16);
 text("picture!", 505, 350);
  
   }
 if(mousePressed){
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
   println("The mouse is pressed and over the Get Dressed button");
   String[] lines = loadStrings("/home/pi/421_521_final-project/weather.txt");
   val = int(lines[0]);
   if (val > 75) {
     myString2 = ("It's " + val + " degrees out, make sure to bring sunscreen!");
     myString3 = ("Athletic or Regular Clothes?");
     dressweather = ("Warm");
   }
   else {
     myString2 = ("It's " + val + " degrees out, make sure to bring a jacket!");
     myString3 = ("Atheltic or Regular Clothes?");
     dressweather = ("Cold");
   }
  }
  else if(mouseX>50 && mouseX < 200 && mouseY>y && mouseY <y+h){
   println("The mouse is pressed and over the Let's Shop button");
   fill(0);
   link("https://www.google.com/shopping?hl=en");
  }
  else if(mouseX>450 && mouseX < 600 && mouseY>y && mouseY <y+h){
   println("The mouse is pressed and over the I went Shopping button");
   fill(0);
   camera = 1;
  }
 }
 
}
void keyPressed(){
  text1+= key;
  myString = "Hi, " + text1;
  String[] lines = loadStrings("/home/pi/421_521_final-project/Processing_421/output.rtf");
 println(lines.length);
  if (keyCode == ENTER) {
     if (lines.length == 0) {
        //output[output.length+1] = myString + "/";
        lines = append(lines, text1);

       }
      else {
        for (int i = 7; i < lines.length; i++) {
          if (lines[i] == text1 + "/") {
             myString = "Welcome back, " + text1;
          } 
          else {
             myString = "Hi, " + text1;
             lines = append(lines, text1);
            
          }
        }}}
      if (keyCode == ENTER && camera == 1) {
            File theDir7 = new File("/home/pi/421_521_final-project/clothes/" + weather + "/" + type + "/" + clothing);
           String[] theList7 = theDir7.list();
           int fileCount7 = theList7.length + 1;
        saveFrame("/home/pi/421_521_final-project/clothes/" + weather + "/" + type + "/" + clothing + "/" + fileCount7 + ".png");
        
      }
}

//Get all radio buttons
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isGroup() && theEvent.name().equals("radio")) {
    if (theEvent.arrayValue()[0]== 1.0) {
      num = "Athletic";
    }
    else if (theEvent.arrayValue()[1]== 1.0) {
      num = "Regular";
    }
  }
  
    if(theEvent.isGroup() && theEvent.name().equals("radio1")) {
    if (theEvent.arrayValue()[0]== 1.0) {
      println(theEvent.arrayValue());
      weather = "Warm";
    }
    else if (theEvent.arrayValue()[1]== 1.0) {
      println(theEvent.arrayValue());
      weather = "Cold";
    }
  }
  
      if(theEvent.isGroup() && theEvent.name().equals("radio2")) {
    if (theEvent.arrayValue()[0]== 1.0) {
      println(theEvent.arrayValue());
      type = "Athletic";
    }
    else if (theEvent.arrayValue()[1]== 1.0) {
      println(theEvent.arrayValue());
      type = "Regular";
    }
  }
  
      if(theEvent.isGroup() && theEvent.name().equals("radio3")) {
    if (theEvent.arrayValue()[0]== 1.0) {
      clothing = "Top";
    }
    else if (theEvent.arrayValue()[1]== 1.0) {
      clothing = "Bottom";
    }
        else if (theEvent.arrayValue()[2]== 1.0) {
      clothing = "Dress";
    }
        else if (theEvent.arrayValue()[3]== 1.0) {
      clothing = "Jacket";
    }
  }
}