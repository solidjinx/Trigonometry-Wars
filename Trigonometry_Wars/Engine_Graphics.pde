//JetWash variables
ArrayList<Stars> Vortex = new ArrayList<Stars>();
float dR;
float dG;
float dB;
int colorSwitch = 0;
int t = 0;
float T = 0;
//JetWash incremental variables
boolean strokeIncrement = true;
int mousepressedIncrement = 10;
int dWCAP = 12;
int dWMAX = 18;
int dW;
float vortexRadius = 1;
float vortexAngle = 0;
//gradient color variables (changes bottom to top)
int c1Red;
int c1Green;
int c1Blue;
int c2Red;
int c2Green;
int c2Blue;
float colorDelta1 = 0;
float colorDelta2 = 0;
color c1;
color c2;
color c3;
color c4;


void JetWash(){
  if (classicModeState == 1){
    stroke(RainbowGen());
    strokeWeight(10);
    //applies a two-way sliding scale to create random rainbow effect with changing laser width
    if (mousePressed){
      stroke(int(random(256)),int(random(256)),int(random(256)));
      mousepressedIncrement++;
      if ((mousepressedIncrement % dWCAP) == 0){
        strokeIncrement = !strokeIncrement;
      }
      if (strokeIncrement){
        dW = 4 + (mousepressedIncrement % dWCAP);
      }
      else {
        dW = dWMAX - (mousepressedIncrement % dWCAP);
      }
      strokeWeight(dW);
    }
    line(mouseX,mouseY,Fulcrum.location.x,Fulcrum.location.y);
    strokeWeight(1);
  }
  else {
    jetWash.beginDraw();
    jetWash.background(0,10);
    if (classicModeState != 11){
      jetWash.stroke(RainbowGen());
      jetWash.strokeWeight(10);
      //applies a two-way sliding scale to create random rainbow effect with changing laser width
      if (mousePressed){
        jetWash.stroke(int(random(256)),int(random(256)),int(random(256)));
        mousepressedIncrement++;
        if ((mousepressedIncrement % dWCAP) == 0){
          strokeIncrement = !strokeIncrement;
        }
        if (strokeIncrement){
          dW = 4 + (mousepressedIncrement % dWCAP);
        }
        else {
          dW = dWMAX - (mousepressedIncrement % dWCAP);
        }
        jetWash.strokeWeight(dW);
      }
      jetWash.line(mouseX,mouseY,Fulcrum.location.x,Fulcrum.location.y);
    }
    jetWash.endDraw();
    //outputs jetWash PGraphics variable to renderer
    image(jetWash,width/2,height/2);
  }
}

void BackWash(){
  pushStyle();
  imageMode(CORNERS);
  backWash.beginDraw();
  backWash.background(0,TAU);
  backWash.endDraw();
  //outputs backWash PGraphics variable to renderer
  image(backWash,-width,-height,width,height);
  popStyle();
}

void VortexWash(){
  if (programState != 2){
    pushMatrix();
    translate(width/2,height/2);
    for (int i = Vortex.size() - 1; i >= 0; i--){
      Stars singleStar = Vortex.get(i);
      if (dist(0,0,singleStar.xPos,singleStar.yPos) > dist(0,0,width,height)){
        Vortex.remove(singleStar);
        if (classicModeState == 11){
          singleStar.radial /= 20;
        }
        else {
          Vortex.add(new Stars());
        }
      }
      singleStar.move();
      if (Fulcrum.gravityWell){
        singleStar.display(int(pow(-1,i)),color(255,round(random(75,100))));
      }
      else {
        singleStar.display(1,color(255,round(random(75,100))));
      }
    }
    popMatrix();
  }
  else {
    for (int i = 0; i < Vortex.size(); i++){
      Stars singleStar = Vortex.get(i);
      if (singleStar.lifeSpan == 0){
        Vortex.remove(singleStar);
        Vortex.add(new Stars());
      }
      else {
        singleStar.starField(color(255,round(random(60,100))));
      }
    }
  }
}

