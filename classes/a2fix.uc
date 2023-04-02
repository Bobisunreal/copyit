class a2fix expands Trigger;

var pathnode ph;
function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  //if (Other.Physics == PHYS_Falling )

                  //{
                   log("playerpawn fell out of space in aline");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
		           other.setlocation (vect(13424.727539,9542.870117,-327.898041));


                  //}

                 }
}

defaultproperties
{
     CollisionRadius=800.000000
     CollisionHeight=220.000000
}
