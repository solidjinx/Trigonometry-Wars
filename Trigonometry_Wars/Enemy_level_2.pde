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
