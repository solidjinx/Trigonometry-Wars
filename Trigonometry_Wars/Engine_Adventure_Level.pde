//===============================================Level Generation====================================================================\\
void LevelGen(int currentLevel, int ttt){
  pushStyle();
  switch (currentLevel){
    case 11:  //World 1, Level 1
      background(0);
      setyGradient(0,0,width,height/3,color(255,0,0),color(0,0,0));
      setyGradient(0,round(Divide(2*height,3)),width,height/3,color(0,0,0),color(255,0,0));
    break;
    case 12:  //World 1, Level 2
      background(0);
      setxGradient(0,0,ttt,height,color(255,0,0),color(0,0,0));
    break;
    case 13:  //World 1, Level 3
      //
    break;
    case 21:  //World 2, Level 1
      //
    break;
    case 22:  //World 2, Level 2
      //
    break;
    case 31:  //World 3, Level 1
      //
    break;
    case 32:  //World 3, Level 2
      //
    break;
    case 33:  //World 3, Level 3
      //
    break;
    case 34:  //World 3, Level 4
      //
    break;
    case 41:  //World 4, Level 1
      //
    break;
    case 42:  //World 4, Level 2
      //
    break;
    case 43:  //World 4, Level 3
      //
    break;
    case 44:  //World 4, Level 4
      //
    break;
    case 45:  //World 4, Level 5
      //
    break;
    case 51:  //World 5, Level 1
      //
    break;
    case 52:  //World 5, Level 2
      //
    break;
    case 53:  //World 5, Level 3
      //
    break;
  }
  popStyle();
}

//===============================================Enemy Spawning Control (by Level) (for Class Constructor)====================================================================\\
float[] EnemySpawn(int currentLevel, int ttt, float enemySize){
  int spawnPicker;
  switch (currentLevel){
    case 11:  //World 1, Level 1
      spawnPicker = round(random(1));
      switch (spawnPicker){
        case 0:
          return (new float[]{random(enemySize,width - enemySize),random(enemySize,Divide(height,3) - enemySize)});
        //break;
        case 1:
          return (new float[]{random(enemySize,width - enemySize),random(Divide(2*height,3) + enemySize,height - enemySize)});
        //break;
      }
    break;
    case 12:  //World 1, Level 2
      //
    break;
    case 13:  //World 1, Level 3
      //
    break;
    case 21:  //World 2, Level 1
      //
    break;
    case 22:  //World 2, Level 2
      //
    break;
    case 31:  //World 3, Level 1
      //
    break;
    case 32:  //World 3, Level 2
      //
    break;
    case 33:  //World 3, Level 3
      //
    break;
    case 34:  //World 3, Level 4
      //
    break;
    case 41:  //World 4, Level 1
      //
    break;
    case 42:  //World 4, Level 2
      //
    break;
    case 43:  //World 4, Level 3
      //
    break;
    case 44:  //World 4, Level 4
      //
    break;
    case 45:  //World 4, Level 5
      //
    break;
    case 51:  //World 5, Level 1
      //
    break;
    case 52:  //World 5, Level 2
      //
    break;
    case 53:  //World 5, Level 3
      //
    break;
  }
  return (new float[]{0,0});
}

//===============================================Player Control (floor is lava)====================================================================\\
boolean isLava(int currentLevel, float[] playerPos){
  switch (currentLevel){
    case 11:  //World 1, Level 1
      if (playerPos[1] < height/3 || playerPos[1] > Divide(2*height,3)){
        return true;
      }
      return false;
    //break;
    case 12:  //World 1, Level 2
      //
    break;
    case 13:  //World 1, Level 3
      //
    break;
    case 21:  //World 2, Level 1
      //
    break;
    case 22:  //World 2, Level 2
      //
    break;
    case 31:  //World 3, Level 1
      //
    break;
    case 32:  //World 3, Level 2
      //
    break;
    case 33:  //World 3, Level 3
      //
    break;
    case 34:  //World 3, Level 4
      //
    break;
    case 41:  //World 4, Level 1
      //
    break;
    case 42:  //World 4, Level 2
      //
    break;
    case 43:  //World 4, Level 3
      //
    break;
    case 44:  //World 4, Level 4
      //
    break;
    case 45:  //World 4, Level 5
      //
    break;
    case 51:  //World 5, Level 1
      //
    break;
    case 52:  //World 5, Level 2
      //
    break;
    case 53:  //World 5, Level 3
      //
    break;
  }
  return false;
}
