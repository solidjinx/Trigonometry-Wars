void RollGraphics(){
  CursorTexture = loadImage("Buttons\\Cursor.png");
  
  classicCountdown3 = loadImage("Buttons\\Classic\\Countdown 3.png");
  classicCountdown2 = loadImage("Buttons\\Classic\\Countdown 2.png");
  classicCountdown1 = loadImage("Buttons\\Classic\\Countdown 1.png");
  ClassicPlayButton = loadImage("Buttons\\Classic\\Start Button.png");
  classicBackwardArrowTexture = loadImage("Buttons\\Classic\\Backward Arrow.png");
  classicForwardArrowTexture = loadImage("Buttons\\Classic\\Forward Arrow.png");
  classicExit = loadImage("Buttons\\Classic\\Exit Button.png");
  classicUnpause = loadImage("Buttons\\Classic\\Unpause Button.png");
  
  adventureCountdown3 = loadImage("Buttons\\Adventure\\Countdown 3.png");
  adventureCountdown2 = loadImage("Buttons\\Adventure\\Countdown 2.png");
  adventureCountdown1 = loadImage("Buttons\\Adventure\\Countdown 1.png");
  AdventurePlayButton = loadImage("Buttons\\Adventure\\Start Button.png");
  adventureExit = loadImage("Buttons\\Adventure\\Exit Button.png");
  adventureUnpause = loadImage("Buttons\\Adventure\\Unpause Button.png");
  LeftArrowTexture = loadImage("Buttons\\Adventure\\Double Left Arrow.png");
  RightArrowTexture = loadImage("Buttons\\Adventure\\Double Right Arrow.png");
  UpArrowTexture = loadImage("Buttons\\Adventure\\Double Up Arrow.png");
  DownArrowTexture = loadImage("Buttons\\Adventure\\Double Down Arrow.png");
}


void RollVortex(int StarCount){
  for (int i = 0; i < StarCount; i++){
    Vortex.add(new Stars());
  }
}

void Vortex(int StarCount){
  for (int i = Vortex.size() - 1; i >= 0; i--){
    Stars singleStar = Vortex.get(i);
    Vortex.remove(singleStar);
  }
  for (int i = 0; i < StarCount; i++){
    Vortex.add(new Stars());
  }
}


void RollVoid(int VoidlingCount){
  for (int i = 0; i < VoidlingCount; i++){
    Void.add(new Voidling());
  }
}

void Void(int VoidlingCount){
  for (int i = Void.size() - 1; i >= 0; i--){
    Voidling singleVoidling = Void.get(i);
    Void.remove(singleVoidling);
  }
  for (int i = 0; i < VoidlingCount; i++){
    Void.add(new Voidling());
  }
}

void Roll(int[] spawnCount){
  //Initializes ArrayLists and textures
  playerJetFulcrumTexture = loadImage("Textures\\Fulcrum_Texture.png");
  Fulcrum = new playerFulcrumJet();
  
  enemylvl1Texture = loadImage("Textures\\Enemies\\Enemy1_Texture.png");
  for (int i = 0; i < spawnCount[0]; i++){
    Red_Brick.add(new Red_Brick());
  }
  enemylvl2Texture = loadImage("Textures\\Enemies\\Enemy2_Texture.png");
  for (int i = 0; i < spawnCount[1]; i++){
    Purple_Saucer.add(new Purple_Saucer());
  }
  enemylvl3Texture = loadImage("Textures\\Enemies\\Enemy3_Texture.png");
  for (int i = 0; i < spawnCount[2]; i++){
    Rainbow_Tracer.add(new Rainbow_Tracer());
  }
  enemylvl4Texture = loadImage("Textures\\Enemies\\Enemy4_Texture.png");
  for (int i = 0; i < spawnCount[3]; i++){
    Violent_Seeker.add(new Violent_Seeker());
  }
  enemylvl5Texture = loadImage("Textures\\Enemies\\Enemy5_Texture.png");
  for (int i = 0; i < spawnCount[4]; i++){
    Crypt_Stalker.add(new Crypt_Stalker());
  }
  enemylvl6Texture = loadImage("Textures\\Enemies\\Enemy6_Texture.png");
  for (int i = 0; i < spawnCount[5]; i++){
    Crypt_Orbs.add(new Crypt_Orbs());
  }
  enemylvl7Texture1 = loadImage("Textures\\Enemies\\Enemy7.1_Texture.png");
  enemylvl7Texture2 = loadImage("Textures\\Enemies\\Enemy7.2_Texture.png");
  for (int i = 0; i < spawnCount[6]; i++){
    Crypt_Bomb.add(new Crypt_Bomb());
  }
  
  boss1Texture = loadImage("Textures\\Enemies\\Boss1_Texture.png");
  for (int i = 0; i < spawnCount[7]; i++){
    Momma_Marble.add(new Momma_Marble());
  }
  for (int i = 0; i < spawnCount[8]; i++){
    Void_Evoker.add(new Void_Evoker());
  }
  //No gravity sink by boss 1 set as default
  Fulcrum.gravityWell = false;
  Drifter.gravityWell = false;
  Behemoth.gravityWell = false;
  
  //Initializes PGraphics variables
  jetWash = createGraphics(width,height,P2D);
  backWash = createGraphics(round(1.8*width),round(1.8*height),P2D);
}

