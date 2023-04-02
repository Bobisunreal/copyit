class skykeeper expands Trigger;

 var pathnode ph;



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   log("playerpawn fell off skylevel steps");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   other.setlocation (vect(23549.625000,1742.186401,4321.122070));


                  }

                 }


}

defaultproperties
{
     CollisionRadius=24800.000000
     CollisionHeight=10.000000
}
