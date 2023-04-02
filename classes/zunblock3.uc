class zunblock3 expands Trigger;

var zblockmap3 vb4;

 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                   foreach AllActors(class'zblockmap3', vb4)
                   {
                    Log("  -   map unlocked the switch via touching... " $ string (vb4.name),'mapfix');
                    vb4.destroy();

                   }





                 }


}

defaultproperties
{
}
