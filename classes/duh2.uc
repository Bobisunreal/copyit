// quick idea.
// duplicate existing monsters  with a random offset.
// basicly use existing location of monsters , and spawn duplicate near them
// A very simple spawner..
// loosly based on wat i saw on skws server(completly from scratch)
// Wont copy bots like skws does
// Wont copy bosses like skws dosnt
class monstercopier3 expands Mutator
config(monstercopier);

struct swaplist {  // list to allow swapped spawns  / New 2011
                   //( allow custom mopnsters to replace a giving classname copy)
 var() config string         oldthing;      var() config string         newthing;
                   };

struct exceptlist {  // list of maps with limits less them the standard.
// still dont work.
 var() config string         map;     var() config int            max;
 var() config int            seed;    var() config string         exclusions;
                   };

//------------------------------------------------------------//
var (any)config int  seedlimit,multispawn,randpsace;          // Max total added monsters.
var (any)config int  seedsaturation;                          // Wait if it is less then this high
var (any)config bool bskipcow,bskipnali,bskiprabbit,logcopy;  // Cow/Nali ignore?
var (any)config bool waitforplayers;                          // Duh
var (any)config bool dontcopystatic;                          // Avoid  "Decoration" Monsters
var (any)config bool debugtomotd,showcopy;                    // show data number in motd   (Mostly for Debuging/watching limits Etc)
var (any)config bool dontcopybosses;                          // Ignore   "bosses"
var (any)config int  timebase;                                // How ofter to re-check  saturation (First cycle is always 10 seconds)
var (any)config      exceptlist exceptionrules[10];           // Map : limit exception to the defualt
var (any)config      swaplist pawnswaplist[10];               // classes swappering

var (any)config bool balanceload;                             // try to balace load of monsters
//------------------------------------------------------------//
var() int cycles;                                             // How many timer cycles
var int countspawns,countfails,origcnt;                       // Successful Spawns  / Failed spawns / Original monstercount
var string spinclass;                                         // Reused for dls
var int tempseed,tempmax;                                     // Map bases  limits
var string tempexclusions;                                    // Exclusion list  on a per-map basis
var int curplay,lastplay;                                     // Playercounts
var class<actor> bbstart;                                     // Dont recall
var scriptedpawn otherx;                                      // Scripted pwned
var vector templocation;                                      // Vector //
var int coun,playa;

//------------------------------------------------------------//
event BeginPlay()
{
      Super.BeginPlay();
      SetTimer(10.0, true); // time deley to avoid the lockup.

       //pre-seed. // dont
       //dothings ();
       log ("-------------------------------------------------------------------------------------------");
       log ("Simple MosterSpawner / Copyier  Initalizing....   ");
       foreach AllActors(class'scriptedpawn', otherx) { origcnt++; };
       log("Pre-Seeded...Added "$countspawns$" Pawns");
       linkupcopy();
       lookupm();
       log("Muliplier="$multispawn $" base pawn count is "$origcnt);
       log ("-------------------------------------------------------------------------------------------");

       if (bskipcow)   {  tempexclusions = tempexclusions $ "unreali.cow";   }

}





