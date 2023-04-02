class city43fix expands Trigger;

 var pathnode ph;



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   log("playerpawn fell into pit.");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   other.setlocation (vect(2992.986816,786.339355,12024.105469));
                   //Pawn(Owner).ClientMessage("...HeHe You though you were gonna get stuck or killed");

                  }

                 }


}

defaultproperties
{
     CollisionRadius=800.000000
     CollisionHeight=10.000000
}
