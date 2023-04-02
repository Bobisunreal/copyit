class c1fix expands Trigger;
var() bool        bkillplayer;

function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   log("playerpawn fell out of space in Csejte2");

                   playerpawn(other).ClientMessage("Should be more careful of that ledge...");
                   pawn(other).Died(None, 'felloutofworld', other.Location);
                   /*
                   if (bkillplayer)
                   {
                    pawn(other).Died(None, 'felloutofworld', other.Location);
                   }
                   else
                   {
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   other.setlocation (vect(7256.152832,-13221.238281,-9281.000000));

                   }
                   */

                  }

                 }


}

defaultproperties
{
     CollisionRadius=16256.000000
     CollisionHeight=10.000000
}
