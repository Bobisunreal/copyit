// quick idea.
// duplicate existing monsters  with a random offset.
// basicly use existing location of monsters , and spawn duplicate near them
// A very simple spawner..


// done - need to add ability to ingnore bosses.
// want to add ability to subsitute spawns.
// add ability to account for playerload
// done! - spinnersupport.
// subclass suport.
// dont copy if b statis.  like decoration in illheaven
// optional copybal health threshold
// add ability to specify map limits in  mapname:count format.
// fix  nomonster and limit etc
// let  mutaiotr link with copies of itself and for a organized mutppier


class monstercopierv2 expands Mutator
config(monstercopier);

struct addonlist {
     var() config string         pawnname;
     var() config string         newclass;
                   };


struct exceptlist {
     var() config string         map;
     var() config int            max;
     var() config int            seed;
     var() config string         exclusions;
                   };

 var() int cycles;
 var() travel int traveled;
var (any)config int  seedlimit,multispawn,randpsace;        // Max total added monsters.
var (any)config int  seedsaturation;                        // Wait if it is less then this high
var (any)config bool doseedlimit,bskipcow,bskipnali,bskiprabbit,copydoompawns; // Cow/Nali ignore?
var (any)config bool waitforplayers,belogcon;               // Duh
var (any)config bool dontcopystatic;                        // Avoid  "Decoration" Monsters
var (any)config bool debugtomotd,messy,showcopy;            // show data number in motd
//var (any)config bool nightmareregenmode;                 // nightmare!  monster health regenerates.


//var (any)config int  spawnmultiplier;                  // How many of each copy of  in each instance in cycle.
var (any)config bool dontcopybosses;                     // Ignore   "bosses"
var (any)config int timebase;                            // Ignore   "bosses"
//var (any)config bool bosseslimit;                      // Only allow this many "bosses" to get copied.
var (any)config exceptlist exceptionrules[10];           // Map : limit exception to the defualt

// fuck ya , duh just search and compare names and use dlc , that a smarter idea.
var (any)config addonlist monsterlist[10];

// var (any)config string simpleaddon [5];             // mabye let it just use one string and split it.?
//--------------------------------------------------------------------------------------------
//  replaccment classes
//--------------------------------------------------------------------------------------------
//var (replacements)config string bruteclass;                  // subsitute for brute spawns.
//var (replacements)config string cowlass;                     // subsitute for cow spawns.
//var (replacements)config string flyclass;                    // subsitute for brute spawns.
//var (replacements)config string tentacleclass;               // subsitute for brute spawns.
//var (replacements)config string krallclass;                  // subsitute for krall spawns.
//var (replacements)config string gasbagclass;                 // subsitute for gasbag spawns.
//var (replacements)config string mantaclass;                  // subsitute for manta spawns.
//var (replacements)config string pupaeclass;                  // subsitute for pupae spawns.
//var (replacements)config string mercenaryclass;              // subsitute for mercenary spawns.
//var (replacements)config string naliclass;                   // subsitute for nali spawns.
//var (replacements)config string SkaarjTrooperclass;          // subsitute for SkaarjTrooper spawns.
//var (replacements)config string SkaarjWarriorclass;          // subsitute for SkaarjWarrior spawns.
//var (replacements)config string slithclass;                  // subsitute for slith spawns.
//var (replacements)config string impclass;                    // subsitute for imp spawns.
//var (replacements)config string titanclass;                  // subsitute for titan spawns.
//var (replacements)config string spinnerclass;                // subsitute for spinner spawns.
//var (replacements)config string predatorclass;               // subsitute for predetor spawns.
var int dist ;
var int countspawns,countfails,origcnt;
var string spinclass;
var string predclass;
var int tempseed,tempmax;
var string tempexclusions;
var int curplay,lastplay; //playercounts
var class<actor> bbstart;
var scriptedpawn otherx;
var vector templocation;
event BeginPlay()
{
      Super.BeginPlay();
      SetTimer(10.0, true);
      fixit();  // fix beta map urls

      //bbstart = class<actor>( DynamicLoadObject("btool2.ssgoodspot", class'Class' ) );
      //pre-seed. // dont pre-seed in jcoopz.
      //dothings ();
       log ("-------------------------------------------------------------------------------------------");
       log ("Simple MosterSpawner/Copyier  Initalizing....   ");
      // justfixit(); // more fixes
       foreach AllActors(class'scriptedpawn', otherx) { origcnt++; };
       log("Pre-Seeded...Added "$countspawns$" Pawns");
       linkupcopy();
       traveled++ ;

        // Identify spinner class.  by map name
           if( instr(Level.Title,"Madehiten - ")!=-1     ){spinclass = "ryspak.spinner";log ("Identified Spinner As "$spinclass); } ;
           if( instr(Level.Title,"Exploited - ")!=-1     ){spinclass = "ryspak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Haros - ")!=-1         ){spinclass = "ryspak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Sirius - ")!=-1        ){spinclass = "ryspak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Chicken Itza -")!=-1   ){spinclass = "ryspak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Pharao - ")!=-1        ){spinclass = "ryspak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Shinigami - ")!=-1     ){spinclass = "ryspak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Soulstone - ")!=-1     ){spinclass = "ryspak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Tau'ri -")!=-1         ){spinclass = "ryspak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"THS")!=-1              ){spinclass = "RTNPmapPak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"MP-")!=-1              ){spinclass = "mpupak.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Woody Bog")!=-1        ){spinclass = "spinner.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"T-H's Fun House")!=-1  ){spinclass = "spinner.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Cavern of Cregor")!=-1 ){spinclass = "spinner.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( instr(Level.Title,"Cregor Mt. Pass")!=-1  ){spinclass = "spinner.spinner"; log ("Identified Spinner As "$spinclass);} ;
           if( Level.Title == "Sealed temple"            ){spinclass = "w3spinner.spinner"; log ("Identified Spinner As "$spinclass);} ;

           if(spinclass =="")
           {// avoind none someplace i forgot.
            //log{"Could not identify potental spinner class."};
            spinclass ="unreali.pupae";
           }
           // Idetify predator class.  by map  name
           if( instr(Level.Title,"THS")!=-1              ){predclass = "RTNPmapPak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"MP-")!=-1              ){predclass = "mpupak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Madehiten - ")!=-1     ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Exploited - ")!=-1     ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Haros - ")!=-1         ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Haros - ")!=-1         ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Sirius - ")!=-1        ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Chicken Itza -")!=-1   ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Pharao - ")!=-1        ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Shinigami - ")!=-1     ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Soulstone - ")!=-1     ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;
           if( instr(Level.Title,"Tau'ri -")!=-1         ){predclass = "ryspak.predator"; log ("Identified predator As "$predclass);} ;

           // Arachnopolis

   log("spawn muliplier="$multispawn);

  log ("-------------------------------------------------------------------------------------------");
}





