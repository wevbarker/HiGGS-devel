(*=================================*)
(*  ProjectionNormalisationsCheck  *)
(*=================================*)

xAct`HiGGS`Private`HiGGSPrint[Style["B0p",Blue,20]];
tmp=PB0p[g,h]PBPara[-g,-h,-n,-m]PB0p[e,f]PBPara[-e,-f,n,m]-(1/cPerpB0p)/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["B1p",Blue,20]];
tmp= PB1p[-x,-y,g,h]PBPara[-g,-h,-n,-m]PB1p[u,v,e,f]PBPara[-e,-f,n,m]-(1/cPerpB1p) Antisymmetrize[Antisymmetrize[PPara[-x,u]PPara[-y,v],{-x,-y}],{u,v}]/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["B1m",Blue,20]];
tmp= PB1m[-x,h]PBPerp[-h,-n,-m]PB1m[u,f]PBPerp[-f,n,m]-(1/cPerpB1m) PPara[-x,u]/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["B2p",Blue,20]];
tmp= PB2p[-x,-y,g,h]PBPara[-g,-h,-n,-m]PB2p[u,v,e,f]PBPara[-e,-f,n,m]-(1/cPerpB2p) Symmetrize[Symmetrize[PPara[-x,u]PPara[-y,v],{-x,-y}],{u,v}]/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["A0p",Red,20]];
tmp= Antisymmetrize[ PA0p[g,h]PAPerp[-g,-h,-n,-m,-o],{-n,-m}]PA0p[e,f]PAPerp[-e,-f,a,b,c]G[n,-a]G[m,-b]G[o,-c]-(1/cPerpA0p)/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["A0m",Red,20]];
tmp= Antisymmetrize[PA0m[g,h,i]PAPara[-g,-h,-i,-n,-m,-o],{-n,-m}]PA0m[e,f,j]PAPara[-e,-f,-j,a,b,c]G[n,-a]G[m,-b]G[o,-c]-(1/cPerpA0m)/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["A1p",Red,20]];
tmp= Antisymmetrize[PA1p[-x,-y,g,h]PAPerp[-g,-h,-n,-m,-o],{-n,-m}]PA1p[u,v,e,f]PAPerp[-e,-f,a,b,c]G[n,-a]G[m,-b]G[o,-c]-(1/cPerpA1p) Antisymmetrize[Antisymmetrize[PPara[-x,u]PPara[-y,v],{-x,-y}],{u,v}]/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["A1m",Red,20]];
tmp= Antisymmetrize[PA1m[-x,g,h,i]PAPara[-g,-h,-i,-n,-m,-o],{-n,-m}]PA1m[u,e,f,j]PAPara[-e,-f,-j,a,b,c]G[n,-a]G[m,-b]G[o,-c]-(1/cPerpA1m) PPara[-x,u]/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["A2p",Red,20]];
tmp= Antisymmetrize[PA2p[-x,-y,g,h]PAPerp[-g,-h,-n,-m,-o],{-n,-m}]PA2p[u,v,e,f]PAPerp[-e,-f,a,b,c]G[n,-a]G[m,-b]G[o,-c]-(1/cPerpA2p) Symmetrize[Symmetrize[PPara[-x,u]PPara[-y,v],{-x,-y}],{u,v}]/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
xAct`HiGGS`Private`HiGGSPrint[Style["A2m",Red,20]];
tmp= Antisymmetrize[ PA2m[-x,-y,-z,g,h,i]PAPara[-g,-h,-i,-n,-m,-o],{-n,-m}]PA2m[u,v,w,e,f,j]PAPara[-e,-f,-j,a,b,c]G[n,-a]G[m,-b]G[o,-c]-(1/cPerpA2m) Antisymmetrize[Antisymmetrize[PPara[-x,u]PPara[-y,v]PPara[-z,w],{-x,-y}],{u,v}]/.TocPerp/.NewPO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
xAct`HiGGS`Private`HiGGSPrint[tmp];
