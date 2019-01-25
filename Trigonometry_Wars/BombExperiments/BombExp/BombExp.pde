PImage enemylvl7Texture1;
PImage enemylvl7Texture2;

ArrayList<Crypt_Bomb> Crypt_Bomb = new ArrayList<Crypt_Bomb>();

void setup(){
    enemylvl7Texture1 = loadImage("Textures\\Enemies\\Enemy7.1_Texture.png");
  enemylvl7Texture2 = loadImage("Textures\\Enemies\\Enemy7.2_Texture.png");
  for (int i = 0; i < 6; i++){
    Crypt_Bomb.add(new Crypt_Bomb());
  }
  size(1000,800);
  background(0);
  
  
}


void draw(){
  background(0);
  for (Crypt_Bomb bomb : Crypt_Bomb){
    bomb.move();
    bomb.display();
  }
}



class Crypt_Bomb{
  ////Class variables
  float xPos;
  float yPos;
  float xTarget;
  float yTarget;
  float enemySize = 72;
  int bombRadius = 200;
  float phi = 0;
  int pointCount;
  float deltaPhi;
  
  int HEALTH;
  
  int bombMoveState = 0;
  int bombDisplayState = 0;
  int[] cartridgeLoad = {9,10,12,13,15,16,16,18,19,19,21,21,22,22,22,22,23,24,25,25,25,25,26,28,28,28,28,29,31,31,34,34,35,35,37,37,38,38,40,41,41,41,41,43,44,44,44,44,47,47,47,47,48,49,50,50,50,50,51,53,53,54,56,57,59,60,60,60,60,63,65,66,66,66,66,69,69,69,69,72,72,72,72,73,75,76,78,80,81,82,82,84,85,85,85,85,86,88,89,91,91,91,91,92,94,94,95,95,97,97,97,97,98,100,100,101,103,103};
  int moveTick;
  int displayTick;
  
  boolean explode = false;
  boolean explodeDone = false;
  

  Crypt_Bomb(){
    ////Constructor
    HEALTH = 30;
    moveTick = 0;
    displayTick = 0;
    //Randomly chooses a destination to be thrown to
    xTarget = random(enemySize,width - enemySize);
    yTarget = random(Divide(height,3) + enemySize,height - enemySize);
    //Randomly chooses a seed to produce the explosion animation
    pointCount = cartridgeLoad[int(random(cartridgeLoad.length))];
    //Interpolates the central angle per vertex count of the stretched polygon randomly chosen above
    deltaPhi = Divide(TAU,pointCount);
  }

  ////Class methods
  void move(){
    switch (bombMoveState){
      case 0:  //approaches target location exponentially
        if (dist(xPos,yPos,xTarget,yTarget) <= 2){
          xPos = xTarget;
          yPos = yTarget;
          moveTick = 0;
          bombMoveState = 1;
          break;
        }
        //Map function relates a point on one axis to a point on another axis, directional one-to-one <----> map(float to map, min original, max original, min target, max target)
        xPos = map(expApproach(moveTick,16),0,1,width/2,xTarget);
        yPos = map(expApproach(moveTick,16),0,1,height/3,yTarget);
        moveTick++;
      break;
      case 1:  //at target location -- initiates countdown to explosion
        if (moveTick >= 60){
          explode = true;
          moveTick = 0;
          bombDisplayState = 1;
          break;
        }
        moveTick++;
      break;
    }
  }
  
