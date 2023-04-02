class duggers expands Trigger;

 var pathnode ph;


event BeginPlay()
{
     Super.BeginPlay();
     log ("huh wtf");
}



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  //if (Other.Physics == PHYS_Falling )

                  //{
                   log("playerpawn fell into lava in dug");
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   other.setlocation (vect(6316.556641,-213.189880,-293.901520));


                 // }

                 }


}

defaultproperties
{
     CollisionRadius=800.000000
     CollisionHeight=10.000000
}
