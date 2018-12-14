//Classic Mode Tutorial
String Title = "Trigonometry Wars";
String SubTitle = "welcome to your [likely] doom...";

String InstructionsP11 = "This is your battleship:";
String InstructionsP12 = "The Fulcrum";
String InstructionsP13 = "It will follow the cursor and melt any baddies along the way with a powerful laser (click on enemy),";
String InstructionsP14 = "but you must prevent contact between it and any other enemy or face a spectacular explosion!";

String InstructionsP21 = "Say hello to the largest group of morons in the galaxy-";
String InstructionsP22 = "it appears Red Bricks build their ships with holes right down the middle!";
String InstructionsP23 = "it might be a good idea to take them out before their sporadic teleporting kills both parties...";

String InstructionsP31 = "Remember what is was like to learn how to use the clutch and/or steering wheel?";
String InstructionsP32 = "Purple Saucers sure don't. This faction is out to kill but luckily they can't drive while drunk!";

String InstructionsP41 = "Aren't they cute? Well not on the recieving end.";
String InstructionsP42 = "Meet the Rainbow Tracer -- they have somewhere to be, but walls always seem to get in their way";
String InstructionsP43 = "Give them space, and no one has to find out what kinetic energy feels like at light speed";

String InstructionsP51 = "Legend has it -- that Violent Seekers are just arrogant assholes";
String InstructionsP52 = "Their prey can all but feel hopeless in the wake of their destruction";
String InstructionsP53 = "Must be because that spacetime-warping cockpit of theirs really must be nauseating to be in...";

String InstructionsP61 = "The physical embodiment of hot, bloody murder -- I'd stay away if I were you!!";

String[] FailedGame = {"Get knocked out, FOOL!","Better luck next time!","Sure, blame the lag!","Dodge next time","Maybe it's a sine","That was brutal, LMAO!","#UnitCircleFail","Wrong triangle bro"};
int failedGame;
String[] WinningGame = {"Congratulations Rookie, you beat Classic!","Ace job today, Pilot -- 4 Kudos!!","8 Kudos to you, Commander -- Perfect score!!!"};
int winningGame;
String GameSet = "Adventure Mode is now unlocked";


