class zblockmapmess extends zblockmap3;


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
     //bblockplayers=true
     bStatic=False
     CollisionRadius=145.000000
     CollisionHeight=145.000000
}
