class Red_Brick{
  ////Class variables
  float xPos;
  float yPos;
  //determines size and movement direction
  float enemySize = 60;
  int cardinalPicker;
  //determines spawning area
  float radialSpawn;
  float thetaSpawn;
  float validRadiusInner = (width + height)/8;
  float validRadiusOuter = validRadiusInner + 4*enemySize;
  
  int VALUE = 5;
  int HEALTH;
  

  Red_Brick(){
    ////Constructor
    HEALTH = VALUE;
    //spawns in valid area
    radialSpawn = random(validRadiusInner,validRadiusOuter - enemySize);
    thetaSpawn = random(TAU);
    xPos = width/2 + radialSpawn*cos(thetaSpawn);
    yPos = height/2 + radialSpawn*sin(thetaSpawn);
    cardinalPicker = 0;
  }

  ////Class methods
  void move(){
    //Uses master game tick to allow movement
    if (enemyTICK % 60 == 0){
      cardinalPicker = int(random(1,5));
      switch (cardinalPicker){
        case 1:  //flip left
          if ((xPos - 2*enemySize) <= 0){
            cardinalPicker = 2;
          break;
          }
          else {
            xPos -= enemySize;
          }
        break;
        case 2:  //flip right
          if ((xPos + 2*enemySize) >= width){
            cardinalPicker = 1;
          break;
          }
          else {
            xPos += enemySize;
          }
        break;
        case 3:  //flip down
          if ((yPos + 2*enemySize) >= height){
            cardinalPicker = 4;
          break;
          }
          else {
            yPos += (enemySize + 6);
          }
        break;
        case 4:  //flip up
          if ((yPos - 2*enemySize) <= 0){
            cardinalPicker = 3;
          break;
          }
          else {
            yPos -= (enemySize + 6);
          }
        break;
      }
    }
  }

  void display(){
    image(enemylvl1Texture,xPos,yPos,enemySize,enemySize);
  }
}
