(*=============================*)
(*  TransferCouplingsPerpPara  *)
(*=============================*)

Transfer$CouplingsPerpParaSolutions={};
tmp=BetPerpPara0m PT0m[e,f,g]PTPara[-e,-f,-g,a,v,w]- PB0p[x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],BetPerpPara0p][[1]]];
tmp=BetPerpPara1p PT1p[-n,-m,e,f]PTPerp[-e,-f,a,v,w]- PB1p[-q,-r,x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],BetPerpPara1p][[1]]];
tmp=BetPerpPara1m  PT1m[-n,e,f,g]PTPara[-e,-f,-g,a,v,w]- PB1m[-q,z]PBPerp[-z,i,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],BetPerpPara1m][[1]]];
tmp=BetPerpPara2p PT2m[-n,-m,-o,e,f,g]PTPara[-e,-f,-g,a,v,w]- PB2p[-q,-r,x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])/.PO3TActivate/.PADMTActivate . PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],BetPerpPara2p][[1]]];
tmp=AlpPerpPara0p PR0p[e,f,g,h]Antisymmetrize[PRPara[-e,-f,-g,-h,a,b,v,w],{a,b}]- PA0p[x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPara0p][[1]]];
tmp=AlpPerpPara0m PR0m[e,f,g]Antisymmetrize[PRPerp[-e,-f,-g,a,b,v,w],{a,b}]- PA0m[x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPara0m][[1]]];
tmp=AlpPerpPara1p PR1p[-n,-m,e,f,g,h]Antisymmetrize[PRPara[-e,-f,-g,-h,a,b,v,w],{a,b}]- PA1p[-p,-q,x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPara1p][[1]]];
tmp=AlpPerpPara1m PR1m[-n,e,f,g]Antisymmetrize[PRPerp[-e,-f,-g,a,b,v,w],{a,b}]- PA1m[-p,x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPara1m][[1]]];
tmp=AlpPerpPara2p PR2p[-n,-m,e,f,g,h]Antisymmetrize[PRPara[-e,-f,-g,-h,a,b,v,w],{a,b}]- PA2p[-p,-q,x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPara2p][[1]]];
tmp=AlpPerpPara2m PR2m[-n,-m,-o,e,f,g]Antisymmetrize[PRPerp[-e,-f,-g,a,b,v,w],{a,b}]
- PA2m[-q,-p,-r,x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]PPara[v,-c]PPara[w,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3TActivate/.PADMTActivate/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpParaSolutions=Join[Transfer$CouplingsPerpParaSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPara2m][[1]]];

DumpSave[xAct`HiGGS`Private`BinaryLocation[],{Transfer$CouplingsPerpParaSolutionsDUMMY}];
