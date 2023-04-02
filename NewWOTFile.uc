class skilldrop expands Mutator Config(damagem);


struct monsterdrops
{
	Var() config string Monster;
	var() config string weapon;
	var() config int pickupammo;
};


struct randomweaps
{
	Var() config int health;
	var() config string weapon;
	var() config int pickupammo;
};

var(mapf)  config monsterdrops monsterdropsconfig[5] ;

var () int thisversion;
var () int lastentry;


event BeginPlay()
{
      Super.BeginPlay();
      thisversion = 4;
      SetTimer(5.0,false);
      lastentry =4 ;
}


function timer()
  {
   local scriptedpawn sp;
   local int bc;
   local weapon ww;


   foreach AllActors(Class'scriptedpawn', sp)
      {
        For( bc = 0; bc <  lastentry ; bc++ )
        {
          if (caps(monsterdropsconfig[bc].monster)  == caps(string(sp.class)) )
          {
           log("Match rule "$monsterdropsconfig[bc].monster$ " slot  "$bc $" pawn "$ sp.class
           setdrop(sp,monsterdropsconfig[bc].weapon);
          }
        }


        // sp.DropWhenKilled = class<weapon>( DynamicLoadObject(curreplcmentclass, class'Class' ) );



      }


  };

function setdrop(scriptedpawn s,string tpw)
{
 local int bc;
 local class<weapon> NewClassp;
 local weapon weap;

          if (tpw  != "" )
          {
            NewClassp = class<weapon>( DynamicLoadObject(tpd, class'Class'));
            if (newclassp != none)
                  {
                      weap=spawn(class<weapon>(NewClassp),,,ppawntable.location);
                          // Attempt spawn
                          if(lol!=none)
                           { // spawned!
                             // stubling block , cant set the ammpo since it spawned via pawn...
                           }

                   }else{
                      //log ( "#Preloaded Object Failed:[" $ bc $"]" $ monsterdropsconfig[bc].weapon );
                      }
          }

}



