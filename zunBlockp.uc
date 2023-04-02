class zunblock3 expands Trigger;

var zblockmap3 vbx;

 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                   foreach AllActors(class'zblockmap3', vbx)
                   {
                    Log("  -   map unlocked the switch via touching... " $ string (vbx.name),'mapfix');
                    vbx.destroy();

                   }





                 }


}

defaultproperties
{
}