void masterSwitch(){
  switch (programState){
    case 0:  //Title
      classicScreenBackground();
      //VortexAnimator();
      NavButton("Classic",Divide(width,2) + 250,height - (300 + Divide(height,8)),300,300,"Click to Play Classic",0);
      NavButton("Adventure",Divide(width,2) - 250,height - (300 + Divide(height,8)),300,300,"Click to Play Adventure",0);
      NavButton("N/A",width - Divide(width,8),height - Divide(height,10),200,100,"Click for Classic Mode Tutorial!",1);
      NavButton("N/A",width/8,height - Divide(height,10),200,100,"Click for Adventure Mode Story!",-1);
      rectMode(CENTER);
      textAlign(CENTER,CENTER);
      textFont(classicTitleFont,ScaleFont(160));
      fill(c2);
      text(Title,width/2,height/6);
      if (mouseX >= (width/2 - Divide(textWidth(Title),2)) && mouseX <= (width/2 + Divide(textWidth(Title),2)) && mouseY >= (height/6 - Divide(textAscent() + textDescent(),2)) && mouseY <= (height/6 + Divide(textAscent() + textDescent(),2))){
        textFont(classicBodyFont,ScaleFont(90));
        fill(colorDelta1*100/PI,200 - colorDelta1*100/PI,0);
        text(SubTitle,width/2,height/6 + ScaleFont(160));
      }
      textFont(classicBodyFont,ScaleFont(45));
      image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
      //For Classic Mode Tutorial (Fulcrum page)
      if (mousePressed && localTIMER >= 120 && NavClicked(width - Divide(width,8),height - Divide(height,10),200,100)){
        localTIMER = 0;
        Reroll(0,0,0,0,0);
        programState = 1;
        classicModeState = 1;
        break;
      }
      //For Classic Mode Play Button
      else if (mousePressed && NavClicked(Divide(width,2) + 250,height - (300 + Divide(height,8)),300,300)){
        localTIMER = 0;
        programState = 1;
        classicModeState = 7;
        break;
      }
      //For Adventure Mode Play Button
      else if (mousePressed && NavClicked(Divide(width,2) - 250,height - (300 + Divide(height,8)),300,300)){
        localTIMER = 0;
        //Vortex(540);
        programState = 2;
        adventureModeState = 0;
        break;
      }
      //For Adventure Mode Storyline
      else if (mousePressed && NavClicked(width/8,height - Divide(height,10),200,100)){
        localTIMER = 0;
        programState = 2;
        adventureModeState = 10;
        break;
      }
      localTIMER++;
    break;
    case 1:  //Classic Mode
      switch (classicModeState){
        case 1:  //Tutorial
          classicScreenBackground();
          NavButton("N/A",width - Divide(width,8),height - Divide(height,10),200,100,"Click to meet the first enemy class!",1);
          NavButton("N/A",width/8,height - Divide(height,10),200,100,"Click to go back to the Title Screen",-1);
          NavButton("Classic",width/2,height - Divide(height,6),300,300,"Click to Play Classic",0);
          JetWash();
          Fulcrum.move();
          Fulcrum.display();
          rectMode(CENTER);
          textAlign(CENTER,CENTER);
          textFont(classicTitleFont,ScaleFont(160));
          fill(c2);
          text(Title,width/2,height/6);
          textFont(classicBodyFont,ScaleFont(45));
          fill(0,200,0);
          text(InstructionsP11,width/2,height/6 + ScaleFont(140));
          textFont(classicBodyFont,ScaleFont(60));
          fill(colorDelta1*100/PI,200 - colorDelta1*100/PI,0);
          text(InstructionsP12,width/2,height/6 + ScaleFont(190));
          textFont(classicBodyFont,ScaleFont(45));
          fill(0,200,0);
          text(InstructionsP13,width/2,height/6 + ScaleFont(240));
          text(InstructionsP14,width/2,height/6 + ScaleFont(280));
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
          //For Classic Mode Tutorial (Red_Brick page)
          if (mousePressed && localTIMER >= 120 && NavClicked(width - Divide(width,8),height - Divide(height,10),200,100)){
            localTIMER = 0;
            Reroll(1,0,0,0,0);
            programState = 1;
            classicModeState = 2;
            break;
          }
          //For Title Screen
          else if (mousePressed && localTIMER >= 120 && NavClicked(width/8,height - Divide(height,10),200,100)){
            localTIMER = 0;
            programState = 0;
            break;
          }
          //For Classic Mode Play Button
          else if (mousePressed && NavClicked(width/2,height - Divide(height,6),300,300)){
            localTIMER = 0;
            programState = 1;
            classicModeState = 7;
            break;
          }
          localTIMER++;
        break;
        case 2:  //Tutorial
          classicScreenBackground();
          NavButton("N/A",width - Divide(width,8),height - Divide(height,10),200,100,"Click to meet the second enemy class!",1);
          NavButton("N/A",width/8,height - Divide(height,10),200,100,"Click to go back to the Fulcrum viewing pool",-1);
          NavButton("Classic",width/2,height - Divide(height,6),300,300,"Click to Play Classic",0);
          Red_Brick singleBrick = Red_Brick.get(0);
          singleBrick.enemySize = 100;
          singleBrick.move();
          singleBrick.display();
          rectMode(CENTER);
          textAlign(CENTER,CENTER);
          textFont(classicTitleFont,ScaleFont(160));
          fill(c2);
          text(Title,width/2,height/6);
          textFont(classicBodyFont,ScaleFont(45));
          fill(0,200,0);
          text(InstructionsP21,width/2,height/6 + ScaleFont(140));
          text(InstructionsP22,width/2,height/6 + ScaleFont(190));
          text(InstructionsP23,width/2,height/6 + ScaleFont(240));
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
          //For Classic Mode Tutorial (Purple_Saucer page)
          if (mousePressed && localTIMER >= 120 && NavClicked(width - Divide(width,8),height - Divide(height,10),200,100)){
            localTIMER = 0;
            //singleBrick.enemySize = 40;
            Red_Brick.remove(singleBrick);
            Reroll(0,1,0,0,0);
            programState = 1;
            classicModeState = 3;
            break;
          }
          //For Classic Mode Tutorial (Fulcrum page)
          else if (mousePressed && localTIMER >= 120 && NavClicked(width/8,height - Divide(height,10),200,100)){
            localTIMER = 0;
            //singleBrick.enemySize = 40;
            Red_Brick.remove(singleBrick);
            Reroll(0,0,0,0,0);
            programState = 1;
            classicModeState = 1;
            break;
          }
          //For Classic Mode Play Button
          else if (mousePressed && NavClicked(width/2,height - Divide(height,6),300,300)){
            localTIMER = 0;
            programState = 1;
            classicModeState = 7;
            break;
          }
          localTIMER++;
        break;
        case 3:  //Tutorial
          classicScreenBackground();
          NavButton("N/A",width - Divide(width,8),height - Divide(height,10),200,100,"Click to meet the third enemy class!",1);
          NavButton("N/A",width/8,height - Divide(height,10),200,100,"Click to go back to the Red Bricks",-1);
          NavButton("Classic",width/2,height - Divide(height,6),300,300,"Click to Play Classic",0);
          Purple_Saucer singleSaucer = Purple_Saucer.get(0);
          singleSaucer.saucerSpeed = 10;
          singleSaucer.enemySize = 120;
          singleSaucer.move();
          singleSaucer.display();
          rectMode(CENTER);
          textAlign(CENTER,CENTER);
          textFont(classicTitleFont,ScaleFont(160));
          fill(c2);
          text(Title,width/2,height/6);
          textFont(classicBodyFont,ScaleFont(45));
          fill(0,200,0);
          text(InstructionsP31,width/2,height/6 + ScaleFont(140));
          text(InstructionsP32,width/2,height/6 + ScaleFont(190));
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
          //For Classic Mode Tutorial (Rainbow_Tracer page)
          if (mousePressed && localTIMER >= 120 && NavClicked(width - Divide(width,8),height - Divide(height,10),200,100)){
            localTIMER = 0;
            //singleSaucer.saucerSpeed = 2;
            //singleSaucer.enemySize = 80;
            Purple_Saucer.remove(singleSaucer);
            Reroll(0,0,1,0,0);
            programState = 1;
            classicModeState = 4;
            break;
          }
          //For Classic Mode Tutorial (Red_Brick page)
          else if (mousePressed && localTIMER >= 120 && NavClicked(width/8,height - Divide(height,10),200,100)){
            localTIMER = 0;
            //singleSaucer.saucerSpeed = 2;
            //singleSaucer.enemySize = 80;
            Purple_Saucer.remove(singleSaucer);
            Reroll(1,0,0,0,0);
            programState = 1;
            classicModeState = 2;
            break;
          }
          //For Classic Mode Play Button
          else if (mousePressed && NavClicked(width/2,height - Divide(height,6),300,300)){
            localTIMER = 0;
            //singleSaucer.saucerSpeed = 2;
            //singleSaucer.enemySize = 80;
            Purple_Saucer.remove(singleSaucer);
            programState = 1;
            classicModeState = 7;
            break;
          }
          localTIMER++;
        break;
        case 4:  //Tutorial
          classicScreenBackground();
          NavButton("N/A",width - Divide(width,8),height - Divide(height,10),200,100,"Click to meet the fourth enemy class!",1);
          NavButton("N/A",width/8,height - Divide(height,10),200,100,"Click to go back to the Purple Saucers",-1);
          NavButton("Classic",width/2,height - Divide(height,6),300,300,"Click to Play Classic",0);
          Rainbow_Tracer singleTracer = Rainbow_Tracer.get(0);
          singleTracer.enemySize = 120;
          singleTracer.move();
          singleTracer.display();
          rectMode(CENTER);
          textAlign(CENTER,CENTER);
          textFont(classicTitleFont,ScaleFont(160));
          fill(c2);
          text(Title,width/2,height/6);
          textFont(classicBodyFont,ScaleFont(45));
          fill(0,200,0);
          text(InstructionsP41,width/2,height/6 + ScaleFont(140));
          text(InstructionsP42,width/2,height/6 + ScaleFont(190));
          text(InstructionsP43,width/2,height/6 + ScaleFont(240));
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
          //For Classic Mode Tutorial (Violent_Seeker page)
          if (mousePressed && localTIMER >= 120 && NavClicked(width - Divide(width,8),height - Divide(height,10),200,100)){
            localTIMER = 0;
            //singleTracer.enemySize = 60;
            Rainbow_Tracer.remove(singleTracer);
            Reroll(0,0,0,1,0);
            programState = 1;
            classicModeState = 5;
            break;
          }
          //For Classic Mode Tutorial (Purple_Saucer page)
          else if (mousePressed && localTIMER >= 120 && NavClicked(width/8,height - Divide(height,10),200,100)){
            localTIMER = 0;
            //singleTracer.enemySize = 60;
            Rainbow_Tracer.remove(singleTracer);
            Reroll(0,1,0,0,0);
            programState = 1;
            classicModeState = 3;
            break;
          }
          //For Classic Mode Play Button
          else if (mousePressed && NavClicked(width/2,height - Divide(height,6),300,300)){
            localTIMER = 0;
            //singleTracer.enemySize = 60;
            Rainbow_Tracer.remove(singleTracer);
            programState = 1;
            classicModeState = 7;
            break;
          }
          localTIMER++;
        break;
        case 5:  //Tutorial
          classicScreenBackground();
          NavButton("N/A",width - Divide(width,8),height - Divide(height,10),200,100,"Click to meet the classic Boss!",1);
          NavButton("N/A",width/8,height - Divide(height,10),200,100,"Click to go back to the Rainbow Tracers",-1);
          NavButton("Classic",width/2,height - Divide(height,6),300,300,"Click to Play Classic",0);
          Violent_Seeker singleSeeker = Violent_Seeker.get(0);
          singleSeeker.move();
          singleSeeker.display();
          rectMode(CENTER);
          textAlign(CENTER,CENTER);
          textFont(classicTitleFont,ScaleFont(160));
          fill(c2);
          text(Title,width/2,height/6);
          textFont(classicBodyFont,ScaleFont(45));
          fill(0,200,0);
          text(InstructionsP51,width/2,height/6 + ScaleFont(140));
          text(InstructionsP52,width/2,height/6 + ScaleFont(190));
          text(InstructionsP53,width/2,height/6 + ScaleFont(240));
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
          //For Classic Mode Tutorial (Momma_Marble page)
          if (mousePressed && localTIMER >= 120 && NavClicked(width - Divide(width,8),height - Divide(height,10),200,100)){
            localTIMER = 0;
            Violent_Seeker.remove(singleSeeker);
            Reroll(0,0,0,0,1);
            programState = 1;
            classicModeState = 6;
            break;
          }
          //For Classic Mode Tutorial (Rainbow_Tracer page)
          else if (mousePressed && localTIMER >= 120 && NavClicked(width/8,height - Divide(height,10),200,100)){
            localTIMER = 0;
            Violent_Seeker.remove(singleSeeker);
            Reroll(0,0,1,0,0);
            programState = 1;
            classicModeState = 4;
            break;
          }
          //For Classic Mode Play Button
          else if (mousePressed && NavClicked(width/2,height - Divide(height,6),300,300)){
            localTIMER = 0;
            Violent_Seeker.remove(singleSeeker);
            programState = 1;
            classicModeState = 7;
            break;
          }
          localTIMER++;
        break;
        case 6:  //Tutorial
          classicScreenBackground();
          NavButton("N/A",width/8,height - Divide(height,10),200,100,"Click to go back to the Violent Seekers",-1);
          NavButton("Classic",width/2,height - Divide(height,6),300,300,"Click to Play Classic",0);
          Momma_Marble singleMarble = Momma_Marble.get(0);
          singleMarble.move();
          singleMarble.display();
          rectMode(CENTER);
          textAlign(CENTER,CENTER);
          textFont(classicTitleFont,ScaleFont(160));
          fill(c2);
          text(Title,width/2,height/6);
          textFont(classicBodyFont,ScaleFont(45));
          fill(0,200,0);
          text(InstructionsP61,width/2,height/6 + ScaleFont(140));
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
          //For Classic Mode Tutorial (Violent_Seeker page)
          if (mousePressed && localTIMER >= 120 && NavClicked(width/8,height - Divide(height,10),200,100)){
            localTIMER = 0;
            Momma_Marble.remove(singleMarble);
            Reroll(0,0,0,1,0);
            programState = 1;
            classicModeState = 5;
            break;
          }
          //For Classic Mode Play Button
          else if (mousePressed && NavClicked(width/2,height - Divide(height,6),300,300)){
            localTIMER = 0;
            Momma_Marble.remove(singleMarble);
            programState = 1;
            classicModeState = 7;
            break;
          }
          localTIMER++;
        break;
        case 7:  //Countdown 3
          black = 0;
          BackWash();
          if (localTIMER == 0){
            pushStyle();
            imageMode(CORNERS);
            image(classicCountdown3,0,0,width,height);
            popStyle();
          }
          if (localTIMER == 60){
            localTIMER = 0;
            classicModeState++;
            break;
          }
          localTIMER++;
        break;
        case 8:  //Countdown 2
          black = 0;
          BackWash();
          if (localTIMER == 0){
            pushStyle();
            imageMode(CORNERS);
            image(classicCountdown2,0,0,width,height);
            popStyle();
          }
          if (localTIMER == 60){
            localTIMER = 0;
            classicModeState++;
            break;
          }
          localTIMER++;
        break;
        case 9:  //Countdown 1
          black = 0;
          BackWash();
          if (localTIMER == 0){
            pushStyle();
            imageMode(CORNERS);
            image(classicCountdown1,0,0,width,height);
            popStyle();
          }
          //Checks Round 1, 2, 3, or no round completed, respectively
          if (localTIMER == 60 && classicModeGame == 1 && playerSCORE > 0){
            localTIMER = 0;
            //Vortex(1080);
            Reroll(42,16,8,0,0);
            programState = 1;
            classicModeState = 10;
            classicModeGame = 2;
            break;
          }
          else if (localTIMER == 60 && classicModeGame == 2){
            localTIMER = 0;
            //Vortex(1080);
            Reroll(32,32,16,4,0);
            programState = 1;
            classicModeState = 10;
            classicModeGame = 3;
            break;
          }
          else if (localTIMER == 60 && classicModeGame == 3){
            localTIMER = 0;
            //Vortex(1080);
            Reroll(32,32,8,16,1);
            programState = 1;
            classicModeState = 10;
            classicModeGame = 4;
            break;
          }
          else if (localTIMER == 60){
            localTIMER = 0;
            //Vortex(1080);
            Reroll(42,8,0,0,0);
            programState = 1;
            classicModeState = 10;
            classicModeGame = 1;
            break;
          }
          else {
            localTIMER++;
          }
        break;
        case 10: //Classic Game
          switch (classicModeGame){
            case 1:  //Round 1
              black = 0;
              JetWash();
              if (keyPressed && key == 'p'){
                SetSTATES(programState,classicModeState,classicModeGame,adventureModeState,adventureModeWorldSelection,adventureModeGame);
                programState = 3;
              }
              Fulcrum.move();
              Fulcrum.display();
              ////Detects level progression first, player death, enemy death, then moves/displays enemies
              if (playerProgression(Red_Brick.size(),Purple_Saucer.size(),Rainbow_Tracer.size(),Violent_Seeker.size(),Momma_Marble.size())){
                playerSCORE *= 2;
                programState = 1;
                classicModeState = 7;
                break;
              }
              //enemy level 1
              for (int i = 0; i < Red_Brick.size(); i++){
                singleBrick = Red_Brick.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleBrick.xPos,singleBrick.yPos,singleBrick.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleBrick.xPos,singleBrick.yPos,singleBrick.enemySize/2)){
                  Red_Brick.remove(singleBrick);
                }
                else if (mousePressed && killDetection(singleBrick.xPos,singleBrick.yPos,Fulcrum.location.x,Fulcrum.location.y,singleBrick.enemySize/2)){
                  singleBrick.HEALTH--;
                  if (singleBrick.HEALTH == 0){
                    playerSCORE += singleBrick.VALUE;
                    Red_Brick.remove(singleBrick);
                  }
                }
                singleBrick.move();
                singleBrick.display();
              }
              //enemy level 2
              for (int i = 0; i < Purple_Saucer.size(); i++){
                singleSaucer = Purple_Saucer.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleSaucer.xPos,singleSaucer.yPos,singleSaucer.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleSaucer.xPos,singleSaucer.yPos,singleSaucer.enemySize/2)){
                  Purple_Saucer.remove(singleSaucer);
                }
                else if (mousePressed && killDetection(singleSaucer.xPos,singleSaucer.yPos,Fulcrum.location.x,Fulcrum.location.y,singleSaucer.enemySize/2)){
                  singleSaucer.HEALTH--;
                  if (singleSaucer.HEALTH == 0){
                    playerSCORE += singleSaucer.VALUE;
                    Purple_Saucer.remove(singleSaucer);
                  }
                }
                singleSaucer.move();
                singleSaucer.display();
              }
              LevelProgressReadout(playerSCORE,330);
            break;
            case 2:  //Round 2
              black = 0;
              JetWash();
              if (keyPressed && key == 'p'){
                SetSTATES(programState,classicModeState,classicModeGame,adventureModeState,adventureModeWorldSelection,adventureModeGame);
                programState = 3;
              }
              Fulcrum.move();
              Fulcrum.display();
              ////Detects level progression first, player death, enemy death, then moves/displays enemies
              if (playerProgression(Red_Brick.size(),Purple_Saucer.size(),Rainbow_Tracer.size(),Violent_Seeker.size(),Momma_Marble.size())){
                playerSCORE *= 2;
                programState = 1;
                classicModeState = 7;
                break;
              }
              //enemy level 1
              for (int i = 0; i < Red_Brick.size(); i++){
                singleBrick = Red_Brick.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleBrick.xPos,singleBrick.yPos,singleBrick.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleBrick.xPos,singleBrick.yPos,singleBrick.enemySize/2)){
                  Red_Brick.remove(singleBrick);
                }
                else if (mousePressed && killDetection(singleBrick.xPos,singleBrick.yPos,Fulcrum.location.x,Fulcrum.location.y,singleBrick.enemySize/2)){
                  singleBrick.HEALTH--;
                  if (singleBrick.HEALTH == 0){
                    playerSCORE += singleBrick.VALUE;
                    Red_Brick.remove(singleBrick);
                  }
                }
                singleBrick.move();
                singleBrick.display();
              }
              //enemy level 2
              for (int i = 0; i < Purple_Saucer.size(); i++){
                singleSaucer = Purple_Saucer.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleSaucer.xPos,singleSaucer.yPos,singleSaucer.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleSaucer.xPos,singleSaucer.yPos,singleSaucer.enemySize/2)){
                  Purple_Saucer.remove(singleSaucer);
                }
                else if (mousePressed && killDetection(singleSaucer.xPos,singleSaucer.yPos,Fulcrum.location.x,Fulcrum.location.y,singleSaucer.enemySize/2)){
                  singleSaucer.HEALTH--;
                  if (singleSaucer.HEALTH == 0){
                    playerSCORE += singleSaucer.VALUE;
                    Purple_Saucer.remove(singleSaucer);
                  }
                }
                singleSaucer.move();
                singleSaucer.display();
              }
              //enemy level 3
              for (int i = 0; i < Rainbow_Tracer.size(); i++){
                singleTracer = Rainbow_Tracer.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleTracer.xPos,singleTracer.yPos,singleTracer.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleTracer.xPos,singleTracer.yPos,singleTracer.enemySize/2)){
                  Rainbow_Tracer.remove(singleTracer);
                }
                else if (mousePressed && killDetection(singleTracer.xPos,singleTracer.yPos,Fulcrum.location.x,Fulcrum.location.y,singleTracer.enemySize/2)){
                  singleTracer.HEALTH--;
                  if (singleTracer.HEALTH == 0){
                    playerSCORE += singleTracer.VALUE;
                    Rainbow_Tracer.remove(singleTracer);
                  }
                }
                singleTracer.move();
                singleTracer.display();
              }
              LevelProgressReadout(playerSCORE,1350);
            break;
            case 3:  //Round 3
              black = 0;
              JetWash();
              if (keyPressed && key == 'p'){
                SetSTATES(programState,classicModeState,classicModeGame,adventureModeState,adventureModeWorldSelection,adventureModeGame);
                programState = 3;
              }
              Fulcrum.move();
              Fulcrum.display();
              ////Detects level progression first, player death, enemy death, then moves/displays enemies
              if (playerProgression(Red_Brick.size(),Purple_Saucer.size(),Rainbow_Tracer.size(),Violent_Seeker.size(),Momma_Marble.size())){
                playerSCORE *= 2;
                programState = 1;
                classicModeState = 7;
                break;
              }
              //enemy level 1
              for (int i = 0; i < Red_Brick.size(); i++){
                singleBrick = Red_Brick.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleBrick.xPos,singleBrick.yPos,singleBrick.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleBrick.xPos,singleBrick.yPos,singleBrick.enemySize/2)){
                  Red_Brick.remove(singleBrick);
                }
                else if (mousePressed && killDetection(singleBrick.xPos,singleBrick.yPos,Fulcrum.location.x,Fulcrum.location.y,singleBrick.enemySize/2)){
                  singleBrick.HEALTH--;
                  if (singleBrick.HEALTH == 0){
                    playerSCORE += singleBrick.VALUE;
                    Red_Brick.remove(singleBrick);
                  }
                }
                singleBrick.move();
                singleBrick.display();
              }
              //enemy level 2
              for (int i = 0; i < Purple_Saucer.size(); i++){
                singleSaucer = Purple_Saucer.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleSaucer.xPos,singleSaucer.yPos,singleSaucer.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleSaucer.xPos,singleSaucer.yPos,singleSaucer.enemySize/2)){
                  Purple_Saucer.remove(singleSaucer);
                }
                else if (mousePressed && killDetection(singleSaucer.xPos,singleSaucer.yPos,Fulcrum.location.x,Fulcrum.location.y,singleSaucer.enemySize/2)){
                  singleSaucer.HEALTH--;
                  if (singleSaucer.HEALTH == 0){
                    playerSCORE += singleSaucer.VALUE;
                    Purple_Saucer.remove(singleSaucer);
                  }
                }
                singleSaucer.move();
                singleSaucer.display();
              }
              //enemy level 3
              for (int i = 0; i < Rainbow_Tracer.size(); i++){
                singleTracer = Rainbow_Tracer.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleTracer.xPos,singleTracer.yPos,singleTracer.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleTracer.xPos,singleTracer.yPos,singleTracer.enemySize/2)){
                  Rainbow_Tracer.remove(singleTracer);
                }
                else if (mousePressed && killDetection(singleTracer.xPos,singleTracer.yPos,Fulcrum.location.x,Fulcrum.location.y,singleTracer.enemySize/2)){
                  singleTracer.HEALTH--;
                  if (singleTracer.HEALTH == 0){
                    playerSCORE += singleTracer.VALUE;
                    Rainbow_Tracer.remove(singleTracer);
                  }
                }
                singleTracer.move();
                singleTracer.display();
              }
              //enemy level 4
              for (int i = 0; i < Violent_Seeker.size(); i++){
                singleSeeker = Violent_Seeker.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleSeeker.location.x,singleSeeker.location.y,76)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleSeeker.location.x,singleSeeker.location.y,singleSeeker.enemySize/2)){
                  Violent_Seeker.remove(singleSeeker);
                }
                else if (mousePressed && killDetection(singleSeeker.location.x,singleSeeker.location.y,Fulcrum.location.x,Fulcrum.location.y,82)){
                  singleSeeker.HEALTH--;
                  if (singleSeeker.HEALTH == 0){
                    playerSCORE += singleSeeker.VALUE;
                    Violent_Seeker.remove(singleSeeker);
                  }
                }
                singleSeeker.move();
                singleSeeker.display();
              }
              LevelProgressReadout(playerSCORE,4020);
            break;
            case 4:  //Round 4 (Boss)
              black = 0;
              JetWash();
              if (keyPressed && key == 'p'){
                SetSTATES(programState,classicModeState,classicModeGame,adventureModeState,adventureModeWorldSelection,adventureModeGame);
                programState = 3;
              }
              if (Momma_Marble.size() == 0){
                Fulcrum.gravityWell = false;
              }
              else {
                Fulcrum.gravityWell = true;
              }
              Fulcrum.move();
              Fulcrum.display();
              ////Checks for Boss status, then detects level progression first, player death, enemy death, then moves/displays enemies
              if (playerProgression(Red_Brick.size(),Purple_Saucer.size(),Rainbow_Tracer.size(),Violent_Seeker.size(),Momma_Marble.size())){
                playerSCORE *= 2;
                programState = 1;
                classicModeState = 13;
                break;
              }
              //enemy level 1
              for (int i = 0; i < Red_Brick.size(); i++){
                singleBrick = Red_Brick.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleBrick.xPos,singleBrick.yPos,singleBrick.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleBrick.xPos,singleBrick.yPos,singleBrick.enemySize/2)){
                  Red_Brick.remove(singleBrick);
                }
                else if (mousePressed && killDetection(singleBrick.xPos,singleBrick.yPos,Fulcrum.location.x,Fulcrum.location.y,singleBrick.enemySize/2)){
                  singleBrick.HEALTH--;
                  if (singleBrick.HEALTH == 0){
                    playerSCORE += singleBrick.VALUE;
                    Red_Brick.remove(singleBrick);
                  }
                }
                singleBrick.move();
                singleBrick.display();
              }
              //enemy level 2
              for (int i = 0; i < Purple_Saucer.size(); i++){
                singleSaucer = Purple_Saucer.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleSaucer.xPos,singleSaucer.yPos,singleSaucer.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleSaucer.xPos,singleSaucer.yPos,singleSaucer.enemySize/2)){
                  Purple_Saucer.remove(singleSaucer);
                }
                else if (mousePressed && killDetection(singleSaucer.xPos,singleSaucer.yPos,Fulcrum.location.x,Fulcrum.location.y,singleSaucer.enemySize/2)){
                  singleSaucer.HEALTH--;
                  if (singleSaucer.HEALTH == 0){
                    playerSCORE += singleSaucer.VALUE;
                    Purple_Saucer.remove(singleSaucer);
                  }
                }
                singleSaucer.move();
                singleSaucer.display();
              }
              //enemy level 3
              for (int i = 0; i < Rainbow_Tracer.size(); i++){
                singleTracer = Rainbow_Tracer.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleTracer.xPos,singleTracer.yPos,singleTracer.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleTracer.xPos,singleTracer.yPos,singleTracer.enemySize/2)){
                  Rainbow_Tracer.remove(singleTracer);
                }
                else if (mousePressed && killDetection(singleTracer.xPos,singleTracer.yPos,Fulcrum.location.x,Fulcrum.location.y,singleTracer.enemySize/2)){
                  singleTracer.HEALTH--;
                  if (singleTracer.HEALTH == 0){
                    playerSCORE += singleTracer.VALUE;
                    Rainbow_Tracer.remove(singleTracer);
                  }
                }
                singleTracer.move();
                singleTracer.display();
              }
              //enemy level 4
              for (int i = 0; i < Violent_Seeker.size(); i++){
                singleSeeker = Violent_Seeker.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleSeeker.location.x,singleSeeker.location.y,76)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (driftDetection(singleSeeker.location.x,singleSeeker.location.y,singleSeeker.enemySize/2)){
                  Violent_Seeker.remove(singleSeeker);
                }
                else if (mousePressed && killDetection(singleSeeker.location.x,singleSeeker.location.y,Fulcrum.location.x,Fulcrum.location.y,82)){
                  singleSeeker.HEALTH--;
                  if (singleSeeker.HEALTH == 0){
                    playerSCORE += singleSeeker.VALUE;
                    Violent_Seeker.remove(singleSeeker);
                  }
                }
                singleSeeker.move();
                singleSeeker.display();
              }
              //Boss
              for (int i = 0; i < Momma_Marble.size(); i++){
                singleMarble = Momma_Marble.get(i);
                if (deathDetection(Fulcrum.location.x,Fulcrum.location.y,Fulcrum.jetSize/2,singleMarble.xPos,singleMarble.yPos,singleMarble.enemySize/2)){
                  programState = 1;
                  classicModeState = 11;
                  break;
                }
                if (mousePressed && killDetection(singleMarble.xPos,singleMarble.yPos,Fulcrum.location.x,Fulcrum.location.y,singleMarble.enemySize/2.01)){
                  singleMarble.HEALTH--;
                  if (singleMarble.HEALTH == 0){
                    playerSCORE += singleMarble.VALUE;
                    Momma_Marble.remove(singleMarble);
                  }
                }
                singleMarble.move();
                singleMarble.display();
              }
              LevelProgressReadout(playerSCORE,10220);
            break;
          }
        break;
        case 11: //Death Animation
          black = 0;
          //if (localTIMER == 0){
          //  for (int i = 0; i < 3240; i++){
          //    Vortex.add(new Stars());
          //  }
          //}
          JetWash();
          FulcrumDeathAnimation(Fulcrum.location.x,Fulcrum.location.y,explosionCounter);
          FulcrumDeathAnimation(Fulcrum.location.x,Fulcrum.location.y,explosionCounter + 1);
          FulcrumDeathAnimation(Fulcrum.location.x,Fulcrum.location.y,explosionCounter + 2);
          explosionCounter *= 1.004;
          if (ExplosionEnd(Fulcrum.location.x,Fulcrum.location.y,explosionCounter) || keyPressed && (keyCode == ENTER || keyCode == RETURN)){
            localTIMER = 0;
            explosionCounter = 1;
            failedGame = int(random(FailedGame.length));
            programState = 1;
            classicModeState++;
            break;
          }
          if (classicModeGame == 1){
            LevelProgressReadout(playerSCORE,330);
          }
          else if (classicModeGame == 2){
            LevelProgressReadout(playerSCORE,1350);
          }
          else if (classicModeGame == 3){
            LevelProgressReadout(playerSCORE,4020);
          }
          else if (classicModeGame == 4){
            LevelProgressReadout(playerSCORE,10220);
          }
          localTIMER++;
        break;
        case 12: //Loser Screen
          endClassicScreenBackground();
          pushStyle();
          rectMode(CENTER);
          textAlign(CENTER,CENTER);
          image(classicExit,width/2,height - 225,200,200);
          textFont(classicTitleFont,ScaleFont(150));
          fill(c2);
          text(FailedGame[failedGame],width/2,height/3,ScaleFont(width - 2),ScaleFont(160));
          textFont(classicBodyFont,ScaleFont(90));
          fill(0,0,255);
          text(playerSCORE,width/2,height/3 + ScaleFont(300));
          popStyle();
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
          if (mousePressed && dist(mouseX,mouseY,width/2,height - 225) <= 100){
            playerSCORE = 0;
            programState = 0;
            classicModeState = 0;
            break;
          }
          LevelProgressReadout(playerSCORE,20440);
        break;
        case 13: //Winner Screen
          winClassicScreenBackground();
          pushStyle();
          rectMode(CENTER);
          textAlign(CENTER,CENTER);
          image(classicExit,width/2,height - 225,200,200);
          textFont(classicTitleFont,height/13);
          fill(c2);
          //Is score a 90% perfect or more?, Else is score perfect?, else normal text to display
          if (playerSCORE >= 18396 && playerSCORE < 20440){
            winningGame = 1;
          }
          else if (playerSCORE == 20440){
            winningGame = 2;
          }
          else {
            winningGame = 0;
          }
          text(WinningGame[winningGame],width/2,height/3);
          textFont(classicBodyFont,height/17);
          fill(0,colorDelta1*100/PI,200 - colorDelta1*100/PI);
          text(GameSet,width/2,height/3 + ScaleFont(150));
          fill(0,0,255);
          text(playerSCORE,width/2,height/3 + ScaleFont(250));
          popStyle();
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
          if (mousePressed && dist(mouseX,mouseY,width/2,height - 225) <= 100){
            if (playerSCORE >= 20000){
              playerCARNAGEKUDOS += 4;
            }
            adventureModeUnlocked = true;
            programState = 0;
            break;
          }
          LevelProgressReadout(playerSCORE,20440);
        break;
      }
    break;
    case 2:  //Adventure Mode
      switch (adventureModeState){
        case 0:  //Solar System UI
          pushMatrix();
          translate(width/2,height/2);
          scale(float(5)/9);
          black = 0;
          BackWash();
          ////Sun
          sunColor = color(200 + colorMod,100,0);
          for (int i = 0; i < Sun.size(); i++){
            Solar singleFlare = Sun.get(i);
            j = int(pow(-1,i));
            if (j < 0){
              singleFlare.Animation(true,i,Sun.size(),sunColor,RADIUS);
            }
            else {
              singleFlare.Animation(false,i,Sun.size(),sunColor,RADIUS);
            }
          }
          colorModIncrement++;
          if ((colorModIncrement % 55) == 0){
            cModIncrement = !cModIncrement;
          }
          if (cModIncrement){
            colorMod++;
          }
          else {
            colorMod--;
          }
          ////Planets
          for (int i = 0; i < planet1.size(); i++){
            FirstSystem singleWorld = planet1.get(i);
            if (dist(1.8*mouseX - Divide(1.8*width,2),1.8*mouseY - Divide(1.8*height,2),singleWorld.location.x,singleWorld.location.y) <= exp(1)*singleWorld.macroRadius){
              singleWorld.Settle();
              PlanetLabel("World 1: The Red Empire Returns",singleWorld.location.x,singleWorld.location.y,color(255,0,0));
              if (mousePressed){
                adventureModeState = 1;
                adventureModeWorldSelection = 1;
              }
            }
            else {
              singleWorld.Orbit();
            }
          }
          for (int i = 0; i < levels13.size(); i++){
            leveling_Red_Brick singleMoon = levels13.get(i);
            singleMoon.Orbit();
          }
          
          for (int i = 0; i < planet2.size(); i++){
            SecondSystem singleWorld = planet2.get(i);
            if (dist(1.8*mouseX - Divide(1.8*width,2),1.8*mouseY - Divide(1.8*height,2),singleWorld.location.x,singleWorld.location.y) <= exp(1)*singleWorld.macroRadius){
              singleWorld.Settle();
              PlanetLabel("World 2: Unidentified Flying Object",singleWorld.location.x,singleWorld.location.y,color(255,0,255));
              if (mousePressed){
                adventureModeState = 1;
                adventureModeWorldSelection = 2;
              }
            }
            else {
              singleWorld.Orbit();
            }
          }
          for (int i = 0; i < levels22.size(); i++){
            leveling_Purple_Saucer singleMoon = levels22.get(i);
            singleMoon.Orbit();
          }
          
          for (int i = 0; i < planet3.size(); i++){
            ThirdSystem singleWorld = planet3.get(i);
            if (dist(1.8*mouseX - Divide(1.8*width,2),1.8*mouseY - Divide(1.8*height,2),singleWorld.location.x,singleWorld.location.y) <= exp(1)*singleWorld.macroRadius){
              singleWorld.Settle();
              ////assumes rainbow of width 999, max color intensity 255
              switch (colorSwitch){
                case 0:  //left third  {t >= 0 && t < 333}
                  t++;
                  T = (t*PI)/333;
                  dR = 127*cos(T) + 127;
                  dG = 127 - 127*cos(T);
                  dB = 0;
                  if (t == 333){
                    colorSwitch = 1;
                    break;
                  }
                break;
                case 1:  //middle third  {t >= 333 && t < 666}
                  t++;
                  T = (t*PI)/333;
                  dR = 0;
                  dG = 127 - 127*cos(T);
                  dB = 127*cos(T);
                  if (t == 666){
                    colorSwitch = 2;
                    break;
                  }
                break;
                case 2:  //right third  {t >= 666 && t <= 999}
                  t++;
                  T = (t*PI)/333;
                  dR = 127 - 127*cos(T);
                  dG = 0;
                  dB = 127*cos(T);
                  if (t > 999){
                    t = 0;
                    colorSwitch = 0;
                    break;
                  }
                break;
              }
              PlanetLabel("World 3: Speedy Gonzolas",singleWorld.location.x,singleWorld.location.y,color(dR,dG,dB));
              if (mousePressed){
                adventureModeState = 1;
                adventureModeWorldSelection = 3;
              }
            }
            else {
              singleWorld.Orbit();
            }
          }
          for (int i = 0; i < levels34.size(); i++){
            leveling_Rainbow_Tracer singleMoon = levels34.get(i);
            singleMoon.Orbit();
          }
          
          for (int i = 0; i < planet4.size(); i++){
            FourthSystem singleWorld = planet4.get(i);
            if (dist(1.8*mouseX - Divide(1.8*width,2),1.8*mouseY - Divide(1.8*height,2),singleWorld.location.x,singleWorld.location.y) <= exp(1)*singleWorld.macroRadius){
              singleWorld.Settle();
              PlanetLabel("World 4: Quidditch",singleWorld.location.x,singleWorld.location.y,color(255,147,16));
              if (mousePressed){
                adventureModeState = 1;
                adventureModeWorldSelection = 4;
              }
            }
            else {
              singleWorld.Orbit();
            }
          }
          for (int i = 0; i < levels45.size(); i++){
            leveling_Violent_Seeker singleMoon = levels45.get(i);
            singleMoon.Orbit();
          }
          
          for (int i = 0; i < planet5.size(); i++){
            FifthSystem singleWorld = planet5.get(i);
            if (dist(1.8*mouseX - Divide(1.8*width,2),1.8*mouseY - Divide(1.8*height,2),singleWorld.location.x,singleWorld.location.y) <= exp(1)*singleWorld.macroRadius){
              singleWorld.Settle();
              PlanetLabel("World 5: The Void",singleWorld.location.x,singleWorld.location.y,color(int(random(200)),int(random(200)),int(random(200))));
              if (mousePressed){
                adventureModeState = 1;
                adventureModeWorldSelection = 5;
              }
            }
            else {
              singleWorld.Orbit();
            }
          }
          for (int i = 0; i < levels53.size(); i++){
            leveling_Momma_Marble singleMoon = levels53.get(i);
            singleMoon.Orbit();
          }
          popMatrix();
          image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
        break;
        case 1:  //Selected States
          switch (adventureModeWorldSelection){
            case 1:  //World 1
              //Red_Bricks
              black = 0;
              BackWash();
              for (int i = 0; i < planet1.size(); i++){
                FirstSystem singleWorld = planet1.get(i);
                if (mousePressed && dist(mouseX,mouseY,0,0) <= 16*singleWorld.macroRadius){
                  adventureModeState = 2;
                }
                else {
                singleWorld.Approach();
                }
              }
              for (int i = 0; i < levels13.size(); i++){
                leveling_Red_Brick singleMoon = levels13.get(i);
                singleMoon.Approach();
              }
              if (mousePressed && mouseButton == RIGHT){
                adventureModeState = 0;
              }
              image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
            break;
            case 2:  //World 2
              //Purple_Saucers
              black = 0;
              BackWash();
              for (int i = 0; i < planet2.size(); i++){
                SecondSystem singleWorld = planet2.get(i);
                if (mousePressed && dist(mouseX,mouseY,0,0) <= 16*singleWorld.macroRadius){
                  adventureModeState = 2;
                }
                else {
                singleWorld.Approach();
                }
              }
              for (int i = 0; i < levels22.size(); i++){
                leveling_Purple_Saucer singleMoon = levels22.get(i);
                singleMoon.Approach();
              }
              if (mousePressed && mouseButton == RIGHT){
                adventureModeState = 0;
              }
              image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
            break;
            case 3:  //World 3
              //Rainbow_Tracers
              black = 0;
              BackWash();
              for (int i = 0; i < planet3.size(); i++){
                ThirdSystem singleWorld = planet3.get(i);
                if (mousePressed && dist(mouseX,mouseY,0,0) <= 16*singleWorld.macroRadius){
                  adventureModeState = 2;
                }
                else {
                singleWorld.Approach();
                }
              }
              for (int i = 0; i < levels34.size(); i++){
                leveling_Rainbow_Tracer singleMoon = levels34.get(i);
                singleMoon.Approach();
              }
              if (mousePressed && mouseButton == RIGHT){
                adventureModeState = 0;
              }
              image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
            break;
            case 4:  //World 4
              //Violent_Seekers
              black = 0;
              BackWash();
              for (int i = 0; i < planet4.size(); i++){
                FourthSystem singleWorld = planet4.get(i);
                if (mousePressed && dist(mouseX,mouseY,0,0) <= 16*singleWorld.macroRadius){
                  adventureModeState = 2;
                }
                else {
                singleWorld.Approach();
                }
              }
              for (int i = 0; i < levels45.size(); i++){
                leveling_Violent_Seeker singleMoon = levels45.get(i);
                singleMoon.Approach();
              }
              if (mousePressed && mouseButton == RIGHT){
                adventureModeState = 0;
              }
              image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
            break;
            case 5:  //World 5
              //Momma_Marble
              black = 0;
              BackWash();
              for (int i = 0; i < planet5.size(); i++){
                FifthSystem singleWorld = planet5.get(i);
                if (mousePressed && dist(mouseX,mouseY,0,0) <= 16*singleWorld.macroRadius){
                  adventureModeState = 2;
                }
                else {
                singleWorld.Approach();
                }
              }
              for (int i = 0; i < levels53.size(); i++){
                leveling_Momma_Marble singleMoon = levels53.get(i);
                singleMoon.Approach();
              }
              if (mousePressed && mouseButton == RIGHT){
                adventureModeState = 0;
              }
              image(CursorTexture,mouseX + 12,mouseY + 14,24,36);
            break;
          }
        break;
        case 2:  //Countdown 3
          //
        break;
        case 3:  //Countdown 2
          //
        break;
        case 4:  //Countdown 1
          //
        break;
        case 5:  //Adventure Game
          switch (adventureModeGame){
            case 11:  //World 1, Level 1
              //
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
        break;
        case 6:  //Death Animation
          //
        break;
        case 7:  //Loser Screen
          //
        break;
        case 8:  //Winner Screen
          //
        break;
        case 9:  //Jet Upgrades
          //
        break;
        case 10:  //Storyline
          //
        break;
      }
    break;
    case 3:  //Pause Menu
      black = 0;
      if (localTIMER == 0){
        for (int i = 0; i < 3240; i++){
          Vortex.add(new Stars());
        }
      }
      JetWash();
      FulcrumDeathAnimation(Fulcrum.location.x,Fulcrum.location.y,explosionCounter);
      FulcrumDeathAnimation(Fulcrum.location.x,Fulcrum.location.y,explosionCounter + 1);
      FulcrumDeathAnimation(Fulcrum.location.x,Fulcrum.location.y,explosionCounter + 2);
      explosionCounter *= 1.004;
      if (ExplosionEnd(Fulcrum.location.x,Fulcrum.location.y,explosionCounter) || keyPressed && (keyCode == ENTER || keyCode == RETURN)){
        localTIMER = 0;
        explosionCounter = 1;
        failedGame = int(random(FailedGame.length));
        programState = 1;
        classicModeState++;
        break;
      }
      if (classicModeGame == 1){
        LevelProgressReadout(playerSCORE,330);
      }
      else if (classicModeGame == 2){
        LevelProgressReadout(playerSCORE,1350);
      }
      else if (classicModeGame == 3){
        LevelProgressReadout(playerSCORE,4020);
      }
      else if (classicModeGame == 4){
        LevelProgressReadout(playerSCORE,10220);
      }
      localTIMER++;
    break;
    case 4:  //Transition Animations & Testing (global)
      //
    break;
  }
}
