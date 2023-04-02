class mapfixes expands Mutator ;
var vector templocation;

var(mapf)  config int lastversion ;

var () int thisversion;



event BeginPlay()
{
      Super.BeginPlay();
      thisversion = 4;
      SetTimer(1.0,false);

}



 function timer()
  {

     if  (lastversion < thisversion)
      { // ya kinda pointless but clever
        log("-----------------------------------------------------------");
        log("General Master Mapfix/Enhancer Mutator ");
        log("Found a newer version present! ");
        log("Mutator updated from "$ lastversion $ " to " $thisversion);
        log("-----------------------------------------------------------");
        lastversion = thisversion;
        saveconfig();

      }
      normaltail(); //  Normal Maps
      Madehiten();  //  RYS - Madehiten  - codespace ran out ;</
      Exploited();  //  RYS - Exploited
      Haros();      //  RYS - Haros
      Sirius();     //  RYS = Sirius
      Stargate();   //  lssg = stargate
      csejte();
  }



   function csejte()
   {
    local class<actor> actNewClass;  // dlc
    local actor actthing;            // dlc
    local teleporter teepee;
    local mover mvr;
    local dispatcher dsp;
    local trigger tgr;


      if(Level.Title == "Csejte1 Cachtice Route")
      { // Outside ledges of map (trAp zones).
       Log("Fixing Ledges...",'mapfix');
       actNewClass = class<actor>( DynamicLoadObject("copyit.c1fix", class'Class' ) );
       actthing=Spawn(actNewClass,,,vect(13411.361328,-9701.044922,-13162.182617));  // entry

       actNewClass = class<actor>( DynamicLoadObject("copyit.czpath", class'Class' ) );

       Spawn(actNewClass,,,vect(6768.211914,-12990.792969,-9281.985352));  // entry
       Spawn(actNewClass,,,vect(6820.020020,-11943.870117,-9282.062500));  // entry
       Spawn(actNewClass,,,vect(6826.535156,-11012.438477,-9282.025391));  // entry
       Spawn(actNewClass,,,vect(6852.229980,-9777.214844,-9282.104492));  // entry
       Spawn(actNewClass,,,vect(7381.269043,-9021.849609,-9281.976563));  // entry
       Spawn(actNewClass,,,vect(8031.905273,-8361.845703,-9281.929688));  // entry
       Spawn(actNewClass,,,vect(8692.200195,-7812.596680,-9282.085938));  // entry
        Spawn(actNewClass,,,vect(9654.025391,-7382.816895,-9281.965820));  // entry
        Spawn(actNewClass,,,vect(10004.335938,-8018.868652,-9282.068359));  // entry
        Spawn(actNewClass,,,vect(10295.891602,-8909.985352,-9281.971680));  // entry
        // start first steps jump

        Spawn(actNewClass,,,vect(10312.734375,-11655.417969,-9281.993164));  // entry


       if (  actthing != None ){
       Log("  - Ledge Area master fixed...",'mapfix');

       };

       foreach AllActors(class'mover', mvr)
                { // double hit hell
                  if(mvr.event == 'BackForceFieldTR')
                  {
                  Log("Fixing Forcefield Lever...",'mapfix');
                  mvr.btriggeronceonly = true;
                  };
                }


      };

      if(Level.Title == "Rons Corridors")
      { // messages
        Log("Fixing checkpoints...",'mapfix');

                foreach AllActors(class'actor', act)
           {
             if (act.isa('specialevent') )
              {
                if(act.tag == 'Portal1MSG')
                {
                  specialevent(act).message ="1";
                }
                if(act.tag == 'Portal2MSG')
                {
                  specialevent(act).message ="2";
                }
                if(act.tag == 'Portal3MSG')
                {
                  specialevent(act).message ="3";
                }
                if(act.tag == 'Portal4MSG')
                {
                  specialevent(act).message ="4";
                }
                if(act.tag == 'Portal5MSG')
                {
                  specialevent(act).message ="5";
                }
              }

            }

      };


       if(Level.Title == "Sky Isles")
      { //(trAp zones).
        Log("Fixing sky...",'mapfix');
        actNewClass = class<actor>( DynamicLoadObject("copyit.skykeeper", class'Class' ) );
        actthing=Spawn(actNewClass,,,vect(18519.595703,-1105.855225,-625.853271));  // entry
        if (  actthing != None ){Log("  - Ledge Area 1 fixed...",'mapfix');};          //actthing(c2fix).killplayer = false

      };



      if(Level.Title == "Csejte2 Cachtice Castle")
      { // Outside ledges of map (trAp zones).
        Log("Fixing Ledges...",'mapfix');
        actNewClass = class<actor>( DynamicLoadObject("copyit.c2fix", class'Class' ) );
        actthing=Spawn(actNewClass,,,vect(10718.380859,19743.207031,-11827.352539));  // entry
        if (  actthing != None ){Log("  - Ledge Area 1 fixed...",'mapfix');};          //actthing(c2fix).killplayer = false
        actthing=Spawn(actNewClass,,,vect(10822.979492,542.396545,-11827.352539));    // cener
        if (  actthing != None ){Log("  - Ledge Area 2 fixed...",'mapfix');};
        actthing=Spawn(actNewClass,,,vect(11926.769531,-18590.687500,-11827.352539)); // end
        if (  actthing != None ){Log("  - Ledge Area 3 fixed...",'mapfix');};

        // may want to have each go a seperate reset?
        // tested ok!
        // Todo : level end trigger only once
      };




      if(Level.Title ==  "Csejte Castle1F")
      { // level has a cheatable edge fenceing
        Log("Fixing Cheatable Switch...",'mapfix');

        // switchblock message
        actNewClass = class<actor>( DynamicLoadObject("copyit.zblockmapmess", class'Class' ) );
        actthing=Spawn(actNewClass,,,vect(-1394.610962,5067.222656,-1900.316406)); // switchtrigger
        if (  actthing != None ){Log("  - Blockingswitch  add message...",'mapfix');};

        // bloclkplayers switch
        actNewClass = class<actor>( DynamicLoadObject("copyit.zblockmap3", class'Class' ) );
        actthing=Spawn(actNewClass,,,vect(-1394.610962,5067.222656,-1900.316406)); // switchtrigger
        if (  actthing != None ){Log("  - Blocking the switch...",'mapfix');};

        // unblock trigger
        actNewClass = class<actor>( DynamicLoadObject("copyit.zunblock3", class'Class' ) );
        actthing=Spawn(actNewClass,,,vect(-9169.635742,-444.148682,-3329.316406)); // switchtrigger end
        if (  actthing != None ){Log("  - Switch unblock trigger...",'mapfix');};


      };



      if(Level.Title == "Inside UMS PrometheusTHS")
      { // my god how fucked up is this map ????
        Log("  -  Fixing thsRTNP bullshit...",'mapfix');

                foreach AllActors(class'mover', mvr)
                { // doors  in coop
                  if(mvr.tag == 'LogDoors')
                  {
                  Log("  -  Opening RTNP Hunter Log door... " $ string (mvr.name),'mapfix');
                  mvr.trigger(none,none);
                  };
                }

                foreach AllActors(class'dispatcher', dsp)
                { // dtiming   in coop
                  if(dsp.tag == 'CallMarines')
                  {
                  Log("  -  Speeding up  dispatcher timings...",'mapfix');
                  dsp.OutDelays[1]  = 30.0;
                  dsp.OutDelays[2]  = 30.0;
                  };
                }
             actNewClass = class<actor>( DynamicLoadObject("rtnp-fx.C4Remote", class'Class' ) );
             actthing=Spawn(actNewClass,,,vect(-5148.626953,13042.881836,2058.196777));  // entry
             if (  actthing != None ){Log("  -  Spawn extra detonator...",'mapfix');};


             //  superhealth in porthole srhink ( inside porthole)
             actNewClass = class<actor>( DynamicLoadObject("copyit.swf", class'Class' ) );
             actthing=Spawn(actNewClass,,,vect(-3542.051758,11867.068359,1759.098022));  // entry
             if (  actthing != None ){Log("  -  Spawned skarr fix...",'mapfix');};
             // superhealth in porthole un shrink (outside porthole)
             actNewClass = class<actor>( DynamicLoadObject("copyit.swfT", class'Class' ) );
             actthing=Spawn(actNewClass,,,vect(-3386.961670,11936.112305,1775.101929));  // entry
             if (  actthing != None ){Log("  -  Spawned skarr fix part 2..."$ string(actthing.name),'mapfix');};

             foreach AllActors(class'trigger', tgr)
                { // omg really?  bass is gay.?
                  if (tgr.event == 'KillPawn')
                  {
                  Log("  -  Fixing triggered kill player..." $ string (tgr.name),'mapfix');
                  tgr.destroy();

                  };
                }


      };

      if(Level.Title ==  "Aline Level 2")
      { // level has a spacecraft ending that traps
        Log("  -  Fixing spacecraft...",'mapfix');


        actNewClass = class<actor>( DynamicLoadObject("copyit.a2fix", class'Class' ) );
        actthing=Spawn(actNewClass,,,vect(18726.568359,11703.276367,718.691162)); // interpoint7
        if (  actthing != None ){Log("    -Spawned Interplotation point teleporter...",'mapfix');};

        Log("    - Checking For Brouci's...",'mapfix');
         foreach AllActors(class'actor', act)
                {
                   if (act.isa('Brouci') )
                   {
                     act.destroy();
                   }     // sry kami but you tiny bugs crash to much
                 }

      };


       if(Level.Title =="Edge of Na PaliTHS" )
      {
      Log("  -  Fixing thsRTNP bullshit...",'mapfix');

       foreach AllActors(class'actor', actthing)
       {
         if ( actthing.event == 'StartScout' || actthing.tag == 'StartScout')
         {
         Log("  -  Disabling door messages...",'mapfix');
         actthing.Destroy();
         }
       }
      //fix stupid door bullshit.
       foreach AllActors(class'mover', mvr)
       {
         if(mvr.tag == 'minedoor8')
         {
         mvr.tag='minedoor8nulled';
         mvr.trigger(self,self.Instigator);
         Log("  -  Opening entry doors..." $ string (mvr.name),'mapfix');
         };
       }

      }


      if(Level.Title =="The Eldora WellTHS" )
      {
        Log("  -  Fixing thsRTNP bullshit...",'mapfix');
        foreach AllActors(Class'teleporter', teepee)
          { // specific map check...  since he failed to changew the  title
            if ( teepee.url =="Glathriel1THS#EnterGlathriel1THS?peer")
            {
                foreach AllActors(class'mover', mvr)
                { // open this door automaticly without waiting.
                  if(mvr.tag == 'templedoors')
                  {
                   mvr.tag='templedoorsnulled';
                   mvr.trigger(self,self.Instigator);
                   Log("  -  Opening entry doors..." $ string (mvr.name),'mapfix');
                  };
                }


            }

          }

      }



      if(Level.Title == "The Return Home")
      { // Ogate2 , playerstart collision
       Log("Fixing playerstart...",'mapfix');

        if (level.game.isa('jCoopZGame'))
        {
         Log("  - detected gamtype as jCoopZGame ",'mapfix');
         actNewClass = class<actor>( DynamicLoadObject("JCoopZ1SSF.jzplayerstart", class'Class' ) );
        }
        if (level.game.isa('xcoop'))
        {
         Log("  - detected gamtype as xcoop ",'mapfix');
         actNewClass = class<actor>( DynamicLoadObject("xcoop.xplayerstart", class'Class' ) );
        }


        actthing=Spawn(actNewClass,,,vect(-1159.526123,-1271.164185,91.099762)); // switchtrigger
        if (  actthing != None ){Log("  - add extra skar start...",'mapfix');};

      };


   }











  function stargate()
 {
    local actor act;
    local sse seventp;               // spec event
    local class<actor> actNewClass;  // dlc
    local actor actaPawn;            // dlc
    local mover mvr;                 // movers


       if(Level.Title =="Level8" && level.author =="LION(LS)")
        { // All fixes for  sggl:Level8
            // possible pretriggergte , as it killall due to overload , cant continue



           foreach AllActors(class'actor', act)
           {
            if (act.isa('krall') ) { act.tag = 'copy';} // dont let anything copy
            if (act.isa('brute') ) { act.tag = 'copy';} // dont let anything copy


             if (act.isa('specialevent') )
              {
                if(act.tag == 'text10')
                {
                  specialevent(act).message ="Sometimes SG3 live ?....... ........";
                }

                if(act.tag == 'text10')
                {
                  specialevent(act).message ="Sometimes SG3 live ?....... ........";
                }



              }

              if (act.isa('counter') )
              {
                if(act.tag == 'Counter01pd' && act.event == 'slp01')
                {
                  counter(act).CompleteMessage ="ZAMEK OPEN";
                  counter(act).CountMessage ="STILL  %i REMAINING GUARDIAN";

                }

              }




            }


          Log("Found And Applied Changes To Map : stargate:Level8");
        }



     if(Level.Title =="Csejte1 Cachtice Route")
{
actNewClass = class<actor>( DynamicLoadObject("pnpack.mypathnode", class'Class' ) );
actthing=Spawn(actNewClass,,,vect(6803.550293,-13222.853516,-9255.950195));
actthing=Spawn(actNewClass,,,vect(7136.207520,-13216.117188,-9255.869141));
actthing=Spawn(actNewClass,,,vect(6793.974121,-12783.375977,-9255.999023));
actthing=Spawn(actNewClass,,,vect(6800.127441,-12238.404297,-9255.944336));
actthing=Spawn(actNewClass,,,vect(6793.502441,-11720.708984,-9255.940430));
actthing=Spawn(actNewClass,,,vect(6789.157715,-11156.554688,-9253.125977));
actthing=Spawn(actNewClass,,,vect(6812.405273,-10607.873047,-9256.114258));
actthing=Spawn(actNewClass,,,vect(6805.145508,-9998.743164,-9256.079102));
actthing=Spawn(actNewClass,,,vect(6899.871582,-9535.783203,-9255.962891));
actthing=Spawn(actNewClass,,,vect(7074.734375,-9335.605469,-9256.104492));
actthing=Spawn(actNewClass,,,vect(7330.728516,-9053.196289,-9255.963867));
actthing=Spawn(actNewClass,,,vect(7595.425781,-8791.666016,-9255.916016));
actthing=Spawn(actNewClass,,,vect(7932.333496,-8442.205078,-9255.965820));
actthing=Spawn(actNewClass,,,vect(8331.924805,-8074.391602,-9256.065430));
actthing=Spawn(actNewClass,,,vect(8649.555664,-7824.501465,-9256.115234));
actthing=Spawn(actNewClass,,,vect(9034.046875,-7640.915039,-9255.871094));
actthing=Spawn(actNewClass,,,vect(9536.808594,-7435.921387,-9256.053711));
actthing=Spawn(actNewClass,,,vect(9674.664063,-7392.645508,-9255.966797));
actthing=Spawn(actNewClass,,,vect(9727.899414,-7530.409668,-9255.904297));
actthing=Spawn(actNewClass,,,vect(9882.379883,-7796.246582,-9256.118164));
actthing=Spawn(actNewClass,,,vect(10041.400391,-8063.407715,-9255.963867));
actthing=Spawn(actNewClass,,,vect(10237.044922,-8519.310547,-9256.034180));
actthing=Spawn(actNewClass,,,vect(10288.486328,-8979.440430,-9253.071289));
actthing=Spawn(actNewClass,,,vect(10311.285156,-9410.917969,-9255.981445));
actthing=Spawn(actNewClass,,,vect(10306.080078,-10751.733398,-9255.866211));
actthing=Spawn(actNewClass,,,vect(10311.173828,-11116.812500,-9255.965820));
actthing=Spawn(actNewClass,,,vect(10310.238281,-11459.411133,-9256.034180));
actthing=Spawn(actNewClass,,,vect(10435.183594,-11875.303711,-9255.916016));
actthing=Spawn(actNewClass,,,vect(10814.590820,-12275.859375,-9256.076172));
actthing=Spawn(actNewClass,,,vect(11025.657227,-12477.485352,-9256.010742));
actthing=Spawn(actNewClass,,,vect(10814.934570,-12756.482422,-9255.947266));
actthing=Spawn(actNewClass,,,vect(10394.125977,-13171.792969,-9256.029297));
actthing=Spawn(actNewClass,,,vect(10362.668945,-13545.081055,-9255.977539));
actthing=Spawn(actNewClass,,,vect(10498.193359,-14131.399414,-9265.745117));
actthing=Spawn(actNewClass,,,vect(10854.155273,-14135.467773,-9261.859375));
actthing=Spawn(actNewClass,,,vect(11498.846680,-14135.791992,-9260.872070));
actthing=Spawn(actNewClass,,,vect(12349.702148,-14133.065430,-9265.745117));
actthing=Spawn(actNewClass,,,vect(11888.763672,-14132.282227,-9265.765625));
actthing=Spawn(actNewClass,,,vect(12641.747070,-14129.167969,-9265.660156));
actthing=Spawn(actNewClass,,,vect(12700.131836,-13939.222656,-9259.979492));
actthing=Spawn(actNewClass,,,vect(12698.147461,-13743.989258,-9265.934570));
actthing=Spawn(actNewClass,,,vect(12409.831055,-13741.748047,-9265.875000));
actthing=Spawn(actNewClass,,,vect(12193.618164,-13744.629883,-9265.988281));
actthing=Spawn(actNewClass,,,vect(12213.728516,-13457.220703,-9265.917969));
actthing=Spawn(actNewClass,,,vect(12207.655273,-13207.519531,-9265.985352));
actthing=Spawn(actNewClass,,,vect(12214.624023,-12977.458008,-9265.859375));
actthing=Spawn(actNewClass,,,vect(12208.503906,-12808.768555,-9265.961914));
actthing=Spawn(actNewClass,,,vect(12201.958008,-12721.416016,-9265.989258));
actthing=Spawn(actNewClass,,,vect(11997.671875,-12728.446289,-9263.529297));
actthing=Spawn(actNewClass,,,vect(11798.354492,-12702.949219,-9266.196289));
actthing=Spawn(actNewClass,,,vect(11821.000977,-12417.869141,-9266.209961));
actthing=Spawn(actNewClass,,,vect(11818.960938,-12062.464844,-9265.901367));
actthing=Spawn(actNewClass,,,vect(11821.324219,-11780.608398,-9265.993164));
actthing=Spawn(actNewClass,,,vect(11810.631836,-11433.452148,-9265.798828));
actthing=Spawn(actNewClass,,,vect(11811.085938,-11223.160156,-9265.945313));
actthing=Spawn(actNewClass,,,vect(11818.445313,-10955.851563,-9265.752930));
actthing=Spawn(actNewClass,,,vect(12118.778320,-10821.148438,-9265.822266));
actthing=Spawn(actNewClass,,,vect(12151.764648,-10564.655273,-9265.861328));
actthing=Spawn(actNewClass,,,vect(11537.874023,-10833.506836,-9265.816406));
actthing=Spawn(actNewClass,,,vect(11460.747070,-10561.153320,-9265.885742));
actthing=Spawn(actNewClass,,,vect(11440.070313,-10272.416992,-9276.022461));
actthing=Spawn(actNewClass,,,vect(11424.198242,-8385.393555,-9276.093750));
actthing=Spawn(actNewClass,,,vect(11299.555664,-8194.179688,-9276.036133));
actthing=Spawn(actNewClass,,,vect(11065.578125,-8137.946777,-9276.028320));
actthing=Spawn(actNewClass,,,vect(10875.495117,-8143.546387,-9275.792969));
actthing=Spawn(actNewClass,,,vect(10780.643555,-8013.397461,-9275.778320));
actthing=Spawn(actNewClass,,,vect(10654.938477,-7890.290527,-9275.807617));
actthing=Spawn(actNewClass,,,vect(10546.895508,-7567.174805,-9273.929688));
actthing=Spawn(actNewClass,,,vect(10427.291992,-7175.790527,-9276.057617));
actthing=Spawn(actNewClass,,,vect(10539.716797,-6838.866211,-9276.057617));
actthing=Spawn(actNewClass,,,vect(10927.035156,-6236.373535,-9274.125977));
actthing=Spawn(actNewClass,,,vect(10712.534180,-6566.372070,-9275.992188));
actthing=Spawn(actNewClass,,,vect(11106.121094,-5907.515137,-9276.083008));
actthing=Spawn(actNewClass,,,vect(11286.780273,-5561.411621,-9276.022461));
actthing=Spawn(actNewClass,,,vect(11494.273438,-5194.715820,-9275.917969));
actthing=Spawn(actNewClass,,,vect(11829.030273,-4784.651855,-9275.979492));
actthing=Spawn(actNewClass,,,vect(12216.266602,-4591.341797,-9276.000977));
actthing=Spawn(actNewClass,,,vect(12683.322266,-4515.652832,-9276.056641));
actthing=Spawn(actNewClass,,,vect(13352.282227,-4471.387695,-9275.958008));
actthing=Spawn(actNewClass,,,vect(13821.497070,-4482.773926,-9276.061523));
actthing=Spawn(actNewClass,,,vect(14290.182617,-4332.661621,-9276.091797));
actthing=Spawn(actNewClass,,,vect(14616.692383,-4170.289551,-9274.125977));
actthing=Spawn(actNewClass,,,vect(14682.649414,-4465.263184,-9274.125977));
actthing=Spawn(actNewClass,,,vect(15104.767578,-4411.795410,-9276.083008));
actthing=Spawn(actNewClass,,,vect(15140.207031,-4777.344727,-9276.040039));
actthing=Spawn(actNewClass,,,vect(15461.407227,-4647.833496,-9275.883789));
actthing=Spawn(actNewClass,,,vect(15600.495117,-5006.104492,-9276.117188));
actthing=Spawn(actNewClass,,,vect(15940.730469,-5133.473145,-9276.018555));
actthing=Spawn(actNewClass,,,vect(16510.898438,-5125.918457,-9273.178711));
actthing=Spawn(actNewClass,,,vect(16165.493164,-5126.827148,-9275.126953));
actthing=Spawn(actNewClass,,,vect(16960.361328,-5123.583984,-9275.065430));
actthing=Spawn(actNewClass,,,vect(16683.865234,-5121.024902,-9275.062500));
actthing=Spawn(actNewClass,,,vect(16310.299805,-4974.510742,-9275.051758));
actthing=Spawn(actNewClass,,,vect(16409.859375,-4890.279785,-9275.103516));
actthing=Spawn(actNewClass,,,vect(16310.299805,-4937.802734,-9258.252930));
actthing=Spawn(actNewClass,,,vect(16301.818359,-4790.876465,-9186.369141));
actthing=Spawn(actNewClass,,,vect(15889.969727,-4916.437012,-9185.854492));
actthing=Spawn(actNewClass,,,vect(16541.111328,-4684.954590,-9338.743164));
actthing=Spawn(actNewClass,,,vect(16680.869141,-4700.846680,-9338.574219));
actthing=Spawn(actNewClass,,,vect(16820.089844,-4554.052734,-9336.784180));
actthing=Spawn(actNewClass,,,vect(17099.671875,-4567.125488,-9252.917969));
actthing=Spawn(actNewClass,,,vect(17566.281250,-4642.553711,-9252.718750));
actthing=Spawn(actNewClass,,,vect(17311.316406,-4800.899902,-9252.779297));
actthing=Spawn(actNewClass,,,vect(17304.048828,-4646.167969,-9252.819336));
actthing=Spawn(actNewClass,,,vect(17405.927734,-4979.812012,-9220.999023));
actthing=Spawn(actNewClass,,,vect(17410.583984,-5219.495117,-9338.608398));
actthing=Spawn(actNewClass,,,vect(17473.001953,-5077.612305,-9338.638672));
actthing=Spawn(actNewClass,,,vect(17588.742188,-5153.214355,-9338.735352));
actthing=Spawn(actNewClass,,,vect(17746.402344,-4839.944336,-9338.651367));
actthing=Spawn(actNewClass,,,vect(17885.699219,-4401.619141,-9338.726563));
actthing=Spawn(actNewClass,,,vect(18034.746094,-3934.840088,-9338.504883));
actthing=Spawn(actNewClass,,,vect(18252.300781,-3304.187744,-9338.728516));
actthing=Spawn(actNewClass,,,vect(18381.068359,-2954.084473,-9338.642578));
actthing=Spawn(actNewClass,,,vect(18722.388672,-2908.682861,-9338.621094));
actthing=Spawn(actNewClass,,,vect(19171.716797,-2847.038574,-9338.549805));
actthing=Spawn(actNewClass,,,vect(19351.500000,-3367.799316,-9338.670898));
actthing=Spawn(actNewClass,,,vect(19258.712891,-2993.850342,-9338.577148));
actthing=Spawn(actNewClass,,,vect(19462.289063,-3724.494141,-9338.632813));
actthing=Spawn(actNewClass,,,vect(19505.437500,-4409.454590,-9338.655273));
actthing=Spawn(actNewClass,,,vect(19505.644531,-4841.970703,-9338.704102));
actthing=Spawn(actNewClass,,,vect(19515.890625,-5431.365234,-9336.742188));
actthing=Spawn(actNewClass,,,vect(19507.056641,-5061.812012,-9338.738281));
actthing=Spawn(actNewClass,,,vect(19534.480469,-5724.509277,-9338.631836));
actthing=Spawn(actNewClass,,,vect(19536.927734,-6103.551758,-9338.692383));
actthing=Spawn(actNewClass,,,vect(19359.638672,-6039.929688,-9291.027344));
actthing=Spawn(actNewClass,,,vect(19157.666016,-6042.589844,-9223.814453));
actthing=Spawn(actNewClass,,,vect(18745.017578,-6578.125977,-9146.016602));
actthing=Spawn(actNewClass,,,vect(18613.298828,-6467.697266,-9079.365234));
actthing=Spawn(actNewClass,,,vect(18264.052734,-6517.912109,-8888.054688));
actthing=Spawn(actNewClass,,,vect(17966.757813,-6707.833008,-8754.763672));
actthing=Spawn(actNewClass,,,vect(17706.074219,-6699.947754,-8628.334961));
actthing=Spawn(actNewClass,,,vect(17432.074219,-6460.322266,-8520.904297));
actthing=Spawn(actNewClass,,,vect(17526.019531,-6655.199707,-8561.880859));
actthing=Spawn(actNewClass,,,vect(17105.351563,-6678.011230,-8446.270508));
actthing=Spawn(actNewClass,,,vect(16698.722656,-7124.108398,-8359.284180));
actthing=Spawn(actNewClass,,,vect(16911.781250,-6960.867676,-8409.010742));
actthing=Spawn(actNewClass,,,vect(16998.941406,-6824.102539,-8425.246094));
actthing=Spawn(actNewClass,,,vect(17240.281250,-6376.388184,-8466.242188));
actthing=Spawn(actNewClass,,,vect(17413.111328,-5947.932129,-8547.322266));
actthing=Spawn(actNewClass,,,vect(17310.958984,-6113.496094,-8491.663086));
actthing=Spawn(actNewClass,,,vect(17087.332031,-5781.838867,-8518.738281));
actthing=Spawn(actNewClass,,,vect(16784.453125,-5623.362793,-8490.144531));
actthing=Spawn(actNewClass,,,vect(16939.212891,-5715.621094,-8492.911133));
actthing=Spawn(actNewClass,,,vect(16464.550781,-5551.319824,-8452.266602));
actthing=Spawn(actNewClass,,,vect(16127.337891,-5712.303711,-8367.776367));
actthing=Spawn(actNewClass,,,vect(15906.537109,-5924.193848,-8318.699219));
actthing=Spawn(actNewClass,,,vect(15632.862305,-6276.754395,-8171.034668));
actthing=Spawn(actNewClass,,,vect(15459.932617,-6409.666992,-8077.809082));
actthing=Spawn(actNewClass,,,vect(15207.352539,-6550.163574,-7963.479492));
actthing=Spawn(actNewClass,,,vect(15354.175781,-6495.641602,-8018.877930));
actthing=Spawn(actNewClass,,,vect(14988.126953,-6498.157715,-7899.887695));
actthing=Spawn(actNewClass,,,vect(14694.490234,-6368.983398,-7809.176758));
actthing=Spawn(actNewClass,,,vect(14422.969727,-6264.184570,-7750.878418));
actthing=Spawn(actNewClass,,,vect(14341.100586,-5995.762207,-7769.003418));
actthing=Spawn(actNewClass,,,vect(14341.666992,-5771.135742,-7822.771973));
actthing=Spawn(actNewClass,,,vect(14166.511719,-5576.777344,-7862.842773));
actthing=Spawn(actNewClass,,,vect(14475.869141,-5433.250000,-7991.291504));
actthing=Spawn(actNewClass,,,vect(14361.861328,-5585.532227,-7903.258789));
actthing=Spawn(actNewClass,,,vect(14230.431641,-5640.750488,-7851.113281));
actthing=Spawn(actNewClass,,,vect(13880.582031,-5404.770508,-7913.224609));
actthing=Spawn(actNewClass,,,vect(13603.360352,-5446.004883,-7885.297852));
actthing=Spawn(actNewClass,,,vect(13550.072266,-5577.450195,-7811.123535));
actthing=Spawn(actNewClass,,,vect(13281.354492,-5612.863770,-7810.159180));
actthing=Spawn(actNewClass,,,vect(12958.712891,-5664.157715,-7807.535645));
actthing=Spawn(actNewClass,,,vect(12821.234375,-5700.445801,-7774.755859));
actthing=Spawn(actNewClass,,,vect(12991.983398,-6245.112305,-7823.223633));
actthing=Spawn(actNewClass,,,vect(13139.368164,-6518.415527,-7715.517090));
actthing=Spawn(actNewClass,,,vect(13032.996094,-6429.235840,-7747.386719));
actthing=Spawn(actNewClass,,,vect(13199.066406,-6719.819336,-7655.291504));
actthing=Spawn(actNewClass,,,vect(13185.942383,-7043.949219,-7608.924805));
actthing=Spawn(actNewClass,,,vect(13034.097656,-7197.372559,-7562.473633));
actthing=Spawn(actNewClass,,,vect(13282.115234,-7415.120605,-7586.065918));
actthing=Spawn(actNewClass,,,vect(13522.481445,-7309.134766,-7644.166992));
actthing=Spawn(actNewClass,,,vect(12798.879883,-7341.575195,-7546.146484));
actthing=Spawn(actNewClass,,,vect(12648.803711,-7604.219238,-7559.614746));
actthing=Spawn(actNewClass,,,vect(12611.556641,-7851.022461,-7558.312012));
actthing=Spawn(actNewClass,,,vect(12550.337891,-8118.405762,-7582.354004));
actthing=Spawn(actNewClass,,,vect(12584.980469,-8001.834473,-7570.945313));
actthing=Spawn(actNewClass,,,vect(12610.581055,-8395.128906,-7593.125977));
actthing=Spawn(actNewClass,,,vect(12826.982422,-8487.250977,-7624.599609));
actthing=Spawn(actNewClass,,,vect(12880.878906,-8914.847656,-7639.881836));
actthing=Spawn(actNewClass,,,vect(12881.890625,-8691.933594,-7639.902832));
actthing=Spawn(actNewClass,,,vect(13630.370117,-7351.899414,-7660.328125));
actthing=Spawn(actNewClass,,,vect(13833.558594,-7144.956055,-7685.804688));
actthing=Spawn(actNewClass,,,vect(13884.073242,-6780.409668,-7533.649414));
actthing=Spawn(actNewClass,,,vect(14102.304688,-6657.348633,-7426.483887));
actthing=Spawn(actNewClass,,,vect(14428.554688,-6629.758301,-7308.110352));
actthing=Spawn(actNewClass,,,vect(14713.439453,-6549.920410,-7196.840332));
actthing=Spawn(actNewClass,,,vect(14858.044922,-6685.733398,-7195.128418));
actthing=Spawn(actNewClass,,,vect(15094.641602,-6893.009766,-7221.779297));
actthing=Spawn(actNewClass,,,vect(14991.722656,-6982.786621,-7266.557129));
actthing=Spawn(actNewClass,,,vect(15262.658203,-6873.781738,-7200.359375));
actthing=Spawn(actNewClass,,,vect(15461.498047,-6845.226074,-7172.724121));
actthing=Spawn(actNewClass,,,vect(15644.812500,-6803.995117,-7174.208496));
actthing=Spawn(actNewClass,,,vect(15706.220703,-6624.289551,-7134.979004));
actthing=Spawn(actNewClass,,,vect(15884.779297,-6493.125000,-7141.553711));
actthing=Spawn(actNewClass,,,vect(16021.909180,-6322.667480,-7134.630371));
actthing=Spawn(actNewClass,,,vect(16252.945313,-6271.984863,-7135.599609));
actthing=Spawn(actNewClass,,,vect(16472.814453,-6351.125488,-7142.814941));
actthing=Spawn(actNewClass,,,vect(16390.427734,-6288.739258,-7124.501953));
actthing=Spawn(actNewClass,,,vect(16635.742188,-6349.052734,-7120.296875));
actthing=Spawn(actNewClass,,,vect(16770.925781,-6221.189453,-7001.584961));
actthing=Spawn(actNewClass,,,vect(16731.865234,-6290.877441,-7059.127441));
actthing=Spawn(actNewClass,,,vect(16843.824219,-6153.275879,-6936.187500));
actthing=Spawn(actNewClass,,,vect(16943.291016,-5978.309082,-6833.714355));
actthing=Spawn(actNewClass,,,vect(17025.244141,-5816.381348,-6757.397949));
actthing=Spawn(actNewClass,,,vect(17114.363281,-5611.271484,-6649.460938));
actthing=Spawn(actNewClass,,,vect(17061.550781,-5687.787598,-6700.131348));
actthing=Spawn(actNewClass,,,vect(17253.501953,-5378.714355,-6559.586426));
actthing=Spawn(actNewClass,,,vect(17139.996094,-5532.730469,-6603.099121));
actthing=Spawn(actNewClass,,,vect(17467.957031,-5371.586426,-6541.639160));
actthing=Spawn(actNewClass,,,vect(17633.339844,-5600.101074,-6599.820313));
actthing=Spawn(actNewClass,,,vect(17718.562500,-5758.836426,-6642.043945));
actthing=Spawn(actNewClass,,,vect(17761.527344,-5900.858398,-6681.789063));
actthing=Spawn(actNewClass,,,vect(17943.253906,-6073.942383,-6780.020020));
actthing=Spawn(actNewClass,,,vect(18126.835938,-6094.275391,-6825.238281));
actthing=Spawn(actNewClass,,,vect(18341.191406,-6047.133301,-6828.207520));
actthing=Spawn(actNewClass,,,vect(18512.333984,-6013.834961,-6837.817871));
actthing=Spawn(actNewClass,,,vect(18674.195313,-5962.474121,-6859.998535));
actthing=Spawn(actNewClass,,,vect(18833.162109,-5807.052734,-6841.246582));
actthing=Spawn(actNewClass,,,vect(18908.033203,-6114.212891,-6840.436035));
actthing=Spawn(actNewClass,,,vect(18675.611328,-6278.583984,-6720.737793));
actthing=Spawn(actNewClass,,,vect(18545.898438,-6445.410156,-6645.675781));
actthing=Spawn(actNewClass,,,vect(18324.470703,-6479.211914,-6572.201172));
actthing=Spawn(actNewClass,,,vect(18178.201172,-6605.938477,-6536.689453));
actthing=Spawn(actNewClass,,,vect(17898.806641,-6572.968750,-6586.444824));
actthing=Spawn(actNewClass,,,vect(17700.054688,-6506.435059,-6518.918945));
actthing=Spawn(actNewClass,,,vect(17499.166016,-6535.014160,-6408.419922));
actthing=Spawn(actNewClass,,,vect(17333.820313,-6487.857422,-6321.946777));
actthing=Spawn(actNewClass,,,vect(17117.835938,-6516.622559,-6204.706543));
actthing=Spawn(actNewClass,,,vect(16950.458984,-6598.155762,-6107.652832));
actthing=Spawn(actNewClass,,,vect(16781.761719,-6815.613281,-6041.950195));
actthing=Spawn(actNewClass,,,vect(16473.033203,-6716.125000,-5929.883301));
actthing=Spawn(actNewClass,,,vect(16209.192383,-6731.521973,-5854.867676));
actthing=Spawn(actNewClass,,,vect(16220.148438,-6439.091797,-5865.395020));
actthing=Spawn(actNewClass,,,vect(15949.552734,-6862.001465,-5778.074219));
actthing=Spawn(actNewClass,,,vect(15597.486328,-6852.814453,-5678.704590));
actthing=Spawn(actNewClass,,,vect(15846.213867,-6579.292480,-5756.028320));
actthing=Spawn(actNewClass,,,vect(15963.413086,-6361.363770,-5794.563965));
actthing=Spawn(actNewClass,,,vect(15908.458984,-6029.187988,-5834.714355));
actthing=Spawn(actNewClass,,,vect(15772.230469,-5821.666016,-5850.599609));
actthing=Spawn(actNewClass,,,vect(15410.904297,-5733.670410,-5788.833008));
actthing=Spawn(actNewClass,,,vect(15560.703125,-5780.198730,-5812.359375));
actthing=Spawn(actNewClass,,,vect(15221.375000,-5682.953125,-5756.026367));
actthing=Spawn(actNewClass,,,vect(14943.427734,-5687.761230,-5721.090332));
actthing=Spawn(actNewClass,,,vect(14672.787109,-5595.801758,-5698.054199));
actthing=Spawn(actNewClass,,,vect(14782.747070,-5622.026855,-5713.997559));
actthing=Spawn(actNewClass,,,vect(14490.275391,-5682.365234,-5644.351563));
actthing=Spawn(actNewClass,,,vect(14380.130859,-5849.105957,-5608.924316));
actthing=Spawn(actNewClass,,,vect(14274.885742,-6048.398438,-5574.164551));
actthing=Spawn(actNewClass,,,vect(14075.383789,-5920.122070,-5572.290039));
actthing=Spawn(actNewClass,,,vect(13954.414063,-5810.150391,-5547.170410));
actthing=Spawn(actNewClass,,,vect(13752.241211,-5799.329590,-5563.755859));
actthing=Spawn(actNewClass,,,vect(13484.240234,-5877.640625,-5597.306152));
actthing=Spawn(actNewClass,,,vect(13611.498047,-5844.871094,-5586.155273));
actthing=Spawn(actNewClass,,,vect(13391.578125,-5945.206543,-5585.852539));
actthing=Spawn(actNewClass,,,vect(13206.162109,-6059.498535,-5584.113770));
actthing=Spawn(actNewClass,,,vect(13051.558594,-6161.756348,-5581.233398));
actthing=Spawn(actNewClass,,,vect(12824.612305,-6270.545898,-5599.350098));
actthing=Spawn(actNewClass,,,vect(12938.793945,-6295.213867,-5578.763184));
actthing=Spawn(actNewClass,,,vect(12648.743164,-6398.757324,-5548.094727));
actthing=Spawn(actNewClass,,,vect(12540.723633,-6382.271484,-5525.598633));
actthing=Spawn(actNewClass,,,vect(12357.972656,-6390.119629,-5483.645508));
actthing=Spawn(actNewClass,,,vect(12165.475586,-6456.616211,-5431.119629));
actthing=Spawn(actNewClass,,,vect(11916.268555,-6558.184570,-5374.907227));
actthing=Spawn(actNewClass,,,vect(11551.477539,-6857.873047,-4962.960938));
actthing=Spawn(actNewClass,,,vect(11640.511719,-7063.880859,-4963.007324));
actthing=Spawn(actNewClass,,,vect(11488.705078,-7122.690430,-4963.027832));
actthing=Spawn(actNewClass,,,vect(11542.902344,-7319.428711,-4962.955078));
actthing=Spawn(actNewClass,,,vect(11389.566406,-7341.078125,-4962.994629));
actthing=Spawn(actNewClass,,,vect(11404.660156,-7589.940918,-4963.004395));
};



  }




  function normaltail()
 {
    local actor act;
    local translatorevent fixf;      // tranlator messages actor array
    local trigger fixg;              // duplicate of trigger array?
    local sse seventp;               // spec event
    local class<actor> actNewClass;  // dlc
    local actor actaPawn;            // dlc
    local teleporter teepee;         // teleporter
    local mover mvr;                 // movers




      if(string(Level.outer) =="dig")
      {  // fan fix.
       templocation.X = 7653.117676;   templocation.Y = 3551.962891;  templocation.Z = -372.099548;
       actNewClass = class<actor>(  DynamicLoadObject("copyit.digfix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = 7507.117676;   templocation.Y = 3545.962891;  templocation.Z = -372.099548;
       actNewClass = class<actor>(  DynamicLoadObject("copyit.digfix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       Log("spawned fan fix");
      };


      if(string(Level.outer) ==  "dug" )
      {
      // 800 radius  the lavas under the 2 first lift are a trap
      actNewClass = class<actor>( DynamicLoadObject("copyit.duggers", class'Class' ) );
      actaPawn=Spawn(actNewClass,,,vect(6863.703613,815.542847,-595.989990));  // First lift
      actaPawn=Spawn(actNewClass,,,vect(6653.206055,-111.683075,-574.989990)); // Second lift

      actNewClass = class<actor>( DynamicLoadObject("unreali.woodenbox", class'Class' ) );
      actaPawn=Spawn(actNewClass,,,vect(6863.703613,815.542847,-595.989990));  // First lift
      actaPawn=Spawn(actNewClass,,,vect(6653.206055,-111.683075,-574.989990)); // Second lift
      Log("dug the duggers is dugged ");
      }


      if(string(Level.outer) ==  "dkeep2" )
      { // glider spawn-fall teleport reset. 4900 radius
      actNewClass = class<actor>( DynamicLoadObject("copyit.dkeeper", class'Class' ) );
      actaPawn=Spawn(actNewClass,,,vect(6013.467285,-2051.453613,-2006.893311));
      Log("Spawned The Glider Fix.",'mapfixes');
      // tested ok!
      }

      if(string(Level.outer) ==  "spacelab" )
      {  // space spawn-fall into space  bug.
      actNewClass = class<actor>( DynamicLoadObject("copyit.labfix", class'Class' ) );
      actaPawn=Spawn(actNewClass,,,vect(7.431558,-16.399410,-5072.676758));
      Log("Spawned The space fix.",'mapfixes');
      // tested ok!
      }

       //arachnopolis.unr





      if(string(Level.outer) =="harobed" )
      { //  mover16   // tag sdd  stayopentime 999
        foreach AllActors(class'mover', mvr)
           { // end door that traps players in votend
             if(mvr.tag == 'sdd')
              {
              Log("Fixing Some Mover");
              mvr.stayopentime = 999;
              // failed in test
              };
           }
       // door at end will blocl players from exiting f the endvoting is enabled
       // Titans
       templocation.X = -5804.000000;  templocation.Y = 3412.000000;  templocation.Z = -188.000000;   actNewClass = class<actor>( DynamicLoadObject("unreali.titan", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);       actaPawn.tag = 'copy';
       templocation.X = -988.000000;   templocation.Y = 3924.000000;  templocation.Z = -188.000000;   actNewClass = class<actor>( DynamicLoadObject("unreali.titan", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);       actaPawn.tag = 'copy';
       templocation.X = 1149.315430;   templocation.Y = -305.206390;  templocation.Z = -1129.486816;  actNewClass = class<actor>( DynamicLoadObject("unreali.titan", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);       actaPawn.tag = 'copy';
       // Warlord
       templocation.X = -4761.766602;  templocation.Y = 1560.692139;  templocation.Z = -429.899475;  actNewClass = class<actor>( DynamicLoadObject("unreali.warlord", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);       actaPawn.tag = 'copy';
       Log("Found And Applied Changes To Map : Harobed Village");
      }







      if(Level.Title =="The Sunspire")
      { // All fixes for  The Sunspire
       // Reset triggers in highest shafts close to bottom of fall
       templocation.X = -2717.327148;   templocation.Y = 3404.426758; templocation.Z = -3530.440430; actNewClass = class<actor>( DynamicLoadObject("copyit.droppoint", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -2704.361328;   templocation.Y = 3074.662109; templocation.Z = -3530.440430; actNewClass = class<actor>( DynamicLoadObject("copyit.droppoint", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       // Reset triggers in second highest shafts close to bottom of fall
       templocation.X = -3305.899902;   templocation.Y = 3068.788330; templocation.Z = -6688.590332; actNewClass = class<actor>( DynamicLoadObject("copyit.droppoint", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3314.899902;   templocation.Y = 3402.310303; templocation.Z = -6652.452148; actNewClass = class<actor>( DynamicLoadObject("copyit.droppoint", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       Log("Found And Applied Changes To Map : The Sunspire");
      }





       if(Level.Title =="The Underground Temple" && level.author =="EddX"  )
      {   // templ1
            // skip templ12 goto temple3
            if (act.isa('teleporter') )
             { //redirect this map to a new name , so the beta maps wont get screwed.    -Cross
               if ( teleporter(act).url =="temple2#temple2entry?peer")
                {
                 teleporter(act).url="temple3#";
                 log("Map end url(ltemple2#temple2entry?peer) has been changed to temple3");
                }

             }




          Log("Found And Applied Changes To Map :templ1");
      }







     // future
     if(Level.Title =="NyLeve's Falls")
      {
        // hard coded spawns from stlister
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );
       templocation = vect(3537.958740,-6826.848633,-1202.099976);  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation = vect(3220.4731450,-7685.009277,-1202.099976); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;


       templocation.X = 3449.655518;   templocation.Y = -8331.272461;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 2650.034180;   templocation.Y = -9039.547852;  templocation.Z = -1141.204346;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 4846.096191;   templocation.Y = -7654.783203;  templocation.Z = -1202.099976;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);actaPawn.drawscale=4;
       templocation.X = 4914.868652;   templocation.Y = -7144.481445;  templocation.Z = -1202.099976;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 5415.890625;   templocation.Y = -7344.074707;  templocation.Z = -1202.099976;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 6438.808594;   templocation.Y = -7099.914551;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 6272.245117;   templocation.Y = -7598.165039;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 6272.245117;   templocation.Y = -7598.165039;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       //templocation.X = 6767.511719;   templocation.Y = -7836.762695;  templocation.Z = -1202.199951;
       //actNewClass = class<actor>(  DynamicLoadObject("sspeed.speed", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);
       //templocation.X = 3137.185059;   templocation.Y = -8331.542969;  templocation.Z = -1202.199951;
       //actNewClass = class<actor>(  DynamicLoadObject("MoreMod.DoubleShotGunv2", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);
       //templocation.X = 1515.666870;   templocation.Y = -7864.077637;  templocation.Z = 346.672455;
       //actNewClass = class<actor>(  DynamicLoadObject("mentalpack1.bodcannon", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);
        templocation.X = 2755.132080;   templocation.Y = -9860.586914;  templocation.Z = -1123.957031;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = 4136.101074;   templocation.Y = -7447.294922;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 3881.757080;   templocation.Y = -9221.828125;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=3;
       templocation.X = -417.583710;   templocation.Y = -8631.685547;  templocation.Z = -975.756042;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = -355.501648;   templocation.Y = -8031.483887;  templocation.Z = -1034.251343;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = -1235.891479;   templocation.Y = -7773.881348;  templocation.Z = -1202.099976;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=3;
       templocation.X = -644.157349;   templocation.Y = -6445.917969;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 3217.744141;   templocation.Y = -8758.341797;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=3;
       templocation.X = 3831.987793;   templocation.Y = -8041.786133;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
       templocation.X = 7418.905273;   templocation.Y = -6801.102051;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
       templocation.X = -822.228088;   templocation.Y = -972.814148;  templocation.Z = -199.509308;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=4;
       templocation.X = 4582.394043;   templocation.Y = -6365.926758;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation); actaPawn.drawscale=3;
       templocation.X = 4152.608887;   templocation.Y = -6784.266602;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
       templocation.X = 3641.153564;   templocation.Y = -7504.811035;  templocation.Z = -1202.199951;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
       templocation.X = 5311.962402;   templocation.Y = -8779.822266;  templocation.Z = -1155.188843;
       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=3;

       templocation.X = 3377.124512;   templocation.Y = -7022.505371;  templocation.Z = -1190.923706;
       actNewClass = class<actor>(  DynamicLoadObject("xcoop.xplayerstart", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);




      };

       if(Level.Title =="SpireVillage")
      { // All fixes for  Harobed Village
        // all trees from stlist
        actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );

       templocation.X =-13560.495117;   templocation.Y =14239.041992;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-14733.813477;   templocation.Y =14473.419922;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-15463.100586;   templocation.Y =14531.580078;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-16012.535156;   templocation.Y =15002.227539;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-15437.047852;   templocation.Y =15607.446289;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-14389.351563;   templocation.Y =16106.688477;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-13283.533203;   templocation.Y =15976.610352;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-12068.203125;   templocation.Y =15781.715820;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-11076.503906;   templocation.Y =15611.399414;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-12388.909180;   templocation.Y =14973.922852;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-13979.625977;   templocation.Y =15342.539063;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-12774.713867;   templocation.Y =14496.610352;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-13564.714844;   templocation.Y =15190.497070;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-12582.171875;   templocation.Y =16149.455078;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-13000.737305;   templocation.Y =12906.074219;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-12255.572266;   templocation.Y =12402.411133;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-11957.510742;   templocation.Y =11663.565430;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-13443.968750;   templocation.Y =11462.821289;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-16092.975586;   templocation.Y =11091.257813;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-16688.882813;   templocation.Y =9326.826172;  templocation.Z = -7841.200195;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-15677.478516;   templocation.Y =8224.013672;  templocation.Z = -7618.590820;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-13206.135742;   templocation.Y =7553.184570;  templocation.Z = -7269.363770;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-12770.358398;   templocation.Y =5853.020996;  templocation.Z = -7014.048340;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-10593.467773;   templocation.Y =5644.877930;  templocation.Z = -6809.955078;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-8154.419922;   templocation.Y =879.706177;  templocation.Z = -6633.200195;    actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-8830.100586;   templocation.Y =-272.895905;  templocation.Z = -6633.200195;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-5961.717773;   templocation.Y =-2552.713623;  templocation.Z = -6912.165527;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-4587.911621;   templocation.Y =-934.392273;  templocation.Z = -7116.726563;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-3293.491455;   templocation.Y =-2652.246338;  templocation.Z = -7222.243652;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-2303.297119;   templocation.Y =-1350.131592;  templocation.Z = -7373.761719;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-1254.744873;   templocation.Y =-2438.220947;  templocation.Z = -7427.832031;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-994.265442;   templocation.Y =-2348.901367;  templocation.Z = -7455.298828;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-14536.922852;   templocation.Y =15689.370117;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-16340.247070;   templocation.Y =14295.016602;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-17015.228516;   templocation.Y =15254.447266;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-16893.419922;   templocation.Y =10253.442383;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-10788.840820;   templocation.Y =3926.597168;  templocation.Z = -6633.200195;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-11946.048828;   templocation.Y =5699.936035;  templocation.Z = -6906.003418;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-15641.926758;   templocation.Y =9391.323242;  templocation.Z = -7841.100098;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-14706.198242;   templocation.Y =7678.471191;  templocation.Z = -7446.901367;  actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-9153.596680;   templocation.Y =1360.421997;  templocation.Z = -6633.100098;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-14610.671875;   templocation.Y =15128.766602;  templocation.Z = -7841.200195; actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-7965.703613;   templocation.Y =-1431.825195;  templocation.Z = -6633.200195;  actaPawn=Spawn(actNewClass,,,templocation);


       Log("Found And Applied Changes To Map : sunshine Village");
      }

       if(Level.Title =="The Sunspire")
      { // All fixes for  The Sunspire
              // A few tentacles neer entry
       templocation.X = 1889.484741;   templocation.Y = 3029.743164;  templocation.Z = -10926.992188; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.tag = 'copy';
       templocation.X = 1869.000977;   templocation.Y = 3340.937012;  templocation.Z = -10927.269531; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.tag = 'copy';

       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );
       templocation.X =-9962.506836; templocation.Y =9687.333984;  templocation.Z = -9372.621094;    actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-9070.884766; templocation.Y =11714.154297; templocation.Z = -10350.226563;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-7232.803711; templocation.Y =12353.166992; templocation.Z = -11089.198242;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-5505.824219; templocation.Y =11246.628906; templocation.Z = -11205.931641;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =-922.836670;  templocation.Y =10523.905273; templocation.Z = -11205.931641;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =2424.436768;  templocation.Y =8690.654297;  templocation.Z = -11205.931641;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =5331.128418;  templocation.Y =7065.880371;  templocation.Z = -11205.931641;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =6739.812500;  templocation.Y =4399.291016;  templocation.Z = -11205.931641;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =5794.541992;  templocation.Y =2929.241699;  templocation.Z = -11205.931641;   actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X =181.377045;   templocation.Y =2673.527344;  templocation.Z = 7453.085938;     actaPawn=Spawn(actNewClass,,,templocation);




       Log("TREES Changes To Map : The Sunspire");
      }


       if(Level.Title =="Edge of Na PaliTHS")
      { // Edge of Na PaliTHS

       actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );
       templocation = vect(20665.880859,-12394.407227,-213.471725); actaPawn=Spawn(actNewClass,,,templocation);     actaPawn.drawscale=4;
       templocation = vect(20745.417969,-10421.687500,-306.901855); actaPawn=Spawn(actNewClass,,,templocation);    actaPawn.drawscale=4;
       templocation = vect(21753.892578,-9633.974609,-280.901642);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(19570.443359,-8198.412109,-372.500793);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(18097.208984,-8741.278320,-280.919800);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(17297.093750,-11654.670898,-461.543671); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
       templocation = vect(5670.346680,-7374.640625,-2118.050049);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(4152.305176,-6469.039063,-2360.785889);  actaPawn=Spawn(actNewClass,,,templocation);    actaPawn.drawscale=4;
       templocation = vect(3258.582275,-5173.377930,-2450.371338);  actaPawn=Spawn(actNewClass,,,templocation);    actaPawn.drawscale=4;
       templocation = vect(1812.824463,-4260.187012,-2631.786133);  actaPawn=Spawn(actNewClass,,,templocation);    actaPawn.drawscale=4;
       templocation = vect(-226.649109,-3838.923584,-2756.562256);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(-1731.209595,-1991.233398,-2742.897705); actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(-1796.028931,-64.633591,-2360.787109);   actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(-1040.420410,2299.363037,-2558.872070);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(-1096.128174,3387.671631,-2558.750977);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(-2280.835693,3700.117188,-2560.191650);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(-1324.619385,5460.679199,-2543.146484);  actaPawn=Spawn(actNewClass,,,templocation);    actaPawn.drawscale=4;
       templocation = vect(1761.429077,6194.028320,-2769.650391);   actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(4431.904785,6023.604980,-2960.131592);   actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
       templocation = vect(8711.542969,8122.948730,-2560.635254);   actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
       templocation = vect(10821.137695,7454.895020,-2158.098145);  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
       templocation = vect(8030.757324,-8886.499023,-1560.517700);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;

       Log("Found And Applied Changes To Map : Edge of Na PaliTHS");
      }


       if(Level.Title =="Neve's CrossingTHS")
      { //Neve's CrossingTHS
         actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );
         templocation = vect(-2871.963623,2955.899902,779.230957);    actaPawn=Spawn(actNewClass,,,templocation);    actaPawn.drawscale=4;
         templocation = vect(-535.322571,2753.932129,746.079956);     actaPawn=Spawn(actNewClass,,,templocation);     actaPawn.drawscale=4;
         templocation = vect(2430.893555,-736.254639,1314.606567);    actaPawn=Spawn(actNewClass,,,templocation);    actaPawn.drawscale=4;
         templocation = vect(3816.695068,-1594.127808,1161.431519);   actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
         templocation = vect(2315.684814,-2657.125000,1224.851318);   actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
         templocation = vect(633.086182,-3092.042725,1226.079590);    actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
         templocation = vect(-1923.894409,-1211.688965,1600.259644);  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(2285.254639,2445.229736,1625.323608);    actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(3206.021729,2816.354736,1625.461060);    actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         Log("Found And Applied Changes To Map : Neve's CrossingTHS");
      }

       if(Level.Title =="The Eldora WellTHS")
      { //Neve's CrossingTHS
         actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );
         templocation = vect(4935.055176,-6641.429199,875.799988);   actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(5892.995117,-5721.168945,875.799988);   actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(3228.332275,-13290.508789,46.637337);   actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(2470.622803,-12698.462891,-87.353088);  actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
         Log("Found And Applied Changes To Map : Eldora WellTHS");
      }

        if(Level.Title =="Glathriel Village2THS")
      { //Glathriel Village2THS
         actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );
         templocation = vect(-120.653458,2046.238525,-374.260376);  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(963.997437,1085.550659,74.733223);     actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
         templocation = vect(-441.973938,877.963745,30.591215);     actaPawn=Spawn(actNewClass,,,templocation);   actaPawn.drawscale=4;
         templocation = vect(1969.167847,-932.182800,41.242527);    actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(615.554138,-808.708435,37.187672);     actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(813.883118,-1968.318481,39.728706);    actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(-2629.457764,-244.031158,-102.224289); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         Log("Found And Applied Changes To MapGlathriel Village2THS");
      }


        if(Level.Title =="Spire ValleyTHS")
      { //Spire ValleyTHS
         actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );

         templocation = vect(7045.403809,-6791.162598,-2857.354248); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(5129.406738,-6407.870605,-2860.510254); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=3;
         templocation = vect(2432.540771,-8180.004395,-3096.205078); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(1007.491638,-6515.708008,-3096.925293); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(-265.205841,-8638.144531,-3096.982422); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=3;
         templocation = vect(1063.390137,-9439.226563,-3096.975586); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(2985.055176,-11866.385742,-3095.175537); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(3810.462891,-10076.320313,-3096.982178); actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(2848.686279,-3159.480469,-3096.841553);  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=3;
         templocation = vect(-3716.699219,3114.022461,-3086.827881);  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(-914.927979,6205.574219,-3009.214844);   actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;
         templocation = vect(-5642.595703,7597.334961,-3057.128418);  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=3;
         templocation = vect(-8105.375488,-240.212875,-2812.335205);  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.drawscale=4;

         actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree4", class'Class' ) );
         templocation = vect(1527.364990,10151.329102,-3063.635498);  actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-2029.852539,14746.734375,-2914.510010); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-7369.077148,9515.250977,-2832.722412);  actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-10371.475586,-12713.942383,-2057.022217); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-9779.073242,-11392.814453,-2072.310791); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-4812.548340,-6796.841309,-2833.934814); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-3947.006592,-7548.945801,-2801.039307); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-2365.698975,-8480.887695,-3064.393555); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(301.579651,-8949.209961,-3045.979736);   actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(944.150513,-13413.810547,-3094.772217);  actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(1522.681885,-13405.724609,-3095.966064); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(2011.090942,-13380.947266,-3096.944580); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(2451.020264,-13358.629883,-3096.993652); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(3296.800049,-13315.883789,-3096.995605); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(4208.324219,-10425.139648,-3067.275146); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(2125.036621,10692.666992,-3094.242432); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(2187.336914,10947.970703,-3095.111572); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(2055.088623,11226.432617,-3091.458496); actaPawn=Spawn(actNewClass,,,templocation);

         actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree2", class'Class' ) );
         templocation = vect(202.877899,-1522.154907,-2502.213867);   actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-6275.874512,2787.292480,-3087.765381);  actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-6899.250977,2687.288818,-3064.106201);  actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-8282.910156,915.995850,-2840.460938);   actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-8642.798828,-2339.502441,-2637.632324); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-8925.339844,-6108.893555,-2343.804443); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-9864.254883,-9520.218750,-2260.734863); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-4964.670410,-7708.640625,-2737.459717); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-5619.293457,-7717.165039,-2671.884766); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(4120.344727,-9139.753906,-3049.303467);  actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(5886.189941,-7160.625977,-2834.132813);  actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-3997.908936,-6808.286133,-2881.424072); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-5337.468750,-7198.143555,-2729.573730); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-6217.463379,-8506.476563,-2580.000244); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-8736.188477,-8548.292969,-2299.079346); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-8517.174805,-6786.589844,-2311.469727); actaPawn=Spawn(actNewClass,,,templocation);
         templocation = vect(-6685.004395,1698.663574,-2976.453369);  actaPawn=Spawn(actNewClass,,,templocation);
         actaPawn=Spawn(actNewClass,,,vect(-2280.756592,5979.041504,-3030.345703));

         Log("Found And Applied Changes To Map : Spire ValleyTHS");
      }

         if(Level.Title =="UMS PrometheusTHS" || Level.Title =="Approaching UMS PrometheusTHS" || Level.Title =="Inside UMS PrometheusTHS")
      { //Neve's CrossingTHS
        //  these 3 maps are interchangable i think...
        actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree2", class'Class' ) );
         actaPawn=Spawn(actNewClass,,,vect(-89.213013,5679.814453,1483.800049));
         actaPawn=Spawn(actNewClass,,,vect(810.989685,7710.143066,1483.800049));
         actaPawn=Spawn(actNewClass,,,vect(594.663330,10958.040039,1483.800049));
        actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );
         actaPawn=Spawn(actNewClass,,,vect(-10499.304688,3895.369141,2572.535400));
         actaPawn=Spawn(actNewClass,,,vect(-9871.887695,5464.437012,2469.107666));
         actaPawn=Spawn(actNewClass,,,vect(-9164.636719,8778.783203,2634.933838));
         actaPawn=Spawn(actNewClass,,,vect(-6650.856934,10149.208008,1522.800049));
         actaPawn=Spawn(actNewClass,,,vect(-6053.816406,2825.121582,1483.800049));
         actaPawn=Spawn(actNewClass,,,vect(-426.555939,2272.704834,1483.800049));
         actaPawn=Spawn(actNewClass,,,vect(-2534.738281,12382.602539,1483.800049));
        actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree4", class'Class' ) );
         actaPawn=Spawn(actNewClass,,,vect(-7830.211914,8852.302734,1518.949341));
         actaPawn=Spawn(actNewClass,,,vect(-6744.454102,5434.271484,1483.800049));
         actaPawn=Spawn(actNewClass,,,vect(-4246.280762,14210.267578,1483.800049));
         actaPawn=Spawn(actNewClass,,,vect(-6588.264160,4944.819824,1482.844238));


          Log("Found And Applied Changes To Map : UMS PrometheusTHS");
      }


        if(Level.Title =="Nagomi PassageTHS" || Level.Title =="Nagomi Passage2THS" || Level.Title =="Nagomi Passage" )
      { //Glathriel Village2THS
        actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree3", class'Class' ) );
         actaPawn=Spawn(actNewClass,,,vect(691.730042,-1541.931641,-2516.199951));
         actaPawn=Spawn(actNewClass,,,vect(-719.843872,-450.627380,-2519.155029));
         actaPawn=Spawn(actNewClass,,,vect(472.973816,-265.875641,-2520.727295));
         actaPawn=Spawn(actNewClass,,,vect(12.153181,643.182922,-2520.891602));
         actaPawn=Spawn(actNewClass,,,vect(-1166.943726,3068.028320,-2504.025879));
        actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree4", class'Class' ) );
         actaPawn=Spawn(actNewClass,,,vect(-595.765808,1956.135010,-2520.842773));
         actaPawn=Spawn(actNewClass,,,vect(-3830.197021,4378.499512,-1237.926270));
         actaPawn=Spawn(actNewClass,,,vect(-4183.780273,-262.242401,-1232.453491));
         actaPawn=Spawn(actNewClass,,,vect(-1385.638184,-4004.550537,-1379.421387));
        actNewClass = class<actor>(  DynamicLoadObject("TobioTreesa.Tobiotree2", class'Class' ) );
         actaPawn=Spawn(actNewClass,,,vect(243.422485,-4076.906738,-1240.742676));
         actaPawn=Spawn(actNewClass,,,vect(992.734070,-3666.792725,-1970.906128));
         actaPawn=Spawn(actNewClass,,,vect(2890.159912,-4168.061035,-2005.374634));
         actaPawn=Spawn(actNewClass,,,vect(1336.425049,1133.443848,-1749.913696));



         Log("Found And Applied Changes To Nagomi PassageTHS");
      }






     // if(Level.Title =="Sacred Passage")               {    };
     // if(Level.Title =="Chizra-Nali Water God")        {    };
     // if(Level.Title =="The Ceremonial Chambers")      {    };



        if(Level.Title =="Monster Mania 03"  )
      {   // Monster Mania 03
                  // skip lastking , lastking1 and mp01 and nalipent.
                  // lastking is a puzle , lastking1 is small , mp01 is to east to get lost andnaluiipent is hard.

            if (act.isa('teleporter') )
             { //redirect this map to a new name , so the beta maps wont get screwed.    -Cross
               if ( teleporter(act).url =="lastking#playerstart?peer")
                {
                 teleporter(act).url="Tgsp1#";
                 log("Map end url(lastking#playerstart?peer) has been changed to Tgsp1");
                }

             }




          Log("Found And Applied Changes To Map :Monster Mania 03");
      }




       if(Level.Title =="FALaunch"  )
      {   // FALaunch


           foreach AllActors(class'actor', act)
                {
                   if (act.isa('monstercopier3') )
                   {
                    act.destroy();
                    //consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!");
                    Log("FALaunch - monster copier disabled");

                   }

                }

          Log("Found And Applied Changes To Map :FALaunch");
      }












      if(Level.Title =="ISV-KRAN Deck 4" )
      {   //ISV-KRAN Deck 4
          // need a fan drop  catcher  , if spawned into the faling vent.
           // location set     128 x 128 collision
           //templocation.X = -763.624573;   templocation.Y = -9032.699219;  templocation.Z = -1887.878296; actNewClass = class<actor>(  DynamicLoadObject("copyit.droppoint", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);


          Log("Found And Applied Changes To Map : ISV-KRAN Deck 4");
      }




      if(Level.Title =="Untitled" )
      {   // tcallin
          foreach AllActors(Class'teleporter', teepee)
          { // specific map check...
              if ( teepee.url =="temple1#playerstart?peer")
              {
                foreach AllActors(class'actor', act)
                {
                   if (act.isa('monstercopier3') )
                   {
                    act.destroy();
                    //consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!");
                    Log("Tcallin - monster copier disabled");
                   }

                }

                 // bridge catcher
                 templocation.X = 7195.171387;   templocation.Y = 6657.383789;  templocation.Z = 627.227356; actNewClass = class<actor>(  DynamicLoadObject("copyit.tcallfix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
                  consolecommand("set copyit.tcallfix collisionradius 600");
                 Log("Found And Applied Changes To Map : (tcalling)");

              }

           }


      }


      if(Level.Title =="The Skaarj Ship" && level.author =="EddX" )
      {   // temple3
          // lift catcher
           templocation.X = 35.035400;   templocation.Y = -803.764282;  templocation.Z = 489.100128; actNewClass = class<actor>(  DynamicLoadObject("copyit.droppoint", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
           consolecommand("set copyit.droppoint collisionradius 300");

          Log("Found And Applied Changes To Map : (temple3)");
      }


       if(Level.Title =="KonosusCoop"  )
      {   // temple3


           foreach AllActors(class'actor', act)
                {
                   if (act.isa('monstercopier3') )
                   {
                    act.destroy();
                    //consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!");
                    Log("KonosusCoop - monster copier disabled");

                   }

                }

          Log("Found And Applied Changes To Map :KonosusCoop");
      }



       if(Level.Title =="Jiganara kingdom"  )
      {   // temple3


           foreach AllActors(class'actor', act)
                {
                   if (act.isa('monstercopier3') )
                   {
                    act.destroy();
                   // consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!");
                    Log("Jiganara kingdom - monster copier disabled");

                   }

                }

          Log("Found And Applied Changes To Map : Jiganara kingdom");
      }


        if(Level.Title =="The Elder"  )
      {   // temple3

          foreach AllActors(Class'teleporter', teepee)
          { // specific map check...
              if ( teepee.url =="theHermit#hermit?peer")
              {
                foreach AllActors(class'actor', act)
                {
                   if (act.isa('monstercopier3') )
                   {
                    act.destroy();
                    //consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!");
                    Log("theelder2 - monster copier disabled");
                   }

                }




              }

           }

          Log("Found And Applied Changes To Map : the elder");
      }


      if(Level.Title =="The Thrall Village - Beyond the Great Canyon"  )
      {   // tThe Thrall Village - Beyond the Great Canyon
                foreach AllActors(class'actor', act)
                {
                   if (act.isa('monstercopier3') )
                   {
                    act.destroy();
                    //consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!");
                    Log("The Thrall Village - Beyond the Great Canyon - monster copier disabled");

                   }

                }
                Log("Found And Applied Changes To Map : The Thrall Village - Beyond the Great Canyon");
      }



      if(Level.Title =="Alien Level"   )
      {   // tThe Thrall Village - Beyond the Great Canyon
                foreach AllActors(class'actor', act)
                {
                   if (act.isa('Brouci') ) {  act.destroy();   }     // sry kami but you tiny bugs crash to much
                   //if (act.isa('monstercopier3') )  { act.destroy();  consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!"); Log("AAlien Level 1 - monster copier disabled");                   }
                }
                Log("Found And Applied Changes To Map : Alien Level");
      }


      if(Level.Title =="Aline Level 2"   )
      {   // tThe  Aline Level 2
                foreach AllActors(class'actor', act)
                {
                   if (act.isa('Brouci') ) {  act.destroy();   }     // sry kami but you tiny bugs crash to much
                   //if (act.isa('monstercopier3') )  { act.destroy();  consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!"); Log("AAlien Level 2 - monster copier disabled");                   }
                }
                Log("Found And Applied Changes To Map :  Aline Level 2");
      }


       if(Level.Title =="Alien Level 3"   )
      {   // tThe  Aline Level 2
                foreach AllActors(class'actor', act)
                {
                   if (act.isa('Brouci') ) {  act.destroy();   }     // sry kami but you tiny bugs crash to much
                   //if (act.isa('monstercopier3') )  { act.destroy();  consolecommand("Set Engine.Engine.GameReplicationInfo MOTDLine2 Spawning disabled for this map!"); Log("AAlien Level 3 - monster copier disabled");                   }
                }
                Log("Found And Applied Changes To Map :  Alien Level 3");
      }




      if(Level.Title =="Dark Arena")
      { // All fixes for  Dark Arena
       // Some extras for dark since there is not enogh monsters.
       // Titans ------------------------------------------------------
       templocation.X = -1887.313599;   templocation.Y = -1887.313599; templocation.Z = 164.098907; actNewClass = class<actor>( DynamicLoadObject("unreali.titan", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);       actaPawn.tag = 'copy';
       templocation.X = -4658.275391;   templocation.Y = -260.282562;  templocation.Z = 325.089294; actNewClass = class<actor>( DynamicLoadObject("unreali.titan", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);       actaPawn.tag = 'copy';
       // Ring Near Entry  -------------------------------------------
       templocation.X = -3821.880127;   templocation.Y = 6437.347656;  templocation.Z = 443.900238; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3657.978271;   templocation.Y = 6695.201660;  templocation.Z = 443.897125; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3833.697998;   templocation.Y = 6550.463867;  templocation.Z = 443.900757; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3771.602051;   templocation.Y = 6642.449707;  templocation.Z = 443.902588; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3672.028564;   templocation.Y = 6369.770508;  templocation.Z = 443.898407; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3484.668213;   templocation.Y = 6649.890625;  templocation.Z = 443.897156; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3486.239014;   templocation.Y = 6413.386230;  templocation.Z = 443.901306; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       // In Hall -----------------------------------------------------
       templocation.X = -3654.969971;   templocation.Y = 4962.799805;  templocation.Z = 192.460175; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3690.994141;   templocation.Y = 5257.879395;  templocation.Z = 189.700531; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -3645.979248;   templocation.Y = 5986.216309;  templocation.Z = 450.245728; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       // Entryway ----------------------------------------------------
       templocation.X = -5631.236328;   templocation.Y = 6189.647949;  templocation.Z = 1235.918213; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -5634.001465;   templocation.Y = 6845.747559;  templocation.Z = 1235.908936; actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       // Warlords ----------------------------------------------------
       templocation.X = -3241.154297;   templocation.Y = 2518.309082;  templocation.Z = 671.096558;  actNewClass = class<actor>( DynamicLoadObject("unreali.warlord", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);       actaPawn.tag = 'copy';
       templocation.X = -3950.878662;   templocation.Y = -2314.778320; templocation.Z = 665.101685;  actNewClass = class<actor>( DynamicLoadObject("unreali.warlord", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);       actaPawn.tag = 'copy';
       // Inside Builing  ---------------------------------------------
       templocation.X = -2380.708008;   templocation.Y = 279.541382;   templocation.Z = 539.899902;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -2415.882813;   templocation.Y = -241.934128;  templocation.Z = 539.897705;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -2380.638428;   templocation.Y = 29.517921;    templocation.Z = 539.902222;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       // Ring Around Titan ------------------------------------------
       templocation.X = -1104.897827;   templocation.Y = 414.213318;   templocation.Z = 411.900970;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -1181.083008;   templocation.Y = 10.662125;    templocation.Z = 411.898590;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -1084.330566;   templocation.Y = -409.858215;  templocation.Z = 411.901550;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -821.345581;    templocation.Y = -812.666016;  templocation.Z = 411.900726;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -438.407471;    templocation.Y = -1073.757324; templocation.Z = 411.902405;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = 486.240417;     templocation.Y = -1053.672729; templocation.Z = 411.900055;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = 782.195679;     templocation.Y = -852.451294;  templocation.Z = 411.899078;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = 1054.821777;    templocation.Y = -494.467529;  templocation.Z = 411.897461;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = 1072.042969;    templocation.Y = 424.366333;   templocation.Z = 411.903198;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = 838.687927;     templocation.Y = 789.196167;   templocation.Z = 411.899139;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = 464.388672;     templocation.Y = 1084.545288;  templocation.Z = 411.897034;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -459.375580;    templocation.Y = 1059.499146;  templocation.Z = 411.899933;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       templocation.X = -833.169800;    templocation.Y = 811.871094;   templocation.Z = 411.896515;  actNewClass = class<actor>( DynamicLoadObject("unreali.tentacle", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);

       Log("Found And Applied Changes To Map : darkareana");
      }






      if(Level.Title =="Noork's Elbow")
      { // All fixes for  Noork's Elbow

        // Titan
        templocation = vect(3529.411133,78.918312,-2739.622070);actNewClass = class<actor>( DynamicLoadObject("unreali.titan", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);  actaPawn.tag = 'copy';


       Log("Found And Applied Changes To Map : Noork's Elbow");
      }

      if(Level.Title =="Caverns of the Forgotten")
      { // All fixes for  Caverns of the Forgotten
        // need to prevent faling in there...
        // 2000 units teleporter
          templocation.X = 13164.648438;   templocation.Y = -925.738159;  templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
          templocation.X = 13258.129883;   templocation.Y = 152.068115;   templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
          templocation.X = 13162.609375;   templocation.Y = 1397.237427;  templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
          templocation.X = 12007.602539;   templocation.Y = 1576.289917;  templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
          templocation.X = 10997.591797;   templocation.Y = 1539.274048;  templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
          templocation.X = 10973.583984;   templocation.Y = 810.287598;   templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
          templocation.X = 10965.578125;   templocation.Y = -83.777405;   templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
          templocation.X = 11023.602539;   templocation.Y = -955.741821;  templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
          templocation.X = 13164.648438;   templocation.Y = -925.738159;  templocation.Z = -4150.964355; actNewClass = class<actor>(  DynamicLoadObject("copyit.hcl5fix", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);

          foreach AllActors(class'actor', act)
         {
             if (act.isa('blockmonsters'))
             {
              //dont let players fall into the hole.
              // replace later with telepoort  the radius is 2048 x 40
              act.bblockplayers = true;

             }

          }
          Log("Found And Applied Changes To Map : Caverns of the Forgotten");
      }

       if(Level.Title =="Aztec" && level.author =="Shane Caudle - converted by Leo")
       {   // All fixes for  Aztec by leo
             Log("Finding And Applied Changes To Map : Aztec");


             foreach AllActors(Class'teleporter', teepee)
          {// skip next  map it it lame and has no monsters
            if ( teepee.url =="FHub4#playerstart?peer")   {
            teepee.url="jpe-fhub4#";
            log("Map end url(FHub4#playerstart?peer) has been changed to jpe-fhub4");
            }

          }






        }





      if(Level.Title =="Aztec Canyon" && level.author =="Juan Pancho Eekels")
      {   // map needs more action...
         Log("Found And Applied Changes To Map : Aztec Canyon");
      }


      if(Level.Title =="Soledad temple" && level.author =="Clifford Michael Bleszinski")
      {   // All fixes for  Soledad temple

          foreach AllActors(Class'teleporter', teepee)
          {// skip next  map it it lame and has no monsters
            if ( teepee.url =="JW-Velora#bak2hubaroni?peer")   {
            teepee.url="DamnCastle#";
            log("Map end url has been changed to DamnCastle");
            }

          }

         Log("Found And Applied Changes To Map : Soledad temple");
      }



      if(Level.Title =="Edge of Na PaliTHS" )
      {
      // remove the THS Changes  at start
       foreach AllActors(class'actor', act){ if ( act.event == 'StartScout' || act.tag == 'StartScout') act.Destroy();}
      //fix stupid door bullshit.
       foreach AllActors(class'mover', mvr){if(mvr.tag == 'minedoor8') {mvr.tag='minedoor8nulled'; mvr.trigger(self,self.Instigator);};}
        Log("Found And Applied Changes To Map : Edge of Na PaliTHS");
      }


      if(Level.Title =="Gala's PeakTHS")
      { // All fixes for  Gala's PeakTHS

        // reset trigger
        //templocation.X = -4754.212891;   templocation.Y = -1206.190796; templocation.Z = -5310.645508; actNewClass = class<actor>( DynamicLoadObject("bobsmutz.gobackhome", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);

       Log("Found And Applied Changes To Map : Gala's PeakTHS");
      }

      if(Level.Title =="The Crash Site")
      {  // All fixes for  The Crash Site(crashed)

         // spawn some kleers
         // kleer
         actNewClass = class<actor>( DynamicLoadObject("MoreMod.Kleer", class'Class' ) );
         templocation.X = 68.739418;   templocation.Y = 2469.126709;  templocation.Z = 83.100128;
         actaPawn=Spawn(actNewClass,,,templocation);

         Log("Found And Applied Changes To Map : The Crash Site(crashed)");
      }


         if(Level.Title =="SniperValley")
        {
         foreach AllActors(class'actor', act)
         {
            // Monster management
            // i cant really decide wat is best here , but snippere with fast rifles are not helpful
            // the spinnere are easy and fun and may be the better otpion.
            if (act.isa('scriptedpawn') ) { act.tag = 'copy';} // dont let anything copy
            if (act.isa('spinner') )  { act.tag = 'lol'; }     // let spiders copy

            // Teleporter management
            if (act.isa('dispatcher') )
             {   // enable end even if spiders are not killed
              if (act.tag == 'messagedisp')  { act.destroy(); }
             }

            if (act.isa('teleporter') )
            { if ( teleporter(act).url =="skaarjpit3#playerstart?peer")   {
             teleporter(act).benabled=true;
             act.tag = 'ingnoredtheend';
             log("Map end url has been enabled early.  - skaarjpit3#playerstart?peer");
             }
            }



         }
          Log("Found And Applied Changes To Map : SniperValley");
        }

         if(Level.Title =="Strange World: Part6")
        { // All fixes for  Strange World: Part6
          // ya well i want to get creative with the meessages here
          // and make them locaton based
              foreach AllActors(class'actor', act)
           {
             if (act.isa('specialevent') )
              {
                if(act.tag == 'kr1')
                {
                  specialevent(act).message ="Crystal (Far House) Recovered";
                }
                if(act.tag == 'kr2')
                {
                  specialevent(act).message ="Crystal (Church) Recovered";
                }
                if(act.tag == 'kr3')
                {
                  specialevent(act).message ="Crystal (Gates) Recovered";
                }
                if(act.tag == 'kr4')
                {
                  specialevent(act).message ="Crystal (Outer Area) Recovered";
                }
                if(act.tag == 'framesorry')
                {
                  specialevent(act).message ="";
                }
              }

            }


          Log("Found And Applied Changes To Map : Strange World: Part6");
        }


      if(Level.Title =="Strange World: Part7")
        { // All fixes for  Strange World: Part7

          //Log("Found And Applied Changes To Map : Strange World: Part7");
        }


      if(Level.Title =="Skaarj pit" )
      {
         foreach AllActors(class'actor', act)
         {
             if (act.isa('deathhunter') )
              {
              act.tag = 'copy';
              }  // dont let deathunters copy

             if (act.isa('monsterspawner3') )
              {
              act.destroy();
              Log("TheWaterWorks - monster copier disabled");
              }  // on second thought dont let anything copy..


         }

         Log("Found And Applied Changes To Map : Skaarj pit");
      }



      if(Level.Title =="TheWaterWorks" )
      {
         foreach AllActors(class'actor', act)
         {
             if (act.isa('MTentacle') )
              {
              act.tag = 'copy';
              }  // dont let MTentacle copy


            if (act.isa('monstercopier3') )
              {
              act.destroy();
              Log("TheWaterWorks - monster copier disabled");
              }  // on second thought dont let anything copy..

         }

         Log("Found And Applied Changes To Map : TheWaterWorks");
      }



      if(Level.Title =="The Eldora WellTHS" )
      {

        foreach AllActors(Class'teleporter', teepee)
          { // specific map check...
            if ( teepee.url =="Glathriel1THS#EnterGlathriel1THS?peer")
            {
                foreach AllActors(class'mover', mvr)
                { // open this door automaticly without waiting.
                  if(mvr.tag == 'templedoors')
                  {
                   mvr.tag='templedoorsnulled';
                   mvr.trigger(self,self.Instigator);
                  };
                }

                Log("Found And Applied Changes To Map : The Eldora WellTHS(Glathriel1THS#EnterGlathriel1THS?peer)");
            }

          }

      }


       if(Level.Title =="The Eldora WellTHS" )
      {
          foreach AllActors(Class'teleporter', teepee)
          { // map check...
            if ( teepee.url =="CrashsiteTHS#EnterCrashsiteTHS?peer")   {

               //gathrea2 needs monster control.
            Log("Found And Applied Changes To Map : The Eldora WellTHS2");
            }

          }


      }



             if(Level.Title =="Sirius - Virtual Reality")
        { // All fixes for  Sirius - Virtual Reality

           foreach AllActors(class'actor', act)
           {
             if (act.isa('trigger') )
              {
                if(act.event == 'kecy3')
                {
                  trigger(act).bTriggerOnceOnly=true;
                }


              }
           }

          Log("Found And Applied Changes To Map : Sirius - Virtual Reality");
        }



           if(Level.Title =="Kralls Ship")
        { // All fixes for  Kralls Ship
           foreach AllActors(class'actor', act)
           {
             if (act.isa('specialevent') )
              {
                if(act.tag == 'Strepy3')
                {
                  specialevent(act).message ="The main drive Knocked";
                }
                if(act.tag == 'Strepy2')
                {
                  specialevent(act).message ="Shields removed";
                }
                if(act.tag == 'Strepy1')
                {
                  specialevent(act).message ="Hyperdrive Knocked";
                }
                if(act.tag == 'Strepy6')
                {
                  specialevent(act).message ="Navigation knocked";
                }
                if(act.tag == 'Strepy5')
                {
                  specialevent(act).message ="Parking brake";
                }
                if(act.tag == 'Strepy4')
                {
                  specialevent(act).message ="Weapons systems eliminated";
                }

              }

            }


          Log("Found And Applied Changes To Map : Kralls Ship");
        }





         if(Level.Title =="Shinigami - Sarevok" )
         {


                foreach AllActors(class'mover', mvr)
                { // open this door automaticly without waiting.
                  if(mvr.event == 'bum')
                  {
                   //mvr.tag='templedoorsnulled';
                   mvr.trigger(self,self.Instigator);
                  };
                }

                Log("Found And Applied Changes To Map : Shinigami - Sarevok");


          }


           if(Level.Title =="Exploited - Mean Streets")
        { // All fixes for  Exploited - Mean Streets
           foreach AllActors(class'actor', act)
           {
             if (act.isa('specialevent') )
              {
                if(act.tag == 'Kec4')
                {
                  specialevent(act).message ="Me: Good help. What should I do?";
                }
                if(act.tag == 'Kec3')
                {
                  specialevent(act).message ="Population: It is useful, just need your help.";
                }
                if(act.tag == 'Kec2')
                {
                  specialevent(act).message ="Me: I came from Madehitnu. I drove all odtamtad Krall.";
                }
                if(act.tag == 'Kec1')
                {
                  specialevent(act).message ="Population: Hello stranger! Where did you come?";
                }
                if(act.tag == 'Kec8')
                {
                  specialevent(act).message ="Population: Good luck.";
                }
                if(act.tag == 'Kec7')
                {
                  specialevent(act).message ="Population: go through the sewers and factories, putting the alliance.";
                }

                 if(act.tag == 'Kec6')
                {
                  specialevent(act).message ="Population: Krall want to connect with Skaarj.";
                }

                if(act.tag == 'Kec5')
                {
                  specialevent(act).message ="Population: Skaarj have a base nearby.";
                }

              }

            }


          Log("Found And Applied Changes To Map : Exploited - Mean Streets");
        }









   }












function Madehiten()
{
local trigger fixc;              // trigger actors array
local specialevent fixe;         // specialevent actor array
local translatorevent fixf;      // tranlator messages actor array
local trigger fixg;              // duplicate of trigger array?
local  sse seventp;              // spec event
local class<actor> actNewClass;  // dlc
local actor actaPawn;            // dlc
local teleporter teepee;         // teleporter
local mover mvr;                 // movers
local Sound TheSound,thesound2,thesound3;
local scriptedpawn scoot;

 // TheSound = Sound(DynamicLoadObject("ssdoorsounds.doorstonesmall",Class'Sound'));
 // thesound2 = Sound(DynamicLoadObject("ssdoorsounds.doorstone3s",Class'Sound'));
 // thesound3 = Sound(DynamicLoadObject("ssdoorsounds.switch06",Class'Sound'));



   if(Level.Title =="Kralls Ship")
     {       // All fixes for  s1 Kralls Ship

        if ( InStr(Caps(ConsoleCommand("get GameEngine ServerPackages")),"GIZMO.U") != -1 )
        {
         //actNewClass = class<actor>( DynamicLoadObject("gizmo.gizmo", class'Class' ) );
         // sustitue pupae.
        }


     }


     if(Level.Title =="Madehiten - Chiris Village")
     {       // All fixes for  2 Madehiten - Chiris Village
             // mostly copied from my original ryspatch scripts.
             // added here for testing

             // Add Brodcast Message
             templocation.X = 2680.061035;   templocation.Y = -352.276611;  templocation.Z = 264.099304;
             seventp=Spawn(Class'sse',,,templocation);  if (  seventp != None )
              {
                seventp.message="Key To Chirzed Temple Has Been Found";
                seventp.bBroadcast=true;
                seventp.tag='Key';
                seventp.sound=Sound(DynamicLoadObject("sskeysnd.key",Class'Sound'));
              }


           foreach AllActors(Class'specialevent', fixe)
           {
               if (  fixe != None )
               {
                   if (fixe.message == "O osm dní pozdeji.") fixe.message = "Eight Days Later.....";
               }
            }

           foreach AllActors(Class'translatorevent', fixf)
           {   if (  fixf != None )
             {

               //02village --------------------------------------------------------------------------------------------------------------
            	if (fixf.message == "Vítej cizince. Je to uz osm dní co si sem spadl v tom stroji.  Narozdíl od toho druhého jsi byl na tom dost spatne, doufám ze se uz brzo uzdravís. Pripravil jsem ti lektvar z lécivé plodiny nali.") fixf.message = "Welcome stranger. It's been eight days as he fell here in the machine. Unlike the other you've been on the pretty bad, I hope that he would soon uzdravís. I have prepared a potion of healing plants Nali.";
             	if (fixf.message == "My Log: Kde to jsem? Co se stalo? Bolí me celé telo. A kde sem se tu vlastne vzal? A kdo vlastne sem?") fixf.message = "My Log: Where am I? What happened? It hurts the whole body. And here is where I actually come from? And who owns here?";
              	if (fixf.message == "Tvuj spolecník byl v zadní cásti toho stroje. Byl na tom podstatne lépe nez ty. Uzdravil se uz po trech dnech. Hodne mluvil o Tauri. Ani se mu nedivím ze tam nechtel zít.") fixf.message = "Your partner was in the rear of the machine. Was in that much better than you. Had recovered after three days. Many spoke of the Tauri. Nor wonder where the wish to live.";
               	if (fixf.message == ("Tvuj spolecník mi obcas vyprável o tajemném kruhu a "$"jak byl na Tauri zneuzit k nekalým plánum. Já jsem mu ukázal knihu Tajemství"$" kruhu ve které je neco o tom kruhu napsáno. Vzal si ji a vecer si ji procítal."$" Rekl mi ze se pomocí toho kruhu chce dostat na planetu Exploited. Hned druhý den odesel hledat ten kruh.")) fixf.message = ("Your partner told me sometimes the mysterious ring "$"and how was Tauri abused for sinister plans. I showed"$" him the book Secrets of a circle which is something written about the circle. "$"He took her and her reading the night. He told me from using that circle the planet wants "$"to get exploited. The next day, went looking for the ring.");
               	if (fixf.message == "My Log: Pomalu si zacínám vzpomínat co se stalo. Cestoval sem na nejaké lodi, která byla necím prepadena. A pak si jeste pamatuju jak sem se zrítil na nejakou planetu. Jenom doufám ze zdejsí obyvaté budou prátelstí.") fixf.message = "My Log: We are slowly beginning to remember what happened. He traveled here on some ship that was attacked something. And then you still remember how it fell here on some planet. I just hope the local inhabit are friendly.";
               	if (fixf.message == "Vcera nás napadli Kralls. Nevíme odkud prisli a proc. Vetsina obyvatel vesnice odesla pred nebezpecím do nedalekého hradu. Prosíme te o tvou pomoc. Zjisti odkud prisli a pokus se je zastavit. Hodne stestí.") fixf.message = "Yesterday we were attacked Kralls. We do not know where they came from and why. Most residents left the village before the danger to the nearby castle. We pray for your help. Find out where they came from and try to stop them. Good luck.";
               	if (fixf.message == ("...bízil jsem se do tajemných hor na severu od Chiris Village."$" Vím ze je tam ten tajemný kruh."$" Staré symboly ríkají, ze lze kruh pouzít k cestování do jiných svetu."$" Az dorazím na místo pokusím se poodhalit tajemství kruhu.")) fixf.message = ("... bízil myself into the mysterious mountains"$" in the north of Chiris Village. I know that there's a mysterious circle."$" Old symbols say that the circle can be used to travel to other worlds."$" When we get to the place I will try to pierce the mystery of the circle.");
               	if (fixf.message == "My Log: Sakra. Jsou tu Krallové. Stovky let stará rasa. Zotrocují obyvatele planet pro vlastní pohodlí") fixf.message = "My Log: Damn. There Krallové. Hundreds of years old race. Enslaved people on the planet for their own convenience.";
               	if (fixf.message == ("Byli jsme se podívat do Chiriz Temple co stojí za vesnicí."$" Byli jsme tam asi hodinu."$" Kdyz uz jsme se chteli vrátit,"$" jeden z nás si vsiml cizince jak utíká k druhému východu."$" Moc jsme o tom nemluvili. Zajímal se jen Hadan.")) fixf.message = ("We look into Temple Chiriz what is behind the village."$" We were there about an hour."$" When we wanted to return, one of us saw a foreigner running away to the next exit."$" We did not talk about it. Interested only Hadano.");
               	if (fixf.message == "My Log: Tady je tak nádherný prostredí. Zádná planeta obývaná námi lidmi nemá tak cistý vzduch a neznicenou prírodu.") fixf.message = "My Log: Here is the beautiful environment. No planet inhabited by our people is not as clean air and destruction of nature.";
               	if (fixf.message == "My Log: Doufám ze v modulu najdu nejaké vybavení a zbrane. Nemúzu dopustit, aby byla dalsí planeta zotrocena Krally") fixf.message = "My Log: I hope that I can find some module equipment and weapons. We can not allow the enslavement of another planet Krall.";
               	if (fixf.message == ("4.August 2084 Konecne se Baltar briblízil k planete Exploited."$" Proto jsem si uz vlezl do nákladového prostoru modulu. Na chvíli jsem si jeste pospal."$" Asi po hodine me probudil alarm. Lod má asi problémy."$" V tom slysím jak nekdo nastupuje do modulu a odlétá i se mnou.")) fixf.message = ("4.August 2084 Finally, the Baltar briblízil the planet Exploited."$" Why I had climbed into the cargo compartment module. At the moment I jeste pospal."$" About an hour after the alarm woke me. Ship is about problems. Then I hear how someone got into the module and flies with me.");
	            if (fixf.message == "Tato hrobka je více jak 4000 let stará.") fixf.message = "The tomb is over 4,000 years old.";
                if (fixf.message == "Zde odpocívá Antiqus.") fixf.message = "Here rests Antiqus";
                if (fixf.message == "Buh Antiqus predpovídá, ze jednoho dne se snese z oblohy tajemný stroj s cizincem, který zachrání tuto planetu pred neprátely z jiného sveta.") fixf.message = "God Antiqus predicts that one day will bear the sky a mysterious machine with a stranger who saves the planet from the enemies from another world.";
                if (fixf.message == "My Log: Opravdu útulná vesnicka. Snad tu najdu nekterého ze zdejsích obyvatel.") fixf.message = "My Log: Really cozy village. Perhaps I can find one of the local population";
                if (fixf.message == ("My Log: Brána je celkem slusne uzavrená. Obávám se ze ale moc dlouho nevydrzí."$" Mel bych ty Krally vsechny postrílet vcas."$" Pokud bych dopustil aby se skrze tuhle bránu dostali dál, Madehiten by byl pak devastován Krally..")) fixf.message = ("My Log: Gateway's a lot closed. I am afraid of but do not last too long."$" Should I shoot all the Krall in time. If I committed to get through the gate this further, Madehiten was then devastated by Krall ..");
                if (fixf.message == ("Vedci v Nevade vykopali v hloubce 10m medený drát."$" Udelali rozbor púdy a odhladli stárí na 10000 let. Z toho usoudili ze v Americe byl uz pred 10000 lety zaveden telefon."$" To se dovedeli Rusové a zacali kopat na Sibiri."$" Kopali az do 30m a nasli NIC. Udelali rozbor púdy a odhadli stárí na 30000 let z toho usoudili ze v Rusku byl "$"uz pred 30000 lety zaveden bezdrátový telefon.")) fixf.message = ("Scientists in Nevada dug at a depth of 10 meters copper wire."$" They did an analysis of soil and odhladli old age at 10,000 years."$" It figured that America was already established before 10,000 years ago the phone."$" Russians learned it and started digging in Siberia. Kicked up to 30 meters and found NOTHING. They did an analysis of soil and old "$"age estimated at 30,000 years of which have concluded that Russia was already in place before 30,000 years ago, wireless phone.");
                if (fixf.message == "Vím ze Hadan dostal o tech lidí nejakou zbran. Urcite by nám mohla dost pomoct. Jenze nevím kam ji dal. Asi jí schoval nekde ve svém sklepe.") fixf.message = "I know from Hadano the tech people had a weapon. Certainly would give us enough to help. But I do not know where to put it. I think she has hidden somewhere in his cellar.";
                if (fixf.message == "Mozná byla chyba, ze jsme nepostavili nejaký hrad v tech horách. Nikdo skoro nepá páru co tam vlastne je. Mozná by to vedel Hadan. Ten hodne casto chodil do Chiris Temple.") fixf.message = "Maybe a mistake, we're not built a castle in the mountains. Nobody almost NEPA couple what they actually are. Maybe it knew Hadano. He very often went to Chiris Temple.";
                if (fixf.message == ("Vcera na nasi vesnici zaútocili Krall´s. Podarilo se uzavrít brány,"$" které oddelují vesnici Chiris od okolního sveta. Doufejme ze jim neprijdou posily,"$" jinak by prorazili brány a rozutekli by se po celém svete. Madehiten není na neco podobného pripraven.")) fixf.message = ("Yesterday in our village attacked Krall's. Managed to close the gates that separate the village from the surrounding Chiris world."$" Hopefully they will not come from the troops, otherwise penetrate the gates and ran it all over the world."$" Madehiten is not prepared for something similar.");
                if (fixf.message == "Hadan mi vyprável o tom co videl v horách. On dokonce ví odkud prisli ti lidi pred 13 roky.") fixf.message = "Hadano told me about what he saw in the mountains. He even knows where these people came before 13 years.";
                if (fixf.message == "Vzpomínám si jak vcera na nás zaútocili Kralls. Bylo to tak rychlé, ze jsme se témer nezmohli na zádnou obranu. Asi po púl hodine jsme radeji opustili vesnici a zamkli jsme oba vstupy do vesnice.") fixf.message = "I remember how yesterday attacked us Kralls. It was so fast that we almost failed to make any defense. After about half an hour we'd rather leave the village and we both locked entrances to the village.";
                if (fixf.message == ("My Log: Hele tady je ten detskej pokojík. Pripomíná mi to moje detské casy,"$" ale my jsme nemeli zádné drevené kostky, ale jenom vselijaké Hi-tech roboty a podobný blbosti."$" Bohuzel nemám cas si ted hrát a mel bych tu najít ten klíc od templu.")) fixf.message = ("My Log: Hey here is the detskej chamber. It reminds me of my children's times,"$" but we had no wooden cubes, just all sorts Hi-tech robots and similar stuff. "$"Unfortunately I do not have time to play now and I'd have to find the key to the Temple.");
                if (fixf.message == ("               OBSAH                Hozená súl na zlato:        Cervavá karkulka:  "$"        Heroinová chaloupka:               Drak 666ti hlavý:  "$"            Punkovláska:                      3Zlaté chlupy deda Vseveda: Hrnecku, spar UT2003!   "$"         Malý, hubený a slepý:                Zivá vodka:                  "$"                ")) fixf.message = "this was a silly recipe , i did not transate.";
                if (fixf.message == ("Zijeme tady na Madehitnu uz prez 400 let a jeste nikdy nás tu nikdo nenapadl."$" Jednou se mi zdálo o jenom svete kde panuje strasná nenávist a jak vytvorí nové rasy,"$" které zotrucují jiné planety pro prospech lidí. Zdá se ze moje nocní múra vyplnila.")) fixf.message = ("We live here on Madehitnu prez had 400 years and had never attacked us here no."$" Once I dreamed about just a terrible world where there is hatred, and how to create a new race,"$" which zotrucují another planet for the benefit of people. It seems that my nightmare filled");
                if (fixf.message == "Potom co jsme opustili vesnici se mi jeste podarilo zamknout ten vchod do toho templu, tím bychom mohli zízkat cas.") fixf.message = "After we left the village, I managed to lock jeste the entrance to the temple, thus we could Zizka time";
                if (fixf.message == "Cizince pokud mám pomúzes. Tak by si mel vedet ze jsem schoval klíc do detského pokoje v tom dome naproti hospode. Jeste neco co bys mel vedet. Ve sklepe mám schovanou zbran. Ta by ti mohla dost pomoct.") fixf.message = "Alien if I help. So he should know that I hid the key to a child's room in the house opposite the pub. Anything else what you should know. In the cellar I have hidden weapon. That would be enough to help you";
                if (fixf.message == ("Jestli Kralls dobudou Madehiten, bude to hodne spatné. Vsechny nás zotrocí pro své nekalé plány."$" Co je vsak horsí, ze by mohla být napadena i nase rodná planety NaPali."$" Uz pred 150 lety byla napadena. Mohl by nám pomoct ten cizinec co sem pred tejdnem spadl.")) fixf.message = ("If Kralls conquer Madehiten, it will be very bad. All of us zotrocí for his unfair plans."$" But what is worse, she might be attacked and our home planet napalm. "$"Even before 150 years ago was attacked. Could we help the stranger out here a week ago he fell.");
                if (fixf.message == ("My Log: Asi to vypadá ze jsem jediný kdo dokáze porazit Krally na Madehitnu."$" Takze se teda musím dostat do templu a najít cestu do tajemných hor."$" Jen by me zajímal ten Exploited a kdo sou to punkáci."$" Slysel jsem o nich ve starých zápiskách, ale nemúzu si furt vzpomenout.")) fixf.message = ("My Log: I think it looks like I'm the only one who can defeat the Madehitnu Krall."$" So there I mean I have to get to the temple and find a path to a mysterious mountain."$" It would interest me the Exploited and who sou to punk. "$"I've heard about them in the old zápiskách, but I can not remember furt.");
                if (fixf.message == ("Múj prítel, který zije sám v horách by mohl vedet jak se dostat na planetu Exploited."$" Ty punkáci me uz pred rokem varovali, ze se na jejich planete neco deje a nase "$"planeta bude po Exploitu dalsi na rade. Vypadá to ze byl Exploited obsazen.")) fixf.message = ("My friend, who lives alone in the mountains would know how to get to the planet Exploited."$" These punks me a year ago warned that their planet something happening and our planet will exploit the next."$" Looks like the Exploited occupied.");
                if (fixf.message == "Je jasné ze Kralls prisli z hor pres ten templ. Ale kde se tam najednou vzali. Nekterí z vesnice si myslí ze je tam jakási brána.") fixf.message = "It is clear from Kralls came from the mountains through the temple. But where there once married. Some of the village thinks there's a sort of gateway.";
                if (fixf.message == "My Log: Tahle brána je opravdu bytelná. Pochybuju ze se skze ní dostanou.") fixf.message = "My Log: This gate is very sturdy. I doubt that it will skze.";
                if (fixf.message == "My Log: Tady je ten vchod do toho Templu o, kterém se tu vsude mluví.") fixf.message = "My Log: Here is the entrance to the Temple on the left to go everywhere talking.";
                if (fixf.message == ("Doufám ze se brzo uzdravís, já uz jsem v pohode, doufám ze se nekdy uvidíme. Pamatuju si ze záchraný modul mel poruchu. Dopravní spolecnosti vetsinou nakupovali nejlevnejsí moduly. " $ "Byly naprosto sílene poruchové, az 80% modulú havalovalo. Kazdopádne mám stestí ze sem vubec prezil.")) fixf.message = (" hope to soon be well again, I'm okay already, I hope that someone will see. I remember the rescue of the malfunctioning module. " $ "Transportation companies typically buy cheapest modules. They were absolutely crazy nuisance, and 80% havalovalo module. In any event, here I am lucky that he survived at all.");
                if (fixf.message == (" Pred rokem nasi vesnici navstívil Paci. Hodne si povídal s Hadanem, o hrozbe na planete "$"Exploited. Pak nám tu trochu pomohl s prací. Docela unikátne mi ve sklepe srovnal bedny.")) fixf.message = ("A year ago, visited our village Paci. Talked with a lot of guessing about the threat to the planet "$"Exploited. Then we have a little help with the work. Quite unique in my cellar flattened boxes.");


               // 02village titles ---------------------------------------------------------------------------------------
	           	if (fixf.m_newmessage == "Zpráva od cizince") fixf.m_newmessage = "Message from the foreigner";
	           	if (fixf.m_transmessage == "Zpráva od cizince") fixf.m_transmessage = "Message from the foreigner";
	           	if (fixf.m_newmessage == "Zápisky") fixf.m_newmessage = "Scraps";
		        if (fixf.m_transmessage == "Zápisky") fixf.m_transmessage = "Scraps";
		        if (fixf.m_newmessage == "Kniha Tajemství kruhu") fixf.m_newmessage = "Secret Book Circle";
	        	if (fixf.m_transmessage == "Kniha Tajemství kruhu") fixf.m_transmessage = "Secret Book Circle";
	         	if (fixf.m_newmessage == "Deník") fixf.m_newmessage = "Diary";
	         	if (fixf.m_transmessage == "Deník") fixf.m_transmessage = "Diary";
		        if (fixf.m_newmessage == "Hrobka") fixf.m_newmessage = "Tomb";
	        	if (fixf.m_transmessage == "Hrobka") fixf.m_transmessage = "Tomb";
		        if (fixf.m_newmessage == "Kniha vtipú") fixf.m_newmessage = "Joke Book";
		        if (fixf.m_transmessage == "Kniha vtipú") fixf.m_transmessage = "Joke Book";
	         	if (fixf.m_newmessage == "Nápisy na sose") fixf.m_newmessage = "Inscriptions on statue";
		        if (fixf.m_transmessage == "Nápisy na sose") fixf.m_transmessage = "Inscriptions on statue";
		        if (fixf.message == "Pamatuju si jak nás pred lety párkrát navstívili obyvatelé z jiného sveta byly to celkem pohodoví lidi.") fixf.message = "I remember how we visited a few years ago people were from another world is quite laid back people.";
                if (fixf.m_newmessage == "Hadanovo zápisky") fixf.m_newmessage = "Hadanovo scraps";
             }

           }

           foreach AllActors(Class'trigger', fixg)
          { if (  fixg != None )
            {
            // 02village
            if (fixg.message == "Nasel jsi klíc od Chiris Temple") fixg.message = "You found the key to the Chirzed Temple";

            }
           }

       Log("Found And Applied Changes To Map : Madehiten - Chiris Village");
     }

     if(Level.Title =="Madehiten - Chirzed Temple")
     {       // All fixes for  Madehiten - Chirzed Temple

             // Add Brodcast Message
             templocation.X = 4692.308594;   templocation.Y = -1996.685303;  templocation.Z = -1371.900513;
             seventp=Spawn(Class'sse',,,templocation);  if (  seventp != None )
              {
                seventp.message="Blue triangle has been activated.";
                seventp.bBroadcast=true;      seventp.tag='Triangl1';
                seventp.sound=Sound(DynamicLoadObject("sskeysnd.key",Class'Sound'));
              }

             // Add Brodcast Message
             templocation.X = 1472.337769;   templocation.Y = -2246.437744;  templocation.Z = -1421.900513;
             seventp=Spawn(Class'sse',,,templocation);  if (  seventp != None )
              {
                seventp.message="The green arrow has been activated.";
                seventp.bBroadcast=true;    seventp.tag='Triangl3';
              }

             // Add Brodcast Message
             templocation.X = 3327.809570;   templocation.Y = -41.609703;  templocation.Z = -1367.900513;
             seventp=Spawn(Class'sse',,,templocation);  if (  seventp != None )
              {
                seventp.message="Red triangle has been activated.";
                seventp.bBroadcast=true;      seventp.tag='Triangl2';
                seventp.sound=Sound(DynamicLoadObject("sskeysnd.key",Class'Sound'));
              }

              // Add Brodcast Message
             templocation.X = 3327.809570;   templocation.Y = -41.609703;  templocation.Z = -1367.900513;
             seventp=Spawn(Class'sse',,,templocation);  if (  seventp != None )
              {
                seventp.message="Entrance to secret level has been opened. :=)";
                seventp.bBroadcast=true;     seventp.tag='SecretLevel';
                seventp.sound=Sound(DynamicLoadObject("sskeysnd.key",Class'Sound'));
              }

              foreach AllActors(Class'translatorevent', fixf)
              {   if (  fixf != None )
                      {
                        if (fixf.message == "My Log: Konecne jsem v templu. Ted bych mel najít cestu kudy se dostat do hor.") fixf.message = "My Log: Finally, I at the temple. Now I had to find a way to get directions to the mountains.";
                        if (fixf.message == "Podarilo se mi uzavrít mríze a zabránit tak postupu dalsích neprátel. Kdyz sem se vracel tak si na me jeden krall pockal ve stínu a prekvapil me. Doufám ze se mi podarí dostat se ven nez zemru.") fixf.message = "I managed to close bars and prevent progress of other enemies. When I went back to me so he waited a Krall in the shade and surprised me. I hope I can get out before he dies";
                        if (fixf.message == "My Log: Neco se mi na tady tý dekoraci nezdá. Mrknu se na to porádne.") fixf.message = " Log: Something to me there seems th decoration. I glance at it properly.";
                        if (fixf.message == "Kdysi dávno nám Paci poslal tady ty malé krabicky. Sou v nich takové stríbrné placicky ale nevíme kcemu jsou. Ríkal snad neco o kovu.") fixf.message = "Long ago we sent Paci here that little box. Sou a silver in them but we know pancakes kcemu are. He said perhaps something about metal.";
                        if (fixf.message == "Tento predmet jsem ukradl na planete Taros. Je to jakýsi stít který dokáze ucinit nositele nesmrtelným. Dokud se energie stítu nevyplácá.") fixf.message = "This course I stole the planet TAROS. It's kind of shield the wearer can make immortal. Until the energy shield does not pay.";
                        if (fixf.message == "My Log: Z tohoto prúchodu cítím zápach smrti. Nevypadá to tam zrovna prívetive. Kdo ví co tam v tech temnotách múze cekat.") fixf.message = "My Log: From this passage I feel smell of death. There just does not look friendly. Who knows what's in those dark can wait.";
                        if (fixf.message == "My Log: Tenhle trojúhelník bude nejaký magický zámek.") fixf.message = "triangle is a magical castle.";
                        if (fixf.message == "Budis posvecen bojovníku. Ale jeste pred tím nez otevres cestu do tajemných hor, ke kruhu bohú. Tak vez ze zlo je opravdu mocné tudís bud dobre pripraven.") fixf.message = "My Log: This Budis sanctified warriors. But before it before you open the way to the mysterious mountains, the circle of the gods. That tower is really powerful evil tudís either well prepared.";
                        if (fixf.message == "My Log: Z tohoto prúchodu cítím zápach smrti. Nevypadá to tam zrovna prívetive. Kdo ví co tam v tech temnotách múze cekat.") fixf.message = "My Log: From this passage I feel smell of death. There just does not look friendly. Who knows what's in those dark can wait.";
                        if (fixf.message == "My Log: Cítím tu temné síly. Pronikají zkrz kamenou podlahu na porvch. Slysím tu desivé zvuky. V katakombách je tma a zima. Mám z toho strach.") fixf.message = "My Log: I feel the dark forces. Penetrate zkrz stone floor on porvch. Hear the eerie sounds. The catacombs are dark and cold. It's terrible.";
                        if (fixf.message == "My Log: Za temito dvermy slysím desivé zvuky. Nemám ani tusení co tam na me múze cekat za hrúzy.") fixf.message = "My Log: for these door I hear scary noises. I have no idea what there for me can wait for the horrors.";
                        if (fixf.message == "My Log: Z této pekelné hrobky pronikají na tento svet temné síly. Nevím jakto zastavit. Radsi rychle zmizím nez me neco prokleje.") fixf.message = "My Log: This hellish tomb penetrate this world of dark forces. Why I do not stop. Rather than quickly disappear cursed me something.";
                        if (fixf.message == "My Log: Vím ze na Zemi existuje satanismus, který je prvým opakem krestanství. Tak tady je neco jako antinalismus. Asi to nebude zrovna neco dobrého.") fixf.message = "My Log: I know from the earth, there is Satanism, which is the first opposed Christianity. So here is something like antinalismus. Probably not just something good.";
                        if (fixf.message == ("Zdejsí obyvatelé kdysi vytvorily speciální zámek,"$" který má chránit tuto planetu pred neprátely z hor."$" Dost casto se stávalo ze z tamejsí veze vycházeli neprátele z jiných svetú."$" Povesti mluví neco o kruhu bohú. Tento magický zámek se dá aktivovat jen ze vnitr. A skládá se ze trí trojúhelníkú.")) fixf.message = ("The local residents had formed a special lock to protect the planet from the enemies of the mountains."$" Quite often happened that the towers were in a nearby enemies from other worlds."$" Rumors speak something about the circle of the gods. "$"This magical castle can be activated only from the interior. And consists of three triangles.");
                        if (fixf.message == "My Log: Tak jsem konecne za tema mrízema.") fixf.message = "My Log: Well, I finally tema mrízema.";
                        if (fixf.message == "My Log: Vypadá to tady jako nekjaká aréna. Mel bych si tu dát pozor.  Hele co to tam vpravo lezí. Podívám se tam.") fixf.message = "My Log: Looks like there nekjaká arena. Should I have listed. Look what lies right there. Look there.";
                        if (fixf.message == "My Log: Dvere nejdou otevrít. Musí tu být nekde tajné talcítko.") fixf.message = "My Log: The door will not open. There must be somewhere secret talcítko.";
                        if (fixf.message == "My Log: Tak jsem za dvermi. A ted by to melo být do hor uz jen kousek.") fixf.message = "My Log: Well, I followed through the door. Now should it be in the mountains were only a bit.";
                        if (fixf.message == "Krallové prisli asi z tajemných hor. Existuje spousta povestí o tajemném kruhu. Jediný kdo by to mohl vedet je poustevník co má domek v horách kousek za templem.") fixf.message = "Krallové probably came from the mysterious mountains. There are plenty of rumors about mysterious ring. Only one who would be able to know what is a hermit's house in the mountains near the temple.";
                        if (fixf.message == ("Zajali me pri útoku na vesnici a odvlekli sem."$" Ve vedlejsí cele je cizinec z jiného sveta. Obcas sme si povídali dírou mezi cihlami."$" Chtel nás varovat pred útokem Krallú. Ríkal mi taky ze jeho planeta uz jimi byla dobyta s pomocí jeste jiné rasy.")) fixf.message = ("Captured me during the attack on the village and brought here."$" In a nearby cell, an alien from another world. Sometimes we talked a hole between the bricks."$" Wanted to warn us before the attack Krall. He told me also that his planet had been conquered by them with problems in a race.");
                        if (fixf.message == "Nasi planetu dobyli Krals s pomocí Skaarj. A ted se chystají na planetu Madehiten. Vydal sem se s mojim kámosem bránou a varovat Madehiten. Me zajali, doufám ze muj kámos je stihne varovat vcas..") fixf.message = "Our planet took Krals with Skaarj. And now going to planet Madehiten. Published here with my buddy gate and warn Madehiten. Me captured, I hope my friend is befall warned in time ..";
                        if (fixf.message == "My Log: Vezení. Kdo ví koho sem Krallové zavreli. Ale mel bych se tu podívat po necem co otevre ty druhé dvere.") fixf.message = "My Log: Carrying. Who knows who here Krallové closed. But I should look for something that you open the second door.";
                        if (fixf.message == "My Log: Za tu dobu co sem byl v templu se venku docela rychle setmelo. Mel bych si pospísit v pátrání po tajemství hor.") fixf.message = "My Log: for the time what I was at the temple outside the dark quite quickly. Should I hurry in the search for the secret of the mountains.";
                        if (fixf.message == "My Log: Je tu chladneji, uz by jsem mel být blízko východu.") fixf.message = "My Log: It's cool, I had he would be close to the east.";
                        if (fixf.message == "Pamatuju si jak nás pred lety párkrát navstívili obyvatelé z jiného sveta byly to celkem pohodoví lidi.") fixf.message = "I remember how we visited a few years ago people were from another world is quite laid back people.";
                       }
              }

             foreach AllActors(Class'specialevent', fixe)
             {
               if (  fixe != None )
                {
                if (fixe.message == "Neco mi ríká ze bych si mel ulozit hru na nové pozici.") fixe.message = "Somebody Found the Secret End  D";
                if (fixe.message == "Sakra je to past.") fixe.message = "Damn it's a trap.";
                }
             }

             foreach AllActors(Class'trigger', fixg)
             { if (  fixg != None )
               {
                if (fixg.message == "Cervený trojúhelník aktivován.") fixg.message = "Red triangle activated.";
                if (fixg.message == "Zelený trojúhelník aktivován.")  fixg.message = "Green arrow is activated";
               }
             }

         Log("Found And Applied Changes To Map : Madehiten - Chirzed Temple");

     }

    if(Level.Title =="Madehiten - Mountains of Secret")
     {   // All fixes for  4 Madehiten - Mountains of Secret
           foreach AllActors(Class'specialevent', fixe)
           {
             if (  fixe != None )
              {
                if (fixe.message == "Jadjis: Vítej cizince. Hadan mi ríkal ze se stavís.") fixe.message = "Jadjis: Welcome stranger. Hadano told me that you are building";
                if (fixe.message == "Jadjis:  Jak uz jiste vís vcera nás prepadli Kralls.") fixe.message = "Jadjis: As you know yesterday assaulted Kralls.";
                if (fixe.message == "Jadjis:  Jeste stále pricházejí z Mystic Spire.") fixe.message = "Jadjis: still come from the Mystic Spire.";
                if (fixe.message == "Jadjis:  Musís se tam vydat a prostrílet si cestu ke StarGate.") fixe.message = "Jadjis: You must give a riddle where the path of the StarGate.";
                if (fixe.message == "Jadjis:  Tam potom na ovládacím panelu zadás tuhle adresu.") fixe.message = "Jadjis: There then control panel, the profiles of this address.";
                if (fixe.message == "Jadjis:  Tak se dostanes na planetu Exploited, kterou v soucasnosti okupují Kralls.") fixe.message = "Jadjis: So you get to the planet Exploited, which currently occupy Kralls";
                if (fixe.message == "Jadjis:  Pomoz obyvatelúm je porazit. A ted uz bez. Hodne stestí.") fixe.message = "Jadjis: Help residents to beat them. And now you go. Good luck.";
                if (fixe.message == "Já: Díky moc za informace. Udelám co bude v mých silách.") fixe.message = "Me: Thank you very much for the information. I'll do my best.";

              }
           }

           foreach AllActors(Class'translatorevent', fixf)
           { if (  fixf != None )
              {
                   if (fixf.message == "My Log: Tak jsem se konecne dostal do hor. Netusil sem ze se moje cesta omezí na úzké útesy. Budu muset chodit opatrne.") fixf.message = "My Log: Well, I finally got to the mountains. Did not know here is my way of limiting the narrow cliffs. I'll have to walk carefully.";
                   if (fixf.message == "Uz druhý den pricházejí Kralls od Mystic Spire. Jadjis, prítel Hadana by mel vedet odkud vlastne pricházejí.") fixf.message = "While the second day come from Mystic Kralls Spire. Jadjis, Hadano friend should know where does it come.";
                   if (fixf.message == "My Log: Ohínek. Hodí se. Potebuju se trochu ohrát, z toho chladného templu jsem celkem dost prochladlý.") fixf.message = "My Log: Ohínek. Fit. Potebuju a little warm from the cold temple I am quite cold enough.";
                   if (fixf.message == ("Tady v horách nás zije neco okolo 10."$" Stará Mystic Spire je uz desítky let opustena."$" Ale pred tremi dny sem si vsiml ze se tam svítí."$" O den pozdeji prisel ten útok."$" Dneska ráno tu byli dva lidé asi z planety Exploited,"$" kterí nás chteli varovat. Sel jsem tedy s nima do vesnice.")) fixf.message = ("Here in the mountains of our lives something about the 10th Old Mystic"$" Spire is abandoned for decades. But three days here noticed that there is lit."$" A day later came the attack. This morning there were two people from around the planet Exploited,"$" who wanted to warn us. So I went with them to the village.");
                   if (fixf.message == "My Log: Tam v pozadí je nejaký dalsí dúm. Snad tam bude prítel Hadana.") fixf.message = "My Log: There is some behind another house. Perhaps there will be a friend Hadano.";
                   if (fixf.message == "My Log: Je tu celkem útulne. Jeste se podívám do veldlejsí mistnosti jestli tam ten prítel Hadana je.") fixf.message = "My Log: There is a total of cozy. Still veldlejsí look into the room if there is one friend Hadano.";
                   if (fixf.message == "Vypadá to jakoby Kralls pripravovali okolí pro útok Skaarj. V soucasnosti mají tajnou základnu na planete Exploited. Kdo ví co se tam deje za nakalé plány.") fixf.message = "Looks like Kralls prepared for the attack near Skaarj. Currently have a secret base on the planet Exploited. Who knows what's going on in nakalé plans.";
                   if (fixf.message == "My Log: Jejda. To není zrovna moc príjemný pocit precházet mostek z prken a videt nekam do hlubin. Odhaduju to tak na kilometr. Nechtel bych tam spadnout.") fixf.message = "My Log: Oops. That's not a very pleasant feeling pacing bridge of planks and see somewhere in the depths. Guess so per kilometer. There would not fall.";
                   if (fixf.message == "My Log: Tak sem v nejakém sklepení. Vez urcite není daleko.") fixf.message = "My Log: Well, here in a basement. Vez definitely not far away.";
                   if (fixf.message == "Po dnesní ceste jsem docela unavenej. Chvilku si odpocinu. Jadjis mi vyprável o StarGate. Taky mi poradil jak se pouzívá a dal mi adresu planety Exploited.") fixf.message = "After Following the path  today I'm pretty tired. during a Moment rest,. Jadjis told me about the Stargate. He also advised me how to use  it and gave me the address of the planet Exploited.";
                   if (fixf.message == "My Log: Zase dalsí most. Vypadá stejne pevne jako ten první. ") fixf.message = "My Log: yet another bridge. Looks the same firm as the first.";

               }
            }

         Log("Found And Applied Changes To Map : Madehiten - Mountains of Secret");
     }


      if(Level.Title =="Madehiten - Mystic Spire")
     {       // All fixes for  5 Madehiten - Mystic Spire


           foreach AllActors(Class'translatorevent', fixf)
              { if (  fixf != None )               {
                     if (fixf.message == "My Log: Konecne sem se dostal do veze. Ted se tu musim porozhlédnout po prícine objevení Krallú. Ale asi to bude opravdu StarGate jak ríkal Jadjis.") fixf.message = "My Log: Finally got here to the tower. Now here I have to look after the discovery of the cause Krall. But I guess it will really what they called StarGate Jadjis.";
                     if (fixf.message == "My Log: Tahle chodba vede nekam do podzemí. Doufám ze tu nebudou pekelní démoni.") fixf.message = "My Log: This corridor leads somewhere underground. I hope there will be hell demons.";
                     if (fixf.message == "My Log: Konecne porádná knihovna. Snad tu najdu nejaké informace.") fixf.message = "My Log: Finally, a proper library. Perhaps you find some information.";
                     if (fixf.message == "Dneska jsme se dostali az do vesnice. Ale Nali krátce po útoku zamkli vchod do templu. Budeme hold muset pockat na pomoc nasich spojencú Brutes.") fixf.message = "Today we got up to the village. Nali But shortly after the attack sealed the entrance to the Temple. We'll have to wait on hold assist our allies Brutes.";
                     if (fixf.message == "Dosla k nám správa ze nekdo se snasí postrílet vsechny nase Krally. Vesnice Chiriz je opet v moci Nali. Asi se chce dostat na planetu Exploited. Ale k bráne se nedostane, hlídá ji 20 elitních Krallú.") fixf.message = "She went to our administration that sometimes tries to shoot all our Krall. Village Chiriz is again in power Nali. Probably wants to get to the planet Exploited. But to get to the gate, guarded by her 20 elite Krall.";
                     if (fixf.message == "Shades je takový zvlástní. Celé dny tráví ve své tajné skrýsi ve svém pokoji. Docela by me zajímalo co tam furt delá. Jenomze nemám páru kde se to vlastne otvírá.") fixf.message = "Shades such special. Spend whole days in his secret hiding place in his room. I wonder what he furt doing. But then I have a pair where it actually opens.";
                     if (fixf.message == "My Log: Tohle je ta skrytá Shaova dílna. Celou dobu tu maluje obrazy zvlástních lidí.") fixf.message = "My Log: This is the hidden Shaova workshop. All the time you painted pictures of special people.";
                     if (fixf.message == "My Log: Za tímto prúchodem je schodiste do dalsího patra. doufám ze se uz brzo dostanu k bráne.") fixf.message = "My Log: The following passage is a staircase to the next level. I hope that he will soon get to the gate.";
                     if (fixf.message == "My Log: Hele támhle je ta brána. Ale nedrív bych mel zjistit jak otevrít tuhle mríz.") fixf.message = "My Log: Hey there's the door. But the earliest opportunity I had to learn about how to open this gate.";
                     if (fixf.message == "My Log: Dalsí velká knihovna. Podívám se po dalsích informacích.") fixf.message = "My Log: Another big library. I look for further information.";
                     if (fixf.message == ("Tyhle zbrane jsme nasli v troskách domu poblíz brány."$" Asi je sem prinesli cizinci z jiných svetú. Odkud vlastne sou to nevíme. "$"Adresy planet si uz moc nepamatuju. A planety na kterých jsme byly nenesou zádné známky osídlení.")) fixf.message = ("These weapons we found in the ruins of the house near the gate."$" I guess they brought them here, foreigners from other worlds. Where does it sou do not know. "$"Addresses of the planet was too remember. A planet on which we were not affected by any signs of habitation.");
                     if (fixf.message == ("Mythorus:                           Velice pochmurný svet."$" Dríve byl plný vegetace. Dnes je uplne vyprahlý. Jediné co tam stojí je jakási tvrz"$" ve které je ukryto semínko zivota jez dokáze vrátit na mrtvé svety zivot. Pri nasí návsteve jsme zabily pár broukú"$". Provedli jsme z nima radu pokusú a zjisti ze sezerou naprosto vse na co prijdou a velice rychle se mnozí.")) fixf.message = ("Mythorus: Very gloomy world. Previously was full of vegetation."$" Today is completely arid. The only thing there is a kind of fortress in which the hidden seeds "$"of life which can return the dead to life worlds. During our visit, we killed some beetles. We have a series of experiments on "$"'em and find out from the eat absolutely everything about what would come very quickly and many others.");
                     if (fixf.message == "My Log: Tady to vypadá jako model planety Madehiten vcetne jeho 2 mesícú.") fixf.message = "My Log: Here it looks like a model of the planet Madehiten including his 2 months.";
                     if (fixf.message == "My Log: Vezní zahrada. To uz budu skoro nahore. Tam by mohlo být neco co otevre tu mríz dole.") fixf.message = "My Log: Vezna garden. I almost had it upstairs. There could be something that opens the gate below.";
                     if (fixf.message == "My Log: Sakra brána je hlídaná spousty Krallú. Cekal sem jich mín. Prímej útok bude asi sebevrazda. Skusím to tady z tech ruin.") fixf.message = "My Log: Hell gate is guarded by many Krall. Waited here for them mín. Get the attack will probably suicide. Skusim a tech here in ruins.";
                     if (fixf.message == "My Log: Cesta vede kamsi do hor. Vypadá to tam opustene. Uz je to asi hodne dlouho co tam nekdo byl.") fixf.message = "My Log: path leads off into the mountains. Looks like there abandoned. It's been around a long time as there ever was";
                     if (fixf.message == "My Log: Tak zadat adresu planety Exploited a múzu jít. Sem zvedav jak bude vypadat.") fixf.message = "My Log: Just enter the planet Exploited and I go. This curious how it will look like.";

                                                   }
              }

            foreach AllActors(Class'specialevent', fixe)
            {
             if (  fixe != None )      {
              if (fixe.message == "Nali: Hodne stestí.") fixe.message = "Nali: Good luck.";
              if (fixe.message == "Já: Díky za informace, bude to hodne tuhý boj.") fixe.message = "Me: Thanks for the information, it's very tough fight.";
              if (fixe.message == "Nali: Vyuzij trosek poblíz je tam jeste spousta munice. Hodne stestí.") fixe.message = "Nali: Use the wreckage near there is still a lot of ammunition. Good luck.";
              if (fixe.message == "Nali: Az pudes k bráne, dej si pozor. Hlídá ji asi 15 Krallú.") fixe.message = "Nali: Az pudes the gate, beware. Watched it about 15 Krall.";
              if (fixe.message == "Nali: Dostan se k bráne a zastav je.") fixe.message = "Nali: get to the gate and stop them.";
              if (fixe.message == "Nali: Kralls pricházejí z Exploitu a potom se sem chystá i rasa Brute a Kralls.") fixe.message = "Nali: Exploit Kralls come from here and then going to the race and Brute Kralls.";
              if (fixe.message == "Nali: Cizince musís nám pomoc.") fixe.message = "Nali: Foreigners you must help us.";
                                       }
            }


       // shortvut , skiop annoying lift
       templocation.X = 870.758789;   templocation.Y = 14.483004;  templocation.Z = -615.897339;
       actNewClass = class<actor>( DynamicLoadObject("JCoopZ1SSF.jzPlayerStart", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       actNewClass = class<actor>( DynamicLoadObject("xcoop.xPlayerStart", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);

        // All fixes for  19 Haros - Ice Morning
          foreach AllActors(Class'teleporter', teepee)
          {   // no wormworles!
           if ( teepee.url =="WormHole1#pod?peer")   {  teepee.url="06Streets#";}

          }


           // telport skip todo!

         Log("Found And Applied Changes To Map : Madehiten - Mountains of Secret");
     }






}

function Exploited()
{
local trigger fixc;              // trigger actors array
local specialevent fixe;         // specialevent actor array
local translatorevent fixf;      // tranlator messages actor array
local trigger fixg;              // duplicate of trigger array?
local  sse seventp;              // spec event
local class<actor> actNewClass;  // dlc
local actor actaPawn;            // dlc
local teleporter teepee;         // teleporter
local mover mvr;                 // movers
local Sound TheSound,thesound2,thesound3;
local scriptedpawn scoot;

  //TheSound = Sound(DynamicLoadObject("ssdoorsounds.doorstonesmall",Class'Sound'));
  //thesound2 = Sound(DynamicLoadObject("ssdoorsounds.doorstone3s",Class'Sound'));
  //thesound3 = Sound(DynamicLoadObject("ssdoorsounds.switch06",Class'Sound'));






     if(Level.Title =="Exploited - Mean Streets")
     {       // All fixes for  6 Exploited - Mean Streets

          foreach AllActors(Class'translatorevent', fixf)
              { if (  fixf != None )
                 {

                   if (fixf.message == "My Log: Uf. Tak to bylo úzasný ten prúchod bránou. Tak se podívám po okolí co me tu múze cekat. Hele zprava na me nekdo volá.") fixf.message = "My Log: Ugh. That was an amazing pass the gate. So I look around me here what to expect. Look to the right someone calls me.";
                   //if (fixf.message == "My Log: Je tu strasný vedro. Vypadá to ze tahle planeta je vulkanického púvodu. Ale je videt ze tu nekdo zije. Prostredí mesta je nápadne podobné se starými gangterkami z 20 století. Rozhodne si tu budu muset dát pozor, jak na místní obyvatele tak na Krally.") fixf.message = "My Log: It's awful hot. Looks like this planet is of volcanic origin. But you can see from someone living there. City environment is strikingly similar to the old gangterkami the 20 century. He decides that he'll have to watch how local communities and on Krall.";
                   if (fixf.message == "My Log: Hmm Tady se asi obcas nekdo nudí. Hází tu obrovské sutry na piramidu z barelú.") fixf.message = "My Log: Hmm here about someone sometimes boring. Throws the huge sutra from the Piramide barrel.";
                   if (fixf.message == "Kdyz byla planeta Exploited prepadena Krally, museli jsme zacít konecne porádne hlídat nase skladiste. Ale stejne se sem obcas nejaký z nich dostane a ukradne Taridium.") fixf.message = "When the planet was attacked Exploited Krall, we had to finally watch the Consultative our warehouse. Anyway here sometimes some of them get a steal Taridium.";
                   if (fixf.message == "My Log: Tady to je asi správcúva místnost. Hezky si tu drepel v pohodlném gauci. Jak jinak. Zeme, Marz, Exploited, vsude je to stejný. Mám uz ten klíc od domu a jeste najít náký vybavení a múzu vyrazit.") fixf.message = "My Log: Here it is probably room steward. Nice to have squatted in a comfortable couch. Course. Country, Marz, Exploited, everywhere is the same. I have had the key to the house and still find a muse got any equipment to go.";
                   if (fixf.message == "Uz s Krally bojujeme 8 mesícú, bohuzel to vypadá ze nás premuzou. Jeden muj kámos si u me schoval klíc od svého baráku.") fixf.message = "Krall had to fight 8 months, unfortunately it seems that we will overcome. One of my friend for me to hide the key from his house.";
                   if (fixf.message == "My Log: Na týhle planete je tech Krallú mnohem víc nez sem predpokládal. Pokracovat po ulici by bylo moc tezké. Skusím najít cestu stokama. Bude to mnohem bezpecnejsí.") fixf.message = "My Log: On this planet tech Krall is more than I supposed. continue along the street would be too hard. Skusim find a way stokama. Will be much safer.";
                   if (fixf.message == "My Log: Tedka jsem v nejakém dome. Nekde by tu mel být schovaný klíc od stok.") fixf.message = "My Log: now on I am in a house. Someone would have had to be hidden key to the sewers.";
                   if (fixf.message == "My Log: Mít prímo Bar ve sklepe je dobrej nápad. To se u nás na Zemi uz dávno nedelá.") fixf.message = "My Log: Being right in the cellar bar is a good idea. It is here on Earth had long since done.";
                   //if (fixf.message == "Skoro rok trvalo nez jsme dobili Exploited. Místní punkeri se bránili do poslední kapky krve. Ale ted uz je dobit a zaútocíme na Madehiten. Jsou tam ukrytá velká loziska Naqadahu. Obsadit Madehiten bude snadné jako vzít díteti bombon. Mají tam jen stredoveké zbrane.") fixf.message = "It took almost a year before we conquered Exploited. Local punks resisted to the last drop of blood. But now it is recharged and the attack on Madehiten. There are large deposits hidden Naqadahu. Casting Madehiten will be easy as grabbing a child amor. They have a medieval weapons.";
                   if (fixf.message == "Nedávno jsem zjistil ze se Kralls chtejí spolcit se Skaarj. Mel by to nekdo prekazit. Staci ze jsou Kralls spolceni s Besties.") fixf.message = "I recently discovered that Kralls want to gang up Skaarj. Mel would spoil someone. Staci they are Kralls conspiracy Besties.";
                   //if (fixf.message == "Nás gang prepadli Kralls a vetsinu z nás zajali. Chtel jsem jim pomoct, a proto jsem je sledoval. Odvlekli je az do Skaarjské základny. Je témer nemozné se tam dostat. Vchod hlídají Bestie a vojáci Skaarj. Nez jsem stacil neco vymyslet uz jsem videl lod Krallú jak odlítá pryc.") fixf.message = "Kralls gang attacked us and most of us captured. I wanted to help them, so I watched. Brought them up to Skaarjské base. It is almost impossible to get there. Entrance, and soldiers patrol the Beast Skaarj. Before I could think of anything I've seen the boat as Krall cast away.";
                   if (fixf.message == "My Log: Témer prázdný skladiste. Jsou tu jen docela zajímavé obrázky. A náká klec, nebo co to je.") fixf.message = "My Log: nearly empty warehouse. There was a fairly interesting pictures. And an old car, or whatever it is.";
                   if (fixf.message == "Spas svoji dusi. Nenech ji zatratit do hlubin pekelných. Vyvaruj se bezdúvodné nenávisti a lakoty nebo budes zatracen pekelným démonúm. Clenové aliance Mytologie proti démonúm: Azgardi, Noxové, Mythorové, God Spiriti, Soulmindi.") fixf.message = "Spas his soul. do not let her doom in the depths of hell. Avoid gratuitous hatred and greed, or you'll be damned infernal demons. Members of the alliance against demons Mythology: Azgardi, Noxové, Mythorové, God Spirit Soulmindi.";
                   if (fixf.message == "My Log: Mám zase takový divný pocit, jako by tu byly nekde temné síly. A cejtim to prímo z toho bytu nalevo.") fixf.message = "My Log: I have again such a strange feeling as if there were somewhere dark forces. And I feel it directly from the apartment to the left";
                   if (fixf.message == "My Log: Temné síly jsou i na Exploitu. Myslel jsem ze to bylo jenom v Templu na Madehitnu. Asi to bude globálnejsí.") fixf.message = "My Log: Dark Forces are to exploit. I thought it was only in the Temple at Madehitnu. Perhaps it will be global.";
                   if (fixf.message == "Z bytu vedle se pres noc ozývají hrozné zvuky. Nemam odvahu tam jít. Sousedi tvrdí ze tam prý strasí.") fixf.message = "From the apartment next to it overnight reverberating sounds terrible. I do not have the courage to go there. The neighbors claimed that there supposedly haunted.";
                   if (fixf.message == "My Log: Ze by zase zacali dávat dalsí sérii VyVolených nebo Superstar.") fixf.message = "My Log: From the back he gave another series of the elect or Superstar.";
                   if (fixf.message == "Konecne se me podarilo dostat na Exploited. Jenze byl dobit Krally a ted se chystají na Madehiten. Jeden punker me nechal u sebe bydlet. Kecali jsem spolu o StarGate. Vrátíme se spolu na Madehiten.") fixf.message = "Finally managed to get me to the Exploited. But Krall has been recharged and now plan to Madehiten. One Punker let me live with them. I lied with the StarGate. Returning along the Madehiten.";
                   if (fixf.message == "My Log: Tady bydlí asi nákej punker, na stole je spousta CD s punkovou muzikou.") fixf.message = "Konecne se me podarilo dostat na Exploited. Jenze byl dobit Krally a ted se chystají na Madehiten. Jeden punker me nechal u sebe bydlet. Kecali jsem spolu o StarGate. Vrátíme se spolu na Madehiten.";

                 }
              }

             foreach AllActors(Class'trigger', fixg)
             {  if (  fixg != None )
              {
               if (fixg.message == "Nasel si klíc od domu.")         { fixg.message = "You found the key to the house.";  }
               if (fixg.message == "Nasel si klíc od stok")          { fixg.message = "You found the key to the sewers";  }

              }
             }

                 // Add Brodcast Message
                 templocation.X = -1978.236328;   templocation.Y = 13798.298828;  templocation.Z = 1240.101440;
                 seventp=Spawn(Class'sse',,, templocation);  if (  seventp != None )
                 {
                   seventp.message="Key to the sewers has been found.";
                   seventp.bBroadcast=true;
                   seventp.tag='Locked2';
                 }
                 // Add Brodcast Message
                 templocation.X = 1142.094849;   templocation.Y = 12777.567383;  templocation.Z = 88.100822;
                 seventp=Spawn(Class'sse',,,fixg.location);
                 if (  seventp != None )
                 {
                   seventp.message="Key to the house has been found.";
                   seventp.bBroadcast=true;
                   seventp.tag='Locked1';
                 }

           Log("Found And Applied Changes To Map : Exploited - Mean Streets");

     }


     if(Level.Title =="Exploited - Sewers")
     {       // All fixes for  7 Exploited - Sewers

             foreach AllActors(Class'translatorevent', fixf)
              { if (  fixf != None )
                 {
                  //if (fixf.message == "My Log: Tedkon jsem ve stokách. Bude hodne obtízné najít Skaajrskou základnu. Navíc nevím ani kde je. Nezbyde mi nic nez jít jen tak za nosem a doufat, ze narazím na nejakou stopu. Torchu mám ze stok strach, protoze jak jsem zjistil pekelní démoni jsou i na Exploitu.") fixf.message = "My Log: Tedkon I'm in the sewers. Will be very difficult to find Skaajrskou base. Moreover, I do not even where it is. There would me nothing but go just follow your nose and hope that we encounter any track. Torch I am afraid of the sewers, because as I found hell demons are to exploit.";
                  if (fixf.message == "My Log: S to mrízí nic nezmuzu, skusim najít jinou cestu.") fixf.message = "My Log: With the grilles can do nothing, skusim find another way.";
                  if (fixf.message == "Nasi skrýs prepadli Kralls, me se podarilo jeste s jedním kámosem utýct. Ale Krallové nás pronásledovali a me zranili. Memuzu uz pokracovat dál, moje smrt se blízí.") fixf.message = "Our hideout attacked Kralls, me to have managed to escape with one buddy. But Krallové chased us and hurt me. Memuzu longer continue, my death is approaching.";
                  if (fixf.message == "My Log: Kde se tady vzala CAR Rifle. Vzdyt ji pouzívají u nás na Zemi Marináci a Ideopolicie.") fixf.message = "My Log: Where did you take CAR Rifle. Hell, use it here on Earth and Marines Ideopolicie.";
                  if (fixf.message == "My Log: Tady je úkryt nejakého gangu. Mozná tam najdu nejakou stopu.") fixf.message = "My Log: Here is hiding a gang. Maybe I would find some trace.";
                  if (fixf.message == "My Log: Je to úkryt nejakého punkového gangu. Doufám ze tu nekdo prezil. Jedine nekdo místní by mi mohl poradit kde presne ta základna je. Ten u Brány mi to jen tak nastínil.") fixf.message = "My Log: It is a refuge for some punk gang. I hope that someone survived. The only someone could give me local advice on where the base is. The gates for me just outlined.";
                  if (fixf.message == "Docházela nám munice, proto sme se vydali do továren. Tam sme nasli neco podivného. Stála tam velká základna hlídaná nejakou cizí rasou a ve vnitr byla videt spicka piramidy. Nekterí se domnívají ze tam pristávají cizí lode.") fixf.message = "Our ammunition was running out, so we went into the factories. There we found something strange. She stood there a large base guarded by a strange race and home affairs was to see spicka piramid. Some think there alien landing ships.";
                  if (fixf.message == ("Nase planeta je us skoro obsazená Krally."$" Musíme se pripravit na obranu nasi skrýse. Jeden z nás byl nedávno na prúzkumu neprátelské základny a zjistil ze Krallúm pomáhají Skaarj."$" Prevázejí zajatce ze základny na nejakou jinou planetu pro práci v Naqadahových dolech.")) fixf.message = ("Our planet is almost occupied us Krall. We must prepare to defend our hideout. One of us"$" recently to survey the enemy base and learned from Krallúm help Skaarj."$" Transporting prisoners from the base on some other planet for work in Naqadahových mines.");
                  if (fixf.message == "My Log: Bohuzel tu nikdo neprezil. Aspon tu zústala nejaká zbran. Vypadá to jako 4 hlavnová brokovnice. Bude se hodit.") fixf.message = "My Log: Unfortunately, there no survivors. At least there remained a weapon. Looks like a 4 barrel shotgun. It will be useful.";
                  if (fixf.message == "My Log: Mestské kanalizace jsou prílis rozsáhlé. Múzu tu taky bloudit trebas celej den a stejne nic nenajdu.") fixf.message = "My Log: City sewer is too extensive. May I also wander all day and maybe not find anything as well.";
                  if (fixf.message == "My Log: Cesta tudy se mi taky moc nezdá.") fixf.message = "My Log: Drive way too much, I think so.";
                  if (fixf.message == "My Log: Vsimul jsem si na zdi hlubokých prasklin. Zdá se, ze tam neco je.") fixf.message = "My Log: Vsimul I have deep cracks on the wall. It seems that there is something.";
                  if (fixf.message == "My Log: Neco mi ríká ze tudy cesta nevede.") fixf.message = "My Log: Something tells me he does not drive that way.";
                  if (fixf.message == "My Log: Staré trosky. Asi to tady drív vypadalo úplne jinak.") fixf.message = "My Log: Old ruins. I guess this place sooner looked completely different.";
                  if (fixf.message == "My Log: Starý chrám. Pravdepodobne centrum drívejsího mesta.") fixf.message = "My Log: Old Temple. Probably the former city center.";
                  if (fixf.message == "1) V dávných dobách byla tato planeta bohatá na zivot. Rostlo tu spoustu stromú a kerú zilo tu velké mnozství zvere. V roce 1438 prisli na tuto planetu Nali. Protoze byla tato planeta dobrá k zivotu, postavili tu spoustu mestecek a vesnic.") fixf.message = "1) In ancient times, this planet was rich in life. There grew a lot of trees and shrubs there lived a large amount of game. In 1438 came to this planet Nali. Because this planet is good for life, have built many towns and villages.";
                  if (fixf.message == "2) V roce 1502 tu objevili velká loziska Taridia, které se tenkrát pouzívalo k pohonu nebeských galeon. Tato planeta se pak pojmenovala Taros.") fixf.message = "2) In 1502 there appeared a large deposit Taridia, which then used it to drive heavenly galeon. The planet is named the TAROS.";
                  if (fixf.message == "3) Nali tu zili dlouhá léta v klidu a míru. V roce 1786 na Taros dopadl meteor, který tu znicil vse zivé od tá doby je tato planeta pokryta skálamy a lávovymi poli. Nali nastestí vcas opustili Taros.") fixf.message = "3) Nali lived many years in peace. In 1786 a meteor fell on TAROS, who had destroyed all the souls of the Nth time this planet is covered skálamy and lava fields. Nali fortunately TAROS left on time.";
                  //if (fixf.message == "4) V roce 2019 objevili Taros Tauriici. Vyslali sem pruzkumnou sondu a nalezli tu jeste hodne Taridia. V té dobe se pouzívalo prevázne pro válecné úcely. V roce 2025 tu Tauriici postavili první mesto. A zacali s tezbou. Bylo tu postaveno hodne rafinérií na zpracování Tariia. Vozilo se sem taridium z okolních planet.") fixf.message = "4) In 2019 appeared TAROS Tauriici. Probes sent here, and found that a lot Taridia. At that time it was used mainly for military purposes. In 2025, the Tauriici built the first city. And they started with the extraction. There were a lot built refineries for processing Tariia. Taridium drove here from nearby planets.";
                  if (fixf.message == "5) V roce 2056 uz na Tarosu pracovalo 500000 Tauriicú. V té dobe tu zacal vládnout krutý totalitní rezim, který postupne nabýval na síle. Pracovalo se tu denne 16 hodin. Bylo tu zakázáno snad vsechno co de zakázat.") fixf.message = "5) In the year 2056 had worked on TAROS 500,000 Tauriicú. At that time there ruled a cruel totalitarian regime, which is gradually growing in strength. Worked here 16 hours a day. There were probably banned everything de prohibited.";
                  // bad , qoutes in qoutes...
                  //if (fixf.message == ("6) V roce 2058 byl uz hodne rozsíren nový prvek "Naqadah" tezba Taridia upadala v celém vesmíru."$" A zacali se zde zavírat továrny. V roce 2061 byl Taros vybrán pro zpracování Naqadahu a zacala tu "$"prestavba starých továren.  Utlacovaní obyvatelé se v roce 2081 vzbourili a vyhnali odsud vsechny totalitní vládce."$" Taurici si postavili nové továrny na zpracování Naqadahu na planete Sirius.")) fixf.message = ("6 In 2058 a lot was already extended with a new element Naqadah"$" extraction Taridia declined throughout the universe. And there began to close the factory."$" In the year 2061 was selected for processing TAROS Naqadahu and began the reconstruction of old factories."$" Oppressed inhabitants revolted in 2081 and drove away all the totalitarian rulers. Taurica had built a new factory Naqadahu the planet Sirius.");
                  if (fixf.message == "7) Od té doby na Tarosu zacala panovat anarchie a planeta byla prejmenována na Exploited podle staré punkové kapely. Od té doby je tu celkove relatiní klid.") fixf.message = "7) Since then, she TAROS reign of anarchy and the planet was renamed the old Exploited punk band. Since then, there Overall relatiní quiet.";


                 }
              }


                 foreach AllActors(class'mover', mvr)
                { // open this door automaticly without waiting.
                  if(mvr.event == 'Bum')
                  {
                   //mvr.tag='templedoorsnulled';
                   mvr.trigger(self,self.Instigator);
                  };
                }


             Log("Found And Applied Changes To Map : Exploited - Sewers");
     }

     if(Level.Title =="Exploited - Stell Town")
     {       // All fixes for 8 Exploited - Stell Town
             foreach AllActors(Class'translatorevent', fixf)
              {   if (  fixf != None )
                 {
                    if (fixf.message == "My Log: Uspesne jsem se dostal na povrch. Ale nevím v jaké ctvrti mesta se zrovna nacházím. Trochu se porozhlédnu po tý základne.") fixf.message = "My Log: I have successfully reached the surface. But I do not know what neighborhood center is just find. Little look around after that base.";
                    if (fixf.message == "My Log: Vchod je zablokanej. Asi se tam nekdo opevnil. Zkusim se tam nejak dostat.") fixf.message = "My Log: The entrance is zablokanej. Perhaps there is someone fortified. I'll try to get there somehow.";
                    if (fixf.message == "My Log: Ocelárna. To je urcite prúmyslová ctrvrt. Urcite to nebude daleko.") fixf.message = "My Log: Steel Plant. It is certain industrial ctrvrt. Certainly will not be far.";
                    if (fixf.message == "Sesel jsem se tu z jedním punkácem. A ten mi ríkal neco ze by se tahle planeta mohla stát tercem útoku Skaarj.") fixf.message = "I met one of the punks. And he told me something would be this planet could become a target of attack Skaarj.";
                    if (fixf.message == "My Log: Dvere jsou zabarikádované bednama. Tak tudy to taky nepujde.") fixf.message = "My Log: barricading the door bednama. That's way too impossible.";
                    if (fixf.message == "Zase nám tu nekdo ukrad Taridium. Za poslední rok je to asi 1320 krádezí. Od doby co tu postavili tu základnu sou tu jen problémy.") fixf.message = "Again we have someone stole Taridium. Over the last year, it's about theft in 1320. Since what we have built a base sou's only problems.";
                    if (fixf.message == "Madehiten:                       Hornatá planeta plná vegetace, jiz 400 let je obývaná Nali. Nali zde zijí v míru. Velice si vásí této planety. Udajne na Madehitnu jsou velká loziska Naqadahu.") fixf.message = "Madehiten: mountainous planet full of vegetation, already 400 years occupied Nali. Nali lived there in peace. Very appreciate your this planet. Alleged to Madehitnu are large deposits Naqadahu.";
                    if (fixf.message == "My Log: Zdá se ze ani tady nikdo neprezil. Nezbývá mi doufat ze se mi podárí nekoho najít tam dál.") fixf.message = "My Log: It seems that not even here no survivors. I can only hope that I can find someone there on.";
                    if (fixf.message == "My Log: Asi nejaké fotogalerie místních obyvatel. Tak me napadá, jak sem si procítal ty knízky. Tam psali, ze punk kdysi byl na Zemi. Dneska by je vláda netolerovala. Zrejme tam byli punkáci dávno pred válkou.") fixf.message = "My Log: Probably some photos of local people. I wonder how you here reading the most books. There have written that punk once was on Earth. Today the government would tolerate. Apparently there were punk long before the war.";
                    if (fixf.message == "To taridium musí krást bud Kralls a nebo Skaarj. V nasem svete se navzájem neokrádáme, nemame proc. Pred pár lety se nám tu podarilo vytvorit celkem slusný systém vlády lidu.") fixf.message = "To taridium must either steal Kralls or Skaarj. In our world neokrádáme each other, they have no reason. A few years ago, we have managed to create quite a good system of government of the people.";
                    if (fixf.message == "My Log: Jak sem si tedka vsiml. Tahle továrna byla neco jako obraná linie. A od tud vede dál jenom jediná cesta.") fixf.message = "My Log: As I have noticed now on. This factory was something like defensive line. And keep away from tud only one way.";
                    if (fixf.message == "Nasi spioni se vcera proplízili do základny. Zjistili opravdu nepríjemné informace. Sídlí tam rasa která si ríká Skaarj. Aby toho nebylo málo chystá se spolcit s Kraaly a Brute. Chystají se nás zotrocit pro práci v Naqadahových dolech.") fixf.message = "Our spies have crept into the base yesterday. Found very unpleasant information. Seat race there who says Skaarj. To make matters worse is going to conspire with the Kraal and Brutus. They're going to enslave us to work in Naqadahových mines.";
                    if (fixf.message == "Zajímavé ze sem ty neprátelské rasy prisly krátce po vyhnání svetovlády. Mám takovej pocit jestli to nevytvorili Tau'riici.") fixf.message = "Interesting for me the enemy race came just after the expulsion of world domination. I have a feeling like that if it did not create Tau'riici.";
                    if (fixf.message == "My Log: Tuhle cást mesta zabarikádovali z obou stran. Zavreli dvere a vchody zabarikádovali bednama. Ale Zdá se ze nekde ta barikáda to nevydrzela.") fixf.message = "My Log: this part of the city barricaded from both sides. Closed the door and barricaded entrances bednama. But It seems that sometimes the barricade could not stand it.";
                    if (fixf.message == "My Log: Poslední útociste. To musel být ale boj. Bohuzel nikdo neprezil. Je to jenom na me.") fixf.message = "My Log: The last refuge. But it must have been a fight. Unfortunately, no one survived. It's just for me.";
                    if (fixf.message == "My Log: To je asi sklad obrazú. Já o punku skoro nic nevím. Práve ze jsem se narodil za války, která mnohé znicila, nevím prakticky nic o ideích, image punku.]") fixf.message = "My Log: This is probably the store image. I'm a punk I know almost nothing. Just that I was born during the war, which destroyed many, I know virtually nothing about ideích, punk image.";
                    if (fixf.message == "15.Februar 2084                    Po dlouhé dobe jsme byly na návsteve Madehitnu. Bohuzel jsme zjistili ze nám nebudou moci pomoct mají jen pár stredovekých zbraní a to este na okrasu. Nali sou mirumilovný národ, podobne jako Noxové.") fixf.message = "15.Februar 2084 after a long time, we were on a visit Madehitnu. Unfortunately, we found that we can not help having a few medieval weapons and ornaments from the este. Nali sou peaceful nation, much as Noxové.";
                    if (fixf.message == "Jeden punker mi ríkal ze se sem pred tejdnem zrítila náká lod. Jmenovala se myslím Baltar. V posledních lodních záznamech nasel záznam o modulu který se zrítil na Madehiten. Tam jsme kdysi dávno byly a sprátelili se s místními obyvateli.") fixf.message = "Punker One told me that collapsed here a week ago an old boat. Her name, I think Baltar. The last record found the ship's log of the module which fell upon Madehiten. There have been a long time ago and made friends with local residents.";
                    if (fixf.message == "My Log: Hmmmm. Tak tady byl urcite Paci :-) . Jinak to nevidím.") fixf.message = "My Log: Hmmmm. So there was definitely Paci :-). Otherwise I do not see it.";
                    if (fixf.message == "Osobne bych ted svolal vsechny punkery a sel tu základnu srovnat se zemí. Ale je nás uz málo tak by jsme zbytecne prohlráli. Nezbývá nic nez cekat na zázrak. Punk's not dead.") fixf.message = "Now I personally called all the punks and went to the base level to the ground. But we are already so low, we should too prohlráli. Have no choice but to wait for a miracle. Punk's not dead.";
                    if (fixf.message == "Snazil jsem se zjistit obranu základny, ale jeden z Brute me vázne zranil. Kdyby se tam nekdy nekdo chtel vydat, tak at dá na ne pozor je jich tam asi 5.") fixf.message = "I tried to find the base defense, but the one Brutus me seriously wounded. if there ever someone wanted to give and give at the not sure there is about 5";
                    if (fixf.message == "My Log: Zajímavá kombinace architektur. Ale proc zrovna piramida uprostred mesta. Ze by na tom pristávali vesmírné lode jako v seriálu StarGate. Ale nebudu tu cekat az to zjistím.") fixf.message = "My Log: An interesting combination of architecture. But why Piramida middle of town. From the landing on the space ships like Stargate. But I have to wait and find out.";
                    //if (fixf.message == "Krallové zatím prevází vezne z Exploitu na Haros. Potom je rozdelíme na práci v dolech na Madehitnu a Siriusu. Pri ceste se nám ztratilo nekolik lodí v blízkosti Madehitnu. Tamejsí obyvatelé by nedokázali zajmout nase lode. Musí tam být neco horsího.") fixf.message = "Krallové far outweigh the prisoner to Exploit Haros. Then we divide the work in the mines Madehitnu and Sirius. When traveling to and we lost several ships in the vicinity Madehitnu. A nearby population would have been able to capture our ships. There must be something worse.";
                    if (fixf.message == "Mise na Madehiten probíhá podle plánu. Zítra bysme meli prolomit obranu a zbytek by mel být obsazen do týdne.") fixf.message = "Mission Madehiten on track. Tomorrow we should break through the defense and the rest should be cast in the week.";
                    if (fixf.message == "Nedávno sem spadla Tau'riská lod. Hned jsme zacali z prúzkumem lodi a vse bylo prevezeno do laboratorí k analíze.") fixf.message = "Recently here fell Tau'riská boat. Soon we started the survey ship and everything was transported to the laboratory for analysis.";
                    if (fixf.message == "V pocitaci je informace o domovké planete Krallú. Jmenuje se Haros, ale adresu jsem tu nenasel.") fixf.message = "The computer is about domovké planet Krall. His name is Haros, but the address I had none.";
                    if (fixf.message == "Tady je rozehranej UNREAL 3. Ale je to nejak zaseklý. CTR + ALT + delete ... a nic. RESET taky ne. Nic nefunguje. Úder kladivem by mohl pomoct.") fixf.message = "Here is rozehranej UNREAL 3rd But it somehow stuck. CTR + ALT + delete ... and nothing. RESET neither. Nothing works. Blow with a hammer might help.";
                    if (fixf.message == "Probíhá spoustení Windows Astalavista.......           ERROR Chybí soubor... Následuje hodne dlouhý výcet chybejících souború. No tak zase nic.") fixf.message = "Ongoing Windows startup Astalavista ....... ERROR Missing file ... Followed by a long list of lots of missing files. Come back nothing.";
                    if (fixf.message == "Helemese tady je plná verze hry UNREAL-STARGATE. Tak si to tu hesky vypálím. Program Nero. A zacal sem pálit a najednou na me vyskocilo okno: Katastrofální selhání. KURVA a zurive mlátím do klávesnice.") fixf.message = "Helemese here is the full version of the game Unreal-STARGATE. So it's hesky burn. Nero. And I started firing at me and suddenly jumped out the window: Catastrophic failure. FUCK furiously mlátím the keyboard.";
                    if (fixf.message == "Probíhá formátování....... Zbývá 245 dní 15 hodin 21 minut.   No tak to hned tak nebude.") fixf.message = "Formatting ....... Remains 245 days 15 hours 21 minutes. So it just would not.";
                    if (fixf.message == "My Log: Ta základna mi prijde strasne malá. Tady musí neco tajit v tý piramide. Byla to nejchránenejsí cást základny.") fixf.message = "My Log: The base I find horrible little. There must be something to keep in th Piramide. Was a part nejchránenejsí base.";
                 }

              }

             Log("Found And Applied Changes To Map : 8 Exploited - Stell Town");

     }

      if(Level.Title =="Exploited - Underground Skaarj Base")
     {       // All fixes for 9 Exploited - Underground Skaarj Base
          foreach AllActors(Class'specialevent', fixe)
          { if (  fixe != None )
                 {

           if (fixe.message == "Otevrít depo. ... OK") fixe.message = "Open depot. ... Ok";
           if (fixe.message == "Otevrít laboratore. ... PRÍSTP ODMÝTNUT") fixe.message = "Open laboratory. ... APPROACHES ODMÝTNUT";
           if (fixe.message == "Probíhá formátování: 0% ... 1% ...") fixe.message = "Formatting: 0% ... 1% ...";
           if (fixe.message == "Narusena bezbecnost laboratore. Spusteno odpocítávání autodestrukce celé základny. Celá posádka musí okamzite evakuovat.") fixe.message = "Impaired GOES laboratory. Running the entire base self-destruct countdown. The entire crew must immediately evacuate.";
                 }
          }

          foreach AllActors(Class'translatorevent', fixf)
              { if (  fixf != None )
                 {

               if (fixf.message == "My Log: Tak tohle tady tak tajili. Skaarjská základna schovaná v podzemí. Tak ted jim to tu zavarím.") fixf.message = "My Log: I do here so concealed. Skaarjská base hidden in the underground. So now they have to zavarím.";
               if (fixf.message == "Výzkum novejsí verze Skaarj pokracuje dle plánu. Sériová výroba bude zapocata na Exploitu zhruba za 13 dní.") fixf.message = "Research on newer versions Skaarj continues according to plan. Serial production will be started to exploit roughly 13 days.";
               if (fixf.message == "My Log: Vezení. Zustalo tu jen nekolik mrtvých tel. Zbytek byl uz odvezen.") fixf.message = "My Log: Carrying. There remained only a few dead phone rest were already taken.";
               if (fixf.message == "Nasel sem tu nejaké info o Skaarjské královne. Je nekde ve starym dungeonu za soutezkou, asi 2,5 km od laboratorí. Je to jenom nejaká podradná hlavní je uplne nekde jinde. Tak to musim znicit, byla by to dost velká ztráta pro Skaarj.") fixf.message = "There I found some info on Skaarjské queen. It is somewhere in the old dungeon soutezkou, about 2.5 km from the laboratory. It's just a low-end home is somewhere else. Then we must destroy, it would be a big enough loss for Skaarj.";
               if (fixf.message == "Výzkum pokracuje kupodivu bez problému. A pokud se neco neposere, tak bychom mohli zaútocit na Sirius za 21 dnú. Mercenary okupují tamejsi naquadahové doly.") fixf.message = "Surprisingly, research continues without any problem. And if something neposere, so we could attack on Sirius for 21 days. Mercenary naquadahové occupy a nearby mines.";
               if (fixf.message == "Geneticky upravení Skaarj: Jsou zatím hotový 3 prototypy. Mají +25% odolnost, +15% Damage a +10% rychlosti.") fixf.message = "Genetically modified Skaarj: They are not yet finished 3 prototypes. They have 25% resistance, +15% Damage and +10% speed.";
               if (fixf.message == "Helemese tady je nejaký info o dvou dalsích planetách a dokonce jejich adresy. Haros: domovská planeta Kralls. Sirius: Vulkanická planeta s obrovskými lozisky naquadahu. Je osídlena Mercenary, nepráteli Skaarj.") fixf.message = "Helemese Here's some info on two other planets and even their addresses. Haros: homeworld Kralls. Sirius: volcanic planet with huge deposits naquadahu. It is inhabited Mercenary, Skaarj enemies.";
               //if (fixf.message == "Info o Exploitu: planeta témer dobita az na pár míst. Pak je tu neco o punkácích, který Skaarj a Kralls odvezli nekam do vezení. Pak budou poziti jako otroci na Siriusu pro tezbu naquadahu.") fixf.message = "Info Exploit: planet almost recharged from a few places. Then there's something about punk that Skaarj and Kralls drove off into the jail. Then they positivity as slaves on Sirius mining naquadahu.";
               if (fixf.message == "Dalsí hromada dat o Exploitu. O úspesném dobití atd.") fixf.message = "Next meeting data exploit. About successful recharge, etc.";
               if (fixf.message == "Je tu spoustu informací o nových prototypech Skaarj. O chystanym útoku na Sirius. A o pohrome v laborkách s Pupae.") fixf.message = "There's a lot of information on new prototypes Skaarj. The upcoming attack on Sirius. And the disaster in laborkách with Pupa.";
               //if (fixf.message == "Nejcerstvejsí zprávy: 1)Madehiten byl ztracen, kvuli tomu jsme prisli o rok práce. 2)Cast Exploitu byla ztracena taky. Místní punkáci se vzbourili a úspesne ziskávají zpet celou planetu. Za to múzou Krallové ze nehlídali vúbec bránu. 3)Prestiz Krallú klesla o 30%. A prestiz Skaarj klesla o 20%.") fixf.message = "Latest news: 1) Madehiten was lost because of that, we came a year of work. 2) Cast Exploit been lost too. Local punks rebelled and successfully recovered the entire planet. for a muse Krallové of nehlídali no gate. 3) The prestige Krall decreased by 30%. A prestige Skaarj decreased by 20%.";
               //if (fixf.message == "Vsecko to zacalo kdyz nedaleko od Punkerazcity ztroskotala lod Baltar. Hned jsme se ji vydali prozkoumat. Nalezli jsme tam bezcenný pozemský haraburdí a nekolik tech zatracených Pupae. Vzali jsme je do laborek na prozkoumání. Potrebujeme zjistit jak se proti nim bránit uz nám znicili desitky lodí.") fixf.message = "Everything started when a nearby ship failed Punkerazcity Baltar. Immediately we went to explore it. We found there worthless junk and several mundane damned Pupa. We took them to laborek to explore. We need to find out how to defend against them, we had destroyed dozens of ships";
               if (fixf.message == "My Log: Tohle je hlavní pocitac. Mely by tu bejt vsechny informace o základne vcetne jejího ovládání.") fixf.message = "My Log: This is the main computer. They should have all the information about Beth base, including its control";
               if (fixf.message == "My Log: Tady je náký vedro. Nefunguje tu osvetlení.") fixf.message = "My Log: There's got any heat. The lighting is not working";
               if (fixf.message == "My Log: Tohle je humus. Pupae si tu udelali hnízdo. Radsi to co nejrychleji probehnu.") fixf.message = "My Log: This is humus. Pupa they have made a nest. Rather as quickly as possible takes place.";
               if (fixf.message == "My Log: Tak tady je to depo. Odtud se dodávají zásoby pro Skaarj a Kralls na celém Exploitu. Snad tu nekde najdu ovládání prístupu do laborek.") fixf.message = "My Log: Tohle je humus. Pupae si tu udelali hnízdo. Radsi to co nejrychleji probehnu.";
               if (fixf.message == "My Log: Slysím tu zvuky pekelných démonú. Ted mám opravdu strach co na me múze cekat tam dál.") fixf.message = "My Log: I can hear the sounds of hell demon. Now I am really worried what to expect me there next.";
                   }
              }

             Log("Found And Applied Changes To Map : 9 Exploited - Underground Skaarj Base");

     }

     if(Level.Title =="Exploited - Way of the Salvation")
     {       // All fixes for 10  Exploited - Way of the Salvation


             foreach AllActors(Class'trigger', fixg)
              { if (  fixg != None )   {

                  // disable earthquake.
                  if (fixg.name == 'trigger1')
                   { if (fixg.event == 'rach' ) fixg.event = 'rach_disabledbyhotfix'; }

                   // possible pre activate shortcut
                   //if (fixg.event == 'telelelol')
                   // { if (fixg.event == 'rach' ) fixg.event = 'rach_disabledbyhotfix'; }


                }
              }



          foreach AllActors(Class'teleporter', teepee)
          {
           if ( teepee.url =="Wormhole2#pod?peer")   {  teepee.url="11Village#";}

          }





             foreach AllActors(Class'specialevent', fixe)
             {
                if (  fixe != None )
                 {
              if (fixe.message == "Obyvatel: Díky zes nám pomohl proti Kralls a Skaarj.") fixe.message = "Population: The amp has helped us against Kralls and Skaarj.";
              if (fixe.message == "Já: To nic nebylo. Sejmul sem jim královnu.") fixe.message = "Me: It was nothing. Here they removed his queen.";
              if (fixe.message == "Obyvatel: Coze oni tu meli nákou královnu.") fixe.message = "Population: What they should have Nako queen.";
              if (fixe.message == "Já: Me to taky prekvapilo dovedel jsem se to az v základne.") fixe.message = "I: Me, too surprised I learned it from the base.";
              if (fixe.message == "Obyvatel: Hlavne ze je mrtvá. A kam ted pujdes?") fixe.message = "Population: mainly from the dead. And where do you go now?";
              if (fixe.message == "Já: Pudu na Haros. Domovská planeta Krallú.") fixe.message = "I: Pudu on Haros. Homeworld Krall.";
              if (fixe.message == "Obyvatel: Dobrá my uz ty zbytky co tu zbyly dostaneme. Takze hodne stestí. Cus.") fixe.message = "Population: Well we had the remnants of what we get left behind. So good luck. Cus.";
              if (fixe.message == "Já: Tady máte adresu Madehitnu, zajdete obcas za Nali. Tak zatim.")  fixe.message = "Me: Here is your address Madehitnu, sometimes we go for the Nali. So long.";
                }
              }


          foreach AllActors(Class'translatorevent', fixf)
              { if (  fixf != None )
                 {
                if (fixf.message == "My Log: Starý podzemní dungeon. Asi z dob kdy tu zili Nali. Snad se tu dozvím víc.") fixf.message = "My Log: The old underground dungeon. Around the time when there lived Nali. Perhaps you know more.";
                if (fixf.message == ("Taros cekaji zlé casy. Kolem 18 století"$" se cekají pády meteoritu, které znicí zdejsí zivot. Ve 21 století bude"$" obsazen Tau'riici. Pozdeji bude prepaden neprátelskou rasou. Ke konci 21 století se sem vrátí Nali a opet se tu obnoví zivot.")) fixf.message = ("TAROS await bad times. Around the 18th century meteorite falls are expected "$"to destroy life here. In the 21st century will be occupied Tau'riici. Will later be attacked by an enemy race. At the end of the 21st century is coming back again and Nali here restores life.");
                if (fixf.message == "My Log: Tahle chodba vypadá nejak dúlezite. Z techto dverí sem jde chlad. Dofám ze za ty léta tu nedoslo k nejakému závalu.") fixf.message = "My Log: This looks like some important corridor. From this door here is cold. Dofám from over the years have not been any collapse.";
                if (fixf.message == "My Log: Podzemní prístav. Touhle lodí se ted vydám dále. Voda tu je, takze soutezka bude volná. Snad se dostanu ke královne.") fixf.message = "My Log: Underground harbor. This ship from now I get on. Hopefully It leads to the queen.";
                if (fixf.message == "My Log: Arkády a aqvadukty, tahle souteska byla kdysi urcite na povrchu. Ale jak sem dopadaly ty asteroidy tak se to tu hodne zmenilo.") fixf.message = "My Log: Arcade and aqvadukty, this gorge was once definitely on the surface. But  the asteroids rained here so this place has changed a lot.";
                if (fixf.message == "My Log: Pripadám si jako kdybych nebyl na planete znicenou asteroidem. Tahle soutezka porád zije.") fixf.message = "My Log: I feel like I was the planet destroyed asteroid. This soutezka always alive.";
                if (fixf.message == "My Log: Hlavní chrám. Královna Skaarjú bude blízko. Tuto planetu ceká velký den osvobození.") fixf.message = "My Log: The main temple. Queen Skaarjú will close. This planet waiting for the big day of liberation.";
                if (fixf.message == "My Log: Tak to by bylo. Královna Skaarj je mrtvá. Dny Skaarj na této planete jsou secteny a aliance mezi Skaarj a Kralls je definitivne prekazená.") fixf.message = "My Log: So this is it. Skaarj Queen is dead. Days of Skaarj on this planet are numbered, and the alliance between Skaarj and Kralls is finally foiled.";
                if (fixf.message == "My Log: Ted se jen dostat k bráne. Snad mi na povrchu nekdo poradí.") fixf.message = "My Log: Now just to get to the gate. Perhaps someone on the surface of my order.";
                if (fixf.message == "My Log: Takze mám adresy dalsích dvou planet. Haros a Sirius. Na Siriu jsou Mercenary, vím jenom ze válcí se Skaarj. Nebude moudré tam chodit Skaarjové jsou jeste dost silní takhle se aspon oslabí obe strany.") fixf.message = "My Log: So, I address two additional planets. Haros and Sirius. Mercenary is on Sirius, I know only from war Skaarj. There will not be wise to go Skaarjové are still strong enough to at least a way to weaken both sides.";
                if (fixf.message == "My Log: Haros je domovská planeta Krallú. Kdybych je tam zneskodnil tak by utrpeli tezkou ztrátu. A potom by byli velice snadnou koristí pro ostatní rasy a postupne by uplne zanikli. Skaarj a Mercenary ted nákou dobu nebudou predstavovat hrozbu.") fixf.message = "My Log: Haros Krall's home planet. If I were there to intercept it suffered heavy losses. And then it would be very easy prey for other races, and gradually it will cease completely. Skaarj a Mercenary for now Nako not pose a threat.";
                if (fixf.message == "My Log: Helemese tohle je ten sklad u brány. Paráda. Aspon nebudu muset celej den bloudit po Exploitu.") fixf.message = "My Log: Helemese this is the warehouse at the gate. Wow. At least I do not have to wander all day exploit.";
                if (fixf.message == "My Log: Zadat adresu Harosu a muzu vyrazit. Jsem zvedavej jak bude ta planeta vypadat. Doufám ze nebude tak horká jak Exploited, uz mi to horko zacíná dost vadit.") fixf.message = "My Log: Enter the address Harosu and men go. I wonder how the planet look like. I hope not as hot as the Exploited, I had the heat begins to matter a lot.";
                  }
              }

             Log("Found And Applied Changes To Map : 10  Exploited - Way of the Salvation");
     }



}




function Haros()
{
local trigger fixc;              // trigger actors array
local specialevent fixe;         // specialevent actor array
local translatorevent fixf;      // tranlator messages actor array
local trigger fixg;              // duplicate of trigger array?
local  sse seventp;              // spec event
local class<actor> actNewClass;  // dlc
local actor actaPawn;            // dlc
local teleporter teepee;         // teleporter
local mover mvr;                 // movers
local Sound TheSound,thesound2,thesound3;
local scriptedpawn scoot;

 // TheSound = Sound(DynamicLoadObject("ssdoorsounds.doorstonesmall",Class'Sound'));
 // thesound2 = Sound(DynamicLoadObject("ssdoorsounds.doorstone3s",Class'Sound'));
 // thesound3 = Sound(DynamicLoadObject("ssdoorsounds.switch06",Class'Sound'));




     if(Level.Title =="Haros - Isthia Village")
     {       // All fixes for  11 Haros - Isthia Village

                 // Add Brodcast Message
                 templocation.X = 1181.727295;   templocation.Y = -540.701172;  templocation.Z = 56.099983;
                 seventp=Spawn(Class'sse',,,fixg.location);  if (  seventp != None )
                 {
                   seventp.message="Second Key to the church has been found.";
                   seventp.bBroadcast=true;
                   seventp.tag='Key2';
                 }

                 // Add Brodcast Message
                 templocation.X = -1924.417725;   templocation.Y = -1411.496460;  templocation.Z = 48.100319;
                 seventp=Spawn(Class'sse',,,fixg.location);  if (  seventp != None )
                 {
                   seventp.message="Fisrt Key to the church has been found.";
                   seventp.bBroadcast=true;
                   seventp.tag='Key1';
                 }

                // in future add counter.


              foreach AllActors(Class'translatorevent', fixf)
             { if (  fixf != None )
               {
               if (fixf.message == "My Log: Tak tohle je planeta Haros. Domovská planeta Kralls, opet nikdo nehlídal bránu. Vypadá to tu opravdu nádherne, vegetace, vesnicka, v okolí se tycí veké hory pokrytý ledem. Je tu dost zima. Podívám se do tý venicky. ") fixf.message = "My Log: So this is planet Haros. Homeworld Kralls, again no nehlídal gate. Looks like you had a wonderful, vegetation, village, near the poles Veke mountains covered with ice. There is plenty cold. I'll look into that venicky.";
               if (fixf.message == ("Potom co byla predpovezena invaze Krallu na Madehiten, se nekterí z nás vydali na Exploited "$"za úcelem sjednotit se s tamnejsimi lidmi a zlikvidovat Krally. Podarilo se nám dobýt vesnici tady na Harosu, ale ne nadlouho Krallové brzo poté zútocili, "$"nastestí se nekterým z nás podarilo ukrýt v kostele a zamknout obe vrata.")) fixf.message = ("After the invasion was predicted to Madehiten Krall, some of us went to the Exploited "$"purpose to unite the people and destroy tamnejsimi Krall. We managed to conquer a village here on Harosu, but not for long Krallové "$"soon after zútocili, Fortunately, some of us managed to hide in a church and lock both doors.");
               if (fixf.message == ("PACI - Paci má velmi zajímavý dar: z neceho co je naprosto správne a srozumitelné udelá neco co"$" by nepochopil ani skusený psycholog. Pojmy typu teroristor, srotkyho dygjoda, ouperacní zeslabovac nebo"$" zesmesnovac se jeho poznámky jen hemzí. Styl jeho chúze se podobá alienovy z jedné hry. A je to príznivec metalu.")) fixf.message = ("PACI - Paci has a very interesting offering of something that is absolutely correct "$"and understandable he does something you would not understand skusený psychologist. The terms type teroristor, srotkyho dygjoda, "$"ouperacní attenuator or zesmesnovac his remarks abound. The style of his walk resembles alienovy one game. And it is a metal fan.");
               if (fixf.message == "Podarilo se mi zamknout kostel a klíc sem hodil do jednoho domu. Nevim jestli to pomuze. Jsou tu stovky Krallu. Schoval sem se na pudu.") fixf.message = "I managed to lock the church here and the key thrown into one house. I do not know if it helps. There are hundreds Krall. Hid here in the land.";
               if (fixf.message == "Stráze zase nehlídali bránu a pronikli sem lidi z Exploitu. Ti se pak tady opevnili a bylo dost tezký to dobít zpet.") fixf.message = "Guard again nehlídali gate and went here for the people of exploit. They then fortified and there were heavy enough to recharge back";
               if (fixf.message == "Budeme brzo asi potrebovat pomoc nasich jediných spojencú Brute. Obývají planetu Pharao ale nemúzeme je kontaktovat protoze knihovna kde byla uchována adresa vyhorela a nikdo si jí nepamatuje.") fixf.message = "We will soon need some assistance to our allies single Brute. Pharao inhabit the planet but we can not contact them because the library where it was stored address burned down and no one remembers it.";
               if (fixf.message == "Situace se poslední dobou znacne zhorsila. Nepovedlo se obsadit Madehiten dokonce jsme ztratily Exploited a dúlezité spojenectví se Skaarj je navzdy ztraceno. Zústala nám jen nase domovská planeta Haros") fixf.message = "The situation has recently deteriorated considerably. Could not fill Madehiten we even lost Exploited and important alliance with Skaarj is forever lost. We stayed only our home planet Haros";
               if (fixf.message == "Pise se tu o hlavním meste Machellopolis, je odsud vzdáleno asi 10kM. Pak je tu zmínka o obrovkých katakombách pod celým Machellopolisem systém chodeb, který vede i do okolních vesic a staveb.") fixf.message = "It says the main city Machellopolis is situated about 10km away. Then there is mention of obrovkých catacombs beneath Machellopolisem entire system of tunnels leading into the surrounding vesic and buildings.";
               if (fixf.message == "My Log: Doufám ze nekdo z lidí co tu byli prezil.") fixf.message = "My Log: I hope that someone from the people we were here survived.";
               if (fixf.message == "Bohuzel vetsinu z nás pobili a nás pár kterí prezili jsou uvezneni tady v kostele, alespon jsme tady nasli Flakcannon. Sid ríká ze tu obevil nejaký tajný východ. Doufám ze se dostaneme do bezpecí.") fixf.message = "Unfortunately, most of us, and we defeated a few survivors who are trapped here in the church, at least here we found the Flakcannon. Sid says he's obevil a secret exit. I hope we get to safety.";
               if (fixf.message == "My Log: Tak nikde nikdo, skusím obevit ten tajný vchod. Tam snad mohl nekdo prezít.") fixf.message = "My Log: Well, nobody ever, skusim obevit that secret entrance. There maybe someone could survive.";
               if (fixf.message == "My Log: Vzpomínám si ze v kostelech byl vetsinou nejaký tajný vchod. Pokud tady nákej je tak to bude jedine tady.") fixf.message = "My Log: I remember that the church was mostly a secret entrance. if there got a so shall handle it here.";
               }
             }

              foreach AllActors(Class'trigger', fixg)
              { if (  fixg != None )   {
              if (fixg.message == "Nasel si 1 klíc od kostela") fixg.message = "He found the key to the church 1";
              if (fixg.message == "si 2. klíc od kostela") fixg.message = "He found the 2nd key to the church";
               }
              }

               Log("Found And Applied Changes To Map : 11 Haros - Isthia Village");

     }


     if(Level.Title =="Haros - Cold Passage")
     {       // All fixes for 12 Haros - Cold Passage




         foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
           if (fixf.message == ("Uz tretí den jsme tady na Harosu. Nastestí jsme se schovali sem, "$"nevíme jestli tu jeste prezijme, dochází nám jídlo. V knihách tady je spousta zmínek o obrovské síti katakomb. "$" V noci mívám desné pocity. V tech katakombách musí být neco desivého.")) fixf.message = ("The third day, we here at Harosu. Fortunately, we hid here, we do not know if there's survive, "$"there is our food. In the books there are many references to the vast network of catacombs. At night they become Desna feelings. In these catacombs to be something terrible. ");
           if (fixf.message == "My Log: Otevrel sem vchod do katakomb. Je tu cítit zatuchlina a chlad. Podle toho co sem zatím cetl, jsou katakomby strasne rozsáhlé. Kdo ví kam vsude vedou a co se v nich vlastne skrývá za hrúzy.") fixf.message = "My Log: He opened the entrance to the catacombs here. It is a smell of stale and cold. According to what I read so far, are large catacombs horrible. Who knows where to lead everywhere, and what they actually hiding behind the terror. ";
           if (fixf.message == "My Log: Co to je za prísery. S tímhle druhem pekelných démonú jsem se jeste nesetkal.") fixf.message = "My Log: What kind of monster. With this kind of hell demon I have not seen. ";
           if (fixf.message == "My Log: Schody do podzemí, podle toho co sem tu potkal se mi moc nechce dolu do temných katakomb. Nemám tusení co na me dole ceká.") fixf.message = "My Log: Stairs to the ground, according to what I have met I really want mine in dark catacombs. I have no idea what awaits me down. ";
           if (fixf.message == "My Log: Vypadá to na nejakej královskej sargofág, ale radsi ho nebudu otvírat. Mohl bych se necím nakazit.") fixf.message = "My Log: Looks like some kind královskej sargofág, but rather it will not open. I could be something infected. ";
           if (fixf.message == "My Log: Podzemní knihovna, snad tu najdu neco o této planete.") fixf.message = "My Log: Underground library, perhaps you find something on this planet. ";
           if (fixf.message == ("My Log: Nasel jsem tu neco velmi zajímavého. Podle této knihy Skaarj zaútocili na Haros asi pred 30 lety."$"Tehdy byl Haros bez obyvatel. A Skaarjci se tu nakazili morem a byli nuceni odejít. Nekterí byli vsak prokleti a zachovali ze tu v nemrtné forme.")) fixf.message = ("My Log: I found something very interesting. According to this book Skaarj attacked Haros about 30 years ago."$" Then was Haros without inhabitant. A Skaarjci infected with the plague and were forced to leave. But some were cursed and kept there in the nemrtné form. ");
           if (fixf.message == "No jak sme klikali to Cisco tak sem si poslední 2 otázky nechal ze si skusím na ne odpovedet sám. No, samozrejme blbe :-) Ale mam 92% tak je to dobrý.") fixf.message = "Well as we click through to Cisco so I have had the last 2 questions from the skusim to answer them himself. Well, of course :-) But here's fool 92% so it's good. ";
           if (fixf.message == "My Log: Dvere nejdou otevrít, asi jsou necím blokavané z druhé strany. Mozná tu pekelní démoni byli uz kdysi dávno a zdejsí obyvatelé zabarikádovali vstupy do podzemí.") fixf.message = "My Log: The door will not open, some are something blokavané side. Maybe the demons of hell had been a long time ago and the local residents barricaded entrances to the underground. ";
           if (fixf.message == "My Log: Pomalu si na zápach smrti zacínám zvykat. Ale z této chodby je zápach nejsilnejsí na který jsem zatím narazil.") fixf.message = "My Log: We are slowly beginning to the smell of death getting used to. But from this passage the smell is the strongest I've ever encountered. ";
           if (fixf.message == "My Log: Co ted. Tady podzemí koncí. Katakomby jsou rozsáhlé a vetsina cest je blokovaná. Doufám ze tu najdu nekde tajný vchod, nerad bych se vracel zpet na povrch.") fixf.message = "My Log: What now. Here ends the underground. Catacombs are extensive and most roads are blocked. I hope you find a secret entrance somewhere, I do not want to return back to the surface. ";
           if (fixf.message == "My Log: Obrovské hrobky a krypty. Vsude je cítit zápach mrtvol a rozkládajícího se masa.") fixf.message = "My Log: Huge tombs and crypts. Everywhere is the smell of corpses and decaying flesh. ";
           if (fixf.message == "My Log: Kdybych aspon tusil kde sem. Musím se dostat co nejrychleji na povrch a skusit se dostat do mesta Machellopolis po povrchu.") fixf.message = "My Log: If I least where I had predicted. I need to get quickly to the surface and skusit to get into the city Machellopolis the surface. ";
           if (fixf.message == "My Log: Z téhle chodby jde cerstvý vzduch. Doufám ze vede na povrch.") fixf.message = "My Log: From this passage it fresh air. I hope it leads to the surface. ";
           if (fixf.message == ".. Nákaza prisla pres Hvezdnou Bránu ale prisla hned z nekolika planet. Celým vesmírem se ted sírí nejaký Cerný mor. Nevíme kdo ho vyrobil. Nemáme ani lék.") fixf.message = ".. The infection came through the Stargate but it came straight from the several planets. The whole universe is now us expands into a black plague. We do not know who made it. We have no medicine. ";
           if (fixf.message == ("My Log: 2) Tady v knizce je popis jak se sírila epidemie. Postihlo to mnoho ras,"$" hlavne humanoidní, vypadá ze ostatní rasy jsou vuci Cernému moru imuní. Vsechno naznacuje ze Hvezdná Brána se na Zemi pouzívá uz skoro 100 let a kdo ví jestli ne víc.")) fixf.message = ("My Log: 2) Here in the book is a description of how the spread of the "$"epidemic. It affected many races, mostly humanoid, looks the other races are immune against the Black African. Everything indicates that "$"the Stargate on Earth already uses nearly 100 years, and who knows if not more. ");
           ////if (fixf.message == "My Log: 1) Prohledal jsem spoustu knizek a vse naznacuje ze asi pred 45 lety se galaxií siríl cerný mor. To by vysvetlovalo "Dobu temna" o které se na Zemi moc nemluví. Tehdy lidstvo témer vymrelo a vypukla 3. svetová válka. Pár let po válce byla revoluce a od té doby nastala na Zemi tvrdá diktatura. Ale uz si to moc nepamatuju bylo mi jen pár let.") fixf.message = "My Log: 1) I searched a lot of books and all indications of about 45 years ago, the galaxies spread black plague. That would explain the "period of darkness" of which the Earth does not speak much. if humanity has died out and almost broke the 3rd World War. A few years after the war was a revolution and since then took place on Earth harsh dictatorship. But she's too remember I was only a few years. ";
           if (fixf.message == "... vetsina obyvatel Harosu je jiz nakazeno cerným morem a pomalu umírá. ") fixf.message = "... Harosu majority of the population is already infected with the Black Sea and slowly dying. ";
           if (fixf.message == "Prohledal jsem pár knih a nasel jsem neco o podzemí Harosu. Chodby vedou snad do kazdého mesta a do kazdé stavby. Ztratil sem své prátele. Snad se dostanu do nejblizsího mesta. Doufám ze tam najdu pomoc.") fixf.message = "I searched a few books and I found something on the ground Harosu. The hallway leading into almost every city and every building. I lost my friends here. Hopefully I get to the nearest town. I hope that he would find help. ";
           if (fixf.message == "My Log: Vypadá to na nejakej královskej sargofág, ale radsi ho nebudu otvírat. Mohl bych se necím nakazit.") fixf.message = "My Log: Looks like some kind královskej sargofág, but rather it will not open. I could be something infected. ";
           ///long///if (fixf.message == "Mysleli jsme ze je to nás konec, ale nastestí Duncan nasel tajný vchod do katakomb. Mysleli jsme ze máme klid ale to co prislo pozdeji predcilo nase nejhorsí sny. Pekelní démoni  byly vsude kolem nás a nase skupinka se rozutekla vsude mozne, ani uz nedoufám ze nekdy kamose jeste uvidim.") fixf.message = "We thought it was our end, but fortunately Duncan found a secret entrance to the catacombs. We thought that we have peace but what came later has exceeded our worst dreams. Hell's demons were all around us and our group ran everywhere, or had no confidence of ever kamose we'll see. ";
           if (fixf.message == "My Log: Z této studny jde chlad a pach smrti. Kdo ví co se tam dole v temnotách skrývá za hrúzy.") fixf.message = "My Log: This well is cold and the smell of death. Who knows what's down there in the darkness behind terror. ";
           if (fixf.message == "Zde odpocívá královský rádce Arthandas jez podlehl dlouhé nemoci.") fixf.message = "Here rests a royal counselor Arthandas that fell after a long illness. ";
                                        }
            }

            Log("Found And Applied Changes To Map : 12 Haros - Cold Passage");

     }

     if(Level.Title =="Haros - Cemery")
     {       // All fixes for  13 Haros - Cemery

            foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
         if (fixf.message == "My Log: Konecne jsem venku z toho prokletého podzemí. Kde ted vlastne jsem? Vidím tu hrbitov a kostel. Mohlo by to bejt Machello City.") fixf.message = "My Log: Eightball, it will be useful around the power of the tool is not. ";
         if (fixf.message == "My Log: Eightball, bude se hodit, v okolí tu moc náboju není.") fixf.message = "My Log: Eightball, it will be useful around the power of the tool is not. ";
         if (fixf.message == "My Log: Musí tu být nejaký jiný vchod. Mel bych se tam dostat, jinam cesta nevede.") fixf.message = "My Log: There must be some other entrance. Should I get there, the other way does. ";
         if (fixf.message == "Damariel Rodi                        15.1. 1889 - 28.2. 1985              Zemrel na mor") fixf.message = "Damariel Rodi 15.1 1889 - 28.2. 1985 He died of the plague ";
         if (fixf.message == "My Log: Tunely pod hrbitovem asi vedou i pod kostel. Doufám ze ho najdu snadno, nechce se mi zabloudit opet do podzemí.") fixf.message = "My Log: Tunnels under the cemetery around the church and lead. I hope I can find him easily, I do not want to get lost again in the underground. ";
         if (fixf.message == "My Log: Zdá se ze pod celým mestem je slozitý systém podzemních chodeb a sklepú.") fixf.message = "My Log: It seems that the whole city is a complex system of underground tunnels and cellars. ";
         if (fixf.message == "My Log: Nali kríz. Na Harosu driv urcite, zili Nali. Bohuzel na tomhle svete vyhynuli.") fixf.message = " My Log: Nali crisis. The Harosu driv certainly lived Nali. Unfortunately, this world perish.";
                                         }
         }
           Log("Found And Applied Changes To Map : 13 Haros - Cemery");
     }

     if(Level.Title =="Haros - Old Quarter")
     {   // All fixes for  14 Haros - Old Quarter
         // searched for  all with 227. , all captions are done.
         // this map may need  block monsters


         foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
         if (fixf.message == ("My Log: Takze jsem se dostal do podzemních chodeb pod centrem Machello City. Hlavní hrad Krallú, nebude snad uz daleko. Pokud bych "$"se tam dostal a zabil vúdce Krallú, tak jejich populace by zacala rapidne klesat. Jenze ted nemám skoro "$"zádnou munici a Krallú tu bude pozehnane. Budu se muset po nejaké podívat.")) fixf.message = ("My Log: So I got into underground tunnels under the center Machello City. The main castle Krall, perhaps not far away. When I got there and killed the "$"leader of Krall and their population began to decline rapidly. But now I have almost no ammo and be blessed, "$"Krall here. I'll have a sure you check it out.");
         if (fixf.message == "   Hospoda a penzion            U dvou Krallú") fixf.message = "Pub and B & B for two Krall";
         if (fixf.message == "My Log: Tady je klíc od skladú. Naberu si náboje ze skladú. Nákou dobu mi to vystací.") fixf.message = "My Log: Here is the key to the warehouse. Naber charge of the warehouse. Eventually it is enough for me.";
         if (fixf.message == "Baliova Dílna") fixf.message = "Baliova Workshop";
         if (fixf.message == "My Log: Tudy se snad dostanu k hradu. Ted jen zjistit jak otevrít tuhle mríz.") fixf.message = "My Log: Is this the way hopefully get to the castle. Now just to find out how to open this gate.";
         if (fixf.message == "V noci se casto budím. Mám pocit ze ve vedlejsím dome strasí. Casto slysím od tamtud podivné zvuky. Léta tam nikdo nebydlí.") fixf.message = "At night I wake up frequently. I have a feeling in the house next door is haunted. I often hear the strange sounds that way. Years where no one lives there.";
         if (fixf.message == "My Log: Tenhle dúm je fakt desivej. Je tu tma a zima. Kdo ví jaká je pravda o démonech.") fixf.message = "My Log: This house is really desivej. It's dark and cold. Who knows the truth about demons.";
         if (fixf.message == "My Log: V podlaze je velká díra. Jeste ze jsem si toho vsiml jinak by me cekal nepríjemný pád.") fixf.message = "My Log: The floor is a big hole. Glad I saw it otherwise would be waiting for me unpleasant fall.";
         if (fixf.message == "My Log: V tomhle dome léta nikdo nebydlel. Je tu jen trochu zniceného nábytku.") fixf.message = "My Log: In this house lived one summer. There's a little broken furniture.";
         if (fixf.message == "Tudy to asi nepude. Mríz se otvírá uplne od nekud jinud.") fixf.message = "This way, it probably nepude. Lattice opens completely from some way else.";
         if (fixf.message == "Podarilo se mi dostat az sem. Ve meste je moc Krallú. Jediný zpúsob jak se dostat pryc z mesta je podzemím. Ale moc se mi do tech katakomb nechce, kolují tu povesti o démonech. Docela se toho bojím.") fixf.message = "I managed to get with me from here. Very much the city Krall. Will cause only how to get gone from town ground. But I really do not want to tech catacombs, are circulating the rumor of démonech. Quite with the fear.";
         if (fixf.message == ("V této knize sem nasel docela zajímavé pasáze. Píse se tu hlavne o obrovské epidemii neznámého "$"viru v okolí roku 2039. Nejvíce byl postizen práve Haros, vetsina zdejsí populace zemrela. Pak je tu jeste neco o Krallech. Vznikli"$" nekdy okolo roku 2035 práve na Harosu.")) fixf.message = ("In this book I found quite interesting passages. It says a massive epidemic of mostly unknown virus around the "$"2039th Most affected was just Haros, most of its population died. Then there is something else about Krall. "$"Established sometime around 2035, right Harosu.");
         if (fixf.message == "My Log: Tudy taky cesta nevede. Mozná je to tak lepsí. Démoni by se mohli dostat do mesta.") fixf.message = "My Log: This way also does not drive. Maybe it's better that way. Demons could get into the city.";
         if (fixf.message == "My Log: Tyhle mríze slouzí jako ochrana pred vstupem démonú do mesta.") fixf.message = "My Log: These kinds of grid serves as a protection against vstupem demo in the city.";
         if (fixf.message == ("Clenové: Oscar Dronjak: Narodil se 20.ledna 1972 ve meste Motndal u Goteburgu. "$"Navstevoval kurzy o historii, archeologii a o reckých a rímských dejinách na Goteburské univerzite."$" Na kytaru zacal hrát ve 14 letech a brzy zalozil první formaci The Hippie Killers. Dalsí jeho skupinou byli Striker, hrající prevázni heavy "$"metalové cover verze prolozené prvními pokusy o vlastní skladby. ...")) fixf.message = ("Members: Oscar Dronjak: Born January 20, 1972 in the city of Gothenburg Motndal. Attended courses on history, archeology and Greek and Roman history "$"at the University Goteburské. Began playing guitar at age 14 and soon established the first formation of The Hippie Killers. "$"Another group were the Striker, playing mostly heavy metal cover versions alternately with the first attempts of his own compositions. ...");
         if (fixf.message == "Kajá Cáp: Drama: Bíla Nemoc, RUM, Vec nekropulous, Máma Povítky : Povejtky z 13 a 666 kapsy. Utopený román: Krakentit, Válka s moli.   Kája Póhlácek: 4 nesou rakev.") fixf.message = "Kaja Cap: Drama: White Plague, RUM, case nekropulous, Mom Povítky: Povejtky of 13 and 666 pocket. Drowned novel: Krakentit, War of the moth. Kaja Póhlácek: 4 bearing a coffin.";
         if (fixf.message == "My Log: Zajímave poskládaný sudy. ze by Paciho zásach :-)") fixf.message = "My Log: Interesting folded barrels. of the Pak zásach";
         if (fixf.message == "Brány mezi ctvrtemi bývají pres noc zavrené. Hlavne má tohle opatrení zabránit vnik neprátelských spionú co se snazí bojovat proti Kralls. V této ctvrti je schovaná jen jedna páka a to v místní knihovne.") fixf.message = "Gateways between neighborhoods tend to be closed overnight. Primarily this has measures to prevent intrusions enemy spy trying to fight Kralls. In this neighborhood are hidden and only one lever in the local library.";
         if (fixf.message == "Hospoda u Somarose") fixf.message = "Pub with Somarose";
         if (fixf.message == "My Log: Snad je to ta páka, co otevírá bránu smerem ke hradu.") fixf.message = "My Log: Perhaps it is the lever, what opens the gate toward the castle.";
         if (fixf.message == "Hlavní Krallský hrad je kousek na sever. Cesta vede pres staré predmestí.") fixf.message = "Home Krallský Castle is just north. The path leads through old suburbs.";
         if (fixf.message == ("Krallové utrpeli v poslední dobe velkou porázku. Pokus obsadit Madehiten selhal a jeste k tomu jsme ztratili Exploited."$" Máme podezrení ze za vsím stojí jeden clovek, který se dostal na nasi planetu. Naposledy byl zpatren ve vesnici u brány.")) fixf.message = ("Krall suffered a major defeat last time. Madehiten failed attempt to occupy and still we lost to the Exploited."$" We suspect from behind this one man who came to our planet. Zpatren last was in a village near the gate.");
         if (fixf.message == "My Log: Za tu dobu se uz hodne ochladilo. Skoro bych rek ze zacne mrznout.") fixf.message = "My Log: During that time he had a lot colder. Almost like the rivers begin to freeze.";
         if (fixf.message == "My Log: Nejaký klíc. Skusím jestli se hodí do zámku od knihovny na námestí.") fixf.message = "My Log: some clue. Skusím if he fits into the lock from the library on the square.";
         if (fixf.message == "My Log: Tak z téhle pípy uz asi pivo nikdy nepotece :-(") fixf.message = "My Log: Well, this beer taps as I'll never not flow :-(";
         if (fixf.message == ("Uz mnoho let se ví o rozsáhlé podzemní síti chodeb a katakomb pod celým Harosem."$" Dosud se nepodarilo zjistit kdo to postavil a jak je to starý."$"  Casto se povídá ze zdejsí podzemí je prokleté. Málokdo vysel z podzemí ziv. Ti co prezili vypráveli o nemrtvích a pekelných démonech."$" Nikdo neví kde se tam vzali.")) fixf.message = ("For many years, is known for an extensive underground network of tunnels and catacombs beneath the entire Harosem."$" We still need to find out who built it and how old it is. It is often said of the local ground is cursed."$" Few emerged from the underground alive. Those who survived and told the undead demons of hell. Nobody knows where the ride.");
         if (fixf.message == "Machellopolis je hodne rozsáhlé mesto. Je tu taky hodne opustených domú. Krallové radeji do techto domú nechodí. Kolují zde totiz povesti ze v domech strasí démoni z pekla.") fixf.message = "Machellopolis is a lot of large town. There's also a lot of abandoned houses. Krall prefers to these houses do not go. Circulating here is the legend of the haunted houses, demons from hell.";
         if (fixf.message == "Krámek u Peymala") fixf.message = "Shop for Peymala";
         if (fixf.message == "Krám u Paramita") fixf.message = "Shop for paramita";
         if (fixf.message == "My Log: Dvere jsou zarezlé a nejde snima pohnout. Mám pocit ze me v tom dome neceká nic dobrého.") fixf.message = "My Log: The doors are rusted and can not move the senses. I have a feeling of me in that house does not wait any good.";
         if (fixf.message == "My Log: Nekteré dvere jsou zamcené. Doufám ze tu nekde v okolí najdu klíc.") fixf.message = "My Log: Some doors are locked. I hope that somewhere in the neighborhood you will find the key.";
                                                }
         }



         Log("Found And Applied Changes To Map : 14 Haros - Old Quarter");

     }

      if(Level.Title =="Haros - Courtyard")
     {       // All fixes for  15 Haros - Courtyard

         foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
         if (fixf.message == "My Log: Konecne jsem se dostal na predmestí. Hrad nebude daleko, jenze Krallové si jen tak nenechají nekoho do hradu pustit. Budu muset najít bezpecnejsí cestu.") fixf.message = "My Log: Finally I got to the outskirts. The castle is not far, but Krallové you just let someone go to the castle. I'll have to find a safer way.";
         if (fixf.message == "Dostali jsme zprávu, ze vesnice u brány byla znovu ztracena. Kdo to vyvrazdil to mi nevíme. Pro jistotu jsme posílili stráze u hradu. Nás vúdce si nepreje být rusen.") fixf.message = "We received a report from the village at the gate was again lost. Who killed me to know. for sure we strengthen the guards at the castle. Our leader does not want to be disturbed. ";
         if (fixf.message == "My Log: Tady je ten tajný vchod do knihovny.") fixf.message = "My Log: Here's the secret entrance to the library.";
         if (fixf.message == "My Log: Mel bych si dát pozor na mnohá prekvapení co me tu múzou potkat.") fixf.message = "My Log: Should I have to be careful in what many surprises me the muse to meet. ";
         if (fixf.message == "Krallové v noci zavírají vsechny brány ve meste. To hlavne proti neprátelúm a démonúm. Vetsina bran se otevírá nekde centrálne, casto se dají brány otevírat pákou schovanou nekde poblíz. Tusím ze jedna je naproti v opustené knihovne.") fixf.message = "Krallové night close all the gates in the city. This is mainly because the enemies and demons. Most of the gates are opened centrally, often can be the gate opening lever hidden somewhere nearby. I guess one is opposite the abandoned library. ";
         if (fixf.message == "My Log: Kam pak tahle tajná chotba asi vede?") fixf.message = "My Log: Where the secret chotba about this lead? ";
         if (fixf.message == "My Log: To bude jedno z tech míst, kam se zamykali vezni cekající na popravu.") fixf.message = "My Log: This will be one of those places where prisoners are locked waiting for execution.";
         if (fixf.message == "My Log: To bude asi cesta ke hradu. Brána je opet zavrená. Ale stejne bude nejlepsí si najít nejakou tajnou cestu, která nebude moc hlídaná.") fixf.message = "My Log: This is probably the way to the castle. Gate is closed again. But the same would be best to find a secret path that will not be too guarded";
         if (fixf.message == "My Log: Vypadá to ze zacne kazdou chvíli prset.") fixf.message = "My Log: Looks like the rain will start any minute";
         if (fixf.message == "My Log: Proc jsou tyhle dvere tak podezrele otevrený. Aha, nejaký vtipálek dal kovadlinu na dvere, jeste ze sem si toho vsiml jinak by mi pristála kovadlina na hlave.") fixf.message = "My Log: Why are these doors open so suspiciously. Well, some joker put an anvil on the door, he is from here that he noticed otherwise, I landed an anvil on his head. ";
         if (fixf.message == "My Log: Má matka chtela svatbu na úrade, má zena na radnici a sestra zase v kostele. No tak sem bouchnul do stolu a udelali to v hospode.") fixf.message = "My Log: My mother wanted to marry the office, my wife and sister at the town hall back in the church. Well here slammed the table and did the pub. ";
         if (fixf.message == "My Log: Kde nepomúze hrubá síla, pomúse kladivo.") fixf.message = "My Log: Where help muscle, will help hammer.";
         if (fixf.message == "My Log: Tady to je, snad se mi podári najít cestu do hradu. Je mozný ze zase potkám pekelný démony. Na Harosu jich je plno.") fixf.message = "My Log: Here it is, maybe I can find the way to the castle. It is possible from the demons of hell I'll meet again. The Harosu there are plenty. ";
                                         }
         }
         Log("Found And Applied Changes To Map : 15 Haros - Courtyard");


     }

      if(Level.Title =="Haros - Castle of Kralls")
     {       // All fixes for  16 Haros - Castle of Kralls

         foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {

         if (fixf.message == "My Log: To by uz mohlo být sklepení Krallskýho hradu.") fixf.message = "My Log: That may already be Krallskýho castle dungeons";
         if (fixf.message == "My Log: Ted jen najít Krallskýho vejvyssího vúdce. Kdybych ho zabil, tak by pak Krallové zacali vymírat a Haros by pak mohl být znovuosídlen Nali. Jenze me tu bude jiste cekat plno elitních Krallú.") fixf.message = "My Log: Now just find Krallskýho vejvyssího leader. if I killed him, it would then Krallové began to die off and Haros might make the resettlement Nali. But there will certainly me wait a lot of elite Krall. ";
         if (fixf.message == "My Log: Není nad to se trochu ohrát u ohne. Podívám se trochu na ty knísky co tam horej. Takze tu vidim (Z)mate(k)matika, Fyzika, Krallskej jazyg.") fixf.message = "My Log: Nothing like a little warm by the fire. I look at those little knísky what he horej. So you see (Z) mate (k) math, physics, Krallskej jazyg. ";
         if (fixf.message == "My Log: Za tu chvilku se venku pekne rozprselo. A teplo taky moc není.") fixf.message = "My Log: for the moment, the nice out there started to rain. And the heat is too much. ";
         if (fixf.message == "My Log: Dvere jsou necím zavrené. Asi to bude nejaký mechanismus.") fixf.message = "My Log: The doors are closed, something. I guess it will be some mechanism.";
         if (fixf.message == "My Log: Hlemese tady mají kulecník. Ale je trochu jinej nez jak ho znám na Zemi. Tenhle je bez der s více koulema.") fixf.message = "My Log: Hlemese there are billiards. But there is little else than to know him on Earth. This is without der more balls. ";
         if (fixf.message == "Staré legendy vypráví o mocných Titánech. Jsou to témer nezdolní válecníci. Kdo je dokáze povolat do svých rad, tak se stane prakticky neporazitelným.") fixf.message = "The old legend tells of the powerful Titans. They are almost indomitable warriors. Who is able to call into its councils, so it has become virtually invincible.";
         if (fixf.message == "My Log: Hradní galerie. Krallové sem dali obrazy co nakradli po rúzných planetách. Vidím tu neco z Madehitnu, dost jich je z Exploitu a zbytek az na pár unikátú je z Harosu.") fixf.message = "My Log: Castle Gallery. Krallové images here put as stolen after different planets. I can see something of Madehitnu, there are a lot of exploits and the rest from a few unique is Harosu. ";
         if (fixf.message == "Haros má v prúmeru 12746 km a den zde trvá priblizne 42 hodin. Noc v zime má v prúmeru 30 hodin a vléte 15 hodin. Prúmerné teploty se pohybuji okolo 16 C v léte a -33 C v zime.") fixf.message = "Haros has a diameter of 12746 km a day that lasts approximately 42 hours. Night in winter has an average of 30 hours in summer and 15 hours. The average temperature is around 16 C in summer and -33 C in winter. ";
         if (fixf.message == "My Log: Tak to je peknej slejvák. A jentak asi neprestane.") fixf.message = "My Log: That's nice slejvák. A jentak about stops. ";
         if (fixf.message == "My Log: Zbrojovka, tady budou kasárny. Bude tu dost Krallú takze pozor na ne.") fixf.message = "My Log: Zbrojovka, there will be barracks. There will be quite so careful Krall Sun ";
         if (fixf.message == "My Log: To musí být páka co otevírá vsechny ty zavrené dvere.") fixf.message = "My Log: This must be what the lever to open all those closed doors.";
         if (fixf.message == "Povolat Titány je mozno pouze za zvlástního magického rituálu.") fixf.message = "Call the Titans is possible only under special magic ritual. ";
         if (fixf.message == "Krallové zazili za posledních pár hodin moc porázek. Stratili jsme dve planety a neznámý cizinec uz rádí na Harosu. Jediná nadeje jak zvrátit spatnou situaci povolat Titány. Potom bychom mohli získat ztracené planety zpet.") fixf.message = "Krallové experienced in the last few hours of much defeats. We lost two unknown alien planet and had like to Harosu. The only hope to reverse a bad situation to call the Titans. Then we can get back the lost planet. ";
         if (fixf.message == "My Log: Jak se tenhle kulecník hraje mi asi zústane navzdy tajemstvím.") fixf.message = "My Log: How is this playing billiards around me will always remain a mystery. ";
         if (fixf.message == "My Log: Trúní sál. Stráze urcite strezili vúdce. Tak jdu na to, Haros ceká na osvobození.") fixf.message = "My Log: Throne Hall. Guards definitely guard leader. So go to Haros waiting for liberation. ";
         if (fixf.message == "My Log: Uf tak jsem to zvládl. Porázkou vúdce zacnou Krallové vymírat. Ale v okolí jich bude jeste dost. A navíc sem nasel pár knízek o povolání Titánú. Takze nebezpecí jeste není zazehnáno.") fixf.message = "My Log: Phew I made it. Defeat the leader Krallové begin dying. But there will still near enough. And I found a few books on the profession of the Titans. So jeste danger is over. ";
         if (fixf.message == "My Log: K cemu slouzí tohle tlacítko. Zkusim to co to otevre. Co kdyby to vedlo na místo kde mohou Krallové povolat Titány.") fixf.message = "My Log: What does this button. I'll try what's opens. What if it led to the place where they can call Krallové Titans. ";
                               }
          }

       Log("Found And Applied Changes To Map : 16 Haros - Castle of Kralls");
     }

      if(Level.Title =="Haros - Mages Tower")
     {       // All fixes for  17 HHaros - Mages Tower

          foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
          if (fixf.message == "My Log: Kde to jsem? Kam me ten portál prenesl?") fixf.message = "My Log: Where am I? Where me he transferred the portal?";
          if (fixf.message == "My Log: Vypadá to tu na nejakou magickou vez. Je to zvlástní, ale gravitace je tu strasne malá, cítim se tu lehkej jako pírko.") fixf.message = "My Log: It seems that for some magical tower. It's strange, but gravity is a terrible little, I feel there lehkej as a feather. ";
          if (fixf.message == "My Log: Je to tu velmi zvlástní. Chvíli jsem ve vezi a za chvíli jsem nekde uplne jinde. Kdo ví zda jsem vúbec v nasem svete.") fixf.message = "My Log: It's very strange. for a while I was in the tower and soon I elsewhere. Who knows whether I ever in our world. ";
          ///if (fixf.message == "Krallové jsou nyní na pokraji svého vymrení. Ztrátou naseho vúdce byl zlomen duch Krallú a nyní ztrácí svou moc, ani elitní Krallové jiz nemají svou púvodní moc. Jediná nase nadeje, povolat mocné Titány. Otázka zda je dovedeme k nasí prízni v síni moci.") fixf.message = "Krallové are now on the verge of its extinction. The loss of our leader was broken spirit Krall and now loses its power, even the elite Krallové already have their original power. Our only hope, to summon the powerful Titans. The question is whether we are able to our favor in the court of power. ";
          if (fixf.message == "My Log: Konecne jsem nasel páku k padacímu mostu.") fixf.message = "My Log: At last I found the lever to the drawbridge.";
          if (fixf.message == "My Log: Musim najít zpúsob jak sputit tenhle most. Preskocit tu propast by asi neslo.") fixf.message = "My Log: we must find ways sputit this bridge. Skip the rift would have carried. ";
          if (fixf.message == "My Log: Tahle knihovna byla silne strezena. Není divu, snazí se ubránit svoji poslední sanci.") fixf.message = "My Log: This library was heavily guarded. Not surprisingly, trying to defend their last chance. ";
          //if (fixf.message == "Tady je neco o púvodu Krallú. Velmi zajímavé. V dobách kdy Haros plne zil. Jeden vecec skousel rúzné mutace a genetické experimenty. Jednoho dne se podarilo vytvorit rasu Kralls. Bohuzel se premnozily a zacali plenit Haros. Navíc byl bránou na planetu zavlecen nejaký mor vúci nemu jsou Krallové imuní.") fixf.message = "There is something about the origin Krall. Very interesting. In the days when Haros fully lived. One vecec skousel different mutations and genetic experiments. One day he managed to create a race Kralls. Unfortunately, premnozily and began looting Haros. Furthermore, the gateway to planet introduced a plague against him are Krallové immune. ";
          if (fixf.message == "Tady je neco o tom jak se dají Titáni spríznit.") fixf.message = "There is something about how the Titans can spríznit.";
          if (fixf.message == "V této knize je tajemná legenda o Titánech. Je tu i neco o jejich domove na pusté planete.") fixf.message = "This book is a mysterious legend of the Titans. There's also something about their home on a desert planet";
          if (fixf.message == "My Log: Musím si pospísit Titáni muzou být povolaní kazdou chvíli.") fixf.message = "My Log: We must hurry Titans can be recalled at any moment. ";
          if (fixf.message == "My Log: Pokladnice, je tu spousta zajímavých vecí. Je videt ze Krallové touzí hodne po zlate.") fixf.message = "My Log: Treasury, there's plenty of interesting things. Can see a lot of Krallové yearns for gold. ";
          if (fixf.message == "My Log: To musí být sín moci. Mel bych Titána zabít hned dokud ho neovládnou Krallové. Zatím ale netusím jak moc jsou Titáni silní.") fixf.message = "My Log: This must be able to Sin. Should I just kill the Titan until it neovládnou Krallové. But have no idea yet how much the Titans are strong.";
                                        }
            }
            // see for parts?
           Log("Found And Applied Changes To Map : 17 HHaros - Mages Tower");
     }

       if(Level.Title =="Haros - Ruthin Line")
     {       // All fixes for  18 Haros - Ruthin Line

          foreach AllActors(Class'translatorevent', fixf)
          { if (  fixf != None )          {
          if (fixf.message == "My Log: Tak, a na Harosu je uz hotovo. Krallové zacnou pomalu z vesmíru mizet. Pro dnesek by to uz stacilo, jsem více jak 10 hodin v akci. Mel bych si najít nejakou hospúdku kde bych mohl prespat.") fixf.message = "My Log: Well, and Harosu is already done. Krallové begin to slowly disappear from the universe. for today it's been enough, I have more than 10 hours in action. Should I find a pub where I could sleep. ";
          if (fixf.message == "My Log: Aspon ze uz neprsí, ale noc je stále vetsí, uz je témer vsude tma. do rána zbývá asi jeste 15 hodin. Pekne se uz ochladilo, rekl bych ze uz i mrzne.") fixf.message = "My Log: At least she did rain, but the night is still greater, it is almost everywhere dark. By morning, left around for 15 hours. Be nice had cooled, I would say that even freezing. ";
          if (fixf.message == "My Log: Myslím ze tohle by mohlo stacit. Krallú je uz vsude málo. Ale pro jistotu se uvnitr zamknu.") fixf.message = "My Log: I think this could be enough. Krall is already everywhere scarce. But for sure the inside lock. ";
          if (fixf.message == "My Log: Uz sem fakt dost unavenej, tesím se az se porádne vyspím.") fixf.message = "My Log: I already really quite tired, I look forward to the advisory sleep.";
                                       }

          }

          Log("Found And Applied Changes To Map : 18 Haros - Ruthin Line");
     }

      if(Level.Title =="Haros - Ice Morning")
     {       // All fixes for  19 Haros - Ice Morning
          foreach AllActors(Class'teleporter', teepee)
          {   // no wormworles!
           if ( teepee.url =="WormHole3#pod?peer")   {  teepee.url="20Cave#";}

          }

          foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
          if (fixf.message == "My Log: To sem se pekne prospal. Brr ... ale je tu náká moc veliká zima. Venku dost huste snezí. Uderila povestná Haroská zima. Mel bych se na chvíli ohrát nekde u krbu.") fixf.message = "My Log: This here is nice nap. Brr ... But there's an old very big winter. Outside, thick enough to eat. Haroská struck the proverbial cold. I had a moment somewhere warm by the fire.";
          if (fixf.message == "V této knize je neco o posmrtném zivote. Kazdý dobrý clovek se po smrti povznese na vysí sféru existence. Zatímco darebáci a zlí lidé budou zatraceni peklu.") fixf.message = "In this book is something about the afterlife. Every good man after death exalted sphere of existence on the amount. While the villains and evil people will be damned hell. ";
          if (fixf.message == "My Log: Jak na to koukám venku napadlo trochu víc snehu. No to bude zajímavý brodit se skoro ve dvoumetrové vrstve snehu.") fixf.message = "My Log: As I look out of wondered a little more snow. Well it will be interesting to wade through almost two meter layer of snow. ";
          if (fixf.message == "My Log: Dvere nejdou otevrít, zamrzly. Stejne by to bylo knicemu, akorát by se sem nasypal sních a ven bych se stejne nedostal.") fixf.message = "My Log: The door will not open, freeze. Similarly, it was knicemu, just be scattered here and out sních would anyway.";
          ////if (fixf.message == "My Log: Konecne troska tepla. Musim se dostat ke hvezdný bráne. Ale je dost daleko, ne ze bych mel starost s Krally tech uz zbylo jen pár, ale ta zima bude horsí. Venku bude asi -30° a já ani nemám náký hodne teplý oblecení. Ceká me tezká cesta.") fixf.message = "My Log: Finally wreck heat. Gotta get to the Stargate. But it is far enough, not that I had troubles with Krall tech had left only a few, but the winter would be worse. Outside will be about -30 °, and I do not even got any lots of warm clothes. Severe road waiting for me.";
          if (fixf.message == "My Log: Koukám ze na strese je krapet víc snehu. Neco takového jsem jeste v zivote nezazil. Respektive u nás na Zemi málokdy snezí. Moji predci mi o vánicích vypráveli, ale ze by byly takové ... to jsem nikdy nezaslech.") fixf.message = "My Log: I see that the roof is a little bit more snow. Something I's life is in before. Respectively here on Earth rarely snows. My ancestors told me about a blizzard, but it would be so ... I have never not sent.";
          if (fixf.message == "My Log: Strecha zrejme nevydrzela tlak snehu a zrítila se. Tak me napadá ze bych se mohl dostat k bráne podzemím.") fixf.message = "My Log: Strecha probably endure the pressure of snow and collapsed. So my idea that I could get to the gate underground. ";
          if (fixf.message == "My Log: Tady je pekná zima a snich a led je i dost v kanalizaci.") fixf.message = "My Log: There is a pretty cold and snich and ice is enough in the sewers. ";
          if (fixf.message == "My Log: Moc to klouze.") fixf.message = "My Log: Not to slippery";
          if (fixf.message == "My Log: Ani pozdzemím to moc dobre nepujde. Kanalizace je zamrzlá.") fixf.message = "My Log: Not pozdzemím a very good chance. Drainage is frozen.";
          if (fixf.message == "My Log: Brrr ... taková zima, to jsem jeste v zivote nezazil. No alespon ze prestalo snezit.") fixf.message = "My Log: Brrr ... so cold, that's life I have experienced in. Well at least he had stopped snowing. ";
          if (fixf.message == "My Log: Tak jsem na kraji mesta, ted jen najít zpúsob jak se dostat k bráne. Bagr na odhrnutí snehu tu asi nemaj a odhazovat sních rucne by mi trvalo leta páne.") fixf.message = "My Log: Well, I'm on the edge of town, now just find a way to get to the gate. Excavator pushed back to the snow around and throw nemaj sních by hand took me leta sir.";
          if (fixf.message == "My Log: Ohen ... to jsem ted potreboval. Na chvili se ohreju a pak rychle k bráne.") fixf.message = "My Log: Fire ... I now need. At the moment, Warm, and then quickly to the gate. ";
          if (fixf.message == "Jednomu z nás se podarilo vzpomenout si na adresu planety nasich spojencú Brutes. Posledním z nás co prezili se podarilo vcas vytvorit cestu snehem k bráne.") fixf.message = "One of us managed to remember the address of the planets of our allies Brutes. The last of us survivors have managed to create a path of snow in time for the gate. ";
          if (fixf.message == "My Log: Brána uz je na dohled. Vesnice u brány je pohrbena 3 metrovou vrstvou snehu. Jak se tady prezívá netusim.") fixf.message = "My Log: Gateway is already in sight. Village at the gate is buried 3-meter layer of snow. How to survive here, no idea. ";
          if (fixf.message == "My Log: Konecne sem u brány. Rychle zadat adresu Siriusu. Musim rychle pryc nebo zmrznu.") fixf.message = "My Log: Finally, here at the gate. Quickly enter the address of Sirius. Must quickly away or freezes. ";
                                           }
         }
          Log("Found And Applied Changes To Map : 19 Haros - Ice Morning");
     }
}

  function Sirius()
{
local trigger fixc;              // trigger actors array
local specialevent fixe;         // specialevent actor array
local translatorevent fixf;      // tranlator messages actor array
local trigger fixg;              // duplicate of trigger array?
local  sse seventp;              // spec event
local class<actor> actNewClass;  // dlc
local actor actaPawn;            // dlc
local teleporter teepee;         // teleporter
local mover mvr;                 // movers
local Sound TheSound,thesound2,thesound3;
local scriptedpawn scoot;

  //TheSound = Sound(DynamicLoadObject("ssdoorsounds.doorstonesmall",Class'Sound'));
 // thesound2 = Sound(DynamicLoadObject("ssdoorsounds.doorstone3s",Class'Sound'));
 // thesound3 = Sound(DynamicLoadObject("ssdoorsounds.switch06",Class'Sound'));






     if(Level.Title =="Sirius - Cave")
     {       // All fixes for  20 Sirius - Cave
           foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
          if (fixf.message == "My Log: Konecne teplo. Sirius je vulkanická planeta, tezí se tu Naquadah. A okupují ho Mercenary, kterí jsou neprátele Skaarj.") fixf.message = "My Log: The final heat. Sirius is a volcanic planet, mined here Naquadah. And it occupied a Mercenary who are enemies Skaarj.";
          if (fixf.message == "My Log: vypadá to jako bych byl prímo v dolech. Takze bych se mel dostat do nejakýho transportu a dostat se do hlavního centra.") fixf.message = "My Log: it looks like I was directly in the mines. So should I get nejakýho transport and get into the main center.";
          if (fixf.message == "My Log: Mel jsem pravdu jsou to doly na Naquadah. Tak ted zjistit kam mam jít.") fixf.message = "My Log: I was right as it mines Naquadah. Well, now find out where to go.";
          if (fixf.message == "My Log: Tenhle vypínac by mi mel otevrít dvere od dúlního výtahu.") fixf.message = "My Log: This one would make me grind Power button will open the door dúlního lift.";
          if (fixf.message == "Geologický prúzkum ukázal ze na povrchu týhle cásti hory je jeste dostatek Naquadahu. Dokud se nám nepodarí porazit Skaarje a Krally na Exploitu, nebudeme mít dostatek otrokú na práci ve vetsích hloubkách.") fixf.message = "Geological survey showed that on the surface of these parts of the mountain is still enough Naquadahu. Until we can beat Skaarje Krall and to exploit, we do not have enough slaves to work at greater depths.";
          if (fixf.message == "My Log: Povrchová tezba Naquadahu. Jak na to koukám tahle planeta nevypadá moc prívetive. Ale narozdíl od Exploitu takhle vypadá uz odjakziva.") fixf.message = "My Log: surface mining Naquadahu. As I see it on this planet does not look too friendly. But unlike the exploit seems like she always had.";
          if (fixf.message == "Vetsinu povrchových lozisek Naquadahu jsme uz vytezily. Tezba ve hlubsích cástech dolú je mnohem tezsí. Musíme si pockat na otroky z Exploitu a potom to vytezíme.") fixf.message = "Majority of surface bearings Naquadahu we've extracted. Mining in the deeper parts of the mine is much harder. We have to wait for the slaves and then exploit it vytezíme.";
                                }
         }
         Log("Found And Applied Changes To Map :  20 Sirius - Cave");

     }

     if(Level.Title =="Sirius - Mine & Rafinery")
     {       // All fixes for  21 Sirius - Mine & Rafinery
              foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
          if (fixf.message == "My Log: Ted jsem tak 600m pod zemí. Mel bych zjistit co ted dál.") fixf.message = "My Log: Now I have the 600 meters underground. Should I find out what to do next.";
          if (fixf.message == "My Log: Tahle hora je pravdepodobne na tektonicky nestabilní skále. Láva je tu na dost místech a je tu i vedro.") fixf.message = "My Log: This mountain is probably the tectonically unstable rock. Lava is here to enough places, and there is also hot.";
          if (fixf.message == "My Log: Vrata jsou zavrená. Skusim se podívat po nejakém rídícím centru. Tam bych mohl skusit otevrít náký ty vrata.") fixf.message = "My Log: The doors are closed. Skusim look after a control center. There I could skusit me some open the gates.";
          if (fixf.message == "Nedávno prestaly vrata, vedocí do prekladiste, reagovat na signály z rídícího centra. Otevrít se dají jeste rucne ze severní cásti dolú.") fixf.message = "Recently stopped gates vedocí to the terminal, responding to signals from the control center. Can still be opened manually from the northern parts of a mine.";
          if (fixf.message == "Tezba Naquadahu zatím nezacala, protoze podzemí je zatím nestabilní a hrozí otresy.") fixf.message = "Extraction of Naquadahu yet begun, because the ground is still unstable and there is turmoil.";
          if (fixf.message == "My Log: Nekde v tehlech stolách by mela být páka. Snad to nebude tezký ji najít.") fixf.message = "My Log: somewhere in this galleries should be the lever. Perhaps it is not hard to find.";
          if (fixf.message == "Nedávno jsme narazili na podzemní chodbu vedocí do nejaké podivné místnosti. Jeden Mercenary tam prý cítí temné síly a ze nedoporucuje tezbu v tomto míste.") fixf.message = "We recently ran into an underground passage vedocí in some weird room. Mercenary one there said they feel the dark forces and it is not recommended ";
          if (fixf.message == "My Log: Tady je nejaká páka. Zkusím co se stane.") fixf.message = "My Log: There is a lever. I'll try what happens.";
          if (fixf.message == "My Log: Tohle místo mi pripomíná podzemí Harosu. Radsi bych se vrátil, peklení démoni urcite nebudou daleko.") fixf.message = "My Log: This place reminds me of the underground Harosu. I'd rather be back, definitely not peklení demons away.";
          if (fixf.message == "My Log: Kde to jsem? Neco mi ríká ze bych dál jít nemel.") fixf.message = "My Log: Where am I? Something tells me I'd go on not.";
          if (fixf.message == "My Log: Prekladiste. Tady se vytezený Naquadah sype na pásy a pak se dál vozí do nejaký základny. Kadyz to budu sledovat urcite se tam dostanu.") fixf.message = "My Log: terminal. Here excavated Naquadah poured into strips and then went on to carry some basic. Kadyz I'll definitely follow to get there.";
          if (fixf.message == "Pri posledním útoku Skaarj byl vázne ponicen monorail pro dopravu naquadahu do hlavní výrobny. Tezba musela být proto zastavena, dokud nebude monorail opraven, nebudeme moct pokracovat ve výrobe.") fixf.message = "During the last attack was seriously damaged Skaarj Monorail Transport naquadahu into major production. Though the extraction had to be stopped until the Monorail repaired, we will be able to continue production.";


                                          }
         }


           Log("Found And Applied Changes To Map :  21 Sirius - Mine & Rafinery");


     }

     if(Level.Title =="Sirius - SpeedWay")
     {       // All fixes for  22 Sirius - SpeedWay

       // playerstart on ground!
       // fixes both falling off and player classes issues.
       templocation.X = 12982.557617;   templocation.Y = 12187.048828;  templocation.Z = -999.902954;
       actNewClass = class<actor>( DynamicLoadObject("JCoopZ1SSF.jzPlayerStart", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
       actNewClass = class<actor>( DynamicLoadObject("xcoop.xPlayerStart", class'Class' ) );  actaPawn=Spawn(actNewClass,,,templocation);

       // move the car rifle , as it is no longer accesable.!
       actNewClass = class<actor>( DynamicLoadObject("ryspak.CARifle", class'Class' ) );
       templocation.X =12884.669922;   templocation.Y = 12171.541992;  templocation.Z = -999.907349;
       actaPawn=Spawn(actNewClass,,,templocation);



          foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
             if (fixf.message == "My Log: Zhruba po 20 minutách jízdy dorazil k poskozené cásti monorailu. Dál budu muset jít pesky. do hlavní základny Mercenary je to asi 10Km, nemel bych se zdrzovat nejakým prúzkumem okolí, urcite to tu vsude hlídaj.") fixf.message = "My Log: Approximately 20 minutes drive reached the damaged parts Monorail. I have continued to walk. The main base of Mercenary is about 10km, I should not delay some exploration around, I'm sure it's everywhere hlídaj.";
             if (fixf.message == "My Log: Zdá se ze pri posledním útoku Skaarj byl monarail vázne poskozen.") fixf.message = "My Log: It seems that in the last attack Skaarj monarail was severely damaged.";
             if (fixf.message == "My Log: Dálnicní tunel vede do stejné hory jako monorail. Doufám ze me dovede do základny.") fixf.message = "My Log: highway tunnel leads to the same mountain as the Monorail. I hope it will lead me into the base.";
             if (fixf.message == "My Log: Zase nejaká nehoda kamionú. Stací si nachvíli ustlat za volantem a uz je dílo hotovo.") fixf.message = "My Log: Again, a truck accident. Just make a bed nachvíli behind the wheel and had the job is done.";
             if (fixf.message == "My Log: Úniková chodba z tunelu. Do základny to uz nebude daleko.") fixf.message = "My Log: Escape from the tunnel corridor. Into the base it will not be far away.";
                                         }
         }

         Log("Found And Applied Changes To Map :  22 Sirius - SpeedWay");
     }


      if(Level.Title =="Sirius - Virtual Reality")
     {       // All fixes for  s4 Sirius - Virtual Reality

               foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
             if (fixf.message == "My Log: Co se to stalo? Mým telem jakoby najednou prosel blesk. Nemel jsem na toho compa sahat.") fixf.message = "My Log: What happened? My body like lightning suddenly walked. I did not touch the compy.";
             if (fixf.message == "My Log: Zdá se mi jako bych byl v nejaké virtuální realite.") fixf.message = "My Log: It seems to me like I was in a virtual reality.";
             if (fixf.message == "My Log: Hmm... virtuální realita se zdá být jeste nedokoncená. Ted to musím být na nejaký vesmírný stanici.") fixf.message = "My Log: Hmm ... Virtual reality appears to be yet incomplete. Now I must be on a space station.";
             if (fixf.message == "My Log: Tady tecou data. Samý 0 a 1. Proc ne treba 3 a 6.") fixf.message = "My Log: Tady TECO data. Samy 0 and the first Proc should not be 3 and the sixth";
             if (fixf.message == "My Log: Nemuzu jít dál, asi to není jeste hotový.") fixf.message = "My Log: can not go on, maybe it is not yet complete.";
             if (fixf.message == "My Log: Tehle tunel vede nekam jakoby do jinýho sveta.") fixf.message = "My Log: this tunnel leads somewhere else like in the world.";
             if (fixf.message == "My Log: Tohle místo mi pripomíná Haros.") fixf.message = "My Log: This place reminds me Haros.";
             //if (fixf.message == "Kdysi dávno jsme zadali adresu nejaké planety a po vyslání sondy se nám dostala do pocítacú nejaká umelá inteligence zvaná Entita. Zdá se ze chce vytvorit svoji realitu, která by pak pohltila nasi realitu.") fixf.message = "Long ago we entered the address of a planet, and after the launch, we got into computers, some artificial intelligence called Entity. It seems you want to create their reality, which would then be absorbed by our reality.";
             if (fixf.message == "My Log: Tady ta cást mesta je celá bez textur. Bude to jeste nákej ten cas trvat nez se to dá dohromady.") fixf.message = "My Log: This is the part of the whole city is without textures. It will still take the time nákej than it brings them together.";
             if (fixf.message == "My Log: To bude dalsí pruchod do jinýho sveta.") fixf.message = "My Log: This will be the next consultation to passthrough to the world.";
             if (fixf.message == "My Log: Tehlech dverí jsem si skoro nevsim jak jsou bez textury. Mel bych být víc pozorný.") fixf.message = "My Log: this door I'm almost as nevsim without textures. Should I be more attentive.";
             if (fixf.message == "My Log: Tady není jeste hotova ani voda.") fixf.message = "My Log: There is not yet ready or water.";
             if (fixf.message == "My Log: Hele to je Egypt, ale já v Egypte jeste nebyl. No mrknem se co tu muze bejt.") fixf.message = "My Log: Hey this is Egypt, but I was still in Egypt. Well, a look what we can be.";
             if (fixf.message == "My Log: To vypadá jako bych byl na Goaldské materské lodi.") fixf.message = "My log: It looks like I was on Goaldské mother ship.";
             if (fixf.message == "My Log: Ted uz vím jak tuhle virtuální realitu znicit. Stacilo tam zavíst Paciho filtr a je vystaráno.") fixf.message = "My Log: Now I know how this virtual reality to destroy. There was enough envy and Pak filter is done.";
             if (fixf.message == "My Log: Entita mozná chtela vytvorit virtuální realitu, ale zapomela na anivirák. Se stává :-)") fixf.message = "My Log: entités Odpust chtela vytvorit virtuální realitu, ale zapomela in anivirák. If stave :-)";
             if (fixf.message == "My Log: Vypadá to ze system je nák zavirovaný :-)") fixf.message = "My Log: Vypadá them to your system zavirovaný nak :-)";
                                                                  }
         }
           // noblock door  that got blocked
           templocation.X = -272.966431;   templocation.Y = -4239.444336;  templocation.Z = 24.099901;
           Spawn(Class'BBlockM',,,templocation);


           foreach AllActors(Class'specialevent', fixe)
          { if (  fixe != None )
                 {

           if (fixe.message == "Init: Engine Entite") fixe.message = "Heat: Engine Entite";
           if (fixe.message == "Entita: Vítej v mém svete. Ve svete stvoren Entitou.") fixe.message = "IEntita: Vítej v Mém world. Ve created Entitou world.";
           if (fixe.message == "Entita: Mozná se divís proc tu jses. Chci stvorit svet kde budou platit má plavidla a brzy muj virtuální svet pohltí vás lidký svet. A ty mi stím pomúzes.") fixe.message = "Entity: You may be wondering why there you are. I want to create a world where they will pay the vessel, and soon my virtual world devour you Lidka world. And I fills help.";
           if (fixe.message == "Entita: Práve jsem precetla tvé myslenky, tvé bojové schopnosti mi pomohou lépe se rozpínat ...") fixe.message = "Entity: That I have read your thoughts, your fighting skills will help me better to expand ...";
           if (fixe.message == "Co to? Tenhle prostor jsem nevytvorila.") fixe.message = "What? I did not create this space.";
           if (fixe.message == "!!! Nalezen virus !!!  Vir: Paciho filtr v4.26.") fixe.message = "! Virus Detected! Vir: Pak Filter v4.26.";
           if (fixe.message == "Warování - Ve virtuální realite bylo detekováno velké mnozství chyb. Hrozí zhroucení systému.") fixe.message = "Warování - in virtual reality has been detected large amounts of error. Threatens to collapse the system.";
           //if (fixe.message == "Entita: Ten tvuj vir to celý znicil. Celá má realita je zamorena tim virem "Paciho Filtr" a ted je to tu vsude zmodifikovaný.") fixe.message = "Entity: The virus that thy whole destroyed. All reality is a team of infestation viraemia "I Filter" and it's here now for Expats zmodifikovaný.";
                                }
          }
             Log("Found And Applied Changes To Map :   s4 Sirius - Virtual Reality");
     }





     if(Level.Title =="Sirius - War Factory")
     {       // All fixes for  23 Sirius - War Factory
                foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
             if (fixf.message == "My Log: Vypadá to jako továrna na zbrane. Myslim ze sem nekam vozí ten naquadah.") fixf.message = "My Log: Looks like a factory for weapons. I think from here to somewhere that brings naquadah.";
             if (fixf.message == "My Log: Tak to je zajímavá architektura. Takovou jsem tu továrnu vúbec necekal. Zajímavý meteriál z jakého to postavili. Je to jakási ocel spojená s organickou hmotou. Tohle místo na me púsobí pekne strasidelne.") fixf.message = "My Log: That's interesting architecture. I have a factory not expect. Meteriál interesting for what it built. It's kind of steel associated with organic matter. This place affects me pretty scary.";
             if (fixf.message == "My Log: To vypadá na nejakou pumpu, ale co to jen cerpá? Naquadah to není. Mohla by to být náká sracka, kterou pouzívají na výrobu kdo ví ceho.") fixf.message = "My Log: This looks like a pump, but you just call? Naquadah it is not. It could be infected with shit they use to produce, who knows what.";
             if (fixf.message == "Vsechna výroba stojí.") fixf.message = "All production costs.";
             if (fixf.message == "Zásobování je preruseno, kvúli ponicenému monorailu. Oprava bude trvat zhruba 6 dní.") fixf.message = "Supply is interrupted, due to the battered Monorail. Repair will take about 6 days.";
             if (fixf.message == "Vniknutí pred 5 minutama.") fixf.message = "From 5 intrusion minutama.";
             if (fixf.message == "Za posledních 15 dní detekováno 34 neznámých vniknutí.") fixf.message = "For 15 days posledních detected 34 unknown intrusion.";
             if (fixf.message == "My Log: Dalsí pocítace, mrknu do nich mozná se mi povede otevrít ty velký vrata.") fixf.message = "My Log: more computers, look for them, maybe I will open those big doors.";
             if (fixf.message == "My Log: Výrobní linka tedka nic nevyrábí. Mercenary poslední dobou nemají naquadah.") fixf.message = "My Log: The production line is now on nothing does not. Mercenary lately have naquadah.";
             if (fixf.message == "My Log: Ted jsem vysel z továrny a jsem v nejakých skladech. Tudy asi ty zbrane vyvázejí nahoru tím hákem a pak ven.") fixf.message = "My Log: Now I came from the factory and I was in some stores. This way, about those weapons exported by hook up and then out.";
             if (fixf.message == "My Log: Skladiste zbraní. V tech bednách musí být hafo zbraní, není divu kdyz Mercenary válcí se Skaarj.") fixf.message = "My Log: weapons warehouse. In those boxes, the hafo weapons, no wonder he Mercenary War Skaarj.";
             if (fixf.message == "My Log: Tyhle skladiste mi prijdou temný jak na nasi lodi Baltar. Mam takový pocit ze je tu nekdo nebo neco schovanýho. Neco temného.") fixf.message = "My Log: These come in a dark warehouse to me as our boat to Baltar. I have a feeling that there is someone or something schovanýho. Something dark.";
             if (fixf.message == ("Poslední mesíc se tu dejí strasné veci. Nemluví se o nicem jiném nez o mizejíchích Mercenary. Nedávno sem byl v té nejtemnejsí stole v dolech, "$"bylo tam pár nasich vojákú jak jsou postupne zabíjeni rudými prízraky, nebo co to mohlo jen bejt. Pak jsem tam na chvíli zahléhl i nejakou postavu "$"s hrebíky v hlave. Já jsem radsi na nic necekal a utek. Tu stolu jsem pro jistotu zakryl bednama, ale stejne to na moc dlouho nepomúze.")) fixf.message = ("Last month, the terrible things happening. It speaks of nothing but mizejíchích Mercenary. "$"Recently I was in the darkest table in the mines, there were a few of our soldiers as they are gradually being killed crimson ghosts, or whatever it might just be. Then I went there "$"for a while zahléhl as a figure with a nail in my head. I'd rather not wait for anything and fled. I have a table to hide bednama sure, but it just does not work for very long.");
             if (fixf.message == "My Log: Tyhle skladiste mi prijdou temný jak na nasi lodi Baltar. Mam takový pocit ze je tu nekdo nebo neco schovanýho. Neco temného.") fixf.message = "My Log: These come in a dark warehouse to me as our boat to Baltar. I have a feeling that there is someone or something schovanýho. Something dark.";
             if (fixf.message == ("Na nasí planete se poslední dobou deje neco podivného. Mizejí nám za záhadných okolností Mercenary. Ze zacátku to bylo v dolech,"$" ale ted se to stalo párkrát i v továrne na zbrane. Musí tu být neco strasného. Vsichni tu mají strach uz ani nevyrábíme. Posledních pár odvázlivcú jeste pracuje v "$"dolech aby jsme byly vúbec schopni se bránit proti Skaarj.")) fixf.message = ("On our planet the last time something was strange. We are disappearing under mysterious circumstances Mercenary. From the beginning, it was in the mines, but now this happened a few times even in "$"factories producing arms. There must be something terrible. We all have fears or had not produced. The last couple of courageous still working in the mines that we were not able to defend itself against Skaarj.");
             if (fixf.message == "My Log: Tady dole je dost horko. Mercenary tu pálí veskerý svúj odpad.") fixf.message = "My Log: down here is pretty hot. Mercenary have burned all their waste.";
             if (fixf.message == "Spalovna odpadu jede na 13%.") fixf.message = "Spalovna odpadu each na 13%.";
             if (fixf.message == "My Log: Tohle musí být zadní vchod do hlavní základny.") fixf.message = "My Log: This must be the rear entrance to the main base.";
             if (fixf.message == "My Log: To musí být nejaký supervýkoný pocítac, no mrneme se. Musí to být neco dúlezitého ze to bylo tak dobre schovaný.") fixf.message = "My Log: This must be some supervýkoný computer, with no kid. It must be something important that was so well hidden.";
             if (fixf.message == "Chces se podívat do virtuální reality? Pak vstup do budky.") fixf.message = "Want to see the virtual reality? Then enter the booth.";


              if (fixf.message == "My Log: Znám mnohem príjemnejsí místa nez tuhle továrnu. To aby mel clovek strach aby ho neco nekde nesezralo.") fixf.message = "My Log: I know a much nicer place than this factory. That the man should make him fear anything ever eaten.";
                                 }
         }

              foreach AllActors(Class'specialevent', fixe)
          { if (  fixe != None )
                 {

           if (fixe.message == "Gavitacní výtah nahoru.")
           {// lift message
           fixe.message = "";
           fixe.bBroadcast=false;

           }                         }
          }

          Log("Found And Applied Changes To Map :  23 Sirius - War Factory");

     }

     if(Level.Title =="Sirius - HeadQuarter")
     {       // All fixes for  24 Sirius - HeadQuarter
             foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
             if (fixf.message == "My Log: Ted bych mel zjistit co se deje a co budu dál delat.") fixf.message = "My Log: Now I should find out what is happening and what I continue to do.";
             if (fixf.message == "V poslední dobe se na Siriusu stále casteji obevují nejací rudí démoni. Nekterí si myslí, ze díky nenávisti, která v soucasnosti ve vesmíru panuje.") fixf.message = "Recently, more and more on Sirius obevují Some reds demons. Some think that because of hatred, which currently exists in the universe.";
             if (fixf.message == "Na Tau'ri se prý taky obevujíi nejací démoni jiz po staletí. Jeden znich (asi nejaký jejich vúdce) má hrebíky v hlave. Toho prý zabili v roce 2077 na nejaký stanici u Tau'ri. Jenze nekterí prý videli podobného démona v dolech.") fixf.message = "Tau'ri to be said, too obevujíi Some demons for centuries. One of them (probably some of their leaders) have a nail in my head. It apparently was killed in 2077 at a station at the Tau'ri. But Some have seen like a demon in the mines.";
             if (fixf.message == "My Log: Konecne jsem se dostal do rídícího centra. Snad tu najdu nejaké informace a ovládání dverí k dokúm.") fixf.message = "My Log: Finally got to the control center. Perhaps I can find some information and the door control to dock.";
             if (fixf.message == "Skaarj se chystají zaútocit na Sirius. Tuto bitvu bychom prohráli, proto prevázíme nase technologie na nasi tajnou planetu Chicken Itza vzdálenou 600.000.000km") fixf.message = "Skaarj plan to attack on Sirius. We lost this battle, because prevázíme our technology to our secret planet 600 million kilometers distant Chicken Itza";
             if (fixf.message == "Pred nedávnem jsme úspesne ukradli Krallúm vetsinu jejich lodí. Bohuzel pri dalsích bojích se Skaarj jsme spoustu lodí ztratili.") fixf.message = "Recently we have successfully stolen Krallúm most of their ships. Unfortunately, during fights with other Skaarj we lost a lot of ships.";
             if (fixf.message == "My Log: Na této planete uz není treba delat neco dalsího Mercenary toto místo opoustejí. Takze nahodit motory a rychle na planetu Chicken Itza nez sem dorazí Skaarj.") fixf.message = "My Log: On this planet, she does not need to do something else instead of this left the Mercenary. So fire up the engines and quickly Planet Chicken Itza before they get here Skaarj.";
             if (fixf.message == "My Log: Rídící centrum dokú. Trochu se v tom pohrabu, snad se mi povede získat prístup do lode.") fixf.message = "My Log: Control Center dock. Bit in the dig, perhaps I will gain access to the ship.";
                                                   }
         }

              foreach AllActors(Class'specialevent', fixe)
          { if (  fixe != None )
                 {

           if (fixe.message == "Poplach. Neoprávnené otevrení lode. Vsechny jednotky do dokú.") fixe.message = "Alarm. Unauthorized otevr(ená ship. All units in the dock.";
                                    }
          }

        Log("Found And Applied Changes To Map : 24 Sirius - HeadQuarter");

     }

      if(Level.Title =="HyperSpeed Fly")
     {       // All fixes for  2HyperSpeed Fly

              foreach AllActors(Class'specialevent', fixe)
          { if (  fixe != None )
                 {

           if (fixe.message == "Nahodit motory a muzu letet k planete Chicken Itza") fixe.message = "Crank engines, and I can fly to the planet Chicken Itza";
           if (fixe.message == "Precházím na hyperrychlost.") fixe.message = "...Zoom!";
           if (fixe.message == "Tak jsem na míste a ted se jenom transportuji kruhy na planetu.") fixe.message = "So I was on the spot and now it just transports circles on the planet.";
                                    }
          }



     }




     if(Level.Title =="Chicken Itza - Lost Palaces")
     {       // All fixes for  25 Chicken Itza - Lost Palaces


         foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
             if (fixf.message == "My Log: Tak jsem na planete Chicken Itza. Mercenary tu nekde mají tajnou základnu.") fixf.message = "My Log: Well, I'm on the planet Chicken Itza. Mercenary's sometimes have a secret base.";
             if (fixf.message == "My Log: O této planete jsem kdysi neco zaslech. Je to prý nejmensí obyvatelná planeta, kterou známe. Denní cyklus tu trvá pouhých 14 hodin a teplo tu taky moc není.") fixf.message = "My Log: On this planet, I once overheard something. It is apparently the least habitable planet we know. Diurnal cycle that lasts only 14 hours and the heat is too much.";
             if (fixf.message == "My Log: Tak a kudy ted, podzemí Chicken Itza je doslova protkáno systémem podzemních chodeb.") fixf.message = "My Log: Well, where do we, underground Chicken Itza is literally interwoven with a system of underground tunnels.";
             if (fixf.message == "My Log: Tohle místo se mi moc nelíbí, mám zase ten pocit ze tu nekde jsou pekelní démoni.") fixf.message = "My Log: This place I really like it, I regain the feeling that somewhere the demons of hell.";
             if (fixf.message == "My Log: Tohle je pekne spletitý podzemí. Nemám páru kde vlastne jsem.") fixf.message = "My Log: This is a pretty intricate underground. I have no idea where I am.";
            // if (fixf.message == "Poslední dobou se dejí podivné veci, nase domovská planeta Sirius se zacala plnit nákými démony, utrpeli jsme tezké ztráty v boji se Skaarj a nejaký cizinec se nás snazí dorazit. Musíme se na nejaký cas schovat v majském meste na severovýchode nez se situace trochu uklidní.") fixf.message = "Last time plot with strange things, our home planet Sirius started to play with nákými demon Heavy suffering we shall lose the fight with a cizinec Skaarj and tries to arrive with us. We forward to some time in the hide majském city in the northeast than the situation of the three se calmed.";
             if (fixf.message == "My Log: Sakra, tohle je bludiste velký jako prase. Nemohu se od tud vymotat, mam pocit ze chodím furt dokola. A jeste jsou tu vsude pekelní démoni.") fixf.message = "My Log: Damn, this is a big maze like a pig. I can not get out of here, I get the feeling of walking around all the time. And still there are the demons of hell everywhere.";
             if (fixf.message == "My Log: V této cásti podzemí je nejak velká zima. Nechápu to, vsude je zhuba stejná teplota a tady je zima.") fixf.message = "My Log: This part is underground, a great winter. I do not understand, everything is zhuba same temperature and there is winter.";
             if (fixf.message == "TEN KDO CTE TYTO RÁDKY JIZ NIKDY NESPATRÍ SVETLO SVETA ") fixf.message = "TEN who reads these lines JIZ never see the light of day";
             if (fixf.message == "My Log: Uf nastestí tu byla voda. Tak je mi to jasný kde se bere ta zima, ted budu muset najít cestu zpátky nahoru.") fixf.message = "My Log: Uf Fortunately, there was water. So it's clear to me which takes the cold, now I have to find my way back up.";
             if (fixf.message == "My Log: Co je tohle za tunel? Proc je tak velký? Kdo ho mohl vytvorit? A kam asi vede? Znám jen jediný zpúsob jak to zjistit.") fixf.message = "My Log: What's this tunnel? Why is it so big? Who could make? And what about you? I know only one way to find out.";
             if (fixf.message == "My Log: Tak s temito vraty jen tak nepohnu. Co za nimi tak múze bejt?") fixf.message = "My Log: Well, with these gates, just move. What has them so it can be?";
             if (fixf.message == "Spadl jsem do tohohle tunelu. Mam strach z toho co me tu múze cekat. Ríká se ze tento spletitý systém tunelú je pod celou planetou Chicken Itza a ze vede az do samotného pekla a kdo ví kam jeste.") fixf.message = "I fell into this tunnel. I fear what I could expect here. They say this is a complex system of tunnels under the entire planet, Chicken Itza, and the lead up to the very hell and who knows where else.";
             if (fixf.message == "My Log: Tyhle vrata jsou pootevrený tak se tam mrknu.") fixf.message = "My Log: These doors are ajar and there look.";
             if (fixf.message == "My Log: Co je tohle za odporné místo utrpení. Vsude je spoustu krve, vnitrností a lidkého masa. Delá se mi z toho blbe.") fixf.message = "My Log: What a disgusting place of suffering. Everywhere there is a lot of blood, guts and lidkého meat. It makes me feel sick.";
             if (fixf.message == "My Log: Dalsí mayské piramidy. Podobné piramidy jsou prej po celé planete Chicken Itza, bude teské vypátrat úkryt Mercenary.") fixf.message = "My Log: Another Mayan Piramide. Similar Piramide are taken across the globe Chicken Itza, will find refuge heavy Mercenary.";
             if (fixf.message == "Netusim jak se dá dostat pres tyhle kamený vrata. Zaslechl jsem od Mercenary ze se dají otevrít nejakou pákou, která je schovaná v nejaké piramide.") fixf.message = "I have no idea how you can get through these gates stones. Heard from the Mercenary can open a lever that is hidden in some Piramide.";
             if (fixf.message == "My Log: Zacíná na me zase padat únava. Najdu si tu nekde pekný místecko na prespání.") fixf.message = "My Log: Zacíná to me zase padat únava. Najdu the tu nekde pekný místecko that prespání.";
             if (fixf.message == "My Log: No tak tady bych mohl na chvíli slozit hlavu. Není to sice hotel Hilton, ale to bude stacit.") fixf.message = "My Log: Come here for a while I could lay your head. That's not a Hilton hotel, but it will do.";
                                                      }
         }


             // Add Brodcast Message
                 templocation.X = 10106.561523;   templocation.Y = -2244.421875;  templocation.Z = -479.898621;
                 seventp=Spawn(Class'sse',,,fixg.location);  if (  seventp != None )
                 {
                   seventp.message="Gate To Exit Passage Has Been Opened";
                   seventp.bBroadcast=true;
                   seventp.tag='doorl';
                 }


        Log("Found And Applied Changes To Map : 25 Chicken Itza - Lost Palaces");

     }


     if(Level.Title =="Chicken Itza - Town")
     {       // All fixes for  26 Chicken Itza - Town

         foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
             if (fixf.message == "My Log: To jsem se krásne prospal. Takze ted bych mel být u mayského mesta. Mercenary tu mají skrytou pozici.") fixf.message = "My Log: This I slept wonderfully. So now I should be at the Mayan city. Mercenary there are hidden position.";
                                          }
         }



                 // hehe wouldnt it be awsome to do a view from the door ? lol
                 // done.
                 // viewtrigger - View door and watch it open
                 ///actNewClass = class<actor>( DynamicLoadObject("copyit.ss_viewspottrig26", class'Class' ) );
                 ///templocation.X = 7052.287598;   templocation.Y = -5762.299805;  templocation.Z = -951.898987;
                /// actaPawn=Spawn(actNewClass,,,templocation);

                 // Add Brodcast Message
                //templocation.X = 11003.896484;   templocation.Y = -2422.407227;  templocation.Z = -463.902039; // just use last loc
                 seventp=Spawn(Class'sse',,,fixg.location);  if (  seventp != None )
                 {
                   seventp.message="Door To Chicken Itza - Cellars Has Been Opened";
                   seventp.bBroadcast=true;
                   seventp.tag='DoorEnd';
                   seventp.sound=Sound(DynamicLoadObject("sskeysnd",Class'Sound'));
                 }

                 // cant spawn in beginplay...
                //kleer
                // templocation.X = 6647.636230;   templocation.Y = -6304.999023;  templocation.Z = -759.897583;
                // actNewClass = class<actor>( DynamicLoadObject("MoreMod.Kleer", class'Class' ) ); actaPawn=Spawn(actNewClass,,,templocation);
                //  if (   actaPawn == None )
                // { // yeah it will fail in 225, need a better fallback./
                //   actaPawn=Spawn(class'woodenbox',,,templocation);

                // }

                Log("Found And Applied Changes To Map : 26 Chicken Itza - Town");
     }

     if(Level.Title =="Chicken Itza - Cellars")
     {    // All fixes for  27 Chicken Itza - Cellars

          foreach AllActors(Class'teleporter', teepee)
          {
           if ( teepee.url =="WormHole5#pod?peer")   {  teepee.url="28Palace#";}

          }


          foreach AllActors(Class'scriptedpawn',   scoot)
          { // dont let boss get copied.
           if ( scoot.health > 2000)   {  scoot.tag='copy';}

          }

         //messages
          foreach AllActors(Class'translatorevent', fixf)
         {   if (  fixf != None )          {
             if (fixf.message == "My Log: Takze nekde tady by se meli skrývat Mercenary. Snad tu najdu i jejich vúdce.") fixf.message = "My Log: So, somewhere there should hide Mercenary. Hopefully I can find their leader.";
             if (fixf.message == "My Log: Tohle jsou jediný dvere které sly otevrít. Snad najdu zpúsob jak se dostat do tech ostatních.") fixf.message = "My Log: This is the only one who heard the door open. Perhaps find a way to get to the others.";
             if (fixf.message == "Dostali jsme zprávu ze nase planeta Sirius byla jiz obsazena Skaarj. Nás posledních pár Mercenary se ukrývá v techto sklepení. Bohuzel jsme museli nechat nase technologie napospas osudu. Skaarj by nás mohli kvuli nim detekovat.") fixf.message = "We received a message from our planet Sirius were already Skaarj. Our last couple of Mercenary are hiding in these dungeons. Unfortunately we had to keep our technology at the mercy of fate. Skaarj we would be able to detect because of them.";
             if (fixf.message == "Vypadá to ze budeme muset náký ten cas zústat ukryti v techto sklepeních. Nasi spioni zjistily ze rasa Brute chce zacít válku proti Skaarj. Myslí si ze mohou za porázku Krall.") fixf.message = "Looks like we have got any of that time remain hidden in these cellars. Our spies have found that race Brutus wants to start a war against Skaarj. They think they can defeat the Krall.";
             if (fixf.message == "Donedávna Brute neopoustely planetu Pharao. Ale po tom co pred pár dny byly vyhlazeni Kralls. Zacínají plánovat expanzi na dalsí planety. Chtejí zacít válcit proti Skaarj. Myslí si ze je Skaarj zradily.") fixf.message = "Until recently, Brutus did not leave the planet Pharao. But after what the last few days have been cut off Kralls. Begin to plan for expansion to other planets. Want to start war against Skaarj. They think of it Skaarj betrayed.";
             if (fixf.message == "My Log: Tak to by bylo. Vúdce Mercenary je mrtev. Takze dalsí neprátelská rasa je nyní na ceste k vyhubení. Ted je na rade rasa Brute. Mel bych zakrocit co nejdrív nez zacnou expandovat. Ale neznám adresu jejich planety Pharao.") fixf.message = "My Log: So this is it. Mercenary leader is dead. So other hostile race is now on its way to extinction. Now the next race Brutus. Should I take action as soon as they start to expand. But I do not know the address of their planet Pharao.";
             if (fixf.message == "My Log: Mozná by bylo dobrý se poohlídnout po adrese Pharaa. Mozná bude nekde tady v knihovne.") fixf.message = "My Log: Maybe it would be good to address the poohlídnout Pharao. Maybe there will be somewhere in the library.";
             if (fixf.message == "My Log: Tak jsem se konecne dostal za ty poslední dvere. Uvidím co tu Mercenary mají.") fixf.message = "My Log: Well, I finally got in the last door. I'll see what we have Mercenary.";
             if (fixf.message == "My Log: A tady je neco zajímavého. Adresa planety Pharao a poloha brány tady na Chicken Itza, to práve potrebuju.") fixf.message = "My Log: And here's something interesting. Address Pharao planets and the position taken here at Chicken Itza, it is the need.";

                                                     }
         }



        Log("Found And Applied Changes To Map : 27 Chicken Itza - Cellars");
     }

     //---new set--//



      if(Level.Title =="Pharao - Palace")
     {       // All fixes for  28 Pharao - Palace

         foreach Allactors(class'mover',mvr)
         { // generic movers
         //  mvr.openingsound = thesound2;
         //  mvr.closingsound = thesound2;
         //  mvr.closedsound = none;
         //  mvr.openedsound = none;
         //  mvr.moveambientsound = none;
         }

         // mover key
         foreach Allactors(class'mover',mvr)
         {
           if(mvr.name == 'mover30')
           {  // the switch
          // mvr.openingsound = thesound;
         //  mvr.closingsound = thesound;

           }

         }


         // same minigun
         actNewClass = class<actor>( DynamicLoadObject("moremod.sammini", class'Class' ) );
         templocation.X = 0.000000;   templocation.Y = -256.000000;  templocation.Z = 100.000000;
         actaPawn=Spawn(actNewClass,,,templocation);
         if (   actaPawn == None )       { actaPawn=Spawn(class'minigun',,,templocation);            }

         // sam armor
         actNewClass = class<actor>( DynamicLoadObject("MoreMod.Armour", class'Class' ) );
         templocation.X = 0.000000;   templocation.Y = 256.000000;  templocation.Z = 48.000000;
         actaPawn=Spawn(actNewClass,,,templocation);
         if (   actaPawn == None )   {      actaPawn=Spawn(class'armor',,,templocation);      }
        // todo door cutscene
        actNewClass = class<actor>( DynamicLoadObject("copyit.ss_viewspottrig28", class'Class' ) );
        templocation.X = 1.517585;   templocation.Y = -2994.167236;  templocation.Z = 520.098633;
        actaPawn=Spawn(actNewClass,,,templocation);

       // add brodcast message
         templocation.X = 1.517585;   templocation.Y = -2994.167236;  templocation.Z = 520.098633;
         seventp=Spawn(Class'sse',,,fixg.location);  if (  seventp != None )
                 {
                   seventp.message="Door To Chicken Itza - Cellars Has Been Opened";
                   seventp.bBroadcast=true;
                   seventp.tag='Door1';
                   seventp.sound=Sound(DynamicLoadObject("sskeysnd",Class'Sound'));
                 }

         //messages
         foreach AllActors(Class'translatorevent', fixf)
         { if (  fixf != None )          {
             if (fixf.message == "My Log: Tak konecne na planete Pharao. Po dlouhé dobe na nejaké teplejsí planete. Zdá se, ze jsem dorazil vcas. Brute jeste nezacali expandovat. Mel bych nejdrív zjistit kde je hlavní vúdce Brute.") fixf.message = "My Log: So, finally on the planet Pharao. After a long time for some warmer planet. It seems that I arrived on time. Brutus started yet expand. Should I ascertain promptly is the main leader Brutus.";
             if (fixf.message == "My Log: Zatím jsem nic zajímavého neobevil. Nezbývá mi nic nez pátrat dál.") fixf.message = "My Log: So far I have nothing interesting neobevil. Only remains for me nothing more than investigate.";
                                         }
         }


       Log("Found And Applied Changes To Map :  28 Pharao - Palace");
     }


     if(Level.Title =="Pharao - Central Town")
     {       // All fixes for  29 Pharao - Central Town
          foreach Allactors(class'mover',mvr)
         { // generic
         ///  mvr.openingsound = thesound2;
         ///  mvr.closingsound = thesound2;
         ///  mvr.closedsound = none;
         ///  mvr.openedsound = none;
         ///  mvr.moveambientsound = none;
         }

          foreach AllActors(class'actor', actaPawn)
         {

              if (actaPawn.isa('monstercopier3') )
              {
              actaPawn.destroy();
              Log("Pharao - Central Town - monster copier disabled");
              }  // on second thought dont let anything copy..

         }

     }

     if(Level.Title =="Pharao - Catacombs")
     {       // All fixes for  30 Pharao - Catacombs
           foreach Allactors(class'mover',mvr)
         { // generic
         ///  mvr.openingsound = thesound2;
         ///  mvr.closingsound = thesound2;
         ///  mvr.closedsound = none;
         ///  mvr.openedsound = none;
        ///   mvr.moveambientsound = none;
         }
     }

     if(Level.Title =="Pharao - Lost City")
     {     // All fixes for  31 Pharao - Lost City
         foreach Allactors(class'mover',mvr)
         { // generic
         ///  mvr.openingsound = thesound2;
         ///  mvr.closingsound = thesound2;
         ////  mvr.closedsound = none;
         ///  mvr.openedsound = none;
         ///  mvr.moveambientsound = none;
         }
     }

     if(Level.Title =="Pharao - Piramide")
     {   // All fixes for  32 Pharao - Piramide
          foreach Allactors(class'mover',mvr)
         { // generic
         ///  mvr.openingsound = thesound2;
         ///  mvr.closingsound = thesound2;
         ///  mvr.closedsound = none;
         ///  mvr.openedsound = none;
          // mvr.moveambientsound = none;
         }
     }

     if(Level.Title =="Shinigami - Sarevok")
     {       // All fixes for  33 Shinigami - Sarevok

     }

     if(Level.Title =="Shinigami - Dark Wood")
     {       // All fixes for  34 Shinigami - Dark Wood

     }

     if(Level.Title =="Shinigami - Monastery")
     {       // All fixes for  35 Shinigami - Monastery

     }

     if(Level.Title =="Shinigami - Amarok")
     {       // All fixes for  36 Shinigami - Amarok

     }

     if(Level.Title =="Shinigami - Amarok Castle")
     {       // All fixes for  37 Shinigami - Amarok Castle

     }

     if(Level.Title =="Shinigami - Burial underground")
     {       // All fixes for  38 Shinigami - Burial underground

     }

     if(Level.Title =="Soulstone - Ruins of Giant Town")
     {       // All fixes for  39 Soulstone - Ruins of Giant Town

     }

     if(Level.Title =="Soulstone - Underworld")
     {       // All fixes for  40 Soulstone - Underworld

     }

     if(Level.Title =="SoulStone - Stonehenge")
     {       // All fixes for  41 SoulStone - Stonehenge

     }

     if(Level.Title =="Tau'ri - Stargateport")
     {       // All fixes for  42 Tau'ri - Stargateport

     }

     if(Level.Title =="Tau'ri - City of Steel")
     {       // All fixes for  43 Tau'ri - City of Steel
           // fix  possibility to spawn in the shaft bottom.
           templocation.X = 2814.170898;
           templocation.Y = -10.341005;
           templocation.Z = 1707.927002;
           actNewClass = class<actor>(  DynamicLoadObject("copyit.city43fix", class'Class' ) );
           actaPawn=Spawn(actNewClass,,,templocation);


     }

     if(Level.Title =="Tau´ri - Old Section")
     {       // All fixes for  44 Tau´ri - Old Section
       // simply answer to the lamer bots
       consolecommand("set bots bblockplayers false");
     }

     if(Level.Title =="Tau'ri - High Town")
     {       // All fixes for  45 Tau'ri - High Town

     }

       if(Level.Title =="Tau'ri - SpacePort")
     {       // All fixes for  46 Tau'ri - SpacePort

     }

}

defaultproperties
{
}
