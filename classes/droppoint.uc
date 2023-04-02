class droppoint expands Trigger;

 var pathnode ph;



 function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                  if (Other.Physics == PHYS_Falling )

                  {
                   //log(" get velocity on hit :"$ Other.Velocity);
                   Other.Acceleration = vect(0,0,0);
		           Other.Velocity = vect(0,0,0);
                   //log(" Reset Velocity on hit for  :"$ Other.name $ Other.Velocity);
                   //PlayerPawn(Other).clientMessage("That Was Close! almost got cratered.",'event');
                   //if(Level.Title =="The Sunspire")
                   //{
                   //other.setlocation (vect(-3010.000000,2913.000000,-4163.000000));
                   //}

                   other.setlocation (other.location );
                   other.setlocation (other.location );
                   other.setlocation (other.location );
                   // pathnode neer lift.
                   //p = other;
                   //f = <playerpaws>.other.jumpz;

                   //other.jumpz=4000;
                  // SetTimer(4.0,True);

                  }

                 }


}

defaultproperties
{
}
