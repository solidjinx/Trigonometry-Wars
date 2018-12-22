//===============================================GAME CONTROL====================================================================\\

//Determines collisiooon between ship and enemy
boolean deathDetection(float FulcrumxPosition, float FulcrumyPosition, float FulcrumRadius, float EnemyxPosition, float EnemyyPosition, float EnemyRadius){
  if (dist(FulcrumxPosition,FulcrumyPosition,EnemyxPosition,EnemyyPosition) <= (FulcrumRadius + EnemyRadius)){
    return false;
  }
  return false;
}

//Determines collisions between enemy and laser 
boolean killDetection(float EnemyxPosition, float EnemyyPosition, float ShipxPosition, float ShipyPosition, float EnemyRadius){
  if (VectorIntersect(ShipxPosition,ShipyPosition,EnemyxPosition,EnemyyPosition,EnemyRadius)){
    return true;
  }
  else {
    return false;
  }
}

//Determines whether an enemy has left the screen
boolean driftDetection(float EnemyxPosition, float EnemyyPosition, float EnemyRadius){
  if (EnemyxPosition < -EnemyRadius || EnemyxPosition > (width + EnemyRadius) || EnemyyPosition < -EnemyRadius || EnemyyPosition > (height + EnemyRadius)){
    return true;
  }
  else {
    return false;
  }
}

//Determines if all enemies have been eliminated
boolean playerProgression(int brickQuantity, int saucerQuantity, int tracerQuantity, int seekerQuantity, int marbleQuantity){
  int[] enemyQueue = {brickQuantity,saucerQuantity,tracerQuantity,seekerQuantity,marbleQuantity};
  if (iSummation(enemyQueue) == 0){
    return true;
  }
  else {
    return false;
  }
}

//Storss the active switch states
void SetSTATES(int TierZeroZero, int TierOneOne, int TierOneTwo, int TierTwoOne, int TierTwoTwo, int TierTwoThree){
  activeSTATES[0] = TierZeroZero;
  
  activeSTATES[1] = TierOneOne;
  activeSTATES[2] = TierOneTwo;
  
  activeSTATES[3] = TierTwoOne;
  activeSTATES[4] = TierTwoTwo;
  activeSTATES[5] = TierTwoThree;
}

//Re-initializes the game to the previous switch states
int[] ResetSTATES(){
  return activeSTATES;
}
