class hcl5fix expands Trigger;

 var pathnode ph;

defaultproperties
{

  bStatic=False;
   CollisionRadius=800.000000
   CollisionHeight=10.000000
}


 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   log("playerpawn fell off edge in hcl5");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   other.setlocation (vect(12044.883789,17.995636,-3593.907227));


                  }

                 }


}




