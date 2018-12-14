//incremental variables for sun
boolean cModIncrement = true;
int colorModIncrement = 0;
int colorMod = 0;
int j;
color sunColor;



class Solar{
  ////Class variables
  float minRadius = 150;
  float maxRadius = 25;
  float diffRadius = maxRadius - minRadius;
  float indRadius;
  //incremental variables for sun
  boolean rModIncrement = true;
  int radiusModIncrement = int(maxRadius);
  float solarTheta;


  Solar(){
    ////Constructor
    //every flare receives different radius
    indRadius = minRadius + random(diffRadius);
  }


  ////Class methods
  void Animation(boolean OuterFlare, int FlareIndex, int NumberOfFlares, color FlareColor, int previousEllipseMode){
    ellipseMode(CORNERS);
    noStroke();
    fill(FlareColor);
    solarTheta = (TAU)/NumberOfFlares;
    pushMatrix();
    //translate(width/2,height/2);
    rotate(FlareIndex*solarTheta);
    ellipse(0,0,PI/4,indRadius);
    popMatrix();
    ellipseMode(previousEllipseMode);
    if (OuterFlare){
      if ((radiusModIncrement % diffRadius) == 0){
        rModIncrement = !rModIncrement;
      }
      if (rModIncrement){
        indRadius += 0.6;
      }
      else {
        indRadius -= 0.6;
      }
    }
    if (!OuterFlare){
      if ((radiusModIncrement % diffRadius) == 0){
        rModIncrement = !rModIncrement;
      }
      if (rModIncrement){
        indRadius -= 2;
      }
      else {
        indRadius += 2;
      }
    }
    radiusModIncrement++;
  }
}

int CircleRecT = 0;
void CircleRecursion(float xlocation, float ylocation, float UpperRadius){
  noFill();
  stroke(int(random(256)),int(random(256)),int(random(256)));
  ellipse(xlocation,ylocation,UpperRadius - CircleRecT,UpperRadius - CircleRecT);
  CircleRecT += 2;
  if (CircleRecT >= UpperRadius){
    CircleRecT = 0;
  }
  else if (CircleRecT >= 0 && CircleRecT < (UpperRadius - 1)){
    CircleRecursion(xlocation,ylocation,UpperRadius);
  }
  noStroke();
}




class FirstSystem{
  ////Class variables
  //Orbital Level
  float macroRadius = 8;
  float macroSpeed = random(4.75,5.25);  //Global vert. min 4.75 , max 7.25
  float theta = PI/2;
  color macroColor = color(255,0,0);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;

