//===============================================FULCRUM (Classic-Adventure Hybrid)====================================================================\\
////Fulcrum Upgrades
boolean FTier0;         //Speed0,      LaserWidth0,      Health0,      Shield0
boolean FTier1;         //Speed+,      LaserWidth+,      Health+,      Shield0
boolean FTier2;         //Speed++,     LaserWidth++,     Health++,     Shield0
boolean FTier3;         //Speed++,     LaserWidth+++,    Health++,     Shield1

////Drifter Upgrades
boolean DTier0;         //Speed+,         Health+,       Shield0
boolean DTier1;         //Speed++,        Health+,       Shield1
boolean DTier2;         //Speed+++,       Health++,      Shield2
boolean DTier3;         //Speed++++,      Health+++,     Shield2

////Behemoth Upgrades
boolean BTier0;         //Speed0,      Burst0,      Health0,      Shield0
boolean BTier1;         //Speed+,      Burst+,      Health+,      Shield1
boolean BTier2;         //Speed++,     Burst++,     Health++,     Shield2
boolean BTier3;         //Speed++,     Burst+++,    Health+++,    Shield3


//===============================================FULCRUM (Classic-Adventure Hybrid)====================================================================\\

class playerFulcrumJet{
  ////Class variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed = 4;
  float jetSize = 120;
  float tangentialForce = 0.5;
  float strengthModulator;
  float phi;
  
  boolean gravityWell;


  playerFulcrumJet(PVector initialLocation, PVector initialVelocity){
    ////Constructor
    //spawns player in a specified location with specified initial velocity
    location = initialLocation;
    velocity = initialVelocity;
  }

  ////Class methods
  void move(){
    //determines direction ship should go towards
    if (gravityWell){
      for (int i = 0; i < Momma_Marble.size(); i++){
        Momma_Marble singleMarble = Momma_Marble.get(i);
        PVector marble = new PVector(singleMarble.xPos,singleMarble.yPos);
        PVector pull = PVector.sub(marble,location);
        pull.mult(strengthModulator*tangentialForce);
        PVector mouse = new PVector(mouseX,mouseY);
        PVector sumForces = PVector.add(mouse,pull);
        PVector direction = PVector.sub(sumForces,location);
        direction.normalize();
        //alters magnitude of tangential extrapolation
        direction.mult(tangentialForce);
        acceleration = direction;
        //vector summations
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.add(velocity);
        //bounces off edges of screen
        if (location.x <= jetSize/2 || location.x >= (width - jetSize/2)){
          velocity.x *= -1;
        }
        else if (location.y <= jetSize/2 || location.y >= (height - jetSize/2)){
          velocity.y *= -1;
        }
      }
    }
    else if (!gravityWell){
      PVector mouse = new PVector(mouseX,mouseY);
      PVector direction = PVector.sub(mouse,location);
      direction.normalize();
      //alters magnitude of tangential extrapolation
      direction.mult(tangentialForce);
      acceleration = direction;
      //vector summations
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
      //bounces off edges of screen
      if (location.x <= jetSize/2 || location.x >= (width - jetSize/2)){
        velocity.x *= -1;
      }
      else if (location.y <= jetSize/2 || location.y >= (height - jetSize/2)){
        velocity.y *= -1;
      }
    }
  }

  void display(){
    //orients image towards mouse location
    phi = acceleration.heading() - Divide(4*PI,3);
    pushMatrix();
    translate(location.x,location.y);
    rotate(phi);
    image(playerJetFulcrumTexture,0,0,jetSize,jetSize);
    popMatrix();
  }
}

//===============================================DRIFTER (Adventure Main)====================================================================\\

class playerDrifterJet{
  ////Class variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed = 4;
  float jetSize = 120;
  float tangentialForce = 0.5;
  float strengthModulator;
  float phi;
  
  boolean gravityWell;
  ////Drifter Upgrades
  

  playerDrifterJet(PVector initialLocation, PVector initialVelocity){
    ////Constructor
    //spawns player in a specified location with specified initial velocity
    location = initialLocation;
    velocity = initialVelocity;
  }

