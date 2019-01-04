ArrayList<Stars> Vortex = new ArrayList<Stars>();
ArrayList<Voidling> Void = new ArrayList<Voidling>();
////JetWash variables
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
int dW = 4;
float vortexRadius = 1;
float vortexAngle = 0;
//Declares each frame in the PImage array
PImage[] VortexGIF = new PImage[58];
PImage[] ShieldGIF = new PImage[30];
////gradient color variables (updates bottom to top)
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

//===============================================GLOBAL TEXTURE CONTROL====================================================================\\

//Dynamic background style used for gameplay
void JetWash(){
  if (programState == 1 && classicModeState == 1){
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
    jetWash.background(0,PIE*TAU);
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

//Background transperency used for Display Scaling & Adventure Mode Game
void BackWash(){
  pushStyle();
  imageMode(CORNERS);
  backWash.beginDraw();
  if (classicModeState == 7 || classicModeState == 8 || classicModeState == 9 || adventureModeState == 2 || adventureModeState == 3 || adventureModeState == 4){
    backWash.background(0,PIE*PI);
  }
  else if (programState == 2 && adventureModeState == 5){
    backWash.background(0,sq(TAU));
  }
  else {
    backWash.background(0,50);
  }
  backWash.endDraw();
  //outputs backWash PGraphics variable to renderer
  image(backWash,-width,-height,width,height);
  popStyle();
}

//Draws custom vortex animation
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

//Calculates the next color in the ROYGBIV RGB color spectrum
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

//===============================================MISC ANIMATIONS====================================================================\\

//Initializes VortexGIF frames
void VortexLoader(){
  for (int i = 0; i < VortexGIF.length; i++){
    VortexGIF[i] = loadImage("Textures\\Vortex-GIF\\vFrame" + i + ".png");
  }
}

//Displays VortexGIF
void VortexAnimator(){
  pushStyle();
  imageMode(CORNERS);
  tint(255,100);
  image(VortexGIF[floor(Divide(millis(),40)) % (VortexGIF.length)],0,0,width,height);
  imageMode(CENTER);
  popStyle();
}

//Initializes ShieldGIF frames
void ShieldLoader(){
  for (int i = 0; i < ShieldGIF.length; i++){
    ShieldGIF[i] = loadImage("Textures\\Shield-GIF\\sFrame" + i + ".png");
  }
}

//Displays VortexGIF or lower-tier shields (or no shields), given the player's equipped upgrades and current location
void ShieldAnimator(int ShieldLvL, float xLocation, float yLocation, float jetSize){
  popMatrix();
  translate(xLocation,yLocation);
  rotate(enemyTICK % int(TAU));
  pushStyle();
  switch (ShieldLvL){
    case 0:
      strokeWeight(PI);
      stroke(0,0,255,75);
      fill(0,0,255,25);
      beginShape();
      //Exterior bounds -- CW
      vertex(-1.5*jetSize,-1.5*jetSize);
      vertex(1.5*jetSize,-1.5*jetSize);
      vertex(1.5*jetSize,1.5*jetSize);
      vertex(-1.5*jetSize,1.5*jetSize);
      //Interior bounds -- CCW
      beginContour();
      vertex(-20, -20ll);
      vertex(-20, 20);
      vertex(20, 20);
      vertex(20, -20);
      endContour();
      endShape(CLOSE);
    break;
    case 1:
    break;
    case 2:
    break;
    case 3:
      imageMode(CENTER);
      tint(255,100);
      image(ShieldGIF[floor(Divide(millis(),40)) % (ShieldGIF.length)],0,0,1.2*jetSize,1.2*jetSize);
      imageMode(CENTER);
   break;
  }
  popStyle();
  popMatrix();
}

//Draws the Fulcrum Death Animation
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

//===============================================PLAYER PROGRESS READOUT====================================================================\\

//Calculates percentage of progress through current level
String LevelProgress(int currentScore, int maxScore){
  float slotZero = Divide(currentScore,maxScore);
  slotZero *= 100;
  return str(DigitSplice(slotZero,3));
}

//Changes the color of the progress readout from red to green as the percentage of the current level gets closer to complete
color c5Modifier(String progressPercentage){
  //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
  float colorTimer = map(float(progressPercentage),0,100,0,255);
  return color(255 - colorTimer,colorTimer,0);
}

//Displayes the percentage progress through current level, given possible max score
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

//===============================================DRAFTS NAVIGATION====================================================================\\

//Configures & displays info panels (is controlled by horizontal positioning and caseWord toggling)
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
      float[] hitBoxBL = {xCenter + labelWidth,xCenter + Divide(3*labelWidth,2)};
      triangle(xCenter + Divide(labelWidth,4),yCenter - Divide(labelHeight,2),xCenter + labelWidth,yCenter - 2*labelHeight,xCenter + Divide(3*labelWidth,2),yCenter - 2*labelHeight);
      rect(Average(hitBoxBL) + 0.6*textWidth(label),yCenter - 2*labelHeight,Average(hitBoxBL) - 0.6*textWidth(label),(yCenter - 2*labelHeight) - (1.2*(textAscent() + textDescent())));
      fill(0,200,0);
      text(label,Average(hitBoxBL),(yCenter - 2*labelHeight) - 0.9*(textAscent() + textDescent()));
    break;
    case 0:   //Bottom-Center (for entry into Classic & Adventure modes)
      float[] hitBoxBC = {xCenter,yCenter};
      if (caseWord == "Classic"){
        pushMatrix();
        translate(xCenter,yCenter);
        scale(Divide(25,96) + 0.1);
        image(ClassicPlayButton,0,0);
        popMatrix();
        if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(hitBoxBC),0.95*TAU)){
          fill(c2);
          text(label,xCenter,(yCenter - Divide(yCenter,PI)));
        }
      }
      else if (caseWord == "Adventure"){
        image(AdventurePlayButton,xCenter,yCenter);
        if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(hitBoxBC),4.3)){
          fill(c2);
          text(label,xCenter,(yCenter - Divide(yCenter,PI)));
        }
      }
    break;
    case 1:   //Bottom-Right Corner
      float[] hitBoxBR = {xCenter - labelWidth,xCenter - Divide(3*labelWidth,2)};
      triangle(xCenter - Divide(labelWidth,4),yCenter - Divide(labelHeight,2),xCenter - labelWidth,yCenter - 2*labelHeight,xCenter - Divide(3*labelWidth,2),yCenter - 2*labelHeight);
      rect(Average(hitBoxBR) - 0.6*textWidth(label),yCenter - 2*labelHeight,Average(hitBoxBR) + 0.6*textWidth(label),(yCenter - 2*labelHeight) - (1.2*(textAscent() + textDescent())));
      fill(0,200,0);
      text(label,Average(hitBoxBR),(yCenter - 2*labelHeight) - 0.9*(textAscent() + textDescent()));
    break;
  }
  popStyle();
}

