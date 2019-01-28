//===============================================GLOBAL JET VARIABLES====================================================================\\
////Upgrades per jet    ~SPEED~          ~HEALTH~          ~SHIELD~          ~LASER ATTACK~          ~DASH ATTACK~          ~BURST ATTACK~

boolean isFulcrum;
//Fulcrum Upgrades
boolean FTier0;       // {DEFAULT}        {DEFAULT}         {NONE}            {DEFAULT}               {N/A}                  {N/A}
boolean FTier1;       // +                +                 {NONE}            +                       {N/A}                  {N/A}
boolean FTier2;       // ++               ++                1                 ++                      {N/A}                  {N/A}
boolean FTier3;       // ++               ++                1                 +++                     {N/A}                  {N/A}

boolean isDrifter;
//Drifter Upgrades
boolean DTier0;       // +                {DEFAULT}         {NONE}            {N/A}                   {DEFAULT}              {N/A}
boolean DTier1;       // ++               +                 1                 {N/A}                   +                      {N/A}
boolean DTier2;       // +++              ++                2                 {N/A}                   ++                     {N/A}
boolean DTier3;       // ++++             ++                2                 {N/A}                   +++                    {N/A}

boolean isBehemoth;
//Behemoth Upgrades
boolean BTier0;       // {DEFAULT}        +                 1                 {N/A}                   {N/A}                  {DEFAULT}
boolean BTier1;       // {DEFAULT]        ++                1                 {N/A}                   {N/A}                  +
boolean BTier2;       // -                +++               2                 {N/A}                   {N/A}                  ++
boolean BTier3;       // --               ++++              3                 {N/A}                   {N/A}                  +++


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
