//determines whether the current level ends
boolean deathDetection(float FulcrumxPosition, float FulcrumyPosition, float FulcrumRadius, float EnemyxPosition, float EnemyyPosition, float EnemyRadius){
  if (dist(FulcrumxPosition,FulcrumyPosition,EnemyxPosition,EnemyyPosition) <= (FulcrumRadius + EnemyRadius)){
    return false;
  }
  return false;
}

//determines whether an enemy has been killed by player  --  "VectorIntersect" for PVector method  --  "LaserLinear()" for my method, "LaserParametric" for calc III method
boolean killDetection(float EnemyxPosition, float EnemyyPosition, float ShipxPosition, float ShipyPosition, float EnemyRadius){
  if (VectorIntersect(ShipxPosition,ShipyPosition,EnemyxPosition,EnemyyPosition,EnemyRadius)){
    return true;
  }
  else {
    return false;
  }
}

//determines whether an enemy has left the screen
boolean driftDetection(float EnemyxPosition, float EnemyyPosition, float EnemyRadius){
  if (EnemyxPosition < -EnemyRadius || EnemyxPosition > (width + EnemyRadius) || EnemyyPosition < -EnemyRadius || EnemyyPosition > (height + EnemyRadius)){
    return true;
  }
  else {
    return false;
  }
}

boolean playerProgression(int brickQuantity, int saucerQuantity, int tracerQuantity, int seekerQuantity, int marbleQuantity){
  if (Summation(brickQuantity,saucerQuantity,tracerQuantity,seekerQuantity,marbleQuantity) == 0){
    return true;
  }
  return false;
}


void SetSTATES(int TierZeroZero, int TierOneOne, int TierOneTwo, int TierTwoOne, int TierTwoTwo, int TierTwoThree){
  activeSTATES[0] = TierZeroZero;
  
  activeSTATES[1] = TierOneOne;
  activeSTATES[2] = TierOneTwo;
  
  activeSTATES[3] = TierTwoOne;
  activeSTATES[4] = TierTwoTwo;
  activeSTATES[5] = TierTwoThree;
}

int [] ResetSTATES(){
  return activeSTATES;
}



int QuadrantFinder(float xlocation, float ylocation){
  if (xlocation > width/2 && ylocation < height/2){
    return 1;
  }
  else if (xlocation < width/2 && ylocation < height/2){
    return 2;
  }
  else if (xlocation < width/2 && ylocation > height/2){
    return 3;
  }
  else if (xlocation > width/2 && ylocation > height/2){
    return 4;
  }
  return 0;
}

boolean ExplosionEnd(float xlocation, float ylocation, float Radial){
  if (QuadrantFinder(xlocation,ylocation) == 1 && Radial/2 > dist(xlocation,ylocation,0,height)){
    return true;
  }
  else if (QuadrantFinder(xlocation,ylocation) == 2 && Radial/2 > dist(xlocation,ylocation,width,height)){
    return true;
  }
  else if (QuadrantFinder(xlocation,ylocation) == 3 && Radial/2 > dist(xlocation,ylocation,width,0)){
    return true;
  }
  else if (QuadrantFinder(xlocation,ylocation) == 4 && Radial/2 > dist(xlocation,ylocation,0,0)){
    return true;
  }
  return false;
}