//Displays the textures for the button, passes label-to-display to NavPopUp()
void NavButton(String NavPopUpCASEWORD, float xCenter, float yCenter, float hitWidth, float hitHeight, String label4PopUp, int side){
  float[] hitBox = {hitWidth,hitHeight};
  pushStyle();
  ellipseMode(CENTER);
  noStroke();
  fill(0,40);
  ellipse(xCenter,yCenter,hitWidth,hitHeight);
  switch (side){
    case -1:  //To previous page (On Bottom-Left)
      image(classicBackwardArrowTexture,xCenter,yCenter,ReturnNotCompare(hitWidth,hitHeight),ReturnNotCompare(hitWidth,hitHeight));
    break;
    case 1:   //To next page (On Bottom-Right)
      image(classicForwardArrowTexture,xCenter,yCenter,ReturnNotCompare(hitWidth,hitHeight),ReturnNotCompare(hitWidth,hitHeight));
    break;
  }
  popStyle();
  //For Classic Play button
  if (NavPopUpCASEWORD == "Classic"){
    NavPopUp("Classic",xCenter,yCenter,hitWidth,hitHeight,label4PopUp,side);
  }
  //For Adventure Level Selection button
  if (NavPopUpCASEWORD == "Adventure"){
    NavPopUp("Adventure",xCenter,yCenter,hitWidth,hitHeight,label4PopUp,side);
  }
  //For all other buttons displays
  else if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(hitBox),2)){
    NavPopUp(NavPopUpCASEWORD,xCenter,yCenter,hitWidth,hitHeight,label4PopUp,side);
  }
}

