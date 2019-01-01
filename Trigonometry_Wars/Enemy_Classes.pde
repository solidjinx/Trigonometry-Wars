//=====================================================================ENEMY CLASSES LISTED BELOW IN ASCENDING ORDER=====================================================================\\
//====Enemy Level 1====\\

class Red_Brick{
  ////Class variables
  float xPos;
  float yPos;
  //determines size and movement direction
  float enemySize = 60;
  int cardinalPicker;
  //determines spawning area
  float radialSpawn;
  float thetaSpawn;
  float validRadiusInner = (width + height)/8;
  float validRadiusOuter = validRadiusInner + 4*enemySize;
  
  int VALUE = 5;
  int HEALTH;
  

  Red_Brick(){
    ////Constructor
    HEALTH = VALUE;
    //spawns in valid area
    radialSpawn = random(validRadiusInner,validRadiusOuter - enemySize);
    thetaSpawn = random(TAU);
    xPos = width/2 + radialSpawn*cos(thetaSpawn);
    yPos = height/2 + radialSpawn*sin(thetaSpawn);
    cardinalPicker = 0;
  }

  ////Class methods
  void move(){
    //Uses master game tick to allow movement
    if (enemyTICK % 60 == 0){
      cardinalPicker = int(random(1,5));
      switch (cardinalPicker){
        case 1:  //flip left
          if ((xPos - 2*enemySize) <= 0){
            cardinalPicker = 2;
          break;
          }
          else {
            xPos -= enemySize;
          }
        break;
        case 2:  //flip right
          if ((xPos + 2*enemySize) >= width){
            cardinalPicker = 1;
          break;
          }
          else {
            xPos += enemySize;
          }
        break;
        case 3:  //flip down
          if ((yPos + 2*enemySize) >= height){
            cardinalPicker = 4;
          break;
          }
          else {
            yPos += (enemySize + 6);
          }
        break;
        case 4:  //flip up
          if ((yPos - 2*enemySize) <= 0){
            cardinalPicker = 3;
          break;
          }
          else {
            yPos -= (enemySize + 6);
          }
        break;
      }
    }
  }

  void display(){
    image(enemylvl1Texture,xPos,yPos,enemySize,enemySize);
  }
}
//==============================================================================================================================================================================================================\\
//====Enemy Level 2====\\

class Purple_Saucer{
  ////Class variables
  float xPos;
  float yPos;
  float saucerXSpeed;
  float saucerYSpeed;
  float saucerSpeed;
  //determines size and movement direction
  float enemySize = 80;
  int cardinalPicker;
  float thetaDrift;
  //controls rotation
  float phiDrift;
  
  int VALUE = 15;
  int HEALTH;
  

  Purple_Saucer(){
    ////Constructor
    HEALTH = VALUE;
    saucerSpeed = 2;
    //spawns in valid area
    cardinalPicker = int(random(1,5));
    switch (cardinalPicker){
      case 1:  //top side
        xPos = random(enemySize,width - enemySize);
        yPos = random(enemySize,height/10 + enemySize);
      break;
      case 2:  //right side
        xPos = random((width - width/10) - enemySize,width - enemySize);
        yPos = random(enemySize,height - enemySize);
      break;
      case 3:  //bottom side
        xPos = random(enemySize,width - enemySize);
        yPos = random((height - height/10) - enemySize,height - enemySize);
      break;
      case 4:  //left side
        xPos = random(enemySize,width/10 + enemySize);
        yPos = random(enemySize,height - enemySize);
      break;
    }
  }

  ////Class methods
  void move(){
    //master game tick enables drift
    thetaDrift = random(TAU);
    if (enemyTICK % 30 == 0){
      saucerXSpeed = saucerSpeed*cos(thetaDrift) + random(-thetaDrift,thetaDrift);
      saucerYSpeed = saucerSpeed*sin(thetaDrift) + random(-thetaDrift,thetaDrift);
    }
    if ((xPos - enemySize/2) <= 0 || (xPos + enemySize/2) >= width){
      saucerXSpeed *= -1;
    }
    else if ((yPos - enemySize/2) <= 0 || (yPos + enemySize/2) >= height){
      saucerYSpeed *= -1;
    }
    xPos += saucerXSpeed;
    yPos += saucerYSpeed;
  }

  void display(){
    pushMatrix();
    translate(xPos,yPos);
    rotate(phiDrift);
    image(enemylvl2Texture,0,0,enemySize,enemySize);
    popMatrix();
    phiDrift += PI/36;    //rotates 5 degrees CW / draw loop
  }
}
//==============================================================================================================================================================================================================\\
//====Enemy Level 3====\\

class Rainbow_Tracer{
  ////Class variables
  float xPos;
  float yPos;
  float tracerSpeed;
  float tracerTopSpeed = 20;
  float tracerAcceleration = 1.001;
  //determines size and movement direction
  float enemySize = 60;
  int cardinalPicker;
  
  int VALUE = 30;
  int HEALTH;
  

  Rainbow_Tracer(){
    ////Constructor
    HEALTH = VALUE;
    tracerSpeed = 4;
    //spawns in valid area
    cardinalPicker = int(random(1,5));
    switch (cardinalPicker){
      case 1:  //top side
        xPos = random(enemySize,width - enemySize);
        yPos = random(enemySize,height/10 + enemySize);
      break;
      case 2:  //right side
        xPos = random((width - width/10) - enemySize,width - enemySize);
        yPos = random(enemySize,height - enemySize);
      break;
      case 3:  //bottom side
        xPos = random(enemySize,width - enemySize);
        yPos = random((height - height/10) - enemySize,height - enemySize);
      break;
      case 4:  //left side
        xPos = random(enemySize,width/10 + enemySize);
        yPos = random(enemySize,height - enemySize);
      break;
    }
  }

