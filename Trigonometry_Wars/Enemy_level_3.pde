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
      rotate(0);
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
