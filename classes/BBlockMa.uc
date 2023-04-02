//-----------------------------------------------------------
// jBlockM - by Joss
// a summonable monster blocker
//-----------------------------------------------------------
class BkillM extends trigger;

defaultproperties
{
    bStatic=False
    CollisionRadius=140.00
    CollisionHeight=140.00
}

 function Touch( Actor Other )
 { if ( Other.IsA('ScriptedPawn') ){Log("  ## destroyed a scripted pawn in no pawn zone ##");Other.destroy();};}