  ////Class methods
  void move(){
    //determines direction ship should go towards
    if (gravityWell){
      for (int i = 0; i < Momma_Marble.size(); i++){
        Momma_Marble singleMarble = Momma_Marble.get(i);
        PVector marble = new PVector(singleMarble.xPos,singleMarble.yPos);
        PVector pull = PVector.sub(marble,location);
        pull.mult(strengthModulator*tangentialForce);
        PVector mouse = new PVector(mouseX,mouseY);
        PVector sumForces = PVector.add(mouse,pull);
        PVector direction = PVector.sub(sumForces,location);
        direction.normalize();
        //alters magnitude of tangential extrapolation
        direction.mult(tangentialForce);
        acceleration = direction;
        //vector summations
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.add(velocity);
        //bounces off edges of screen
        if (location.x <= jetSize/2 || location.x >= (width - jetSize/2)){
          velocity.x *= -1;
        }
        else if (location.y <= jetSize/2 || location.y >= (height - jetSize/2)){
          velocity.y *= -1;
        }
      }
    }
    else if (!gravityWell){
      PVector mouse = new PVector(mouseX,mouseY);
      PVector direction = PVector.sub(mouse,location);
      direction.normalize();
      //alters magnitude of tangential extrapolation
      direction.mult(tangentialForce);
      acceleration = direction;
      //vector summations
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
      //bounces off edges of screen
      if (location.x <= jetSize/2 || location.x >= (width - jetSize/2)){
        velocity.x *= -1;
      }
      else if (location.y <= jetSize/2 || location.y >= (height - jetSize/2)){
        velocity.y *= -1;
      }
    }
  }

  void display(){
    //orients image towards mouse location
    phi = acceleration.heading() - Divide(4*PI,3);
    pushMatrix();
    translate(location.x,location.y);
    rotate(phi);
    image(playerJetFulcrumTexture,0,0,jetSize,jetSize);
    popMatrix();
  }
}

//===============================================BEHEMOTH (Adventure Main)====================================================================\\

class playerBehemothJet{
  ////Class variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed = 4;
  float jetSize = 120;
  float tangentialForce = 0.5;
  float strengthModulator;
  float phi;
  
  boolean gravityWell;
  ////Behemoth Upgrades
  


  playerBehemothJet(PVector initialLocation, PVector initialVelocity){
    ////Constructor
    //spawns player in a specified location with specified initial velocity
    location = initialLocation;
    velocity = initialVelocity;
  }

  ////Class methods
  void move(){
    //determines direction ship should go towards
    if (gravityWell){
      for (int i = 0; i < Momma_Marble.size(); i++){
        Momma_Marble singleMarble = Momma_Marble.get(i);
        PVector marble = new PVector(singleMarble.xPos,singleMarble.yPos);
        PVector pull = PVector.sub(marble,location);
        pull.mult(strengthModulator*tangentialForce);
        PVector mouse = new PVector(mouseX,mouseY);
        PVector sumForces = PVector.add(mouse,pull);
        PVector direction = PVector.sub(sumForces,location);
        direction.normalize();
        //alters magnitude of tangential extrapolation
        direction.mult(tangentialForce);
        acceleration = direction;
        //vector summations
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.add(velocity);
        //bounces off edges of screen
        if (location.x <= jetSize/2 || location.x >= (width - jetSize/2)){
          velocity.x *= -1;
        }
        else if (location.y <= jetSize/2 || location.y >= (height - jetSize/2)){
          velocity.y *= -1;
        }
      }
    }
    else if (!gravityWell){
      PVector mouse = new PVector(mouseX,mouseY);
      PVector direction = PVector.sub(mouse,location);
      direction.normalize();
      //alters magnitude of tangential extrapolation
      direction.mult(tangentialForce);
      acceleration = direction;
      //vector summations
      velocity.add(acceleration);
      velocity.limit(topspeed);
      location.add(velocity);
      //bounces off edges of screen
      if (location.x <= jetSize/2 || location.x >= (width - jetSize/2)){
        velocity.x *= -1;
      }
      else if (location.y <= jetSize/2 || location.y >= (height - jetSize/2)){
        velocity.y *= -1;
      }
    }
  }

  void display(){
    //orients image towards mouse location
    phi = acceleration.heading() - Divide(4*PI,3);
    pushMatrix();
    translate(location.x,location.y);
    rotate(phi);
    image(playerJetFulcrumTexture,0,0,jetSize,jetSize);
    popMatrix();
  }
}
