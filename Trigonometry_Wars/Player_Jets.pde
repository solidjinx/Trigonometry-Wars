//===============================================FULCRUM====================================================================\\

class playerClassicJet{
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


  playerClassicJet(){
    ////Constructor
    //spawns player in middle of screen with zero initial velocity
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
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
