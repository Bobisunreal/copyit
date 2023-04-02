class texMutator expands Mutator 	config(texMutator);


  var texture tex;

simulated function postBeginPlay()
{
  super.postBeginPlay();

  foreach allobjects(class'Texture',tex)
		{
		 log (string(texture.class));

		}





}

