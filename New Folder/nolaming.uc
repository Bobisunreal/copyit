class nolaming expands Trigger;


function BeginState ()
  {
  SetTimer(1.0,True);
  }


function Timer()
{
local playerpawn playerptable;

// this function kills any scriptedpawns near the self
foreach AllActors(Class'playerpawn', playerptable)
{
  if (  playerptable != None )
   {
    if(playerptable.IsInState('CheatFlying'))
    {
    playerptable.clientmessage("HEHE ;/) No Cheating!");
    playerptable.setlocation(self.location);
    };
   };
 }



} //timer

defaultproperties
{
     CollisionRadius=150.000000
     CollisionHeight=150.000000
}
