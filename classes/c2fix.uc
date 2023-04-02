class c2fix expands Trigger;
function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   log("playerpawn fell out of space in Csejte2");
                   pawn(other).Died(None, 'felloutofworld', other.Location);
                   //Other.Acceleration = vect(0,0,0);
		           //Other.Velocity = vect(0,0,0);
                   //other.setlocation (vect(11147.386719,27313.701172,-9926.849609));
                   playerpawn(other).ClientMessage("Should be more careful of that ledge...");

                  }

                 }


}

defaultproperties
{
     CollisionRadius=19256.000000
     CollisionHeight=10.000000
}
