//===============================================GLOBAL BOSS VARIABLES====================================================================\\
//Void_Evoker toggled & throttled
boolean throwBomb = false;

//=====================================================================BOSS CLASSES LISTED BELOW IN ASCENDING ORDER=====================================================================\\
//====Boss Level 1====\\

class Momma_Marble{
  ////Class variables
  float xPos;
  float yPos;
  float Speed;
  //determines the current side to roll along
  int cardinalPicker;
  //determines size and rotation speed
  float enemySize = 390;
  float phiDrift;
  
  int VALUE = 500;
  int HEALTH;

  Momma_Marble(){
    ////Constructor
    HEALTH = VALUE;
    Speed = 6;
    cardinalPicker = int(random(1,5));
    Fulcrum.strengthModulator = 1;
  }

  ////Class methods
  void move(){
    switch (cardinalPicker){
      case 1:  //top side (sweeping right)
        xPos += Speed;
        yPos = enemySize/2;
        if (xPos >= (width - (enemySize/2))){
          cardinalPicker = 2;
          break;
        }
      break;
      case 2:  //right side (sweeping down)
        xPos = width - (enemySize/2);
        yPos += Speed;
        if (yPos >= (height - (enemySize/2))){
          cardinalPicker = 3;
          break;
        }
      break;
      case 3:  //bottom side (sweeping left)
        xPos -= Speed;
        yPos = height - (enemySize/2);
        if (xPos <= (enemySize/2)){
          cardinalPicker = 4;
          break;
        }
      break;
      case 4:  //left side (sweeping up)
        xPos = enemySize/2;
        yPos -= Speed;
        if (yPos <= (enemySize/2)){
          cardinalPicker = 1;
          break;
        }
      break;
    }
  }

  void display(){
    phiDrift -= Divide(Speed,Divide(enemySize,2));    //rolls along edges of screen
    pushMatrix();
    translate(xPos,yPos);
    rotate(phiDrift);
    image(boss1Texture,0,0,enemySize,enemySize);
    popMatrix();
  }
}
//==============================================================================================================================================================================================================\\
//====Boss Level 2====\\

class Void_Evoker{
  ////Class variables
  float xPos;
  float yPos;
  float enemySize = height/3;
  
  int VALUE = 1000000;
  int HEALTH;
  
  int bombSwitch;
  int lifeTimer;
  int bombTimer;

  Void_Evoker(){
    ////Constructor
    xPos = width/2;
    yPos = height/3;
    HEALTH = VALUE + 16000;
    lifeTimer = 0;
    bombSwitch = 0;
  }

  ////Class methods
  void health(){
    HEALTH = VALUE + Void.size();
    lifeTimer++;
  }
  
  void attack(){
    switch(bombSwitch){
      case 0:
        if (lifeTimer == 450){
          throwBomb = true;
          bombSwitch = 1;
          break;
        }
        throwBomb = false;
      break;
      case 1:
        bombTimer = int(random(100));
        if (bombTimer == 0){
          throwBomb = true;
        }
        else {
          throwBomb = false;
        }
      break;
    }
  }
}
