class tcallfix expands Trigger;

 var pathnode ph;



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   log("playerpawn fell off bridge in tcalling");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   other.setlocation (vect(6939.854004,9425.666016,1658.094971));


                  }

                 }


}

defaultproperties
{
     CollisionRadius=800.000000
     CollisionHeight=10.000000
}
