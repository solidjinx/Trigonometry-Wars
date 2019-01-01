//player declarations
playerClassicJet Fulcrum;
//enemy class declarations
ArrayList<Red_Brick> Red_Brick = new ArrayList<Red_Brick>();
ArrayList<Purple_Saucer> Purple_Saucer = new ArrayList<Purple_Saucer>();
ArrayList<Rainbow_Tracer> Rainbow_Tracer = new ArrayList<Rainbow_Tracer>();
ArrayList<Violent_Seeker> Violent_Seeker = new ArrayList<Violent_Seeker>();
ArrayList<Crypt_Stalker> Crypt_Stalker = new ArrayList<Crypt_Stalker>();
ArrayList<Crypt_Orbs> Crypt_Orbs = new ArrayList<Crypt_Orbs>();
ArrayList<Crypt_Bomb> Crypt_Bomb = new ArrayList<Crypt_Bomb>();

ArrayList<Momma_Marble> Momma_Marble = new ArrayList<Momma_Marble>();
ArrayList<Void_Evoker> Void_Evoker = new ArrayList<Void_Evoker>();
//Adventure Mode UI declarations
ArrayList<Solar> Sun = new ArrayList<Solar>();

ArrayList<FirstSystem> planet1 = new ArrayList<FirstSystem>();
ArrayList<leveling_Red_Brick> levels13 = new ArrayList<leveling_Red_Brick>();

ArrayList<SecondSystem> planet2 = new ArrayList<SecondSystem>();
ArrayList<leveling_Purple_Saucer> levels22 = new ArrayList<leveling_Purple_Saucer>();

ArrayList<ThirdSystem> planet3 = new ArrayList<ThirdSystem>();
ArrayList<leveling_Rainbow_Tracer> levels34 = new ArrayList<leveling_Rainbow_Tracer>();

ArrayList<FourthSystem> planet4 = new ArrayList<FourthSystem>();
ArrayList<leveling_Violent_Seeker> levels45 = new ArrayList<leveling_Violent_Seeker>();

ArrayList<FifthSystem> planet5 = new ArrayList<FifthSystem>();
ArrayList<leveling_Momma_Marble> levels53 = new ArrayList<leveling_Momma_Marble>();
//Texture declarations
PImage CursorTexture;

PImage classicCountdown3;
PImage classicCountdown2;
PImage classicCountdown1;
PImage ClassicPlayButton;
PImage classicBackwardArrowTexture;
PImage classicForwardArrowTexture;
PImage classicExit;
PImage classicUnpause;

PImage adventureCountdown3;
PImage adventureCountdown2;
PImage adventureCountdown1;
PImage AdventurePlayButton;
PImage adventureExit;
PImage adventureUnpause;
PImage LeftArrowTexture;
PImage RightArrowTexture;
PImage UpArrowTexture;
PImage DownArrowTexture;

PImage playerJetFulcrumTexture;
PImage enemylvl1Texture;
PImage enemylvl2Texture;
PImage enemylvl3Texture;
PImage enemylvl4Texture;
PImage enemylvl5Texture;
PImage enemylvl6Texture;
PImage enemylvl7Texture1;
PImage enemylvl7Texture2;
PImage boss1Texture;
//font information
PFont classicTitleFont;
PFont classicBodyFont;
//global Engine_Graphics variables
PGraphics jetWash;
PGraphics backWash;
////PROGRAM SWITCHES
int programState;          ////Judges whether in title {0}, classicModeState {1}, adventureModeState {2}, Pause menu {3}, or Transition Animations (global) {4}

int classicModeState;        //judges whether in tutorial {1-6}, Countdown {7-9}, classicModeGame {10}, death animation {11}, loser screen {12}, or winner screen {13}
int classicModeGame;         //Judges whether in play -- Round 1 {1}, 2 {2}, 3 {3}, or 4 (boss) {4}

int adventureModeState;           //Judges whether in Solar UI {0}, adventureModeWorldSelection {1}, Countdown {2-4}, adventureModeGame {5}, death animation {6}, loser screen {7}, winner screen {8}, Jet upgrades menu {9}, or Storyline {10}
int adventureModeWorldSelection;  //Judges whether in World 1 {1}, 2 {2}, 3 {3}, 4 {4}, or 5 (boss) {5}
int adventureModeGame;            //Judges whether in play -- World 1 {11-13}, World 2 {21-22}, World 3 {31-34}, World 4 {41-45}, World 5 {51-53}
int[] activeSTATES = new int[6];
////MASTER GAME TICKS
int localTIMER = 0;   //for adding controlled repeatability in masterSwitch();
int playerTICK = 0;   //for controlling player progress in Adventure Mode
boolean adventureModeUnlocked;
int enemyTICK = 0;           //for controlling enemy spawning and movement
int playerSCORE = 0;         //for scoring points  //20440 is max Classic score
int playerCARNAGEKUDOS = 0;  //for controlling ship upgrades
boolean throwBomb = false;


void setup(){
  fullScreen(P2D,1);
  //size(1000,1000,P2D);
  smooth(16);
  frameRate(120);
  noCursor();
  //flags programSTATE 2 as vaild
  adventureModeUnlocked = true;
  ////can comment out any except programState (who's default value = 0)
  programState = 0;
  classicModeState = 0;
  classicModeGame = 0;
  adventureModeState = 0;
  adventureModeWorldSelection = 0;
  adventureModeGame = 0;
  
  //item initializations
  imageMode(CENTER);
  classicTitleFont = createFont("Stencil",ScaleFont(160),true);
  classicBodyFont = createFont("Spicy Rice",ScaleFont(120),true);
  Roll(new int[]{1,1,1,1,1,1,1,1,1});
  //RollVortex(1);
  VortexLoader();
  RollGraphics();
  RollAdventureMode();
  
  //println(PIE*PI);
}

void draw(){
  masterSwitch();  //Screen_Control tab
  enemyTICK++;
  
  //println(frameRate);
  //println(activeSTATES);
}


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
  Fulcrum = new playerClassicJet();
  
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
  //No gravity by boss 1 set as default
  Fulcrum.gravityWell = false;
  
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
