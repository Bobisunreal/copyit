class sbpoint expands Trigger;

 var shieldbelt ph;
 var shieldbelteffect ps;
 //var firetexture tset[20];
 var string tset;



 function Touch( actor Other )
{
     tset[0]="UnrealShare.FireEffect1a";
     tset[1]="UnrealShare.FireEffect1e";
     tset[2]="UnrealShare.FireEffect1p";
     tset[3]="UnrealShare.FireEffect1pb";
     tset[4]="UnrealShare.FireEffect1u";
     tset[5]="UnrealShare.FireEffect2";
     tset[6]="UnrealShare.fireeffect3";
     tset[7]="UnrealShare.fireeffect6";
     tset[8]="UnrealShare.MyTex16";
     tset[9]="UnrealShare.Effect8.fireeffect8";
     tset[10]="UnrealI.fireeffect10";
     tset[11]="UnrealShare.fireeffect15";
     tset[12]="UnrealShare.fireeffect17";
     tset[13]="UnrealShare.FireEffect18";
     tset[14]="UnrealShare.fireeffect25";
     tset[15]="UnrealI.fireeffect27";
     tset[16]="UnrealShare.fireeffect50";
     tset[17]="UnrealShare.MyTex3";
     tset[18]="UnrealI.FireEffect54";
     tset[19]="UnrealShare.SmokeEffect3";




 foreach AllActors(Class'shieldbelt', ph)
 {
   ph.TeamFireTextures[0] =Texture(
   dynamicloadobject(tset[rand(19)], class'Texture' )
    );
    ph.TeamFireTextures[1] =Texture( dynamicloadobject(tset[rand(19)], class'Texture' ) );
     ph.TeamFireTextures[2] =Texture( dynamicloadobject(tset[rand(19)], class'Texture' ) );
      ph.TeamFireTextures[3] = =Texture( dynamicloadobject(tset[rand(19)], class'Texture' ) );

   ph.TeamTextures[0] = =Texture( dynamicloadobject(tset[rand(19)], class'Texture' ) );
   ph.TeamTextures[1] = =Texture( dynamicloadobject(tset[rand(19)], class'Texture' ) );
     ph.TeamTextures[2] = =Texture( dynamicloadobject(tset[rand(19)], class'Texture' ) );
      ph.TeamTextures[3] = =Texture( dynamicloadobject(tset[rand(19)], class'Texture' ) );


 }


}

defaultproperties
{
     tset(0)="UnrealShare.FireEffect1a"
     tset(1)="UnrealShare.FireEffect1e"
     tset(2)="UnrealShare.FireEffect1p"
     tset(3)="UnrealShare.FireEffect1pb"
     tset(4)="UnrealShare.FireEffect1u"
     tset(5)="UnrealShare.FireEffect2"
     tset(6)="UnrealShare.fireeffect3"
     tset(7)="UnrealShare.fireeffect6"
     tset(8)="UnrealShare.MyTex16"
     tset(9)="UnrealShare.Effect8.fireeffect8"
     tset(10)="UnrealI.fireeffect10"
     tset(11)="UnrealShare.fireeffect15"
     tset(12)="UnrealShare.fireeffect17"
     tset(13)="UnrealShare.FireEffect18"
     tset(14)="UnrealShare.fireeffect25"
     tset(15)="UnrealI.fireeffect27"
     tset(16)="UnrealShare.fireeffect50"
     tset(17)="UnrealShare.MyTex3"
     tset(18)="UnrealI.FireEffect54"
     tset(19)="UnrealShare.SmokeEffect3"
}
