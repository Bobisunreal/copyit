class dkeeper expands Trigger;

 var pathnode ph;



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   log("playerpawn fell off glider in dkeep2");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   other.setlocation (vect(7893.245117,-128.860779,437.822235));


                  }

                 }


}

defaultproperties
{
     CollisionRadius=4800.000000
     CollisionHeight=10.000000
}