color RainbowGen(){
  ////assumes rainbow of width 999, split in thirds, max color intensity 255
  switch (colorSwitch){
    case 0:  //left third  {t >= 0 && t < 333}
      t++;
      T = PI*Divide(t,333);
      dR = 127*cos(T) + 127;
      dG = 127 - 127*cos(T);
      dB = 0;
      if (t == 333){
        colorSwitch = 1;
        break;
      }
    break;
    case 1:  //middle third  {t >= 333 && t < 666}
      t++;
      T = PI*Divide(t,333);
      dR = 0;
      dG = 127 - 127*cos(T);
      dB = 127*cos(T);
      if (t == 666){
        colorSwitch = 2;
        break;
      }
    break;
    case 2:  //right third  {t >= 666 && t <= 999}
      t++;
      T = PI*Divide(t,333);
      dR = 127 - 127*cos(T);
      dG = 0;
      dB = 127*cos(T);
      if (t > 999){
        t = 0;
        colorSwitch = 0;
        break;
      }
    break;
  }
  return color(dR,dG,dB);
}

PImage[] VortexGIF = new PImage[58];
//Vortex GIF frames
void VortexLoader(){
  for (int i = 0; i < 58; i++){
    VortexGIF[i] = loadImage("Textures\\Vortex-GIF\\vFrame" + i + ".png");
  }
}

void VortexAnimator(){
  //int startTime = millis();
  imageMode(CORNERS);
  tint(255,100);
  image(VortexGIF[floor(Divide(millis(),40)) % (VortexGIF.length)],0,0,width,height);
  imageMode(CENTER);
}

float explosionCounter = 1;
void FulcrumDeathAnimation(float xlocation, float ylocation, float Radial){
  pushMatrix();
  pushStyle();
  noFill();
  stroke(int(random(256)),int(random(256)),int(random(256)));
  translate(xlocation,ylocation);
  rotate(Radial);
  triangle(0,-Radial,Radial*sqrt(3)/2,Radial/2,-Radial*sqrt(3)/2,Radial/2);
  popStyle();
  popMatrix();
}

String LevelProgress(int currentScore, int maxScore){
  float slotZero = Divide(currentScore,maxScore);
  slotZero *= 100;
  return str(DigitSplice(slotZero,3));
}

color c5Modifier(String progressPercentage){
  //Map function relates a point on one axis to a point on another axis one-to-one <----> map(float to map, min original, max original, min target, max target)
  float colorTimer = map(float(progressPercentage),0,100,0,255);
  return color(255 - colorTimer,colorTimer,0);
}

void LevelProgressReadout(int currentScore, int maxScore){
  pushMatrix();
  translate(width/2,0);
  pushStyle();
  textMode(MODEL);
  textAlign(CENTER,CENTER);
  textFont(classicTitleFont,ScaleFont(90));
  fill(c5Modifier(LevelProgress(currentScore,maxScore)),50);
  text(LevelProgress(currentScore,maxScore) + "%",0,ScaleFont(90));
  popStyle();
  popMatrix();
}

