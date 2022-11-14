(*============================*)
(*  ProjectionNormalisations  *)
(*============================*)

Solutions={};
tmp=PB0pT[-n,-m,a,c]-cPerpB0p PB0p[g,h]PBPara[-g,-h,-n,-m]PB0p[e,f]PBPara[-e,-f,a,c]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpB0p][[1]]];
tmp=PB1pT[-n,-m,a,c]-cPerpB1p PB1p[-x,-y,g,h]PBPara[-g,-h,-n,-m]PB1p[x,y,e,f]PBPara[-e,-f,a,c]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpB1p][[1]]];
tmp=PB1mT[-n,-m,a,c]-cPerpB1m PB1m[-x,h]PBPerp[-h,-n,-m]PB1m[x,f]PBPerp[-f,a,c]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpB1m][[1]]];
tmp=PB2pT[-n,-m,a,c]-cPerpB2p PB2p[-x,-y,g,h]PBPara[-g,-h,-n,-m]PB2p[x,y,e,f]PBPara[-e,-f,a,c]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpB2p][[1]]];
tmp=Antisymmetrize[Antisymmetrize[PA0pT[-n,-m,-o,a,b,c]-cPerpA0p PA0p[g,h]PAPerp[-g,-h,-n,-m,-o]PA0p[e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{a,b}]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpA0p][[1]]];
tmp=Antisymmetrize[Antisymmetrize[PA0mT[-n,-m,-o,a,b,c]-cPerpA0m PA0m[g,h,i]PAPara[-g,-h,-i,-n,-m,-o]PA0m[e,f,j]PAPara[-e,-f,-j,a,b,c],{-n,-m}],{a,b}]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpA0m][[1]]];
tmp=Antisymmetrize[Antisymmetrize[PA1pT[-n,-m,-o,a,b,c]-cPerpA1p PA1p[-x,-y,g,h]PAPerp[-g,-h,-n,-m,-o]PA1p[x,y,e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{a,b}]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpA1p][[1]]];
tmp=Antisymmetrize[Antisymmetrize[PA1mT[-n,-m,-o,a,b,c]-cPerpA1m PA1m[-x,g,h,i]PAPara[-g,-h,-i,-n,-m,-o]PA1m[x,e,f,j]PAPara[-e,-f,-j,a,b,c],{-n,-m}],{a,b}]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpA1m][[1]]];
tmp=Antisymmetrize[Antisymmetrize[PA2pT[-n,-m,-o,a,b,c]-cPerpA2p PA2p[-x,-y,g,h]PAPerp[-g,-h,-n,-m,-o]PA2p[x,y,e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{a,b}]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpA2p][[1]]];
tmp=Antisymmetrize[Antisymmetrize[PA2mT[-n,-m,-o,a,b,c]-cPerpA2m PA2m[-x,-y,-z,g,h,i]PAPara[-g,-h,-i,-n,-m,-o]PA2m[x,y,z,e,f,j]PAPara[-e,-f,-j,a,b,c],{-n,-m}],{a,b}]/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[tmp==0],cPerpA2m][[1]]];
TocPerp=Solutions;

DumpSave[xAct`HiGGS`Private`BinaryLocation["ProjectionNormalisations"],{TocPerp}];