//Displays the World info panel
void PlanetLabel(String Label, String Description, float xCenter, float yCenter, color Panel){
  pushStyle();
  rectMode(CORNER);
  textMode(MODEL);
  strokeWeight(2);
  stroke(Panel,88);
  fill(Panel,5);
  rect(xCenter + 100,yCenter,300,250);
  fill(255);
  textSize(64);
  text(Label,xCenter + 100,yCenter,300,100);
  textSize(40);
  text(Description,xCenter + 100,yCenter + 24,300,250);
  popStyle();
}

//Displays the Level info panel
void MoonLabel(String Label, String Description, color Panel){
  pushStyle();
  rectMode(CORNERS);
  textMode(MODEL);
  strokeWeight(4);
  stroke(Panel,88);
  fill(Panel,5);
  rect(-2,-2,width + 2,height/6);
  fill(255);
  textSize(64);
  rectMode(CENTER);
  text(Label,width/2,height/24,width - width/24,textDescent() + textAscent());
  fill(255,80);
  textSize(32);
  text(Description,width/2,height/9,width - width/24,textDescent() + textAscent());
  popStyle();
  //for preview animation
}

//Did the player click a navigation button?
boolean NavClicked(float xCenter, float yCenter, float hitWidth, float hitHeight){
  float[] hitBox = {hitWidth,hitHeight};
  if (dist(mouseX,mouseY,xCenter,yCenter) <= Divide(Average(hitBox),2)){
    return true;
  }
  else {
    return false;
  }
}

//===============================================GRADIENT DRAFTERS====================================================================\\

//The title screen background
void classicScreenBackground(){
  c1Red = int(128*sin(colorDelta1) + 127);
  c1Green = int(128*sin(colorDelta1) + 127);
  c1Blue = int(128*sin(colorDelta1) + 127);
  c2Red = int(128*cos(colorDelta1) + 127);
  c2Green = int(108*cos(colorDelta1) + 109);
  c2Blue = int(128*sin(colorDelta1) + 127);
  c1 = color(c1Red,c1Green,c1Blue);
  c2 = color(c2Red,c2Green,c2Blue);
  setyGradient(0,0,width,height,c1,c2);
  colorDelta1 += (PI/720) % (TAU);
}

//The loser screen background
void endClassicScreenBackground(){
  c3 = color(abs(255*sin(colorDelta2)),abs(255*sin(colorDelta2)),abs(255*sin(colorDelta2)));
  c4 = color(abs(255*cos(colorDelta2)),0,0);
  setyGradient(0,0,width,height,c3,c4);
  colorDelta2 += (PI/90) % (TAU);
}

//The winning screen background
void winClassicScreenBackground(){
  c3 = color(abs(255*sin(colorDelta2)),abs(255*sin(colorDelta2)),abs(255*sin(colorDelta2)));
  c4 = color(0,abs(255*cos(colorDelta2)),0);
  setyGradient(0,0,width,height,c3,c4);
  colorDelta2 += (PI/180) % (TAU);
}

