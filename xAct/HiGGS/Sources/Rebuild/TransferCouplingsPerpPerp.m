(*=============================*)
(*  TransferCouplingsPerpPerp  *)
(*=============================*)

Transfer$CouplingsPerpPerpSolutions={};
tmp=BetPerpPerp0p PB0p[g,h]PBPara[-g,-h,a,e]- PB0p[x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],BetPerpPerp0p][[1]]];
tmp=BetPerpPerp1p PB1p[-q,-r,g,h]PBPara[-g,-h,a,e]- PB1p[-q,-r,x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],BetPerpPerp1p][[1]]];
tmp=BetPerpPerp1m PB1m[-q,h]PBPerp[-h,a,e]- PB1m[-q,z]PBPerp[-z,i,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],BetPerpPerp1m][[1]]];
tmp=BetPerpPerp2p PB2p[-q,-r,g,h]PBPara[-g,-h,a,e]- PB2p[-q,-r,x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],BetPerpPerp2p][[1]]];
tmp=AlpPerpPerp0p PA0p[g,h]Antisymmetrize[PAPerp[-g,-h,a,b,e],{a,b}]- PA0p[x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPerp0p][[1]]];
tmp=AlpPerpPerp0m PA0m[g,h,i]Antisymmetrize[PAPara[-g,-h,-i,a,b,e],{a,b}]- PA0m[x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPerp0m][[1]]];
tmp=AlpPerpPerp1p PA1p[-p,-q,g,h]Antisymmetrize[PAPerp[-g,-h,a,b,e],{a,b}]- PA1p[-p,-q,x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPerp1p][[1]]];
tmp=AlpPerpPerp1m PA1m[-p,g,h,i]Antisymmetrize[PAPara[-g,-h,-i,a,b,e],{a,b}]- PA1m[-p,x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPerp1m][[1]]];
tmp=AlpPerpPerp2p PA2p[-p,-q,g,h]Antisymmetrize[PAPerp[-g,-h,a,b,e],{a,b}]- PA2p[-p,-q,x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPerp2p][[1]]];
tmp=AlpPerpPerp2m PA2m[-q,-p,-r,g,h,i]Antisymmetrize[PAPara[-g,-h,-i,a,b,e],{a,b}]- PA2m[-q,-p,-r,x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Transfer$CouplingsPerpPerpSolutions=Join[Transfer$CouplingsPerpPerpSolutions,Solve[ToConstantSymbolEquations[tmp==0],AlpPerpPerp2m][[1]]];

DumpSave[xAct`HiGGS`Private`BinaryLocation["TransferCouplingsPerpPerp"],{Transfer$CouplingsPerpPerpSolutionsDUMMY}];
