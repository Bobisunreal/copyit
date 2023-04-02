//-----------------------------------------------------------
// jBlockM - by Joss
// a summonable monster blocker
//-----------------------------------------------------------
class BkillM extends trigger;


 function Touch( Actor Other )
 { if ( Other.IsA('ScriptedPawn') ){Log("  ## destroyed a scripted pawn in no pawn zone ##");Other.destroy();};}

defaultproperties
{
     CollisionRadius=140.000000
     CollisionHeight=140.000000
}