//Initializes and displays a gradient along the positive X-Cardinal
void setxGradient(int xPlacement, int yPlacement, float xSpread, float ySpread, color c1, color c2){
  noFill();
  for (int i = xPlacement; i <= (xPlacement + xSpread); i++){
    //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
    float inter = map(i,xPlacement,xPlacement + xSpread,0,1);
    color c = lerpColor(c1,c2,inter);
    stroke(c);
    line(i,yPlacement,i,yPlacement + ySpread);
  }
}

//Initializes and displays a gradient along the positive Y-Cardinal
void setyGradient(int xPlacement, int yPlacement, float xSpread, float ySpread, color c1, color c2){
  noFill();
  for (int i = yPlacement; i <= (yPlacement + ySpread); i++){
    //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
    float inter = map(i,yPlacement,yPlacement + ySpread,0,1);
    color c = lerpColor(c1,c2,inter);
    stroke(c);
    line(xPlacement,i,xPlacement + xSpread,i);
  }
}

//===============================================GRAPHICS CLASS DECLARATIONS====================================================================\\

//For Vortex creation
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

//For Void creation
class Voidling{
  ////Class variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed = 14;
  
  
  Voidling(){
    ////Constructor
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
  }
  
  ////Class methods
  void move(){
    PVector evoker = new PVector(width/2,height/3);
    PVector attractor = PVector.sub(evoker,location);
    attractor.normalize();
    attractor.mult(0.1);
    acceleration = attractor;
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    if (location.x >= width || location.x <= 0){
      velocity.x *= -1;
    }
    if (location.y >= height || location.y <= 0){
      velocity.y *= -1;
    }
  }
  
  void display(){
    pushStyle();
    noStroke();
    fill(0,TAU);
    ellipse(location.x,location.y,16,16);
    popStyle();
  }
}

//===============================================ENEMY TEXTURE MODULATIONS====================================================================\\

//controls Violent_Seeker size relative to the target ship
float eAccelerator;
float eDistance;
float eCoefficient;
float eBound = 200;
float seekerExpansion(float FulcrumxPosition, float FulcrumyPosition, float EnemyxPosition, float EnemyyPosition, float initialEnemyRadius){
  eAccelerator = dist(0,0,width,height)/2;
  eDistance = dist(FulcrumxPosition,FulcrumyPosition,EnemyxPosition,EnemyyPosition);
  //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
  eCoefficient = initialEnemyRadius + map(eAccelerator - eDistance,0,eAccelerator,0,eBound);
  return eCoefficient;
}

//=====================================================================NUMERICAL COMPUTATION=====================================================================\\

//Significant Figures calculator
float DigitSplice(float n, int digitPlacement){
  n -= n % pow(10,-digitPlacement);
  return n;
}

//Integer Summation
int iSummation(int[] numberQueue){
  int sumTotal = 0;
  for (int i = 0; i < numberQueue.length; i++){
    sumTotal += numberQueue[i];
  }
  return sumTotal;
}

//Float Summation
float fSummation(float[] numberQueue){
  float sumTotal = 0;
  for (int i = 0; i < numberQueue.length; i++){
    sumTotal += numberQueue[i];
  }
  return sumTotal;
}

//Intelligent Division
float Divide(float N, float D){
  if (D != 0){
    return N/D;
  }
  else {
    if (int(Divide(N,abs(N))) < 0){
      println("Division By Zero -- returned Negative Infinity");
      return tan(Divide(3*PI,2));
    }
    else if (int(Divide(N,abs(N))) > 0){
      println("Division By Zero -- returned Infinity");
      return -tan(Divide(PI,2));
    }
    else {
      println("L'Hopital Indeterminate -- returned Zero");
      return 0;
    }
  }
}

//Horizontally Asymptotically approaches zero as time diverges {1 - e^(-time/acceleration)}
float expApproach(int time, int acceleration){
  return (1 - Divide(1,exp(Divide(time,acceleration))));
}

//Computes arbitrarily-sized average
float Average(float[] numberQueue){
  return Divide(fSummation(numberQueue),2);
}

