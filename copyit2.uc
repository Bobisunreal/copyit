// quick idea.
// duplicate existing monsters  with a random offset.
// basicly use existing location of monsters , and spawn duplicate near them
// A very simple spawner..


// need to add ability to ingnore bosses.
// want to add ability to subsitute spawns.

class ammom expands Mutator
config(monstercopier);


var (any)config bool unlimitammo,unlimitcopies,unlimitcharge;

event PreBeginPlay()
{
 Super.PreBeginPlay();
 SetTimer(5.0, true);

}


 function Timer()
{
 local scriptedpawn other;
 local int coun;


   if(unlimitammo)
   {
    consolecommand("set ammo ammoammount 9999");
   }

   if(unlimitcopies)
   {
    consolecommand("set pickup numcopies 9999");
   }

    if(unlimitcharge)
   {
    consolecommand("set jumpboots charge 9999");
   }
}