  ////Class methods
  void move(){
    //master game tick enables movement
    if (tracerSpeed <= tracerTopSpeed){
      tracerSpeed *= tracerAcceleration;
    }
    switch (cardinalPicker){
      case 1:  //top side (sweeping down)
        yPos += tracerSpeed;
        if (yPos >= height - enemySize){
          cardinalPicker = 3;
          break;
        }
      break;
      case 2:  //right side (sweeping left)
        xPos -= tracerSpeed;
        if (xPos <= enemySize){
          cardinalPicker = 4;
          break;
        }
      break;
      case 3:  //bottom side (sweeping up)
        yPos -= tracerSpeed;
        if (yPos <= enemySize){
          cardinalPicker = 1;
          break;
        }
      break;
      case 4:  //left side (sweeping right)
        xPos += tracerSpeed;
        if (xPos >= width - enemySize){
          cardinalPicker = 2;
          break;
        }
      break;
    }
  }

  void display(){
    pushMatrix();
    if (cardinalPicker == 1 || cardinalPicker == 3){
      translate(xPos,yPos);
      image(enemylvl3Texture,0,0,enemySize,2*enemySize);
    }
    else if (cardinalPicker == 2 || cardinalPicker == 4){
      translate(xPos,yPos);
      rotate(PI/2);
      image(enemylvl3Texture,0,0,enemySize,2*enemySize);
    }
    popMatrix();
  }
}
//==============================================================================================================================================================================================================\\
//====Enemy Level 4====\\

class Violent_Seeker{
  ////Class variables
  //controls movement
  PVector location;
  PVector velocity;
  PVector acceleration;
  float seekerTopSpeed = 2;
  //determines size and tangential extrapolation
  float enemySize = 10;
  int cardinalPicker;
  float tangentialForce = 1;
  //controls rotations
  float thetaDrift1;
  float thetaDrift2;
  float thetaDrift3;
  
  int VALUE = 50;
  int HEALTH;


  Violent_Seeker(){
    ////Constructor
    HEALTH = VALUE;
    //spawns in random corner with zero initial velocity
    velocity = new PVector(0,0);
    cardinalPicker = int(random(1,5));
    switch (cardinalPicker){
      case 1:  //top-left corner
        location = new PVector(random(enemySize,6*enemySize),random(enemySize,6*enemySize));
      break;
      case 2:  //top-right corner
        location = new PVector(random(width - 6*enemySize,width - enemySize),random(enemySize,6*enemySize));
      break;
      case 3:  //bottom-right corner
        location = new PVector(random(width - 6*enemySize,width - enemySize),random(height - 6*enemySize,height - enemySize));
      break;
      case 4:  //bottom-left corner
        location = new PVector(random(enemySize,6*enemySize),random(height - 6*enemySize,height - enemySize));
      break;
    }
  }

  ////Class methods
void move(){
    //determines direction towwards Fulcrum
    PVector path = new PVector(Fulcrum.location.x,Fulcrum.location.y);
    PVector direction = PVector.sub(path,location);
    direction.normalize();
    //alters magnitude of tangential extrapolation
    direction.mult(tangentialForce);
    acceleration = direction;
    //vector summations
    velocity.add(acceleration);
    velocity.limit(seekerTopSpeed);
    location.add(velocity);
    //bounces off edges of screen
    if (location.x <= seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize/2) || location.x >= (width - seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize/2))){
      velocity.x *= -1;
    }
    else if (location.y <= seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize/2) || location.y >= (height - seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize/2))){
      velocity.y *= -1;
    }
  }

  void display(){
    //increments and applies stacking rotations
    thetaDrift1 += PI/180;
    thetaDrift2 += -PI/120;
    thetaDrift3 += PI/60;
    pushMatrix();
    translate(location.x,location.y);
    rotate(thetaDrift1);
    image(enemylvl4Texture,0,0,seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize),seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize));
    rotate(thetaDrift2);
    image(enemylvl4Texture,0,0,2*seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize)/3,2*seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize)/3);
    rotate(thetaDrift3);
    image(enemylvl4Texture,0,0,seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize)/3,seekerExpansion(Fulcrum.location.x,Fulcrum.location.y,location.x,location.y,enemySize)/3);
    popMatrix();
  }
}
//==============================================================================================================================================================================================================\\
//====Enemy Level 5====\\

class Crypt_Stalker{
  
}
//==============================================================================================================================================================================================================\\
//====Enemy Level 6====\\

class Crypt_Orbs{
  
}
//==============================================================================================================================================================================================================\\
//====Enemy Level 7====\\

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
    xTarget = random(enemySize,width - enemySize);
    yTarget = random(Divide(height,3) + enemySize,height - enemySize);
    pointCount = cartridgeLoad[round(random(cartridgeLoad.length))];
    deltaPhi = Divide(2*PI,pointCount);
    HEALTH = 30;
    moveTick = 0;
    displayTick = 0;
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
      case 1:  //at target location -- countdown towards explosion
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
      case 0:  //default bomb texture
        pushMatrix();
        translate(xPos,yPos);
        rotate(-phi);
        pushStyle();
        imageMode(CORNERS);
        image(enemylvl7Texture1,-enemySize,-enemySize,enemySize,enemySize);
        rotate(6*phi);
        image(enemylvl7Texture2,-Divide(3*enemySize,5),-Divide(3*enemySize,5),Divide(3*enemySize,5),Divide(3*enemySize,5));
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