//Integer Cubing
int iCube(int n){
  return int(n*sq(n));
}

//Float Cubing
float fCube(float n){
  return n*sq(n);
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

//Returns largest number between numberA & numberB
float ReturnCompare(float numberA, float numberB){
  if (Compare(numberA,numberB)){
    return numberA;
  }
  else {
    return numberB;
  }
}

//Returns smallest number between numberA & numberB
float ReturnNotCompare(float numberA, float numberB){
  if (!Compare(numberA,numberB)){
    return numberA;
  }
  else {
    return numberB;
  }
}

//Validates arbitrary size() & fullScreen() choices
float ScaleFont(int size){
  return Divide(width*size,1920);
}

//Intelligent Quadratic solver
float[] QuadraticEQ(float a, float b, float c){
  if ((sq(b) - 4*a*c) >= 0){
    return (new float[]{Divide(-b + sqrt(sq(b) - 4*a*c),2*a),Divide(-b - sqrt(sq(b) - 4*a*c),2*a)});
  }
  else {
    println("Non-Real Solutions to QuadraticEQ -- returned Radicand & Real Divisor");
    return (new float[]{sq(b) - 4*a*c,Divide(-b,2*a)});
  }
}

//Calculates the length of the hypetenuse of a triangle given its two legs
float Pythag(float sideA, float sideB){
  return sqrt(fSummation(new float[]{sq(sideA),sq(sideB)}));
}

//Area of a triangle given the three side lengths
float HeronArea(float sideA, float sideB, float sideC){
  float semiP = Divide(fSummation(new float[]{sideA,sideB,sideC}),2);
  return sqrt(semiP*(semiP - sideA)*(semiP - sideB)*(semiP - sideC));
}

//===============================================ANALYTIC COMPUTATION====================================================================\\

//Calculates the closest point on the tangent vector associated with the ship and its acceleration heading  --->THANKS JOE!!
boolean VectorIntersect(float Shipx, float Shipy, float Enemyx, float Enemyy, float EnemyRadius){
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
  //check that the result is between the points -- (on the laser)
  if (dist(closestPt.x,closestPt.y,Shipx,Shipy) < v.mag() && dist(closestPt.x,closestPt.y,mouseX,mouseY) < v.mag()){
    if (dist(closestPt.x,closestPt.y,Enemyx,Enemyy) < (EnemyRadius + dW)){
      return true;
    }
    else {
      return false;
    }
  }
  return false;
}

//Determines which Standard Trigonometric Quadrant a given coordinate lies in -- CCW Cardinal Inclusiom returns as 0
int QuadrantFinder(float xlocation, float ylocation){
  if (xlocation > width/2 && ylocation < height/2){
    return 1;
  }
  else if (xlocation < width/2 && ylocation < height/2){
    return 2;
  }
  else if (xlocation < width/2 && ylocation > height/2){
    return 3;
  }
  else if (xlocation > width/2 && ylocation > height/2){
    return 4;
  }
  return 0;
}

//Determines if the Fulcrum Death Animation reaches tthe farthest corner from death origin
boolean ExplosionEnd(float xlocation, float ylocation, float Radial){
  if (QuadrantFinder(xlocation,ylocation) == 1 && Radial/2 > dist(xlocation,ylocation,0,height)){
    return true;
  }
  else if (QuadrantFinder(xlocation,ylocation) == 2 && Radial/2 > dist(xlocation,ylocation,width,height)){
    return true;
  }
  else if (QuadrantFinder(xlocation,ylocation) == 3 && Radial/2 > dist(xlocation,ylocation,width,0)){
    return true;
  }
  else if (QuadrantFinder(xlocation,ylocation) == 4 && Radial/2 > dist(xlocation,ylocation,0,0)){
    return true;
  }
  else if (Divide(3*Radial,2) > Divide(ReturnCompare(width,height),2)){
    return true;
  }
  return false;
}