function linkupcopy()
{
 local monstercopierv2 unfek;
 local int countm;

  foreach AllActors(Class'monstercopierv2', unfek)
  {
     countm++;

  }
   //countm--;
  log ("Found "$countm $ " Instances already running" );
  if (countm > 1)
  {
  log("double found -bye-bye");
  destroy();
  }

}


 function fixit()
{   // fix zmu98 beta map urls
local teleporter teleptable;
local int urlat;
local string frt,lst;
         foreach AllActors(Class'teleporter', teleptable)
          {
              if (  teleptable != None )
              { // Map Has Teleports...
               urlat=InStr(teleptable.url,"/");
               if (urlat== -1) {
                  }else{
                   frt=Mid(teleptable.url,0,urlat);
                   lst=Mid(teleptable.url,urlat+1,len(teleptable.url));
                   teleptable.url = frt$"#"$lst;
                  }

              }
           }

}


 function Timer()
{
 local scriptedpawn other;
 local playerpawn otherp;
 local int coun;
 local int playa;
 local int Cunt,hate;
 local string Shit,Ill;

 cycles++;
  /*
  //local string exclusioncache{10}; // stor the seperated delimted string from excusion in here.?

	Shit = GetURLMap();    hate = InStr(Shit,".");     Ill = Mid(Shit,0,Hate);	//log ("this map: "$y);
	00000
    For( Cunt = 0; Cunt <  9 ; Cunt++ )
          {
           if (exceptionrules[cunt].map !=  "")
           {
               if (exceptionrules[cunt].map == Ill)
               {

                 // found a rule.
                 log (" exception:   map-"$exceptionrules[cunt].map$ "  / seed-"$exceptionrules[cunt].seed$" / max-"$exceptionrules[cunt].max$" / exc-"$exceptionrules[cunt].exclusions);


                 if  (exceptionrules[cunt].seed > 5)
                 {
                 tempseed = exceptionrules[cunt].seed;
                 // mabye Valid
                 }

                 if  (exceptionrules[cunt].max > 5)
                 {
                 tempmax = exceptionrules[cunt].max;
                  // mabye Valid
                 }

                 if  (exceptionrules[cunt].max > 5)
                 {
                 tempexclusions = exceptionrules[cunt].exclusions;
                  // mabye Valid
                 }

               }


           }


         }

    */
 //---------------------------------
   // Count  Monsters
    foreach AllActors(class'scriptedpawn', other) { coun++; };
   // Count Players
    foreach AllActors(class'playerpawn', otherp)  {
       if (belogcon)
       {


        // check and ignore webadmin under 227f.
        // if ( otherp.name == "webadmin")
        // {
        // }

       }
      playa++;


      };
      if( int(Level.EngineVersion) > 226 )
         {//webadmin!
           playa--;
         }

   // Handle Seed Goal
   if (countspawns > seedlimit)
   {
   // we are done . we have achived our seed goal.
   //log ("------------------------------------");
   log ("Seed goal of "$ seedlimit$" Reached.");
   //log ("------------------------------------");
   //destroy();

   }

  // Handle No Host Monsters.
  if (coun < 5)
   {
   log ("Nothing to do , No Monsters ,Aborting");
   // Todo : Check creature factorieres.
   destroy();
   }

  // Handle  Monster Saturation
  if (countspawns < seedsaturation ) {              // Monster Count Is Below Satatation Point
    if (waitforplayers && playa > 0) {dothings(); } // Waiting for Players
    if (!waitforplayers        )     {dothings(); } // Not Waiting.
   }
  if (debugtomotd )

  {
   consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 ( "$"C -" $ coun $ ":"$ origcnt $"/Ts -"$ countspawns $ ":" $countfails$"/Max:- "$seedsaturation$"/SG- "$seedlimit$ "/P- "$ playa$"/t- "$timebase$"/c- "$cycles$"/"$"sm="$multispawn$" )");
   //consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 travaled  though "$traveled$" maps since last restart )");
  }else {
  // consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine3 Travaled  Though "$traveled$" Maps Since Last Restart )");
   consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 --IS--");
   log ( "Current -"$coun $" / Total -"$ countspawns $" /  MaxAtOnce:- "$seedsaturation$"  /  SeedGoal- "$seedlimit$ " / Players- "$ playa $" / timbase- "$timebase,'monstercopier');

  }


 if (timebase < 5)
 { // satefy
 timebase = 30;
 }
setTimer(float(timebase), true);
}




