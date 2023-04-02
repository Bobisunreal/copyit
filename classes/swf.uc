class swf expands Trigger;
function Touch( actor Other )
{
 if ( Other.IsA('PlayerPawn') )
                 {
                   other.SetCollisionSize( 15.000000, 20.000000 );

                 }


}

defaultproperties
{
     CollisionRadius=15.000000
     CollisionHeight=15.000000
}
