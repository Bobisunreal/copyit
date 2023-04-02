class swfT expands Trigger;
function Touch( actor Other )
{
 if ( Other.IsA('SkaarjPlayer') )
                 {
                   other.SetCollisionSize(42.000000, 32.000000 );

                 }


}

defaultproperties
{
     CollisionRadius=50.000000
     CollisionHeight=50.000000
}
