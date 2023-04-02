
class endzonemut expands Mutator ;



event BeginPlay()
{
      Super.BeginPlay();
      SetTimer(3.0,false);

}



function timer();
{
 blockzend ();

}

function blockzend()
{  // revenge on bad players.

   local teleporter telepspot;

   local int tespl, goodends;
   local string tesp,test;

// if(mapmasterblock)
 //{


   foreach AllActors(Class'teleporter', telepspot)
   {
      if (  telepspot != None )
      {
            tespl=InStr(telepspot.url,"#");
            if (tespl!= -1)	{
            tesp=Mid(telepspot.url,0,tespl);
            //spawn(class'fuckuloser',,,telepspot.location); //drop stone. < lol copied from tombstones
            //Log("blocked end= "  $ tesp ,'BCCMapM');
            }
      }
   }
 //}
}


