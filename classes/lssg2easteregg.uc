class lssg2easteregg expands Trigger;



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                   log("playerpawn lsg egg1");
                   other.setlocation (vect(275.662933,-242.259995,-915.900024));


                 }


}

defaultproperties
{
     CollisionRadius=30.000000
     CollisionHeight=30.000000
}