  FirstSystem(){
    ////Constructor
    location = new PVector(10*pow(macroSpeed,2)*cos(theta),10*pow(macroSpeed,2)*sin(theta));
    tangentialVelocity = new PVector(1.65*macroSpeed*sin(theta),-macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    centripetalAcceleration = PVector.sub(new PVector(0,0),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.1);
    tangentialVelocity.add(centripetalAcceleration);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    pushMatrix();
    translate(width/2,height/2);
    scale(16);
    noStroke();
    fill(macroColor,pow(PI,PIE));
    ellipse(0,0,macroRadius,macroRadius);
    popMatrix();
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}

class leveling_Red_Brick{
  ////Class variables
  //Orbital Level
  float macroRadius = 1;
  float macroSpeed = random(1,1.6);  //Global vert. min 1 , max 1.6
  float theta;
  color macroColor = color(255,255,255);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;
  float maxVelocityT;

  leveling_Red_Brick(){
    ////Constructor
    FirstSystem singleWorld = planet1.get(0);
    theta = random(TAU);
    location = new PVector(10*pow(macroSpeed,2)*cos(theta) + singleWorld.location.x,10*pow(macroSpeed,2)*sin(theta) + singleWorld.location.y);
    tangentialVelocity = new PVector(macroSpeed*sin(theta),-macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    FirstSystem singleWorld = planet1.get(0);
    centripetalAcceleration = PVector.sub(new PVector(singleWorld.location.x,singleWorld.location.y),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(2);
    tangentialVelocity.add(centripetalAcceleration);
    maxVelocityT = singleWorld.tangentialVelocity.mag();
    tangentialVelocity.limit(sqrt(7)*maxVelocityT);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    centripetalAcceleration = PVector.sub(new PVector(width/2,height/2),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.4);
    tangentialVelocity.add(centripetalAcceleration);
    tangentialVelocity.limit(sqrt(7)*6);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}



class SecondSystem{
  ////Class variables
  //Orbital Level
  float macroRadius = 8;
  float macroSpeed = random(5.25,5.75);  //Global vert. min 4.75 , max 7.25
  float theta = 3*PI/2;
  color macroColor = color(255,0,255);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;

  SecondSystem(){
    ////Constructor
    location = new PVector(10*pow(macroSpeed,2)*cos(theta),10*pow(macroSpeed,2)*sin(theta));
    tangentialVelocity = new PVector(1.65*macroSpeed*sin(theta),-macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    centripetalAcceleration = PVector.sub(new PVector(0,0),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.1);
    tangentialVelocity.add(centripetalAcceleration);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    pushMatrix();
    translate(width/2,height/2);
    scale(16);
    noStroke();
    fill(macroColor,pow(PI,PIE));
    ellipse(0,0,macroRadius,macroRadius);
    popMatrix();
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}

class leveling_Purple_Saucer{
  ////Class variables
  //Orbital Level
  float macroRadius = 1;
  float macroSpeed = random(1,1.6);  //Global vert. min 1 , max 1.6
  float theta;
  color macroColor = color(255,255,255);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;
  float maxVelocityT;

  leveling_Purple_Saucer(){
    ////Constructor
    SecondSystem singleWorld = planet2.get(0);
    theta = random(TAU);
    location = new PVector(10*pow(macroSpeed,2)*cos(theta) + singleWorld.location.x,10*pow(macroSpeed,2)*sin(theta) + singleWorld.location.y);
    tangentialVelocity = new PVector(macroSpeed*sin(theta),-macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    SecondSystem singleWorld = planet2.get(0);
    centripetalAcceleration = PVector.sub(new PVector(singleWorld.location.x,singleWorld.location.y),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(2);
    tangentialVelocity.add(centripetalAcceleration);
    maxVelocityT = singleWorld.tangentialVelocity.mag();
    tangentialVelocity.limit(sqrt(7)*maxVelocityT);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    centripetalAcceleration = PVector.sub(new PVector(width/2,height/2),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.4);
    tangentialVelocity.add(centripetalAcceleration);
    tangentialVelocity.limit(sqrt(7)*6);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}



class ThirdSystem{
  ////Class variables
  //Orbital Level
  float macroRadius = 8;
  float macroSpeed = random(5.75,6.25);  //Global vert. min 4.75 , max 7.25
  float theta = -4*PI/5;
  color macroColor = color(0,165,0);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;

  ThirdSystem(){
    ////Constructor
    location = new PVector(10*pow(macroSpeed,2)*cos(theta),10*pow(macroSpeed,2)*sin(theta));
    tangentialVelocity = new PVector(-1.65*macroSpeed*sin(theta),1.65*macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    centripetalAcceleration = PVector.sub(new PVector(0,0),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.1);
    tangentialVelocity.add(centripetalAcceleration);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    pushMatrix();
    translate(width/2,height/2);
    scale(16);
    noStroke();
    fill(macroColor,pow(PI,PIE));
    ellipse(0,0,macroRadius,macroRadius);
    popMatrix();
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}

class leveling_Rainbow_Tracer{
  ////Class variables
  //Orbital Level
  float macroRadius = 1;
  float macroSpeed = random(1,1.6);  //Global vert. min 1 , max 1.6
  float theta;
  color macroColor = color(255,255,255);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;
  float maxVelocityT;

  leveling_Rainbow_Tracer(){
    ////Constructor
    ThirdSystem singleWorld = planet3.get(0);
    theta = random(TAU);
    location = new PVector(10*pow(macroSpeed,2)*cos(theta) + singleWorld.location.x,10*pow(macroSpeed,2)*sin(theta) + singleWorld.location.y);
    tangentialVelocity = new PVector(macroSpeed*sin(theta),-macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    ThirdSystem singleWorld = planet3.get(0);
    centripetalAcceleration = PVector.sub(new PVector(singleWorld.location.x,singleWorld.location.y),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(2);
    tangentialVelocity.add(centripetalAcceleration);
    maxVelocityT = singleWorld.tangentialVelocity.mag();
    tangentialVelocity.limit(sqrt(7)*maxVelocityT);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    centripetalAcceleration = PVector.sub(new PVector(width/2,height/2),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.4);
    tangentialVelocity.add(centripetalAcceleration);
    tangentialVelocity.limit(sqrt(7)*6);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}



class FourthSystem{
  ////Class variables
  //Orbital Level
  float macroRadius = 8;
  float macroSpeed = random(6.25,6.75);  //Global vert. min 4.75 , max 7.25
  float theta = -7*PI/4;
  color macroColor = color(200,200,0);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;

  FourthSystem(){
    ////Constructor
    location = new PVector(10*pow(macroSpeed,2)*cos(theta),10*pow(macroSpeed,2)*sin(theta));
    tangentialVelocity = new PVector(-1.65*macroSpeed*sin(theta),1.65*macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    centripetalAcceleration = PVector.sub(new PVector(0,0),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.1);
    tangentialVelocity.add(centripetalAcceleration);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    pushMatrix();
    translate(width/2,height/2);
    scale(16);
    noStroke();
    fill(macroColor,pow(PI,PIE));
    ellipse(0,0,macroRadius,macroRadius);
    popMatrix();
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}

class leveling_Violent_Seeker{
  ////Class variables
  //Orbital Level
  float macroRadius = 1;
  float macroSpeed = random(1,1.6);  //Global vert. min 1 , max 1.6
  float theta;
  color macroColor = color(255,255,255);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;
  float maxVelocityT;

  leveling_Violent_Seeker(){
    ////Constructor
    FourthSystem singleWorld = planet4.get(0);
    theta = random(TAU);
    location = new PVector(10*pow(macroSpeed,2)*cos(theta) + singleWorld.location.x,10*pow(macroSpeed,2)*sin(theta) + singleWorld.location.y);
    tangentialVelocity = new PVector(macroSpeed*sin(theta),-macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    FourthSystem singleWorld = planet4.get(0);
    centripetalAcceleration = PVector.sub(new PVector(singleWorld.location.x,singleWorld.location.y),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(2);
    tangentialVelocity.add(centripetalAcceleration);
    maxVelocityT = singleWorld.tangentialVelocity.mag();
    tangentialVelocity.limit(sqrt(7)*maxVelocityT);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    centripetalAcceleration = PVector.sub(new PVector(width/2,height/2),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.4);
    tangentialVelocity.add(centripetalAcceleration);
    tangentialVelocity.limit(sqrt(7)*6);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}



class FifthSystem{
  ////Class variables
  //Orbital Level
  float macroRadius = 8;
  float macroSpeed = random(6.75,7.25);  //Global vert. min 4.75 , max 7.25
  float theta = -3*PI/2;
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;

  FifthSystem(){
    ////Constructor
    location = new PVector(10*pow(macroSpeed,2)*cos(theta),10*pow(macroSpeed,2)*sin(theta));
    tangentialVelocity = new PVector(-1.65*macroSpeed*sin(theta),1.65*macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    centripetalAcceleration = PVector.sub(new PVector(0,0),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.1);
    tangentialVelocity.add(centripetalAcceleration);
    location.add(tangentialVelocity);
    noStroke();
    CircleRecursion(location.x,location.y,macroRadius);
  }
  
  void Approach(){
    pushMatrix();
    translate(width/2,height/2);
    scale(16);
    noStroke();
    CircleRecursion(0,0,macroRadius);
    popMatrix();
  }
  
  void Settle(){
    noStroke();
    CircleRecursion(location.x,location.y,macroRadius);
  }
}

class leveling_Momma_Marble{
  ////Class variables
  //Orbital Level
  float macroRadius = 1;
  float macroSpeed = random(1,1.6);  //Global vert. min 1 , max 1.6
  float theta;
  color macroColor = color(255,255,255);
  PVector location;
  PVector tangentialVelocity;
  PVector centripetalAcceleration;
  float maxVelocityT;

  leveling_Momma_Marble(){
    ////Constructor
    FifthSystem singleWorld = planet5.get(0);
    theta = random(TAU);
    location = new PVector(10*pow(macroSpeed,2)*cos(theta) + singleWorld.location.x,10*pow(macroSpeed,2)*sin(theta) + singleWorld.location.y);
    tangentialVelocity = new PVector(macroSpeed*sin(theta),-macroSpeed*cos(theta));
  }


  ////Class methods
  void Orbit(){
    FifthSystem singleWorld = planet5.get(0);
    centripetalAcceleration = PVector.sub(new PVector(singleWorld.location.x,singleWorld.location.y),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(2);
    tangentialVelocity.add(centripetalAcceleration);
    maxVelocityT = singleWorld.tangentialVelocity.mag();
    tangentialVelocity.limit(sqrt(7)*maxVelocityT);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Approach(){
    centripetalAcceleration = PVector.sub(new PVector(width/2,height/2),location);
    centripetalAcceleration.normalize();
    centripetalAcceleration.mult(0.4);
    tangentialVelocity.add(centripetalAcceleration);
    tangentialVelocity.limit(sqrt(7)*6);
    location.add(tangentialVelocity);
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
  
  void Settle(){
    noStroke();
    fill(macroColor);
    ellipse(location.x,location.y,macroRadius,macroRadius);
  }
}
