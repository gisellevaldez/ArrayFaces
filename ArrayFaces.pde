int numRows = 5;
int numCols = 5;
int picSize = 120;
int total; 
PImage f1, f2, f3;
String[] mood = {"Happy Julien", "Ok Julien", "Sad Julien"};
String julienMood; 

void setup() {
  noLoop();
  size(600, 600);

  // Load images
  f1 = loadImage("1.png");
  f2 = loadImage("2.png");
  f3 = loadImage("3.png");

  // Check if images loaded correctly
  if (f1 == null) println("Error loading 1.png");
  if (f2 == null) println("Error loading 2.png");
  if (f3 == null) println("Error loading 3.png");
}

void draw() {
  background(2, 30, 69);
  total = 0;
  
  // Loop through rows and columns to place faces
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      pic currentPic = new pic(j * picSize + 1, i * picSize + 1); 
      currentPic.roll();  
      currentPic.show();  
      total += currentPic.getValue();  
    }
  }

 
  if (total < 45) {
    julienMood = mood[0];  // Happy
  } else if (total <= 50) {
    julienMood = mood[1];  // Ok
  } else if (total <= 70) {
    julienMood = mood[2];  // Sad
  } else {
    julienMood = mood[2];  
  }


  textSize(30);
  text("Julien's Mood is: " + julienMood, 200, 575);
}

void mousePressed() {
  redraw(); 
}


class pic {
  int x, y, value;

  pic(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void roll() {
    
    value = (int) (Math.random() * 3) + 1;
  }

  void show() {
    PImage img = null;
  
    if (value == 1) img = f1;
    else if (value == 2) img = f2;
    else if (value == 3) img = f3;

    if (img != null) {
      image(img, x, y, picSize, picSize);
    }
  }

  int getValue() {
    return value;
  }
}
