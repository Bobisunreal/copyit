class sbpoint expands Trigger;

 var shieldbelt ph;
 var shieldbelteffect ps;
 var firetexture tset[20];




 function Touch( actor Other )
{
 foreach AllActors(Class'shieldbelt', ph)
 {
   ph.TeamFireTextures[0] = tset[rand(19)];
    ph.TeamFireTextures[1] = tset[rand(19)];
     ph.TeamFireTextures[2] = tset[rand(19)];
      ph.TeamFireTextures[3] = tset[rand(19)];

   ph.TeamTextures[0] = tset[rand(19)];
   ph.TeamTextures[1] = tset[rand(19)];
     ph.TeamTextures[2] = tset[rand(19)];
      ph.TeamTextures[3] = tset[rand(19)];


 }


}


  defaultproperties
{

  tset(0)=FireTexture'UnrealShare.Effect1.FireEffect1a'
  tset(1)=FireTexture'UnrealShare.Effect1.FireEffect1e'
  tset(2)=FireTexture'UnrealShare.Effect1.FireEffect1p'
  tset(3)=FireTexture'UnrealShare.Effect1.FireEffect1pb'
  tset(4)=FireTexture'UnrealShare.Effect1.FireEffect1u'
  tset(5)=FireTexture'UnrealShare.Effect2.FireEffect2'
  tset(6)=FireTexture'UnrealShare.Effect3.fireeffect3'
  tset(7)=FireTexture'UnrealShare.Effect6.fireeffect6'
  tset(8)=FireTexture'UnrealShare.Effect7.MyTex16'
  tset(9)=FireTexture'UnrealShare.Effect8.fireeffect8'
  tset(10)=FireTexture'UnrealI.Effect10.fireeffect10'
  tset(11)=FireTexture'UnrealShare.Effect15.fireeffect15'
  tset(12)=FireTexture'UnrealShare.Effect17.fireeffect17'
  tset(13)=FireTexture'UnrealShare.Effect18.FireEffect18'
  tset(14)=FireTexture'UnrealShare.Effect25.fireeffect25'
  tset(15)=FireTexture'UnrealI.Effect27.fireeffect27'
  tset(16)=FireTexture'UnrealShare.Effect50.fireeffect50'
  tset(17)=FireTexture'UnrealShare.Effect51.MyTex3'
  tset(18)=FireTexture'UnrealI.Effect54.FireEffect54'
  tset(19)=FireTexture'UnrealShare.SEffect3.SmokeEffect3'


  bStatic=False;

}


