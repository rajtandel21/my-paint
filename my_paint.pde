import TUIO.*;

TuioProcessing tuio;

color[] colorArray = {
  color(0, 0, 0),
  color(255,0,0),
  color(0,255,0),
  color(0,0,255),
  color(252, 241, 18),
  color(240, 152, 12),
  color(237, 17, 204),
  color(255, 255, 255)
};

String[] shapes = {
  "rect",
  "circle",
  "triangle"
};

int[] xArray = new int[8];
int[][] sArray = {
  {50, 40},
  {100, 40},
  {150, 40}
};

int cHeight = 40;
int cDiameter = 40;
int clicked = 8;
int shapeClick = 1;

color currentColor = colorArray[0];

float posX;
float posY;
float posAngle;

void setup(){
  background(255);
  size(1100,800);
  tuio = new TuioProcessing(this);
}

void draw(){
  noStroke();
  fill(200);
  rect(100, 100, width, 80);
  
  fill(currentColor);
  ellipse(sArray[1][0], sArray[1][1], 40, 40);
  rectMode(CENTER);
  rect(sArray[0][0], sArray[0][1], 40, 40);
  triangle(sArray[2][0], 20, 130, 60, 170, 60);
  
  for(int i =0; i< colorArray.length; i++){
    int tempWidth = (width/2) + 80 + (i * 50);
    fill(colorArray[i]);
    xArray[i] = tempWidth;
    ellipse(tempWidth, cHeight, 40, 40);
  }
  drawing();
  angleChange();
  println(posAngle);
}

void updateTuioObject(TuioObject objectTuio){
  posX = round(objectTuio.getX()*width);
  posY = round(objectTuio.getY()*height);
  posAngle = round(objectTuio.getAngleDegrees());
}


//void cursorTuioObject(TuioCursor cursorTuio){
  //to show cursor on screen
//}

void angleChange(){
  if(posAngle >= 80 && posAngle <= 100){
    update();
    updateShape();
  }else if(posAngle >= 260 && posAngle <= 280){
    background(255);
  }
}

void drawing(){
  noStroke();
  fill(currentColor);
  if(posY > 80 && posAngle >=80 && posAngle <=100){
    switch(shapeClick){
    case 0:
      rectMode(CENTER);
       rect(posX, posY, 20, 20);
      break;
     case 1:
       ellipse(posX, posY, 20, 20);
       break;
      case 2:
       triangle(posX, posY - 20, posX - 20, posY + 20, posX + 20, posY + 20);
       break;
    }
  }
}

void updateShape(){
  for(int i=0; i < sArray.length; i++){
    if (posX >= sArray[i][0]-25 && posX <= sArray[i][0]+25 && 
      posY >= sArray[i][1]-20 && posY <= sArray[i][1]+20) {
      shapeClick =  i;
      break;
      }
  }
}
void update() {
  for(int i =0; i < xArray.length; i++){
    float disX = xArray[i] - posX;
    float disY = cHeight - posY;
    if (sqrt(sq(disX) + sq(disY)) < cDiameter/2 ) {
      clicked =  i;
      break;
    }
  }
  //println(clicked);
  switch(clicked){
    case 0:
      currentColor = colorArray[0];
      break;
     case 1:
      currentColor = colorArray[1];
      break;
     case 2:
      currentColor = colorArray[2];
      break;
     case 3:
      currentColor = colorArray[3];
      break;
     case 4:
      currentColor = colorArray[4];
      break;
     case 5:
      currentColor = colorArray[5];
      break;
     case 6:
      currentColor = colorArray[6];
      break;
     case 7:
      currentColor = colorArray[7];
      break;
  }
}