void NavPopUp(String caseWord, float xCenter, float yCenter, float labelWidth, float labelHeight, String label, int side){
  pushStyle();
  rectMode(CORNERS);
  textMode(MODEL);
  textAlign(CENTER,CENTER);
  strokeWeight(2);
  stroke(0);
  fill(0);
  switch (side){
    case -1:  //Bottom-Left Corner
      triangle(xCenter + Divide(labelWidth,4),yCenter - Divide(labelHeight,2),xCenter + labelWidth,yCenter - 2*labelHeight,xCenter + Divide(3*labelWidth,2),yCenter - 2*labelHeight);
      rect(Average(xCenter + labelWidth,xCenter + Divide(3*labelWidth,2)) + 0.6*textWidth(label),yCenter - 2*labelHeight,Average(xCenter + labelWidth,xCenter + Divide(3*labelWidth,2)) - 0.6*textWidth(label),(yCenter - 2*labelHeight) - (1.2*(textAscent() + textDescent())));
      fill(0,200,0);
      text(label,Average(xCenter + labelWidth,xCenter + Divide(3*labelWidth,2)),(yCenter - 2*labelHeight) - 0.9*(textAscent() + textDescent()));
    break;
    case 0:   //Bottom-Center (for entry into Classic & Adventure modes)
      if (caseWord == "Classic"){
        pushMatrix();
        translate(xCenter,yCenter);
        scale(Divide(25,96) + 0.1);
        image(ClassicPlayButton,0,0);
        popMatrix();
        if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(xCenter,yCenter),0.95*TAU)){
          fill(c2);
          text(label,xCenter,(yCenter - Divide(yCenter,PI)));
        }
      }
      else if (caseWord == "Adventure"){
        image(AdventurePlayButton,xCenter,yCenter);
        if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(xCenter,yCenter),4.3)){
          fill(c2);
          text(label,xCenter,(yCenter - Divide(yCenter,PI)));
        }
      }
    break;
    case 1:   //Bottom-Right Corner
      triangle(xCenter - Divide(labelWidth,4),yCenter - Divide(labelHeight,2),xCenter - labelWidth,yCenter - 2*labelHeight,xCenter - Divide(3*labelWidth,2),yCenter - 2*labelHeight);
      rect(Average(xCenter - labelWidth,xCenter - Divide(3*labelWidth,2)) - 0.6*textWidth(label),yCenter - 2*labelHeight,Average(xCenter - labelWidth,xCenter - Divide(3*labelWidth,2)) + 0.6*textWidth(label),(yCenter - 2*labelHeight) - (1.2*(textAscent() + textDescent())));
      fill(0,200,0);
      text(label,Average(xCenter - labelWidth,xCenter - Divide(3*labelWidth,2)),(yCenter - 2*labelHeight) - 0.9*(textAscent() + textDescent()));
    break;
  }
  popStyle();
}

void NavButton(String NavPopUpCASEWORD, float xCenter, float yCenter, float hitWidth, float hitHeight, String label4PopUp, int side){
  pushStyle();
  ellipseMode(CENTER);
  noStroke();
  fill(0,40);
  ellipse(xCenter,yCenter,hitWidth,hitHeight);
  switch (side){
    case -1:  //To previous page
      image(classicBackwardArrowTexture,xCenter,yCenter,ReturnNotCompare(hitWidth,hitHeight),ReturnNotCompare(hitWidth,hitHeight));
    break;
    case 1:   //To next page
      image(classicForwardArrowTexture,xCenter,yCenter,ReturnNotCompare(hitWidth,hitHeight),ReturnNotCompare(hitWidth,hitHeight));
    break;
  }
  popStyle();
  if (NavPopUpCASEWORD == "Classic"){
    NavPopUp("Classic",xCenter,yCenter,hitWidth,hitHeight,label4PopUp,side);
  }
  if (NavPopUpCASEWORD == "Adventure"){
    NavPopUp("Adventure",xCenter,yCenter,hitWidth,hitHeight,label4PopUp,side);
  }
  else if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(hitWidth,hitHeight),2)){
    NavPopUp(NavPopUpCASEWORD,xCenter,yCenter,hitWidth,hitHeight,label4PopUp,side);
  }
}

void PlanetLabel(String Label, float xCenter, float yCenter, color Panel){
  pushStyle();
  rectMode(CORNER);
  textMode(MODEL);
  strokeWeight(2);
  stroke(Panel,88);
  fill(Panel,5);
  rect(xCenter + 100,yCenter,200,250);
  fill(255);
  text(Label,xCenter + 100,yCenter,200,250);
  popStyle();
}

void MoonLabel(String Label, float xCenter, float yCenter, color Panel){
  pushStyle();
  rectMode(CORNERS);
  textMode(MODEL);
  strokeWeight(2);
  stroke(Panel,88);
  fill(Panel,5);
  rect(0,0,width,height/8);
  fill(255);
  text(Label,0,0,width,height/8);
  popStyle();
  //for preview animation
}