void Reroll(int[] IspawnCount){
  for (int i = 0; i < Red_Brick.size(); i++){
    Red_Brick singleBrick = Red_Brick.get(i);
    Red_Brick.remove(singleBrick);
  }
  for (int i = 0; i < Purple_Saucer.size(); i++){
    Purple_Saucer singleSaucer = Purple_Saucer.get(i);
    Purple_Saucer.remove(singleSaucer);
  }
  for (int i = 0; i < Rainbow_Tracer.size(); i++){
    Rainbow_Tracer singleTracer = Rainbow_Tracer.get(i);
    Rainbow_Tracer.remove(singleTracer);
  }
  for (int i = 0; i < Violent_Seeker.size(); i++){
    Violent_Seeker singleSeeker = Violent_Seeker.get(i);
    Violent_Seeker.remove(singleSeeker);
  }
  for (int i = 0; i < Crypt_Stalker.size(); i++){
    Crypt_Stalker singleStalker = Crypt_Stalker.get(i);
    Crypt_Stalker.remove(singleStalker);
  }
  for (int i = 0; i < Crypt_Orbs.size(); i++){
    Crypt_Orbs singleOrb = Crypt_Orbs.get(i);
    Crypt_Orbs.remove(singleOrb);
  }
  for (int i = 0; i < Crypt_Bomb.size(); i++){
    Crypt_Bomb singleBomb = Crypt_Bomb.get(i);
    Crypt_Bomb.remove(singleBomb);
  }
  
  for (int i = 0; i < Momma_Marble.size(); i++){
    Momma_Marble singleMarble = Momma_Marble.get(i);
    Momma_Marble.remove(singleMarble);
  }
  for (int i = 0; i < Void_Evoker.size(); i++){
    Void_Evoker singleEvoker = Void_Evoker.get(i);
    Void_Evoker.remove(singleEvoker);
  }
  Roll(IspawnCount);
}


void RollAdventureMode(){
  //For Sun
  for (int i = 0; i < 1886; i++){
    Sun.add(new Solar());
  }
  //World 1
  for (int i = 0; i < 1; i++){
    planet1.add(new FirstSystem());
  }
  for (int i = 0; i < 3; i++){
    levels13.add(new leveling_Red_Brick());
  }
  //World 2
  for (int i = 0; i < 1; i++){
    planet2.add(new SecondSystem());
  }
  for (int i = 0; i < 2; i++){
    levels22.add(new leveling_Purple_Saucer());
  }
  //World 3
  for (int i = 0; i < 1; i++){
    planet3.add(new ThirdSystem());
  }
  for (int i = 0; i < 4; i++){
    levels34.add(new leveling_Rainbow_Tracer());
  }
  //World 4
  for (int i = 0; i < 1; i++){
    planet4.add(new FourthSystem());
  }
  for (int i = 0; i < 5; i++){
    levels45.add(new leveling_Violent_Seeker());
  }
  //World 5
  for (int i = 0; i < 1; i++){
    planet5.add(new FifthSystem());
  }
  for (int i = 0; i < 3; i++){
    levels53.add(new leveling_Momma_Marble());
  }
}

void RerollAdventureMode(){
  for (int i = 0; i < Sun.size(); i++){
    Solar singleFlare = Sun.get(i);
    Sun.remove(singleFlare);
  }
  
  for (int i = 0; i < planet1.size(); i++){
    FirstSystem singleWorld = planet1.get(i);
    planet1.remove(singleWorld);
  }
  for (int i = 0; i < levels13.size(); i++){
    leveling_Red_Brick singleMoon = levels13.get(i);
    levels13.remove(singleMoon);
  }
  
  for (int i = 0; i < planet2.size(); i++){
    SecondSystem singleWorld = planet2.get(i);
    planet2.remove(singleWorld);
  }
  for (int i = 0; i < levels22.size(); i++){
    leveling_Purple_Saucer singleMoon = levels22.get(i);
    levels22.remove(singleMoon);
  }
  
  for (int i = 0; i < planet3.size(); i++){
    ThirdSystem singleWorld = planet3.get(i);
    planet3.remove(singleWorld);
  }
  for (int i = 0; i < levels34.size(); i++){
    leveling_Rainbow_Tracer singleMoon = levels34.get(i);
    levels34.remove(singleMoon);
  }
  
  for (int i = 0; i < planet4.size(); i++){
    FourthSystem singleWorld = planet4.get(i);
    planet4.remove(singleWorld);
  }
  for (int i = 0; i < levels45.size(); i++){
    leveling_Violent_Seeker singleMoon = levels45.get(i);
    levels45.remove(singleMoon);
  }
  
  for (int i = 0; i < planet5.size(); i++){
    FifthSystem singleWorld = planet5.get(i);
    planet5.remove(singleWorld);
  }
  for (int i = 0; i < levels53.size(); i++){
    leveling_Momma_Marble singleMoon = levels53.get(i);
    levels53.remove(singleMoon);
  }
  RollAdventureMode();
}
