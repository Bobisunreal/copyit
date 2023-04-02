// change view trigger  for the  26 Chicken Itza - Town exit door
// wat a cool idea! references to sam here.
class ss_viewspottrig26 expands Trigger;
var playerpawn pw;
var translatorevent sst;
var bool trigged ;
function Touch( Actor Other )
 {
      foreach AllActors(class'translatorevent',sst)
      {
      //log(sst.name);
        if (sst.name== 'translatorevent2')
        {
           if ( Other.IsA('playerpawn') && !trigged )
          {
           //log(other.name);
           PlayerPawn(Other).ViewTarget = sst;
           PlayerPawn(Other).ViewTarget.BecomeViewTarget();
           trigged=true;
           SetTimer(3.0,false);
           pw = PlayerPawn(Other);
          }


        }


     }

   }

function BeginState ()
  {
  }


function Timer()
{
local playerpawn lop;

  foreach AllActors(class'PlayerPawn',lop)
   {

   if (lop == pw)
    {
      //log("reset view");
      lop.ViewTarget = None;
      lop.ViewTarget.BecomeViewTarget();
    }

   }


} //timer

defaultproperties
{
     bTriggerOnceOnly=True
     CollisionRadius=150.000000
     CollisionHeight=150.000000
}