function linkupcopy()
{
 local monstercopier3 unfek;
 local int countm;

  foreach AllActors(Class'monstercopier3', unfek)
  {
     countm++;
  }
  log ("Found "$countm $ " Instances already running" );
  //if (countm > 0)  {log("double found -bye-bye");   destroy();  }

}




  function Timer()
   {
     local scriptedpawn other;
     local playerpawn otherp;
     //local int coun,playa;

     // Count timer cycles , for debuging
      cycles++;    playa = 0;
     // Count Monsters
      foreach AllActors(class'scriptedpawn', other) { coun++; };

      playa = Level.Game.NumPlayers;

      // Handle Seed Goal
      if (countspawns > seedlimit)
      {   // We are d5one . we have achived our seed goal.
      log ("Seed goal of "$ seedlimit$" Reached. destroying!");
      consolecommand("Set Engine.Engine GameReplicationInfo MOTDLine2 Done Spawning! ");
      destroy();
      }

     // Handle No Host Monsters.
      if (coun < 5)
      {
      log ("Nothing to do , No Monsters ,Aborting");// <-- cross likes this.  LOL
      consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Done Spawning!(Not Enough Host Pawns) ");
      // TODO : Check creature factorieres.?
      destroy();
      }


     // Handle  Monster Saturation
       if (countspawns < seedlimit  )
       {    // Monster Count Is Below max spawns

         if (coun < seedsaturation  )
         { // Monster Count Is Below Satatation Point
           // ok to conitue
           if (waitforplayers && playa > 0)
                {
                    if (balanceload)
                    { // attemp to balance the load
                       if (Level.Game.NumPlayers  > 0  && Level.Game.NumPlayers  < 2) {  if (countspawns  < seedsaturation/6)  { dothings(); };};
                       if (Level.Game.NumPlayers  > 1  && Level.Game.NumPlayers  < 3) {  if (countspawns  < seedsaturation/5)  { dothings(); };};
                       if (Level.Game.NumPlayers  > 2  && Level.Game.NumPlayers  < 4) {  if (countspawns  < seedsaturation/4)  { dothings(); };};
                       if (Level.Game.NumPlayers  > 3  && Level.Game.NumPlayers  < 5) {  if (countspawns  < seedsaturation/3)  { dothings(); };};
                       if (Level.Game.NumPlayers  > 4  && Level.Game.NumPlayers  < 6) {  if (countspawns  < seedsaturation/2)  { dothings(); };};
                       if (Level.Game.NumPlayers  > 5  && Level.Game.NumPlayers  < 7) {  if (countspawns  < seedsaturation/1)  { dothings(); };};
                     }else{
                    //consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 Load balancing is disabled");
                     dothings();
                         }


                } // Waiting for Players
           if (!waitforplayers        )     {dothings(); } // Not Waiting.

         }else{
               if (waitforplayers && playa > 0)
               {// dont spam  if noone's there to hear it.

                log("Map full , Waiting for space");
               }
              }


       }


    // Wheter to spam log , or use motd. to display  debug info.
    if (debugtomotd)
    {
     consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 ( "$"C -" $ coun $ ":"$ origcnt $"/Ts -"$ countspawns $ ":" $countfails$"/Max:- "$seedsaturation$"/SG- "$seedlimit$ "/P- "$ playa$"/t- "$timebase$"/c- "$cycles$"/"$"sm="$multispawn$" )");
    }else{
     consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 --IS--");
     log ( "Current -"$coun $" / Total -"$ countspawns $" /  MaxAtOnce:- "$seedsaturation$"  /  SeedGoal- "$seedlimit$ " / Players- "$ playa $" / timbase- "$timebase,'monstercopier');

    }

    if (balanceload)
    {
       if (Level.Game.NumPlayers  > 0  && Level.Game.NumPlayers  < 2)     { consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 Balance for "$ Level.Game.NumPlayers $ " Player  " $  seedsaturation/6 $"/"$seedlimit);  }
       if (Level.Game.NumPlayers  > 1  && Level.Game.NumPlayers  < 3)     { consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 Balance for "$ Level.Game.NumPlayers $ " Players " $  seedsaturation/5 $"/"$seedlimit);  }
       if (Level.Game.NumPlayers  > 2  && Level.Game.NumPlayers  < 4)     { consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 Balance for "$ Level.Game.NumPlayers $ " Players " $  seedsaturation/4 $"/"$seedlimit);  }
       if (Level.Game.NumPlayers  > 3  && Level.Game.NumPlayers  < 5)     { consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 Balance for "$ Level.Game.NumPlayers $ " Players " $  seedsaturation/3 $"/"$seedlimit);  }
       if (Level.Game.NumPlayers  > 5  && Level.Game.NumPlayers  < 5)     { consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 Balance for "$ Level.Game.NumPlayers $ " Players " $  seedsaturation/2 $"/"$seedlimit);  }
       if (Level.Game.NumPlayers  > 6  && Level.Game.NumPlayers  < 7)     { consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 Balance for "$ Level.Game.NumPlayers $ " Players " $  seedsaturation/1 $"/"$seedlimit);  }

    }

    // Dont allow insanly fast spawn speeds
    if (timebase < 5)
     {
     timebase = 30;
     saveconfig();
     }

    // Go Wait again! useing a new timebase if value changed.
     setTimer(float(timebase), true);
  }




function dothings ()
{   // Most of the work is here.,  Could be better  tho
   local class<ScriptedPawn> spinnerNewClass;
   local ScriptedPawn spinneraPawn;
   local scriptedpawn other;
   local string jumpstring;

   foreach AllActors(class'scriptedpawn', other)
   {
         if (countspawns  > seedsaturation)
                             {
                             log ( "Breaking...");
                             return;


                             };
              if( string(other.tag) != "Copy"      // && countspawns < seedsaturation  //var error  ( comparin saturation to total spawns)
              && instr(tempexclusions,string(other.Class))==-1) // Allow to skip  spawn if the temp rule exclude this class in this map.
              { // duh.

                       if (Level.Game.NumPlayers  > 0  && Level.Game.NumPlayers  < 2)
                          {
                            if (countspawns  > seedsaturation)
                             {
                             return;


                             };
                          };
                           jumpstring =  swapem(string(other.Class));
                         spinnernewClass = class<ScriptedPawn>( DynamicLoadObject(swapem(string(other.Class)), class'Class' ) );
                       // new issue -- swapped pawn inherits all skins from original??? lol wtf
               //spinnernewClass = class<ScriptedPawn>( DynamicLoadObject(string(other.Class), class'Class' ) );
               if ( multispawn > 1) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 2) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 3) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 4) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 5) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 6) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 7) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 8) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 9) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 10) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               // Anything past 10 is Insane...
               if ( multispawn > 11) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 12) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 13) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 14) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 15) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 16) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 17) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 18) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 19) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               // will almost always crash your game...
               if ( multispawn > 20) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 21) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 22) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 23) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 24) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 25) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               // why ? wtf!
               if ( multispawn > 26) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 27) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 28) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}
               if ( multispawn > 29) {spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;};}




              }


   }

}






     function  duppy(scriptedpawn p,scriptedpawn duppyp)
    { // Copy info from  p to duppyp
      // This is why its called a "copier" (it assumes any changes or customization , i.e. rys pawns.)

     duppyp.tag = 'copy';       // avoid the looping  (Copies wont get copied)
                                // Wont effect the host pawn tag in any way , so maps wont break.
      duppyp.menuname=p.menuname;
      if (logcopy)     {  log("spawned " $ string(duppyp.Class));  }  // log  spawned classes ,(for tracking custom class spawns)
      if (showcopy)    {  duppyp.menuname=string(p.name);     }  // show source name in menunanes
     duppyp.Health=p.health ;
     duppyp.DropWhenKilled=p.DropWhenKilled;
     duppyp.rangedprojectile=p.rangedprojectile;


     // Lighting
     duppyp.lightbrightness=p.lightbrightness;
     duppyp.lighthue=p.lighthue;
     duppyp.lightsaturation=p.lightsaturation;
     duppyp.lightcone=p.lightcone;
     duppyp.lighteffect=p.lighteffect;
     duppyp.lightperiod=p.lightperiod;
     duppyp.lightphase=p.lightphase;
     duppyp.lightradius=p.lightradius;
     duppyp.lighttype=p.lighttype;

     // Scaling
     //duppyp.drawscale=p.drawscale;  // bad idea \?\ without collision.

     // Skins
     duppyp.Style=p.Style;
     duppyp.DrawType=p.DrawType;
     duppyp.Skin=p.Skin;
     duppyp.MultiSkins[0]=p.MultiSkins[0];
     duppyp.MultiSkins[1]=p.MultiSkins[1];
     duppyp.MultiSkins[2]=p.MultiSkins[2];
     duppyp.MultiSkins[3]=p.MultiSkins[3];
     duppyp.MultiSkins[4]=p.MultiSkins[4];
     duppyp.MultiSkins[5]=p.MultiSkins[5];
     duppyp.MultiSkins[6]=p.MultiSkins[6];
     duppyp.MultiSkins[7]=p.MultiSkins[7];
     countspawns++;

     // whatever
     duppyp.GotoState('Attacking');

     // skip things that shouldnt be copied.
       if (dontcopybosses &&  duppyp.bIsBoss)
       { // probably need to be done b4 we get to this state.
         duppyp.destroy();
         log("Destoyed  Invalid boss copy.");
         countspawns--;
       }

     // skip things that shouldnt be copied.
      if (dontcopystatic &&  duppyp.bstatic)
       { // decorations
          p.destroy();
          log("Destoyed  Invalid statis copy.");
          countspawns--;
       }
    }



     function  string swapem(string thing)
  {  // tri to find swaping  classes
   local int Cunt;
   local bool found;

    For( Cunt = 0; Cunt <  9 ; Cunt++ )
          {
           if (caps(pawnswaplist[cunt].oldthing) ==  caps(thing))
           {
            found = true;
            log("mc3 - swap " $ thing $ " with " $pawnswaplist[cunt].newthing);
            return pawnswaplist[cunt].newthing;

           }
          }
    if (!found )
      {
       return thing;
      }

  }



  function  lookupm()
  {  // tri to find rules for maps...
   local int Cunt;
   local string Shit,Ill;
   local int hate,torn;


	Shit = GetURLMap();
	Hate = InStr(Shit,".");
	Ill = Mid(Shit,0,Hate);
	Torn = 0;

	//log ("this map: "$y);
	//log(s);

    For( Cunt = 0; Cunt <  9 ; Cunt++ )
          {
           if (exceptionrules[cunt].map !=  "")
           {
               if (exceptionrules[cunt].map == Ill)
               {
                 // found a rule.
                 log (" a exception rule for this map was found!  map-"$exceptionrules[cunt].map$ "  / seed-"$exceptionrules[cunt].seed$" / max-"$exceptionrules[cunt].max$" / exc-"$exceptionrules[cunt].exclusions);
                 if  (exceptionrules[cunt].seed > 5)              {             }
                 if  (exceptionrules[cunt].max > 5)               {             }

               }

             }

           }

  }

