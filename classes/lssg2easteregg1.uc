class lssg2easteregg1 expands Trigger;



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                   log("playerpawn lsg egg1");
                   other.setlocation (vect(-61.791817,-289.926483,-915.900024));


                 }


}

defaultproperties
{
     CollisionRadius=30.000000
     CollisionHeight=30.000000
}