function dothings ()
{
 local class<ScriptedPawn> spinnerNewClass;
 local ScriptedPawn spinneraPawn;
 local scriptedpawn other;
 local class<ScriptedPawn> NewClass;
 local ScriptedPawn aPawn;
 local int cunt;

   foreach AllActors(class'scriptedpawn', other)
   {

         For( Cunt = 0; Cunt <  9 ; Cunt++ )
          {   // small possible flaw , if name is changed it will fuckup.
            // but this is hella' easier
            if ( caps(other.name) == caps(monsterlist[cunt].pawnname)   )
            {
              if (monsterlist[cunt].newclass != "none" )
               {
               spinnernewClass = class<ScriptedPawn>( DynamicLoadObject(monsterlist[cunt].newclass, class'Class' ) );
               spinneraPawn = Spawn(spinnernewClass,,, other.Location + rand(randpsace) * vector(Rotation) + vect(0.00,0.00,1.00) * 15);   if (spinnerapawn !=none){  duppy(other,spinnerapawn);} else{ countfails++;}
               }

            }

          }





   }
}




     function  duppy(scriptedpawn p,scriptedpawn duppyp)
    {     // copy info from  p to duppyp
     duppyp.tag = 'copy';       // avoid the looping crap hole of doom


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
     duppyp.drawscale=p.drawscale;

     // Skins
     duppyp.Style=p.Style;
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

          duppyp.GotoState('Attacking');

          if (dontcopybosses &&  duppyp.bIsBoss)
          {
           duppyp.destroy();
           log("Destoyed  Invalid boss copy.");
           countspawns--;
          }



          if (dontcopystatic &&  duppyp.bstatic)
          {
           p.destroy();
           log("Destoyed  Invalid static copy.");
           countspawns--;
          }
    }



  function  lookupm()
  {
   local int Cunt;
   local string Shit,Ill;
   local int hate,torn;
   //local string exclusioncache{10}; // stor the seperated delimted string from excusion in here.

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


                 if  (exceptionrules[cunt].seed > 5)
                 {
               // mabye Valid
                 }

                 if  (exceptionrules[cunt].max > 5)
                 {
                  // mabye Valid
                 }



               }


           }


         }

  }


     // scorpion

defaultproperties
{
}
