//player declarations
playerFulcrumJet Fulcrum;
playerDrifterJet Drifter;
playerBehemothJet Behemoth;
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
PImage playerJetDrifterTexture;
PImage playerJetBehemothTexture;
PImage shieldlvl0Texture;
PImage shieldlvl1Texture;
PImage shieldlvl2Texture;

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
  ShieldLoader();
  RollGraphics();
  RollAdventureMode();
  
  //println(PIE*PI);
}

void draw(){
  masterSwitch();  //Screen_Control tab
  enemyTICK++;
  
  //println(int(frameRate));
  //println(activeSTATES);
}
