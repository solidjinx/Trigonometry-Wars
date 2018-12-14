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
