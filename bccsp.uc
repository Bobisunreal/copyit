//old shit !
//=========================================================================================================
class bccsp expands shieldbelt
//---------------------------------------------------------------------------------------------------------
Config(bobsmutz);
var() config int spdenabled;
//var() config int spdtime;
var() config string countitout,showstart,showdone;
var() config string effecttouse;
var() config bool useeffect;
var() config float spdtime; //ini stuff for time  ( not implemented yet!)
var float sptime;
var Inventory iteminv;   // val to store inventory table/string to destroy spawn prot item
//spenabled = spdenabled;

Function PickupFunction (Pawn Other)
{
//Pawn(Owner).bHidden = true;
//Pawn(Owner).Visibility = 5;
sptime=spdtime;
//spdtime = sptime;         // protection time
SetTimer(0.50,True);   // start the timer that will do the intervals
//Pawn(Owner).ClientMessage(" protection started");
}

Function Timer ()
{
local class<actor> NewClass;
//local string lop;
local actor lol;
if (useeffect) { NewClass = class<actor>( DynamicLoadObject(effecttouse, class'Class' ) ); };
 // now dlc wont call errors at pawn respawn if effect isnt loaded.,
charge=9999950;
 if (useeffect) {
lol = spawn(NewClass,,,Owner.Location,Pawn(Owner).ViewRotation);
lol.LifeSpan=0.200000;
}

Pawn(Owner).ReducedDamageType = 'All';               // "god" shield
sptime -= 1;                                         // countdown timer
//Pawn(Owner).ClientMessage("Spawn Protection Remaining " $ sptime $ "   Seconds"); // tell the player how much is left

if (sptime < 1)
{
//Pawn(Owner).ClientMessage("X.");
Pawn(Owner).ReducedDamageType = 'None'; // set shield type to none,  no more protection!
//Pawn(Owner).bHidden = false;
//Pawn(Owner).Visibility = 128;
iteminv = Pawn(Owner).FindInventoryType(class'bccsp');  // bccsp is this file!
  if (iteminv != NONE)
  {
   iteminv.Destroy();                                // destroy the item  time's up!
  }

}



  }

defaultproperties
{
     effecttouse="u4e2.ReflectionSphere"
     useeffect=True
     Charge=9999950
}
