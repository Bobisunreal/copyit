//-----------------------------------------------------------
//-----------------------------------------------------------
class zblockmap3 extends Trigger;


 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                   playerpawn(other).ClientMessage("You shouldnt be any where near here yet. Please play fair... Your should be looking for a lever in the basment...");
                   Log("  -   Player cheated!... " $ playerpawn(other).PlayerReplicationInfo.playername ,'mapfix');
                 }
}



defaultproperties

{
     bblockplayers=true
     bStatic=False
     CollisionRadius=130.000000
     CollisionHeight=130.000000
}