boolean NavClicked(float xCenter, float yCenter, float hitWidth, float hitHeight){
  if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(hitWidth,hitHeight),2)){
    return true;
  }
  else {
    return false;
  }
}



void classicScreenBackground(){
  c1Red = int(128*sin(colorDelta1) + 127);
  c1Green = int(128*sin(colorDelta1) + 127);
  c1Blue = int(128*sin(colorDelta1) + 127);
  c2Red = int(128*cos(colorDelta1) + 127);
  c2Green = int(108*cos(colorDelta1) + 109);
  c2Blue = int(128*sin(colorDelta1) + 127);
  c1 = color(c1Red,c1Green,c1Blue);
  c2 = color(c2Red,c2Green,c2Blue);
  setGradient(0,0,width,height,c1,c2);
  colorDelta1 += (PI/720) % (TAU);
}

void endClassicScreenBackground(){
  c3 = color(abs(255*sin(colorDelta2)),abs(255*sin(colorDelta2)),abs(255*sin(colorDelta2)));
  c4 = color(abs(255*cos(colorDelta2)),0,0);
  setGradient(0,0,width,height,c3,c4);
  colorDelta2 += (PI/90) % (TAU);
}

void winClassicScreenBackground(){
  c3 = color(abs(255*sin(colorDelta2)),abs(255*sin(colorDelta2)),abs(255*sin(colorDelta2)));
  c4 = color(0,abs(255*cos(colorDelta2)),0);
  setGradient(0,0,width,height,c3,c4);
  colorDelta2 += (PI/180) % (TAU);
}

void setGradient(int xPlacement, int yPlacement, float xSpread, float ySpread, color c1, color c2){
  noFill();
  for (int i = yPlacement; i <= (yPlacement + ySpread); i++){
    float inter = map(i,yPlacement,yPlacement + ySpread,0,1);
    color c = lerpColor(c1,c2,inter);
    stroke(c);
    line(xPlacement,i,xPlacement + xSpread,i);
  }
}


class Stars{
  ////Class variables
  float xPos;
  float yPos;
  float radial;
  float theta;
  float size;
  
  float phi = 0;
  
  int lifeSpan;

  Stars(){
    ////Constructor
    radial = random(dist(0,0,width,height));
    theta = random(TAU);
    size = random(1,2);
    xPos = radial*cos(theta);
    yPos = radial*sin(theta);
    
    lifeSpan = ceil(random(pow(sqrt(radial),radial)));
  }

  ////Class methods
  void move(){
    xPos = radial*cos(theta);
    yPos = radial*sin(theta);
    radial *= 1.008;
  }

  void display(int Mod, color Filler){
    pushMatrix();
    pushStyle();
    rotate(Mod*phi);
    noFill();
    stroke(Filler);
    ellipse(xPos,yPos,size,size);
    popStyle();
    popMatrix();
    phi += Divide(PI,720);
  }
  
  void starField(color Filler){
    pushStyle();
    noFill();
    stroke(Filler);
    if (lifeSpan != 0){
      ellipse(xPos,yPos,size,size);
    }
    popStyle();
    lifeSpan--;
  }
}

//controls Violent_Seeker size
float eAccelerator;
float eDistance;
float eCoefficient;
float eBound = 200;
float seekerExpansion(float FulcrumxPosition, float FulcrumyPosition, float EnemyxPosition, float EnemyyPosition, float initialEnemyRadius){
  eAccelerator = dist(0,0,width,height)/2;
  eDistance = dist(FulcrumxPosition,FulcrumyPosition,EnemyxPosition,EnemyyPosition);
  //Map function relates a point on one axis to a point on another axis one-to-one <----> map(float to map, min original, max original, min target, max target)
  eCoefficient = initialEnemyRadius + map(eAccelerator - eDistance,0,eAccelerator,0,eBound);
  return eCoefficient;
}


////MATH
float DigitSplice(float n, int digitPlacement){
  n -= n % pow(10,-digitPlacement);
  return n;
}

int Summation(int First, int Second, int Third, int Fourth, int Fifth){
  int total = First + Second + Third + Fourth + Fifth;
  return total;
}