  void display(){
    switch (bombDisplayState){
      case 0:  //default (unexploded) bomb texture
        pushMatrix();
        translate(xPos,yPos);
        rotate(-phi);
        pushStyle();
        imageMode(CORNERS);
        image(enemylvl7Texture1,-enemySize,-enemySize,enemySize,enemySize);
        rotate(6*phi);
        image(enemylvl7Texture2,-Divide(3*enemySize,5),-Divide(3*enemySize,5),Divide(3*enemySize,5),Divide(3*enemySize,5));
        rotate(-12*phi);
        image(enemylvl7Texture2,-Divide(enemySize,3),-Divide(enemySize,3),Divide(enemySize,3),Divide(enemySize,3));
        popStyle();
        popMatrix();
        phi += Divide(PI,22.5);
      break;
      case 1:  //bomb explosion animation
        if (displayTick >= 96){
          explodeDone = true;
        }
        if (!explodeDone){
          pushMatrix();
          translate(xPos,yPos);
          rotate(phi);
          pushStyle();
          fill(255);
          stroke(255,0,0);
          beginShape();
          //Exterior bounds -- CW
          for (int i = 0; i <= pointCount; i++){
            vertex(map(expApproach(displayTick,8),0,1,0,bombRadius)*cos((pointCount - i)*deltaPhi),-map(expApproach(displayTick,8),0,1,0,bombRadius)*sin(pointCount - i)*deltaPhi);
          }
          //Interior bounds -- CCW
          beginContour();
          for (int i = 0; i <= pointCount; i++){
            vertex(map(expApproach(displayTick,8),0,1,0,Divide(8*bombRadius,9))*cos((pointCount - i)*-deltaPhi),map(expApproach(displayTick,8),0,1,0,Divide(8*bombRadius,9))*sin(pointCount - i)*deltaPhi);
          }
          endContour();
          endShape(CLOSE);
          rotate(2*phi);
          beginShape();
          //Exterior bounds -- CW
          for (int i = 0; i <= pointCount; i++){
            vertex(map(expApproach(displayTick,8),0,1,0,bombRadius)*cos((pointCount - i)*deltaPhi),-map(expApproach(displayTick,8),0,1,0,bombRadius)*sin(pointCount - i)*deltaPhi);
          }
          //Interior bounds -- CCW
          beginContour();
          for (int i = 0; i <= pointCount; i++){
            vertex(map(expApproach(displayTick,8),0,1,0,Divide(8*bombRadius,9))*cos((pointCount - i)*-deltaPhi),map(expApproach(displayTick,8),0,1,0,Divide(8*bombRadius,9))*sin(pointCount - i)*deltaPhi);
          }
          endContour();
          endShape(CLOSE);
          rotate(3*phi);
          beginShape();
          //Exterior bounds -- CW
          for (int i = 0; i <= pointCount; i++){
            vertex(map(expApproach(displayTick,8),0,1,0,bombRadius)*cos((pointCount - i)*deltaPhi),-map(expApproach(displayTick,8),0,1,0,bombRadius)*sin(pointCount - i)*deltaPhi);
          }
          //Interior bounds -- CCW
          beginContour();
          for (int i = 0; i <= pointCount; i++){
            vertex(map(expApproach(displayTick,8),0,1,0,Divide(8*bombRadius,9))*cos((pointCount - i)*-deltaPhi),map(expApproach(displayTick,8),0,1,0,Divide(8*bombRadius,9))*sin(pointCount - i)*deltaPhi);
          }
          endContour();
          endShape(CLOSE);
          rotate(4*phi);
          beginShape();
          //Exterior bounds -- CW
          for (int i = 0; i <= pointCount; i++){
            vertex(map(expApproach(displayTick,8),0,1,0,bombRadius)*cos((pointCount - i)*deltaPhi),-map(expApproach(displayTick,8),0,1,0,bombRadius)*sin(pointCount - i)*deltaPhi);
          }
          //Interior bounds -- CCW
          beginContour();
          for (int i = 0; i <= pointCount; i++){
            vertex(map(expApproach(displayTick,8),0,1,0,Divide(8*bombRadius,9))*cos((pointCount - i)*-deltaPhi),map(expApproach(displayTick,8),0,1,0,Divide(8*bombRadius,9))*sin(pointCount - i)*deltaPhi);
          }
          endContour();
          endShape(CLOSE);
          popStyle();
          popMatrix();
          phi -= Divide(PI,90);
          displayTick++;
        }
      break;
    }
  }
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
