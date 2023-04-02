class labfix expands Trigger;

var pathnode ph;
function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   log("playerpawn fell out of space in spacelab");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
		           other.setlocation (vect(-896.012939,-1072.391846,-656.901794));


                  }

                 }
}

defaultproperties
{
     CollisionRadius=9000.000000
     CollisionHeight=10.000000
}