float Divide(float N, float D){
  if (D != 0){
    return N/D;
  }
  else {
    int sign = int(Divide(N,abs(N)));
    if (sign < 0){
      println("Division By Zero -- returned Negative Infinity");
      return tan(Divide(3*PI,2));
    }
    else if (sign > 0){
      println("Division By Zero -- returned Infinity");
      return -tan(Divide(PI,2));
    }
    println("Indeterminate -- returned Zero");
    return 0;
  }
}

float Average(float firstNumber, float secondNumber){
  return Divide(Summation(int(firstNumber),int(secondNumber),0,0,0),2);
}

float Cube(float n){
  n *= sq(n);
  return n;
}

//Is numberA > numberB?
boolean Compare(float numberA, float numberB){
  if (numberA > numberB){
    return true;
  }
  else {
    return false;
  }
}

//Return largest between numberA & numberB
float ReturnCompare(float numberA, float numberB){
  if (Compare(numberA,numberB)){
    return numberA;
  }
  else {
    return numberB;
  }
}

//Return smallest between numberA & numberB
float ReturnNotCompare(float numberA, float numberB){
  if (!Compare(numberA,numberB)){
    return numberA;
  }
  else {
    return numberB;
  }
}

float ScaleFont(int size){
  float scale = Divide(width*size,1920);
  return scale;
}

boolean VectorIntersect(float Shipx, float Shipy, float Enemyx, float Enemyy, float EnemyRadius){
  float[] VIntersectionCoords = new float[2];
  PVector u = new PVector(0,0);
  PVector uParV = new PVector(0,0);
  PVector uPerpV = new PVector(0,0);
  PVector v = new PVector(0,0);
  PVector closestPt = new PVector(0,0);
  //set u to disp between pt1 and pt3
  u.set(Enemyx - Shipx,Enemyy - Shipy);
  //set v to disp between pt1 and pt2
  v.set(mouseX - Shipx,mouseY - Shipy);
  //u parallel to v is (u dot v divided by mag squared of v) times v
  uParV = v.copy();
  uParV = uParV.mult(u.dot(v)/v.magSq());
  //u perp v is u - u parallel
  uPerpV = u.copy();
  uPerpV.sub(uParV);
  //set closest
  closestPt.set(Enemyx - uPerpV.x,Enemyy - uPerpV.y);
  //check that the result is between the points...
  float d1 = dist(closestPt.x,closestPt.y,Shipx,Shipy);
  float d2 = dist(closestPt.x,closestPt.y,mouseX,mouseY);
  if (d1 < v.mag() && d2 < v.mag()){
    //draw an ellipse at the point on the line from pt 1 to pt2 closest to pt3
    //ellipse(closestPt.x,closestPt.y,10,10);
    VIntersectionCoords[0] = closestPt.x;
    VIntersectionCoords[1] = closestPt.y;
    if (dist(VIntersectionCoords[0],VIntersectionCoords[1],Enemyx,Enemyy) < EnemyRadius){
      return true;
    }
    else {
      return false;
    }
  }
  return false;
}


float[] QuadraticEQ(float a, float b, float c){
  float[] quadSolutions = new float[2];
  float radicand = (pow(b,2) - 4*a*c);
  if (radicand >= 0){
    float solution1 = Divide(-b + sqrt(radicand),2*a);
    float solution2 = Divide(-b - sqrt(radicand),2*a);
    quadSolutions[0] = solution1;
    quadSolutions[1] = solution2;
    return quadSolutions;
  }
  else {
    println("Non-Real Solutions to QuadraticEQ -- returned radicand & real divisor");
    quadSolutions[0] = radicand;
    quadSolutions[1] = Divide(-b,2*a);
    return quadSolutions;
  }
}

float HeronArea(float sideA, float sideB, float sideC){
  float semiP = Divide(sideA + sideB + sideC,2);
  return sqrt(semiP*(semiP - sideA)*(semiP - sideB)*(semiP - sideC));
}
