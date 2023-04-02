class digfix expands Trigger;

 var pathnode ph;



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {

                   log("playerpawn fell into fan in dig");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   other.setlocation (vect(7176.000000,3334.598145,-382.000000));



                 }


}

defaultproperties
{
     CollisionRadius=60.000000
     CollisionHeight=60.000000
}
