(* ::Package:: *)

(* ::Input::Initialization:: *)
Print[Style["Setting up perturbations",20,Blue]]
SetOptions[$FrontEndSession,EvaluationCompletionAction->"ScrollToOutput"]
ClearAll/@ Names["Global`*"];
Get["variations`"];
Needs["xAct`xTras`"];

SuperTheory=TheoryCase17;

dimension=4;                                  (* dimension of space-time manifold *)
DefManifold[M4,dimension,IndexRange[{a,z}]];
DefMetric[-1,G[-a,-c],CD,{";","\[Del]"},PrintAs->"g"];
DefTensor[R[a,b,-d,-e],M4,{Antisymmetric[{a,b}],Antisymmetric[{-d,-e}]}];
DefTensor[T[a,-b,-c],M4,Antisymmetric[{-b,-c}]];
DefTensor[W[a,b,-d,-e],M4];
DefTensor[PR1[-a,-b,-c,-d,e,f,g,h],M4];
DefTensor[PR2[-a,-b,-c,-d,e,f,g,h],M4];
DefTensor[PR3[-i,-k,-l,-m,a,b,c,d],M4];
DefTensor[PR4[-i,-k,-l,-m,a,b,c,d],M4];
DefTensor[PR5[-i,-k,-l,-m,a,b,c,d],M4];
DefTensor[PR6[-i,-k,-l,-m,a,b,c,d],M4];
DefTensor[PW[-i,-k,-l,-m,a,b,c,d],M4];
DefTensor[PT1[-a,-b,-c,e,f,g],M4];
DefTensor[PT2[-a,-b,-c,e,f,g],M4];
DefTensor[PT3[-a,-b,-c,e,f,g],M4];
DefTensor[A1[],M4];

(*
PWActivate=MakeRule[{PW[-i,-k,-l,-m,a,b,c,d],G[a,-i]G[b,-k]G[c,-l]G[d,-m]+(1/2)(G[b,d]G[a,-i]G[c,-m]G[-k,-l]-G[b,d]G[a,-i]G[c,-l]G[-k,-m]+G[b,d]G[a,-k]G[c,-l]G[-i,-m]-G[b,d]G[a,-k]G[c,-m]G[-i,-l])+(1/6)G[a,c]G[b,d](G[-i,-l]G[-k,-m]-G[-i,-m]G[-k,-l])},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PR1Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(2/3)G[s,-i]G[r,-n](2G[p,-j]G[q,-m]+G[p,-m]G[q,-j])(1/2)(Symmetrize[PW[-s,-p,-q,-r,a,b,c,d]+PW[-s,-r,-q,-p,a,b,c,d],{-s,-q}]),{-i,-j}],{-m,-n}],{a,b}],{c,d}]/.PWActivate//ToCanonical;
PR1Activate=MakeRule[{PR1[-i,-j,-m,-n,a,b,c,d],Evaluate[PR1Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PR2Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(1/2)(PW[-i,-j,-m,-n,a,b,c,d]-PW[-m,-n,-i,-j,a,b,c,d]),{-i,-j}],{-m,-n}],{a,b}],{c,d}]/.PWActivate//ToCanonical;
PR2Activate=MakeRule[{PR2[-i,-j,-m,-n,a,b,c,d],Evaluate[PR2Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PR3Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(-1/4)(1/6)epsilonG[-i,-j,-m,-n]epsilonG[a,b,c,d],{-i,-j}],{-m,-n}],{a,b}],{c,d}]//ToCanonical;
PR3Activate=MakeRule[{PR3[-i,-j,-m,-n,a,b,c,d],Evaluate[PR3Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PR4Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(1/2)(G[-i,-m]G[x,-j]G[y,-n]+G[-j,-n]G[x,-i]G[y,-m]-G[-j,-m]G[x,-i]G[y,-n]-G[-i,-n]G[x,-j]G[y,-m])(Symmetrize[G[-x,a]G[-y,c]G[b,d],{-x,-y}]-(1/4)G[-x,-y]G[b,d]G[a,c]),{-i,-j}],{-m,-n}],{a,b}],{c,d}]//ToCanonical;
PR4Activate=MakeRule[{PR4[-i,-j,-m,-n,a,b,c,d],Evaluate[PR4Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PR5Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[(1/2)(G[-i,-m]G[x,-j]G[y,-n]+G[-j,-n]G[x,-i]G[y,-m]-G[-j,-m]G[x,-i]G[y,-n]-G[-i,-n]G[x,-j]G[y,-m])Antisymmetrize[G[-x,a]G[-y,c]G[b,d],{-x,-y}],{-i,-j}],{-m,-n}],{a,b}],{c,d}]//ToCanonical;
PR5Activate=MakeRule[{PR5[-i,-j,-m,-n,a,b,c,d],Evaluate[PR5Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PR6Definition=Antisymmetrize[Antisymmetrize[Antisymmetrize[Antisymmetrize[-(1/6)G[b,d]G[a,c](G[-i,-j]G[-m,-n]-G[-i,-m]G[-j,-n]),{-i,-j}],{-m,-n}],{a,b}],{c,d}]//ToCanonical;
PR6Activate=MakeRule[{PR6[-i,-j,-m,-n,a,b,c,d],Evaluate[PR6Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PT1Definition=Antisymmetrize[Antisymmetrize[(4/3)(Symmetrize[G[-i,a]G[-j,b]G[-k,c]+(1/3)G[-k,-i]G[a,b]G[c,-j],{-i,-j}]-(1/3)G[-i,-j]G[a,b]G[c,-k]),{-j,-k}],{b,c}]//ToCanonical;
PT1Activate=MakeRule[{PT1[-i,-j,-k,a,b,c],Evaluate[PT1Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PT2Definition=Antisymmetrize[Antisymmetrize[(2/3)G[-i,-j]G[a,b]G[c,-k],{-j,-k}],{b,c}]//ToCanonical;
PT2Activate=MakeRule[{PT2[-i,-j,-k,a,b,c],Evaluate[PT2Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PT3Definition=Antisymmetrize[Antisymmetrize[(1/6)epsilonG[-i,-j,-k,-m]epsilonG[m,a,b,c],{-j,-k}],{b,c}]//ToCanonical;
PT3Activate=MakeRule[{PT3[-i,-j,-k,a,b,c],Evaluate[PT3Definition]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];

PActivate=Join[PR1Activate,PR2Activate,PR3Activate,PR4Activate,PR5Activate,PR6Activate,PT1Activate,PT2Activate,PT3Activate];

DumpSave["O13Projections.mx",{PActivate}];

Quit[]
*)
<<O13Projections.mx;

(*
Print[Style["checking orthogonality",Blue,16]]

For[ii=1,ii<7,ii++,For[jj=1,jj<7,jj++,If[ii\[NotEqual]jj,Print[ToExpression["PR"<>ToString[ii]<>"[-i,-k,-l,-m,a,b,c,d]PR"<>ToString[jj]<>"[-a,-b,-c,-d,e,f,g,h]R[-e,-f,-g,-h]"]/.PActivate//ToCanonical]]]]
For[ii=1,ii<4,ii++,For[jj=1,jj<4,jj++,If[ii\[NotEqual]jj,Print[ToExpression["PT"<>ToString[ii]<>"[-i,-j,-k,a,b,c]PT"<>ToString[jj]<>"[-a,-b,-c,e,f,g]T[-e,-f,-g]"]/.PActivate//ToCanonical]]]]

Print[Style["checking inverse orthogonality",Blue,16]]

For[ii=1,ii<7,ii++,For[jj=1,jj<7,jj++,If[ii\[NotEqual]jj,Print[ToExpression["PR"<>ToString[ii]<>"[a,b,c,d,i,j,k,l]R[-i,-j,-k,-l]PR"<>ToString[jj]<>"[-a,-b,-c,-d,e,f,g,h]R[-e,-f,-g,-h]"]/.PActivate//ToCanonical]]]]
For[ii=1,ii<4,ii++,For[jj=1,jj<4,jj++,If[ii\[NotEqual]jj,Print[ToExpression["PT"<>ToString[ii]<>"[a,b,c,i,j,k]T[-i,-j,-k]PT"<>ToString[jj]<>"[-a,-b,-c,e,f,g]T[-e,-f,-g]"]/.PActivate//ToCanonical]]]]

Print[Style["checking idempotency",Blue,16]]

For[ii=1,ii<7,ii++,Print[ToExpression["(PR"<>ToString[ii]<>"[-i,-k,-l,-m,a,b,c,d]PR"<>ToString[ii]<>"[-a,-b,-c,-d,e,f,g,h]-PR"<>ToString[ii]<>"[-i,-k,-l,-m,e,f,g,h])R[-e,-f,-g,-h]"]/.PActivate//ToCanonical//FullSimplify]]
For[ii=1,ii<4,ii++,Print[ToExpression["(PT"<>ToString[ii]<>"[-i,-j,-k,a,b,c]PT"<>ToString[ii]<>"[-a,-b,-c,e,f,g]-PT"<>ToString[ii]<>"[-i,-j,-k,e,f,g])T[-e,-f,-g]"]/.PActivate//ToCanonical//FullSimplify]]

Print[Style["checking completeness",Blue,16]]

(PR1[-i,-k,-l,-m,a,b,c,d]+PR2[-i,-k,-l,-m,a,b,c,d]+PR3[-i,-k,-l,-m,a,b,c,d]+PR4[-i,-k,-l,-m,a,b,c,d]+PR5[-i,-k,-l,-m,a,b,c,d]+PR6[-i,-k,-l,-m,a,b,c,d])R[-a,-b,-c,-d]/.PActivate//ToCanonical//Simplify
(PT1[-i,-k,-l,a,b,c]+PT2[-i,-k,-l,a,b,c]+PT3[-i,-k,-l,a,b,c])T[-a,-b,-c]/.PActivate//ToCanonical//Simplify

Print[Style["checking invertability",Blue,16]]

For[ii=1,ii<7,ii++,Print[ToExpression["(PR"<>ToString[ii]<>"[e,f,g,h,-i,-k,-l,-m]-PR"<>ToString[ii]<>"[-i,-k,-l,-m,e,f,g,h])R[-e,-f,-g,-h]"]/.PActivate//ToCanonical//FullSimplify]]

Quit[]
*)
(*Define the Ricci \mathcal{R}^a_{\ b}*)
DefTensor[Rc[a,-b],M4];
(*Define the Ricci scalar \mathcal{R}*)
DefTensor[Rs[],M4];
(*Define the torsion contraction \mathcal{T}^a*)
DefTensor[Tc[-a],M4];
(*Rule to expand Ricci*)
ExpandRicci=MakeRule[{Rc[a,-b],R[c,a,-c,-b]},MetricOn->All,ContractMetrics->True];
(*Rule to expand Ricci scalar*)
ExpandRicciScalar=MakeRule[{Rs[],R[c,d,-c,-d]},MetricOn->All,ContractMetrics->True];
(*Rule to expand torsion contraction*)
ExpandTorsionContraction=MakeRule[{Tc[-a],T[b,-a,-b]},MetricOn->All,ContractMetrics->True];
(*Total rule to expand contracted field-strength tensors*)
ExpandContractedStrengths=Join[ExpandRicci,ExpandRicciScalar,ExpandTorsionContraction];

(*Define dimensionless coupling constants and reduced Planck mass*)
DefNiceConstantSymbol[m,P];
Alphas=DefNiceConstantSymbol[\[Alpha],#,W]&/@Range[6];
DefNiceConstantSymbol[\[Alpha],#,M]&/@Range[6];
Betas=DefNiceConstantSymbol[\[Beta],#,W]&/@Range[3];
DefNiceConstantSymbol[\[Beta],#,M]&/@Range[3];
DefNiceConstantSymbol[c,#]&/@Range[3];
TheoryParameters=Join[Alphas,Betas];

(*Define 10-parameter PGT Lagrangian*)
(*
Print[Style["Mike's Lagrangian",Blue,16]]
MikeLagrangian=\[Alpha]1M Rs[]^2+\[Alpha]2M Rc[-a,-b]Rc[a,b]+\[Alpha]3M Rc[-a,-b]Rc[b,a]+\[Alpha]4M R[-a,-b,-c,-d]R[a,b,c,d]+\[Alpha]5M R[-a,-b,-c,-d]R[a,c,b,d]+\[Alpha]6M R[-a,-b,-c,-d]R[c,d,a,b]+mP^2(\[Beta]1M T[-a,-b,-c]T[a,b,c]+\[Beta]2M T[-a,-b,-c]T[b,a,c]+\[Beta]3M Tc[-a]Tc[a]);
%//ToCanonical;
%/.ExpandContractedStrengths//ToCanonical//NoScalar
MikeLagrangian=%;
KNLagrangian=mP^2(c1 (1/2)T[-k,-l,-m]T[k,l,m]+c2 (3/4)Antisymmetrize[T[-k,-l,-m],{-k,-l,-m}]Antisymmetrize[T[k,l,m],{k,l,m}]+c3 (1/2)(T[-k,-l,-m]T[k,l,m]-2Tc[-k]Tc[k]));
%//ToCanonical;
%/.ExpandContractedStrengths//ToCanonical//NoScalar
KNLagrangian=%;
Print[Style["Will's Lagrangian",Blue,16]]
WillLagrangian=R[i,k,l,m](\[Alpha]1W PR1[-i,-k,-l,-m,a,b,c,d]+\[Alpha]2W PR2[-i,-k,-l,-m,a,b,c,d]+\[Alpha]3W PR3[-i,-k,-l,-m,a,b,c,d]+\[Alpha]4W PR4[-i,-k,-l,-m,a,b,c,d]+\[Alpha]5W PR5[-i,-k,-l,-m,a,b,c,d]+\[Alpha]6W PR6[-i,-k,-l,-m,a,b,c,d])R[-a,-b,-c,-d]+mP^2 T[i,k,l](\[Beta]1W PT1[-i,-k,-l,a,b,c]+\[Beta]2W PT2[-i,-k,-l,a,b,c]+\[Beta]3W PT3[-i,-k,-l,a,b,c])T[-a,-b,-c];
%/.PActivate;
%//ToCanonical
WillLagrangian=%;
Print[Style["Comparing",Blue,16]]
MikeLagrangian-WillLagrangian//ContractMetric;
%//ToCanonical;
%//Simplify;
%//FullSimplify;
%//CollectTensors
equations=ToConstantSymbolEquations[%\[Equal]0]
Solve[equations,{\[Alpha]1W,\[Alpha]2W,\[Alpha]3W,\[Alpha]4W,\[Alpha]5W,\[Alpha]6W,\[Beta]1W,\[Beta]2W,\[Beta]3W}]
Solve[equations,{\[Alpha]1M,\[Alpha]2M,\[Alpha]3M,\[Alpha]4M,\[Alpha]5M,\[Alpha]6M,\[Beta]1M,\[Beta]2M,\[Beta]3M}]
Print[Style["Comparing with KN",Blue,16]]
KNLagrangian-WillLagrangian//ContractMetric;
%//ToCanonical;
%//Simplify;
%//FullSimplify;
%//CollectTensors
equations=ToConstantSymbolEquations[%\[Equal]0]
KNToWill=Solve[equations,{c1,c2,c3,\[Alpha]1W,\[Alpha]2W,\[Alpha]3W,\[Alpha]4W,\[Alpha]5W,\[Alpha]6W}]
c1/.KNToWill[[1]]//ToCanonical
c2+c3/.KNToWill[[1]]//ToCanonical

Quit[];
*)
Print[Style["Moving on to primary if-constraints",Blue,16]]

DefTensor[V[-a],M4,PrintAs->"n"];
AutomaticRules[V,MakeRule[{V[-a]V[a],1}]];
DefTensor[PPerp[-a,-b],M4,Symmetric[{-a,-b}]];
DefTensor[PPara[-a,-b],M4,Symmetric[{-a,-b}]];
PPerpDefinition=V[-a]V[b];
PPerpActivate=MakeRule[{PPerp[-a,b],Evaluate[PPerpDefinition]},MetricOn->All,ContractMetrics->True];
PParaDefinition=G[-a,b]-V[-a]V[b];
PParaActivate=MakeRule[{PPara[-a,b],Evaluate[PParaDefinition]},MetricOn->All,ContractMetrics->True];
PADMActivate=Join[PPerpActivate,PParaActivate];

DefTensor[PThreePara[-a,-b,-c,d,e,f],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{d,e}]}];
PThreeParaDefinition=Antisymmetrize[Antisymmetrize[PPara[-a,d]PPara[-b,e]PPara[-c,f],{-a,-b}],{d,e}]/.PADMActivate//ToCanonical;
PThreeParaActivate=MakeRule[{PThreePara[-a,-b,-c,d,e,f],Evaluate[PThreeParaDefinition]},MetricOn->All,ContractMetrics->True];
DefTensor[PThreePerp[-a,-b,-c,d,e,f],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{d,e}]}];
PThreePerpDefinition=Antisymmetrize[Antisymmetrize[(PPara[-a,d]PPerp[-b,e]+PPerp[-a,d]PPara[-b,e])PPara[-c,f],{-a,-b}],{d,e}]/.PADMActivate//ToCanonical;
PPerpActivate=MakeRule[{PThreePerp[-a,-b,-c,d,e,f],Evaluate[PThreePerpDefinition]},MetricOn->All,ContractMetrics->True];

Print[Style["Using an `incomplete' projection series for speed",Blue,16]]

DefTensor[PAPerp[-a,-b,d,e,f],M4];
DefTensor[PAPara[-a,-b,-c,d,e,f],M4];
DefTensor[PBPerp[-a,d,e],M4];
DefTensor[PBPara[-a,-b,d,e],M4];

PAPerpDefinition=V[d]PPara[-a,e]G[-b,f]/.PADMActivate//ToCanonical;
PAPerpActivate=MakeRule[{PAPerp[-a,-b,d,e,f],Evaluate[PAPerpDefinition]},MetricOn->All,ContractMetrics->True];
PAParaDefinition=PPara[-a,d]PPara[-b,e]G[-c,f]/.PADMActivate//ToCanonical;
PAParaActivate=MakeRule[{PAPara[-a,-b,-c,d,e,f],Evaluate[PAParaDefinition]},MetricOn->All,ContractMetrics->True];

PBPerpDefinition=V[d]G[-a,e]/.PADMActivate//ToCanonical;
PBPerpActivate=MakeRule[{PBPerp[-a,d,e],Evaluate[PBPerpDefinition]},MetricOn->All,ContractMetrics->True];
PBParaDefinition=PPara[-a,d]G[-b,e]/.PADMActivate//ToCanonical;
PBParaActivate=MakeRule[{PBPara[-a,-b,d,e],Evaluate[PBParaDefinition]},MetricOn->All,ContractMetrics->True];

PADMPiActivate=Join[PAPerpActivate,PAParaActivate,PBPerpActivate,PBParaActivate];
DefTensor[PA0p[c,d],M4];
DefTensor[PA1p[-a,-b,c,d],M4];
DefTensor[PA2p[-a,-b,c,d],M4];

PA0pDefinition=PPara[c,-k]PPara[d,-l]G[k,l]/.PADMActivate//ToCanonical;
PA1pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l]Antisymmetrize[G[-i,k]G[-j,l],{-i,-j}]/.PADMActivate//ToCanonical;
PA2pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l](Symmetrize[G[-i,k]G[-j,l],{-i,-j}]-(1/3)G[-i,-j]G[k,l])/.PADMActivate//ToCanonical;

DefTensor[PA0m[d,e,f],M4];
DefTensor[PA1m[-a,d,e,f],M4];
DefTensor[PA2m[-a,-b,-c,d,e,f],M4];

PA0mDefinition=PPara[-i,d]PPara[-j,e]PPara[-k,f]epsilonG[i,j,k,g]V[-g]/.PADMActivate//ToCanonical;
PA1mDefinition=PPara[-i,d]PPara[-j,f]PPara[k,-a]PPara[-l,e]G[i,j]G[-k,l]/.PADMActivate//ToCanonical;
PA2mDefinition=PPara[-a,i]PPara[-b,j]PPara[-c,k]PPara[d,-l]PPara[e,-n]PPara[f,-m](3/4)((1/3)(2G[-i,l]G[-j,n]G[-k,m]-G[-j,l]G[-k,n]G[-i,m]-G[-k,l]G[-i,n]G[-j,m])-Antisymmetrize[G[-i,-k]G[-j,n]G[l,m],{-i,-j}])/.PADMActivate//ToCanonical;

PA0pActivate=MakeRule[{PA0p[c,d],Evaluate[PA0pDefinition]},MetricOn->All,ContractMetrics->True];
PA1pActivate=MakeRule[{PA1p[-a,-b,c,d],Evaluate[PA1pDefinition]},MetricOn->All,ContractMetrics->True];
PA2pActivate=MakeRule[{PA2p[-a,-b,c,d],Evaluate[PA2pDefinition]},MetricOn->All,ContractMetrics->True];
PA0mActivate=MakeRule[{PA0m[d,e,f],Evaluate[PA0mDefinition]},MetricOn->All,ContractMetrics->True];
PA1mActivate=MakeRule[{PA1m[-a,d,e,f],Evaluate[PA1mDefinition]},MetricOn->All,ContractMetrics->True];
PA2mActivate=MakeRule[{PA2m[-a,-b,-c,d,e,f],Evaluate[PA2mDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[PB0p[c,d],M4];
DefTensor[PB1p[-a,-b,c,d],M4];
DefTensor[PB2p[-a,-b,c,d],M4];

PB0pDefinition=PPara[c,-k]PPara[d,-l]G[k,l]/.PADMActivate//ToCanonical;
PB1pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l]Antisymmetrize[G[-i,k]G[-j,l],{-i,-j}]/.PADMActivate//ToCanonical;
PB2pDefinition=PPara[-a,i]PPara[-b,j]PPara[c,-k]PPara[d,-l](Symmetrize[G[-i,k]G[-j,l],{-i,-j}]-(1/3)G[-i,-j]G[k,l])/.PADMActivate//ToCanonical;

DefTensor[PB1m[-a,d],M4];

PB1mDefinition=PPara[d,-j]PPara[-a,i]G[-i,j]/.PADMActivate//ToCanonical;

PB0pActivate=MakeRule[{PB0p[c,d],Evaluate[PB0pDefinition]},MetricOn->All,ContractMetrics->True];
PB1pActivate=MakeRule[{PB1p[-a,-b,c,d],Evaluate[PB1pDefinition]},MetricOn->All,ContractMetrics->True];
PB2pActivate=MakeRule[{PB2p[-a,-b,c,d],Evaluate[PB2pDefinition]},MetricOn->All,ContractMetrics->True];
PB1mActivate=MakeRule[{PB1m[-a,d],Evaluate[PB1mDefinition]},MetricOn->All,ContractMetrics->True];

PO3PiActivate=Join[PA0pActivate,PA1pActivate,PA2pActivate,PA0mActivate,PA1mActivate,PA2mActivate,PB0pActivate,PB1pActivate,PB2pActivate,PB1mActivate];

DefTensor[APi[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->"A\[Pi]"];
DefTensor[APiP[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->"A\[Pi]p"];
AutomaticRules[APiP,MakeRule[{APiP[-a,-b,-c]V[c],0},MetricOn->All,ContractMetrics->True]];
DefTensor[BPi[-a,-c],M4,PrintAs->"b\[Pi]"];
DefTensor[BPiP[-a,-c],M4,PrintAs->"b\[Pi]p"];
AutomaticRules[BPiP,MakeRule[{BPiP[-a,-c]V[c],0},MetricOn->All,ContractMetrics->True]];
DefTensor[H[-a,c],M4,PrintAs->"h"];
DefTensor[B[a,-c],M4,PrintAs->"b"];
DefTensor[A[a,c,-d],M4,Antisymmetric[{a,c}]];

ExpandRiemann=MakeRule[{R[a,b,-d,-e],H[-d,i]H[-e,j](CD[-i][A[a,b,-j]]-CD[-j][A[a,b,-i]]+A[a,-k,-i]A[k,b,-j]-A[a,-k,-j]A[k,b,-i])},MetricOn->All,ContractMetrics->True];
(*Rule to expand torsion*)
ExpandTorsion=MakeRule[{T[a,-b,-c],H[-b,i]H[-c,j](CD[-i][B[a,-j]]-CD[-j][B[a,-i]]+A[a,-k,-i]B[k,-j]-A[a,-k,-j]B[k,-i])},MetricOn->All,ContractMetrics->True];
RecoverTorsion=MakeRule[{CD[-s][B[a,-r]],(1/2)B[b,-s]B[c,-r]T[a,-b,-c]-A[a,-k,-s]B[k,-r]},MetricOn->All,ContractMetrics->True];
RecoverRiemann=MakeRule[{CD[-s][A[i,j,-r]],(1/2)B[k,-s]B[l,-r]R[i,j,-k,-l]-A[i,m,-s]A[j,-m,-r]},MetricOn->All,ContractMetrics->True];
RecoverStrengths=Join[RecoverTorsion,RecoverRiemann];
(*Total rule to expand field-strength tensors*)
ExpandStrengths=Join[ExpandRiemann,ExpandTorsion];
(*Rule to contract Roman indices*)
AutomaticRules[H,MakeRule[{H[-a,i]B[a,-j],G[i,-j]},MetricOn->All,ContractMetrics->True]];
(*Rule to contract Greek indices*)
AutomaticRules[H,MakeRule[{H[-a,i]B[c,-i],G[-a,c]},MetricOn->All,ContractMetrics->True]];
DefTensor[Ji[],M4];
DefTensor[G3[-a,-b],M4,Symmetric[{-a,-b}]];
AutomaticRules[G3,MakeRule[{G3[-a,-b]G3[b,-d],G3[-a,-d]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[G3,MakeRule[{G3[-a,a],3},MetricOn->All,ContractMetrics->True]];
AutomaticRules[G3,MakeRule[{B[a,-b]G3[b,-c]V[-a],0},MetricOn->All,ContractMetrics->True]];
AutomaticRules[G3,MakeRule[{CD[-a][G3[-c,b]],0},MetricOn->All,ContractMetrics->True]];
NewAssault=MakeRule[{G3[n,-m]H[-i,m],Evaluate[V[-i]V[j]G3[n,-m]H[-j,m]+PPara[-i,j]H[-j,n]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
RemoveG3Der=MakeRule[{G3[-a,b]CD[-c][B[d,-b]],Evaluate[CD[-c][PPara[d,-f]B[f,-a]]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
RemoveG3NoDer=MakeRule[{G3[-a,b]B[d,-b],Evaluate[PPara[d,-f]B[f,-a]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
DefTensor[X[k],M4];
AutomaticRules[X,MakeRule[{X[-a]V[a],1},MetricOn->All,ContractMetrics->True]];
NewRemoveG3=MakeRule[{B[d,-b]G3[b,-a]H[-e,a],Evaluate[G[d,-e]-V[-e]X[d]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
RemoveG3=Join[RemoveG3Der,RemoveG3NoDer];

MagicOrthogonality=MakeRule[{H[-a,b]G3[-b,c]B[d,-c],Evaluate[PPara[-a,b]PPara[-b,d]+V[-a]V[c]H[-c,e]G3[-e,f]B[d,-f]/.PADMActivate//ToCanonical]},MetricOn->All,ContractMetrics->True];
APiToAPiP=MakeRule[{APi[-i,-j,k]G3[-k,a]B[l,-a],APiP[-i,-j,l]},MetricOn->All,ContractMetrics->True];
BPiToBPiP=MakeRule[{BPi[-i,k]G3[-k,a]B[l,-a],BPiP[-i,l]},MetricOn->All,ContractMetrics->True];
PiToPiP=Join[APiToAPiP,BPiToBPiP];

DefTensor[BPiCanonical[-a,-c],M4];
BPiCanonicalDefinition=Ji[]BPi[-i,z]G3[-z,a]B[-k,-a]-4V[g]B[-k,-o]G3[o,-z]H[h,z](\[Beta]1W PT1[-i,-g,-h,a,c,d]+\[Beta]2W PT2[-i,-g,-h,a,c,d]+\[Beta]3W PT3[-i,-g,-h,a,c,d])PPara[-c,m]PPara[-d,n]T[-a,-m,-n];
BPiCanonicalActivate=MakeRule[{BPiCanonical[-i,-k],Evaluate[BPiCanonicalDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[BPiNonCanonical[-a,-c],M4];
BPiNonCanonicalDefinition=4V[g]B[-k,-o]G3[o,-z]H[h,z](\[Beta]1W PT1[-i,-g,-h,a,c,d]+\[Beta]2W PT2[-i,-g,-h,a,c,d]+\[Beta]3W PT3[-i,-g,-h,a,c,d])(PPerp[-c,m]PPara[-d,n]T[-a,-m,-n]+PPara[-c,m]PPerp[-d,n]T[-a,-m,-n]);
BPiNonCanonicalActivate=MakeRule[{BPiNonCanonical[-i,-k],Evaluate[BPiNonCanonicalDefinition]},MetricOn->All,ContractMetrics->True];

PhiB0pCanonical=PB0p[e,f]PBPara[-e,-f,a,c]BPiCanonical[-a,-c];
PhiB1pCanonical=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiCanonical[-a,-c];
PhiB2pCanonical=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiCanonical[-a,-c];
PhiB1mCanonical=PB1m[-n,f]PBPerp[-f,a,c]BPiCanonical[-a,-c];

PiB0pCanonical=PB0p[e,f]PBPara[-e,-f,a,c]Ji[]BPiP[-a,-c];
PiB1pCanonical=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]Ji[]BPiP[-a,-c];
PiB2pCanonical=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]Ji[]BPiP[-a,-c];
PiB1mCanonical=PB1m[-n,f]PBPerp[-f,a,c]Ji[]BPiP[-a,-c];

PhiB0pNonCanonical=PB0p[e,f]PBPara[-e,-f,a,c]BPiNonCanonical[-a,-c];
PhiB1pNonCanonical=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiNonCanonical[-a,-c];
PhiB2pNonCanonical=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiNonCanonical[-a,-c];
PhiB1mNonCanonical=PB1m[-n,f]PBPerp[-f,a,c]BPiNonCanonical[-a,-c];

DefTensor[APiCanonical[-a,-b,-c],M4,Antisymmetric[{-a,-b}]];
APiCanonicalDefinition=Ji[]APi[-i,-j,z]G3[-z,a]B[-k,-a]-8V[g]B[-k,-o]G3[o,-z]H[h,z](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,m]PPara[-d,n]R[-a,-b,-m,-n];
APiCanonicalActivate=MakeRule[{APiCanonical[-i,-j,-k],Evaluate[APiCanonicalDefinition]},MetricOn->All,ContractMetrics->True];

DefTensor[APiNonCanonical[-a,-b,-c],M4];
APiNonCanonicalDefinition=8V[g]B[-k,-o]G3[o,-z]H[h,z](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])(PPerp[-c,m]PPara[-d,n]R[-a,-b,-m,-n]+PPara[-c,m]PPerp[-d,n]R[-a,-b,-m,-n]);
APiNonCanonicalActivate=MakeRule[{APiNonCanonical[-i,-j,-k],Evaluate[APiNonCanonicalDefinition]},MetricOn->All,ContractMetrics->True];

PhiA0pCanonical=PA0p[e,f]PAPerp[-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA1pCanonical=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA2pCanonical=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA0mCanonical=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA1mCanonical=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA2mCanonical=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]APiCanonical[-a,-b,-c];

PiA0pCanonical=PA0p[e,f]PAPerp[-e,-f,a,b,c]Ji[]APiP[-a,-b,-c];
PiA1pCanonical=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]Ji[]APiP[-a,-b,-c];
PiA2pCanonical=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]Ji[]APiP[-a,-b,-c];
PiA0mCanonical=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]Ji[]APiP[-a,-b,-c];
PiA1mCanonical=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]Ji[]APiP[-a,-b,-c];
PiA2mCanonical=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]Ji[]APiP[-a,-b,-c];

PhiA0pNonCanonical=PA0p[e,f]PAPerp[-e,-f,a,b,c]APiNonCanonical[-a,-b,-c];
PhiA1pNonCanonical=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiNonCanonical[-a,-b,-c];
PhiA2pNonCanonical=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiNonCanonical[-a,-b,-c];
PhiA0mNonCanonical=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]APiNonCanonical[-a,-b,-c];
PhiA1mNonCanonical=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]APiNonCanonical[-a,-b,-c];
PhiA2mNonCanonical=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]APiNonCanonical[-a,-b,-c];

PiActivate=Join[BPiCanonicalActivate,BPiNonCanonicalActivate,APiCanonicalActivate,APiNonCanonicalActivate];

ToPiP[expr_]:=Module[{exp,kern},exp=Evaluate[expr];exp=exp/.PADMActivate;exp=exp//ToCanonical;temp=PrintTemporary[Style["3",Green,10]];exp=exp/.PADMPiActivate;exp=exp//ToCanonical;temp=PrintTemporary[Style["4",Green,10]];exp=exp/.PO3PiActivate;exp=exp//ToCanonical;temp=PrintTemporary[Style["5",Green,10]];exp=exp/.NewRemoveG3;exp=exp//ContractMetric;exp=exp//ToCanonical;temp=PrintTemporary[Style["6",Green,10]];
NotebookDelete[temp];
exp=exp//CollectTensors;exp];

ToFieldStrengths[expr_]:=Module[{exp,kern},exp=Evaluate[expr];exp=exp/.PiActivate;exp=exp//ToCanonical;temp=PrintTemporary[Style["1",Green,10]];exp=exp/.PActivate;exp=exp//ToCanonical;exp=exp/.PADMActivate;exp=exp//ToCanonical;temp=PrintTemporary[Style["3",Green,10]];exp=exp/.PADMPiActivate;exp=exp//ToCanonical;temp=PrintTemporary[Style["4",Green,10]];exp=exp/.PO3PiActivate;exp=exp//ToCanonical;temp=PrintTemporary[Style["5",Green,10]];exp=exp/.NewRemoveG3;exp=exp//ContractMetric;exp=exp//ToCanonical;temp=PrintTemporary[Style["6",Green,10]];
NotebookDelete[temp];
exp=exp//CollectTensors;exp];

(*
Print[Style["0^+ canonical",Red,16]]
PhiB0pCanonical=ToFieldStrengths[PhiB0pCanonical]
Print[Style["0^+ non-canonical",Red,10]]
PhiB0pNonCanonical=ToFieldStrengths[PhiB0pNonCanonical]
Print[Style["1^+ canonical",Red,16]]
PhiB1pCanonical=ToFieldStrengths[PhiB1pCanonical]
Print[Style["1^+ non-canonical",Red,10]]
PhiB1pNonCanonical=ToFieldStrengths[PhiB1pNonCanonical]
Print[Style["1^- canonical",Red,16]]
PhiB1mCanonical=ToFieldStrengths[PhiB1mCanonical]
Print[Style["1^- non-canonical",Red,10]]
PhiB1mNonCanonical=ToFieldStrengths[PhiB1mNonCanonical]
Print[Style["2^+ canonical",Red,16]]
PhiB2pCanonical=ToFieldStrengths[PhiB2pCanonical]
Print[Style["2^+ non-canonical",Red,10]]
PhiB2pNonCanonical=ToFieldStrengths[PhiB2pNonCanonical]
Print[Style["0^+ canonical",Blue,16]]
PhiA0pCanonical=ToFieldStrengths[PhiA0pCanonical]
Print[Style["0^+ non-canonical",Blue,10]]
PhiA0pNonCanonical=ToFieldStrengths[PhiA0pNonCanonical]
Print[Style["0^- canonical",Blue,16]]
PhiA0mCanonical=ToFieldStrengths[PhiA0mCanonical]
Print[Style["0^- non-canonical",Blue,10]]
PhiA0mNonCanonical=ToFieldStrengths[PhiA0mNonCanonical]
Print[Style["1^+ canonical",Blue,16]]
PhiA1pCanonical=ToFieldStrengths[PhiA1pCanonical]
Print[Style["1^+ non-canonical",Blue,10]]
PhiA1pNonCanonical=ToFieldStrengths[PhiA1pNonCanonical]
Print[Style["1^- canonical",Blue,16]]
PhiA1mCanonical=ToFieldStrengths[PhiA1mCanonical]
Print[Style["1^- non-canonical",Blue,10]]
PhiA1mNonCanonical=ToFieldStrengths[PhiA1mNonCanonical]
Print[Style["2^+ canonical",Blue,16]]
PhiA2pCanonical=ToFieldStrengths[PhiA2pCanonical]
Print[Style["2^+ non-canonical",Blue,10]]
PhiA2pNonCanonical=ToFieldStrengths[PhiA2pNonCanonical]
Print[Style["2^- canonical",Blue,16]]
PhiA2mCanonical=ToFieldStrengths[PhiA2mCanonical]
Print[Style["2^- non-canonical",Blue,10]]
PhiA2mNonCanonical=ToFieldStrengths[PhiA2mNonCanonical]

Print[Style["0^+ canonical",Red,16]]
PiB0pCanonical=ToPiP[PiB0pCanonical]
Print[Style["1^+ canonical",Red,16]]
PiB1pCanonical=ToPiP[PiB1pCanonical]
Print[Style["1^- canonical",Red,16]]
PiB1mCanonical=ToPiP[PiB1mCanonical]
Print[Style["2^+ canonical",Red,16]]
PiB2pCanonical=ToPiP[PiB2pCanonical]
Print[Style["0^+ canonical",Blue,16]]
PiA0pCanonical=ToPiP[PiA0pCanonical]
Print[Style["0^- canonical",Blue,16]]
PiA0mCanonical=ToPiP[PiA0mCanonical]
Print[Style["1^+ canonical",Blue,16]]
PiA1pCanonical=ToPiP[PiA1pCanonical]
Print[Style["1^- canonical",Blue,16]]
PiA1mCanonical=ToPiP[PiA1mCanonical]
Print[Style["2^+ canonical",Blue,16]]
PiA2pCanonical=ToPiP[PiA2pCanonical]
Print[Style["2^- canonical",Blue,16]]
PiA2mCanonical=ToPiP[PiA2mCanonical]

DumpSave["SectorValues.mx",{PhiB0pCanonical,PhiB1pCanonical,PhiB1mCanonical,PhiB2pCanonical,PhiA0pCanonical,PhiA0mCanonical,PhiA1pCanonical,PhiA1mCanonical,PhiA2pCanonical,PhiA2mCanonical,PhiB0pNonCanonical,PhiB1pNonCanonical,PhiB1mNonCanonical,PhiB2pNonCanonical,PhiA0pNonCanonical,PhiA0mNonCanonical,PhiA1pNonCanonical,PhiA1mNonCanonical,PhiA2pNonCanonical,PhiA2mNonCanonical,PiB0pCanonical,PiB1pCanonical,PiB1mCanonical,PiB2pCanonical,PiA0pCanonical,PiA0mCanonical,PiA1pCanonical,PiA1mCanonical,PiA2pCanonical,PiA2mCanonical}];
Quit[]

*)

(*
PhiB0pCanonical=PB0p[e,f]PBPara[-e,-f,a,c]BPiCanonical[-a,-c];
PhiB1pCanonical=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiCanonical[-a,-c];
PhiB2pCanonical=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiCanonical[-a,-c];
PhiB1mCanonical=PB1m[-n,f]PBPerp[-f,a,c]BPiCanonical[-a,-c];
PhiA0pCanonical=PA0p[e,f]PAPerp[-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA1pCanonical=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA2pCanonical=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA0mCanonical=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA1mCanonical=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]APiCanonical[-a,-b,-c];
PhiA2mCanonical=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]APiCanonical[-a,-b,-c];
*)

<<SectorValues.mx;

DefTensor[PhiB0p[],M4,PrintAs->"\[Phi]b0p"];
DefTensor[PhiB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->"\[Phi]b1p"];
DefTensor[PhiB1m[-a],M4,PrintAs->"\[Phi]b1m"];
DefTensor[PhiB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->"\[Phi]b2p"];
DefTensor[PhiA0p[],M4,PrintAs->"\[Phi]A0p"];
DefTensor[PhiA0m[],M4,PrintAs->"\[Phi]A0m"];
DefTensor[PhiA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->"\[Phi]A1p"];
DefTensor[PhiA1m[-a],M4,PrintAs->"\[Phi]A1m"];
DefTensor[PhiA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->"\[Phi]A2p"];
DefTensor[PhiA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->"\[Phi]A2m"];
AutomaticRules[PhiA2m,MakeRule[{PhiA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];

DefTensor[PiB0p[],M4,PrintAs->"\[Pi]b0p"];
DefTensor[PiB1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->"\[Pi]b1p"];
DefTensor[PiB1m[-a],M4,PrintAs->"\[Pi]b1m"];
DefTensor[PiB2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->"\[Pi]b2p"];
DefTensor[PiA0p[],M4,PrintAs->"\[Pi]A0p"];
DefTensor[PiA0m[],M4,PrintAs->"\[Pi]A0m"];
DefTensor[PiA1p[-a,-b],M4,Antisymmetric[{-a,-b}],PrintAs->"\[Pi]A1p"];
DefTensor[PiA1m[-a],M4,PrintAs->"\[Pi]A1m"];
DefTensor[PiA2p[-a,-b],M4,Symmetric[{-a,-b}],PrintAs->"\[Pi]A2p"];
DefTensor[PiA2m[-a,-b,-c],M4,Antisymmetric[{-a,-b}],PrintAs->"\[Pi]A2m"];
AutomaticRules[PiA2m,MakeRule[{PiA2m[a,-b,-a],0},MetricOn->All,ContractMetrics->True]];

PhiB0pActivate=MakeRule[{PhiB0p[],Scalar[Evaluate[PhiB0pCanonical]]},MetricOn->All,ContractMetrics->True];
PhiB1pActivate=MakeRule[{PhiB1p[-n,-m],Evaluate[PhiB1pCanonical]},MetricOn->All,ContractMetrics->True];
PhiB1mActivate=MakeRule[{PhiB1m[-n],Evaluate[PhiB1mCanonical]},MetricOn->All,ContractMetrics->True];
PhiB2pActivate=MakeRule[{PhiB2p[-n,-m],Evaluate[PhiB2pCanonical]},MetricOn->All,ContractMetrics->True];
PhiA0pActivate=MakeRule[{PhiA0p[],Scalar[Evaluate[PhiA0pCanonical]]},MetricOn->All,ContractMetrics->True];
PhiA0mActivate=MakeRule[{PhiA0m[],Scalar[Evaluate[PhiA0mCanonical]]},MetricOn->All,ContractMetrics->True];
PhiA1pActivate=MakeRule[{PhiA1p[-n,-m],Evaluate[PhiA1pCanonical]},MetricOn->All,ContractMetrics->True];
PhiA1mActivate=MakeRule[{PhiA1m[-n],Evaluate[PhiA1mCanonical]},MetricOn->All,ContractMetrics->True];
PhiA2pActivate=MakeRule[{PhiA2p[-n,-m],Evaluate[PhiA2pCanonical]},MetricOn->All,ContractMetrics->True];
PhiA2mActivate=MakeRule[{PhiA2m[-n,-m,-o],Evaluate[PhiA2mCanonical]},MetricOn->All,ContractMetrics->True];

PiB0pActivate=MakeRule[{PiB0p[],Scalar[Evaluate[PiB0pCanonical]]},MetricOn->All,ContractMetrics->True];
PiB1pActivate=MakeRule[{PiB1p[-n,-m],Evaluate[PiB1pCanonical]},MetricOn->All,ContractMetrics->True];
PiB1mActivate=MakeRule[{PiB1m[-n],Evaluate[PiB1mCanonical]},MetricOn->All,ContractMetrics->True];
PiB2pActivate=MakeRule[{PiB2p[-n,-m],Evaluate[PiB2pCanonical]},MetricOn->All,ContractMetrics->True];
PiA0pActivate=MakeRule[{PiA0p[],Scalar[Evaluate[PiA0pCanonical]]},MetricOn->All,ContractMetrics->True];
PiA0mActivate=MakeRule[{PiA0m[],Scalar[Evaluate[PiA0mCanonical]]},MetricOn->All,ContractMetrics->True];
PiA1pActivate=MakeRule[{PiA1p[-n,-m],Evaluate[PiA1pCanonical]},MetricOn->All,ContractMetrics->True];
PiA1mActivate=MakeRule[{PiA1m[-n],Evaluate[PiA1mCanonical]},MetricOn->All,ContractMetrics->True];
PiA2pActivate=MakeRule[{PiA2p[-n,-m],Evaluate[PiA2pCanonical]},MetricOn->All,ContractMetrics->True];
PiA2mActivate=MakeRule[{PiA2m[-n,-m,-o],Evaluate[PiA2mCanonical]},MetricOn->All,ContractMetrics->True];

PhiActivate=Join[PhiB0pActivate,PhiB1pActivate,PhiB1mActivate,PhiB2pActivate,PhiA0pActivate,PhiA0mActivate,PhiA1pActivate,PhiA1mActivate,PhiA2pActivate,PhiA2mActivate];
PiPActivate=Join[PiB0pActivate,PiB1pActivate,PiB1mActivate,PiB2pActivate,PiA0pActivate,PiA0mActivate,PiA1pActivate,PiA1mActivate,PiA2pActivate,PiA2mActivate];

SectorNames={"B0p","B1p","B1m","B2p","A0p","A0m","A1p","A1m","A2p","A2m"};

DefTensor[DVDB[-a,-b,c],M4];
DefTensor[DHDB[-a,b,-c,d],M4];
DefTensor[DJDB[-c,d],M4];

DVDBDefinition=-V[-b]PPara[i,-a]H[-i,c]/.PADMActivate//ToCanonical;
AutomaticRules[DVDB,MakeRule[{DVDB[-a,-b,c],Evaluate[DVDBDefinition]},MetricOn->All,ContractMetrics->True]];
DHDBDefinition=-H[-c,b]H[-a,d]//ToCanonical;
AutomaticRules[DHDB,MakeRule[{DHDB[-a,b,-c,d],Evaluate[DHDBDefinition]},MetricOn->All,ContractMetrics->True]];
DJDBDefinition=Ji[]PPara[-c,e]H[-e,d]/.PADMActivate//ToCanonical;
AutomaticRules[DJDB,MakeRule[{DJDB[-c,d],Evaluate[DJDBDefinition]},MetricOn->All,ContractMetrics->True]];

(*Automatic rules for casting all derivatives as derivatives of b/B*)
AutomaticRules[V,MakeRule[{CD[-a][V[-j]],Evaluate[-V[-i]PPara[-j,k]H[-k,m]CD[-a][B[i,-m]]/.PADMActivate]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[H,MakeRule[{CD[-a][H[-j,n]],Evaluate[-H[-i,n]H[-j,m]CD[-a][B[i,-m]]]},MetricOn->All,ContractMetrics->True]];
AutomaticRules[Ji,MakeRule[{CD[-a][Ji[]],Evaluate[-Ji[]H[-k,n]PPara[k,-i]CD[-a][B[i,-n]]/.PADMActivate]},MetricOn->All,ContractMetrics->True]];
DefNiceConstantSymbol[\[CapitalPi],{A,b}];
DefNiceConstantSymbol[\[CapitalPhi],{A,b}];
DefNiceConstantSymbol[\[CapitalDelta]\[CapitalPhi],{A,b}];
APiSchematic=MakeRule[{APiP[-a,-b,-c],\[CapitalPi]A APiP[-a,-b,-c]},MetricOn->All,ContractMetrics->True];
BPiSchematic=MakeRule[{BPiP[-a,-b],\[CapitalPi]b BPiP[-a,-b]},MetricOn->All,ContractMetrics->True];BSchematic=MakeRule[{B[-a,-b],\[CapitalPhi]b B[-a,-b]},MetricOn->All,ContractMetrics->True];ASchematic=MakeRule[{A[-a,-b,-c],\[CapitalPhi]A A[-a,-b,-c]},MetricOn->All,ContractMetrics->True];
DBSchematic=MakeRule[{CD[-z][B[-a,-b]],\[CapitalDelta]\[CapitalPhi]b CD[-z][B[-a,-b]]},MetricOn->All,ContractMetrics->True];
DASchematic=MakeRule[{CD[-z][A[-a,-b,-c]],\[CapitalDelta]\[CapitalPhi]A CD[-z][A[-a,-b,-c]]},MetricOn->All,ContractMetrics->True];
ToSchematic=Join[APiSchematic,BPiSchematic,BSchematic,ASchematic,DBSchematic,DASchematic];

(*Theory={\[Alpha]1W\[Rule]\[Alpha]1W};*)
(*Here is the first case considered by Yo and Nester*)
(*Theory={\[Alpha]1W\[Rule]0,\[Alpha]2W\[Rule]0,\[Alpha]3W\[Rule]0,\[Alpha]4W\[Rule]0,\[Alpha]5W\[Rule]1,\[Alpha]6W\[Rule]0,\[Beta]1W\[Rule]0,\[Beta]2W\[Rule]0,\[Beta]3W\[Rule]1};*)
(*Here is 0+ case*)
(*Theory={\[Alpha]1W\[Rule]0,\[Alpha]2W\[Rule]0,\[Alpha]3W\[Rule]0,\[Alpha]4W\[Rule]0,\[Alpha]5W\[Rule]0,\[Beta]2W\[Rule]-2*\[Beta]1W,\[Beta]3W\[Rule]-\[Beta]1W/2};*)

ToExpression[Import["cases_definitions.txt"]];

Theory=SuperTheory
(*Theory={\[Alpha]1W\[Rule]0,\[Alpha]2W\[Rule]0,\[Alpha]3W\[Rule]0,\[Alpha]4W\[Rule]0,\[Alpha]5W\[Rule]0,\[Beta]2W\[Rule]-2*\[Beta]1W,\[Beta]3W\[Rule]-\[Beta]1W/2}*)
(*Construction of translational hyperprojectors*)

PB0pTDefinition=(1/3)PPara[-n,-m]PB0p[e,f]PBPara[-e,-f,a,c]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PB1pTDefinition=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PB2pTDefinition=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PB1mTDefinition=V[-n]PB1m[-m,f]PBPerp[-f,a,c]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;

DefTensor[PB0pT[-n,-m,a,c],M4];
DefTensor[PB1pT[-n,-m,a,c],M4];
DefTensor[PB2pT[-n,-m,a,c],M4];
DefTensor[PB1mT[-n,-m,a,c],M4];

PB0pTActivate=MakeRule[{PB0pT[-n,-m,a,c],Evaluate[PB0pTDefinition]},MetricOn->All,ContractMetrics->True];
PB1pTActivate=MakeRule[{PB1pT[-n,-m,a,c],Evaluate[PB1pTDefinition]},MetricOn->All,ContractMetrics->True];
PB2pTActivate=MakeRule[{PB2pT[-n,-m,a,c],Evaluate[PB2pTDefinition]},MetricOn->All,ContractMetrics->True];
PB1mTActivate=MakeRule[{PB1mT[-n,-m,a,c],Evaluate[PB1mTDefinition]},MetricOn->All,ContractMetrics->True];

(*Construction of rotational hyperprojectors*)

PA0pTDefinition=Antisymmetrize[Antisymmetrize[2Antisymmetrize[V[-n](1/3)PPara[-m,-o]PA0p[e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA1pTDefinition=Antisymmetrize[Antisymmetrize[2Antisymmetrize[V[-n]PA1p[-m,-o,e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA2pTDefinition=Antisymmetrize[Antisymmetrize[2Antisymmetrize[V[-n]PA2p[-m,-o,e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA0mTDefinition=Antisymmetrize[Antisymmetrize[(-1/6)PA0m[-n,-m,-o]PA0m[i,j,k]PAPara[-i,-j,-k,a,b,c],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA1mTDefinition=Antisymmetrize[Antisymmetrize[Antisymmetrize[-PPara[-m,-o]PA1m[-n,i,j,k]PAPara[-i,-j,-k,a,b,c],{-m,-n}],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;
PA2mTDefinition=Antisymmetrize[Antisymmetrize[(4/3)PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c],{-n,-m}],{a,b}]/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical;

DefTensor[PA0pT[-n,-m,-o,a,b,c],M4];
DefTensor[PA1pT[-n,-m,-o,a,b,c],M4];
DefTensor[PA2pT[-n,-m,-o,a,b,c],M4];
DefTensor[PA0mT[-n,-m,-o,a,b,c],M4];
DefTensor[PA1mT[-n,-m,-o,a,b,c],M4];
DefTensor[PA2mT[-n,-m,-o,a,b,c],M4];

PA0pTActivate=MakeRule[{PA0pT[-n,-m,-o,a,b,c],Evaluate[PA0pTDefinition]},MetricOn->All,ContractMetrics->True];
PA1pTActivate=MakeRule[{PA1pT[-n,-m,-o,a,b,c],Evaluate[PA1pTDefinition]},MetricOn->All,ContractMetrics->True];
PA2pTActivate=MakeRule[{PA2pT[-n,-m,-o,a,b,c],Evaluate[PA2pTDefinition]},MetricOn->All,ContractMetrics->True];
PA0mTActivate=MakeRule[{PA0mT[-n,-m,-o,a,b,c],Evaluate[PA0mTDefinition]},MetricOn->All,ContractMetrics->True];
PA1mTActivate=MakeRule[{PA1mT[-n,-m,-o,a,b,c],Evaluate[PA1mTDefinition]},MetricOn->All,ContractMetrics->True];
PA2mTActivate=MakeRule[{PA2mT[-n,-m,-o,a,b,c],Evaluate[PA2mTDefinition]},MetricOn->All,ContractMetrics->True];

PO3TActivate=Join[PB0pTActivate,PB1pTActivate,PB2pTActivate,PB1mTActivate,PA0pTActivate,PA1pTActivate,PA2pTActivate,PA0mTActivate,PA1mTActivate,PA2mTActivate];

DefNiceConstantSymbol[\[Xi],ToExpression[#]]&/@SectorNames;
DefNiceConstantSymbol[\[Zeta],ToExpression[#]]&/@SectorNames;
DefNiceConstantSymbol[\[Lambda],ToExpression[#]]&/@SectorNames;
DefNiceConstantSymbol[\[Nu],ToExpression[#]]&/@SectorNames;
DefNiceConstantSymbol[\[Mu],ToExpression[#]]&/@SectorNames;
DefNiceConstantSymbol[\[Omega],ToExpression[#]]&/@SectorNames;

(*
Solutions={};
PB0pT[-n,-m,a,c]-\[Xi]B0p PB0p[g,h]PBPara[-g,-h,-n,-m]PB0p[e,f]PBPara[-e,-f,a,c]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]B0p][[1]]]
PB1pT[-n,-m,a,c]-\[Xi]B1p PB1p[-x,-y,g,h]PBPara[-g,-h,-n,-m]PB1p[x,y,e,f]PBPara[-e,-f,a,c]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]B1p][[1]]]
PB1mT[-n,-m,a,c]-\[Xi]B1m PB1m[-x,h]PBPerp[-h,-n,-m]PB1m[x,f]PBPerp[-f,a,c]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]B1m][[1]]]
PB2pT[-n,-m,a,c]-\[Xi]B2p PB2p[-x,-y,g,h]PBPara[-g,-h,-n,-m]PB2p[x,y,e,f]PBPara[-e,-f,a,c]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]B2p][[1]]]
Antisymmetrize[Antisymmetrize[PA0pT[-n,-m,-o,a,b,c]-\[Xi]A0p PA0p[g,h]PAPerp[-g,-h,-n,-m,-o]PA0p[e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{a,b}]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]A0p][[1]]]
Antisymmetrize[Antisymmetrize[PA0mT[-n,-m,-o,a,b,c]-\[Xi]A0m PA0m[g,h,i]PAPara[-g,-h,-i,-n,-m,-o]PA0m[e,f,j]PAPara[-e,-f,-j,a,b,c],{-n,-m}],{a,b}]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]A0m][[1]]]
Antisymmetrize[Antisymmetrize[PA1pT[-n,-m,-o,a,b,c]-\[Xi]A1p PA1p[-x,-y,g,h]PAPerp[-g,-h,-n,-m,-o]PA1p[x,y,e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{a,b}]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]A1p][[1]]]
Antisymmetrize[Antisymmetrize[PA1mT[-n,-m,-o,a,b,c]-\[Xi]A1m PA1m[-x,g,h,i]PAPara[-g,-h,-i,-n,-m,-o]PA1m[x,e,f,j]PAPara[-e,-f,-j,a,b,c],{-n,-m}],{a,b}]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]A1m][[1]]]
Antisymmetrize[Antisymmetrize[PA2pT[-n,-m,-o,a,b,c]-\[Xi]A2p PA2p[-x,-y,g,h]PAPerp[-g,-h,-n,-m,-o]PA2p[x,y,e,f]PAPerp[-e,-f,a,b,c],{-n,-m}],{a,b}]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]A2p][[1]]]
Antisymmetrize[Antisymmetrize[PA2mT[-n,-m,-o,a,b,c]-\[Xi]A2m PA2m[-x,-y,-z,g,h,i]PAPara[-g,-h,-i,-n,-m,-o]PA2m[x,y,z,e,f,j]PAPara[-e,-f,-j,a,b,c],{-n,-m}],{a,b}]/.PO3TActivate/.PO3PiActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors;
Solutions=Join[Solutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Xi]A2m][[1]]]

DumpSave["O3Differences.mx",{Solutions}];
Quit[]
*)
<<O3Differences.mx;
(*
Solutions
AntiSolutions={};
PB0p[g,h]PBPara[-g,-h,a,e]-\[Zeta]B0p PB0p[x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Beta]1W PT1[-i,-g,-h,a,c,d]+\[Beta]2W PT2[-i,-g,-h,a,c,d]+\[Beta]3W PT3[-i,-g,-h,a,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]B0p][[1]]]
PB1p[-q,-r,g,h]PBPara[-g,-h,a,e]-\[Zeta]B1p PB1p[-q,-r,x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Beta]1W PT1[-i,-g,-h,a,c,d]+\[Beta]2W PT2[-i,-g,-h,a,c,d]+\[Beta]3W PT3[-i,-g,-h,a,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]B1p][[1]]]
PB1m[-q,h]PBPerp[-h,a,e]-\[Zeta]B1m PB1m[-q,z]PBPerp[-z,i,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Beta]1W PT1[-i,-g,-h,a,c,d]+\[Beta]2W PT2[-i,-g,-h,a,c,d]+\[Beta]3W PT3[-i,-g,-h,a,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]B1m][[1]]]
PB2p[-q,-r,g,h]PBPara[-g,-h,a,e]-\[Zeta]B2p PB2p[-q,-r,x,z]PBPara[-x,-z,i,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Beta]1W PT1[-i,-g,-h,a,c,d]+\[Beta]2W PT2[-i,-g,-h,a,c,d]+\[Beta]3W PT3[-i,-g,-h,a,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]B2p][[1]]]
PA0p[g,h]Antisymmetrize[PAPerp[-g,-h,a,b,e],{a,b}]-\[Zeta]A0p PA0p[x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]A0p][[1]]]
PA0m[g,h,i]Antisymmetrize[PAPara[-g,-h,-i,a,b,e],{a,b}]-\[Zeta]A0m PA0m[x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]A0m][[1]]]
PA1p[-p,-q,g,h]Antisymmetrize[PAPerp[-g,-h,a,b,e],{a,b}]-\[Zeta]A1p PA1p[-p,-q,x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]A1p][[1]]]
PA1m[-p,g,h,i]Antisymmetrize[PAPara[-g,-h,-i,a,b,e],{a,b}]-\[Zeta]A1m PA1m[-p,x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]A1m][[1]]]
PA2p[-p,-q,g,h]Antisymmetrize[PAPerp[-g,-h,a,b,e],{a,b}]-\[Zeta]A2p PA2p[-p,-q,x,z]PAPerp[-x,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]A2p][[1]]]
PA2m[-q,-p,-r,g,h,i]Antisymmetrize[PAPara[-g,-h,-i,a,b,e],{a,b}]-\[Zeta]A2m PA2m[-q,-p,-r,x,y,z]PAPara[-x,-y,-z,i,j,f]V[g]PPara[-f,h]V[-c]PPara[e,-d](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])/.PO3PiActivate/.PActivate/.PADMPiActivate/.PADMActivate//ToCanonical//CollectTensors
AntiSolutions=Join[AntiSolutions,Solve[ToConstantSymbolEquations[%\[Equal]0],\[Zeta]A2m][[1]]]

DumpSave["O3AntiDifferences.mx",{AntiSolutions}];
Quit[]
*)
<<O3AntiDifferences.mx;
Solutions;
AntiSolutions;
TotalSolutions=Join[Solutions,AntiSolutions]

(*
ConstraintHamiltonian=(1/4)(\[Omega]B0p PhiB0p[]PhiB0p[]+\[Omega]B1p PhiB1p[-a,-b]PhiB1p[a,b]+\[Omega]B1m PhiB1m[-a]PhiB1m[a]+\[Omega]B2p PhiB2p[-a,-b]PhiB2p[a,b]+\[Omega]A0p PhiA0p[]PhiA0p[]+\[Omega]A0m PhiA0m[]PhiA0m[]+\[Omega]A1p PhiA1p[-a,-b]PhiA1p[a,b]+\[Omega]A1m PhiA1m[-a]PhiA1m[a]+\[Omega]A2p PhiA2p[-a,-b]PhiA2p[a,b]+\[Omega]A2m PhiA2m[-a,-b,-c]PhiA2m[a,b,c])/.TotalSolutions//ToCanonical//CollectTensors;
ConstraintHamiltonian=ConstraintHamiltonian/.PhiActivate//NoScalar//ToCanonical//CollectTensors
ConstraintHamiltonian=ConstraintHamiltonian/.ExpandStrengths//NoScalar//ToCanonical//CollectTensors
DumpSave["ConstraintHamiltonian.mx",{ConstraintHamiltonian}];
Quit[]
*)
<<ConstraintHamiltonian.mx;
(*
LagrangianHamiltonian=-T[i,-x,-y]PPara[x,g]PPara[y,h](\[Beta]1W PT1[-i,-g,-h,a,c,d]+\[Beta]2W PT2[-i,-g,-h,a,c,d]+\[Beta]3W PT3[-i,-g,-h,a,c,d])PPara[-c,-p]PPara[-d,-q]T[-a,p,q]-R[i,j,-x,-y]PPara[x,g]PPara[y,h](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,-p]PPara[-d,-q]R[-a,-b,p,q]/.TotalSolutions//ToCanonical//CollectTensors
LagrangianHamiltonian=LagrangianHamiltonian/.PADMActivate/.PActivate//ToCanonical//CollectTensors
LagrangianHamiltonian=LagrangianHamiltonian/.ExpandStrengths//ToCanonical//ScreenDollarIndices//CollectTensors
LagrangianHamiltonian=LagrangianHamiltonian//ToCanonical//ScreenDollarIndices//CollectTensors
DumpSave["LagrangianHamiltonian.mx",{LagrangianHamiltonian}];
Quit[]
*)
<<LagrangianHamiltonian.mx;

Freedoms={};
CriticalCombinations={\[Beta]2W,\[Beta]1W+2\[Beta]3W,2\[Beta]1W+\[Beta]2W,\[Beta]1W,\[Alpha]4W+\[Alpha]6W,\[Alpha]2W+\[Alpha]3W,\[Alpha]2W+\[Alpha]5W,\[Alpha]4W+\[Alpha]5W,\[Alpha]1W+\[Alpha]4W,\[Alpha]1W+\[Alpha]2W};
Relevants={};
SimpleCombinations={0,\[Beta]1W-\[Beta]3W,\[Beta]1W-\[Beta]2W,0,\[Alpha]4W-\[Alpha]6W,\[Alpha]2W-\[Alpha]3W,\[Alpha]2W-\[Alpha]5W,\[Alpha]4W-\[Alpha]5W,\[Alpha]1W-\[Alpha]4W,\[Alpha]1W-\[Alpha]2W};

For[ii=1,ii<11,ii++,If[Evaluate[CriticalCombinations[[ii]]/.Theory]==0,AppendTo[Freedoms,Evaluate[ToExpression["\[Lambda]"<>ToString[SectorNames[[ii]]]<>"->0"]]],AppendTo[Freedoms,Evaluate[ToExpression["\[Lambda]"<>ToString[SectorNames[[ii]]]<>"->1"]]],AppendTo[Freedoms,Evaluate[ToExpression["\[Lambda]"<>ToString[SectorNames[[ii]]]<>"->1"]]]]]
For[ii=1,ii<11,ii++,If[Evaluate[SimpleCombinations[[ii]]/.Theory]==0&&Evaluate[CriticalCombinations[[ii]]/.Theory]==0,AppendTo[Relevants,Evaluate[ToExpression["\[Nu]"<>ToString[SectorNames[[ii]]]<>"->0"]]],AppendTo[Relevants,Evaluate[ToExpression["\[Nu]"<>ToString[SectorNames[[ii]]]<>"->1"]]],AppendTo[Relevants,Evaluate[ToExpression["\[Nu]"<>ToString[SectorNames[[ii]]]<>"->1"]]]]]
DefTensor[Eps[-a,-b,-c],M4,Antisymmetric[{-a,-b,-c}]];

MomentumListB=DeleteCases[{\[Nu]B0p PiB0p[],\[Nu]B1p PiB1p[-a,-b],\[Nu]B1m PiB1m[-a],\[Nu]B2p PiB2p[-a,-b]}/.Relevants,0];
XMomentumListB=Eps[-x,-y,-z]#&/@MomentumListB;
MomentumListB=Join[MomentumListB,XMomentumListB];
ScalarMomentumListB={};
For[ii=1,ii<Length[MomentumListB]+1,ii++,If[Length[Evaluate[FindFreeIndices[Evaluate[MomentumListB[[ii]]]]]]==0,AppendTo[ScalarMomentumListB,MomentumListB[[ii]]]]];

MomentumListA=DeleteCases[{\[Nu]A0p PiA0p[],\[Nu]A0m PiA0m[],\[Nu]A1p PiA1p[-a,-b],\[Nu]A1m PiA1m[-a],\[Nu]A2p PiA2p[-a,-b],\[Nu]A2m PiA2m[-a,-b,-c]}/.Relevants,0];
XMomentumListA=Eps[-x,-y,-z]#&/@MomentumListA;
MomentumListA=Join[MomentumListA,XMomentumListA];
ScalarMomentumListA={};
For[ii=1,ii<Length[MomentumListA]+1,ii++,If[Length[Evaluate[FindFreeIndices[Evaluate[MomentumListA[[ii]]]]]]==0,AppendTo[ScalarMomentumListA,MomentumListA[[ii]]]]];

ToParallelG=MakeRule[{G[-a,-b],PPara[-a,-b]},MetricOn->All,ContractMetrics->True];
ToParallelEps=MakeRule[{Eps[-a,-b,-c],V[d]epsilonG[-d,-a,-b,-c]},MetricOn->All,ContractMetrics->True];
ToParallel=Join[ToParallelG,ToParallelEps];
NewFreedoms={};
Scan[Module[{Av,Bv,Cv,Dv,total,sector},sector=#;Av=ToExpression["\[Zeta]"<>ToString[sector]];Bv=ToExpression["\[Xi]"<>ToString[sector]];Cv=ToExpression["\[Lambda]"<>ToString[sector]];Dv=ToExpression["\[Omega]"<>ToString[sector]];total=Av Bv Cv;total=total/.Freedoms;total=total/.TotalSolutions;total=total/.Theory;AppendTo[NewFreedoms,Evaluate[Dv->total]];]&,SectorNames]
NewFreedoms
(*
ConstraintHamiltonian=ConstraintHamiltonian/.NewFreedoms//ToCanonical;
ConstraintHamiltonian=ConstraintHamiltonian//ToCanonical//ScreenDollarIndices//CollectTensors;
LagrangianHamiltonian=LagrangianHamiltonian/.Theory//ToCanonical;
LagrangianHamiltonian=LagrangianHamiltonian//ToCanonical//ScreenDollarIndices//CollectTensors;
SuperHamiltonian=ConstraintHamiltonian+LagrangianHamiltonian//ToCanonical//ScreenDollarIndices//CollectTensors
*)
DefTensor[J[],M4];
AutomaticRules[J,MakeRule[{J[]Ji[],1},MetricOn->All,ContractMetrics->True]];
AutomaticRules[J,MakeRule[{CD[-a][J[]],Evaluate[J[]H[-k,n]PPara[k,-i]CD[-a][B[i,-n]]/.PADMActivate]},MetricOn->All,ContractMetrics->True]];
ForceMeasureCancellation=MakeRule[{J[]Ji[],1},MetricOn->All,ContractMetrics->True];

DefTensor[BCompliment[-i,-k],M4];
DefTensor[ACompliment[-i,-j,-k],M4];
(*
compliment=J[]4 V[g]B[-k,-o]G3[o,-z]H[h,z](\[Beta]1W PT1[-i,-g,-h,a,c,d]+\[Beta]2W PT2[-i,-g,-h,a,c,d]+\[Beta]3W PT3[-i,-g,-h,a,c,d])PPara[-c,x]PPara[-d,y]T[-a,-x,-y]/.PActivate/.PADMActivate//ToCanonical//ContractMetric//CollectTensors;
compliment=compliment/.NewRemoveG3//ToCanonical//ContractMetric//CollectTensors;
BcomplimentValue=compliment/.ExpandStrengths//ToCanonical//ContractMetric//CollectTensors;
compliment=J[] 8V[g]B[-k,-o]G3[o,-z]H[h,z](\[Alpha]1W PR1[-i,-j,-g,-h,a,b,c,d]+\[Alpha]2W PR2[-i,-j,-g,-h,a,b,c,d]+\[Alpha]3W PR3[-i,-j,-g,-h,a,b,c,d]+\[Alpha]4W PR4[-i,-j,-g,-h,a,b,c,d]+\[Alpha]5W PR5[-i,-j,-g,-h,a,b,c,d]+\[Alpha]6W PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,x]PPara[-d,y]R[-a,-b,-x,-y]/.PActivate/.PADMActivate//ToCanonical//ContractMetric//CollectTensors;
compliment=compliment/.NewRemoveG3//ToCanonical//ContractMetric//CollectTensors;
AcomplimentValue=compliment/.ExpandStrengths//ToCanonical//ContractMetric//CollectTensors;

DumpSave["compliments.mx",{AcomplimentValue,BcomplimentValue}];
Quit[]
*)
<<compliments.mx;
(*
TransformBCompliment=MakeRule[{BCompliment[-i,-k],Evaluate[BcomplimentValue]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
TransformACompliment=MakeRule[{ACompliment[-i,-j,-k],Evaluate[AcomplimentValue]},MetricOn\[Rule]All,ContractMetrics\[Rule]True];
TransformCompliments=Join[TransformBCompliment,TransformACompliment];

(\[Lambda]B0p PB0pT[-n,-m,a,c]+\[Lambda]B1p PB1pT[-n,-m,a,c]+\[Lambda]B2p PB2pT[-n,-m,a,c]+\[Lambda]B1m PB1mT[-n,-m,a,c])BPiP[-a,-c]+((1-\[Lambda]B0p)PB0pT[-n,-m,i,k]+(1-\[Lambda]B1p)PB1pT[-n,-m,i,k]+(1-\[Lambda]B2p)PB2pT[-n,-m,i,k]+(1-\[Lambda]B1m)PB1mT[-n,-m,i,k])BCompliment[-i,-k]/.PO3TActivate//ToCanonical//ContractMetric//CollectTensors;
OnShellBDefinition=%/.TransformCompliments//ToCanonical//ContractMetric

(\[Lambda]A0p PA0pT[-n,-m,-o,a,b,c]+\[Lambda]A1p PA1pT[-n,-m,-o,a,b,c]+\[Lambda]A2p PA2pT[-n,-m,-o,a,b,c]+\[Lambda]A0m PA0mT[-n,-m,-o,a,b,c]+\[Lambda]A1m PA1mT[-n,-m,-o,a,b,c]+\[Lambda]A2m PA2mT[-n,-m,-o,a,b,c])APiP[-a,-b,-c]+((1-\[Lambda]A0p)PA0pT[-n,-m,-o,i,j,k]+(1-\[Lambda]A1p)PA1pT[-n,-m,-o,i,j,k]+(1-\[Lambda]A2p)PA2pT[-n,-m,-o,i,j,k]+(1-\[Lambda]A0m)PA0mT[-n,-m,-o,i,j,k]+(1-\[Lambda]A1m)PA1mT[-n,-m,-o,i,j,k]+(1-\[Lambda]A2m)PA2mT[-n,-m,-o,i,j,k])ACompliment[-i,-j,-k]/.PO3TActivate//ToCanonical//ContractMetric//CollectTensors;
OnShellADefinition=%/.TransformCompliments//ToCanonical//ContractMetric

DumpSave["onshelldefinitions.mx",{OnShellBDefinition,OnShellADefinition}];
Quit[]
*)
<<onshelldefinitions.mx;
(*
(\[Mu]B0p \[Lambda]B0p PB0pT[-n,-m,a,c]+\[Mu]B1p \[Lambda]B1p PB1pT[-n,-m,a,c]+\[Mu]B2p \[Lambda]B2p PB2pT[-n,-m,a,c]+\[Mu]B1m \[Lambda]B1m PB1mT[-n,-m,a,c])BPiP[-a,-c]/.PO3TActivate//ToCanonical//ContractMetric//CollectTensors;
TaggantBDefinition=%//ToCanonical//ContractMetric

(\[Mu]A0p PA0pT[-n,-m,-o,a,b,c]+\[Mu]A1p PA1pT[-n,-m,-o,a,b,c]+\[Mu]A2p PA2pT[-n,-m,-o,a,b,c]+\[Mu]A0m PA0mT[-n,-m,-o,a,b,c]+\[Mu]A1m PA1mT[-n,-m,-o,a,b,c]+\[Mu]A2m PA2mT[-n,-m,-o,a,b,c])APiP[-a,-b,-c]/.PO3TActivate//ToCanonical//ContractMetric//CollectTensors;
TaggantADefinition=%//ToCanonical//ContractMetric

DumpSave["taggant.mx",{TaggantBDefinition,TaggantADefinition}];
Quit[]
*)
<<taggant.mx;

(*Original conditions to move on shell, much faster but danger from field/field strength dependency!*)
(*
OnShellBDefinition=(\[Lambda]B0p PB0pT[-n,-m,a,c]+\[Lambda]B1p PB1pT[-n,-m,a,c]+\[Lambda]B2p PB2pT[-n,-m,a,c]+\[Lambda]B1m PB1mT[-n,-m,a,c])BPiP[-a,-c]/.PO3TActivate//ToCanonical//ContractMetric//CollectTensors;
OnShellADefinition=(\[Lambda]A0p PA0pT[-n,-m,-o,a,b,c]+\[Lambda]A1p PA1pT[-n,-m,-o,a,b,c]+\[Lambda]A2p PA2pT[-n,-m,-o,a,b,c]+\[Lambda]A0m PA0mT[-n,-m,-o,a,b,c]+\[Lambda]A1m PA1mT[-n,-m,-o,a,b,c]+\[Lambda]A2m PA2mT[-n,-m,-o,a,b,c])APiP[-a,-b,-c]/.PO3TActivate//ToCanonical//ContractMetric//CollectTensors;
*)

Print["Trying to simplify the on-shell definition"];
TaggantList={\[Mu]B0p,\[Mu]B1p,\[Mu]B1m,\[Mu]B2p,\[Mu]A0p,\[Mu]A1p,\[Mu]A2p,\[Mu]A0m,\[Mu]A1m,\[Mu]A2m};
TaggantBDefinition=TaggantBDefinition/.Freedoms/.Theory//ToCanonical//ContractMetric//CollectTensors;
TaggantADefinition=TaggantADefinition/.Freedoms/.Theory//ToCanonical//ContractMetric//CollectTensors;
OnShellBDefinition=OnShellBDefinition/.Freedoms/.Theory//ToCanonical//ContractMetric//CollectTensors;
OnShellADefinition=OnShellADefinition/.Freedoms/.Theory//ToCanonical//ContractMetric//CollectTensors;

TaggantBActivate=MakeRule[{BPiP[-n,-m],Evaluate[TaggantBDefinition]},MetricOn->All,ContractMetrics->True];
TaggantAActivate=MakeRule[{APiP[-n,-m,-o],Evaluate[TaggantADefinition]},MetricOn->All,ContractMetrics->True];
OnShellBActivate=MakeRule[{BPiP[-n,-m],Evaluate[OnShellBDefinition]},MetricOn->All,ContractMetrics->True];
OnShellAActivate=MakeRule[{APiP[-n,-m,-o],Evaluate[OnShellADefinition]},MetricOn->All,ContractMetrics->True];

OnShellActivate=Join[OnShellBActivate,OnShellAActivate];
TaggantActivate=Join[TaggantBActivate,TaggantAActivate];

BPiP[-n,-m]/.OnShellActivate;
APiP[-n,-m,-o]/.OnShellActivate;

(PB0pT[-n,-m,a,c]+PB1pT[-n,-m,a,c]+PB2pT[-n,-m,a,c]+PB1mT[-n,-m,a,c])BPiP[-a,-c]/.PO3TActivate//ToCanonical//ContractMetric//CollectTensors

PhiB0pSubCanonical=PB0p[e,f]PBPara[-e,-f,a,c]BPiP[-a,-c]/.OnShellActivate;
PhiB1pSubCanonical=PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiP[-a,-c]/.OnShellActivate;
PhiB2pSubCanonical=PB2p[-n,-m,e,f]PBPara[-e,-f,a,c]BPiP[-a,-c]/.OnShellActivate;
PhiB1mSubCanonical=PB1m[-n,f]PBPerp[-f,a,c]BPiP[-a,-c]/.OnShellActivate;

PhiA0pSubCanonical=PA0p[e,f]PAPerp[-e,-f,a,b,c]APiP[-a,-b,-c]/.OnShellActivate;
PhiA1pSubCanonical=PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiP[-a,-b,-c]/.OnShellActivate;
PhiA2pSubCanonical=PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiP[-a,-b,-c]/.OnShellActivate;
PhiA0mSubCanonical=PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]APiP[-a,-b,-c]/.OnShellActivate;
PhiA1mSubCanonical=PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]APiP[-a,-b,-c]/.OnShellActivate;
PhiA2mSubCanonical=PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]APiP[-a,-b,-c]/.OnShellActivate;

(*
Print[Style["0^+ canonical",Red,16]]
PhiB0pSubCanonical=ToFieldStrengths[Ji[]PhiB0pSubCanonical]
Print[Style["1^+ canonical",Red,16]]
PhiB1pSubCanonical=ToFieldStrengths[Ji[]PhiB1pSubCanonical]
Print[Style["1^- canonical",Red,16]]
PhiB1mSubCanonical=ToFieldStrengths[Ji[]PhiB1mSubCanonical]
Print[Style["2^+ canonical",Red,16]]
PhiB2pSubCanonical=ToFieldStrengths[Ji[]PhiB2pSubCanonical]
Print[Style["0^+ canonical",Blue,16]]
PhiA0pSubCanonical=ToFieldStrengths[Ji[]PhiA0pSubCanonical]
Print[Style["0^- canonical",Blue,16]]
PhiA0mSubCanonical=ToFieldStrengths[Ji[]PhiA0mSubCanonical]
Print[Style["1^+ canonical",Blue,16]]
PhiA1pSubCanonical=ToFieldStrengths[Ji[]PhiA1pSubCanonical]
Print[Style["1^- canonical",Blue,16]]
PhiA1mSubCanonical=ToFieldStrengths[Ji[]PhiA1mSubCanonical]
Print[Style["2^+ canonical",Blue,16]]
PhiA2pSubCanonical=ToFieldStrengths[Ji[]PhiA2pSubCanonical]
Print[Style["2^- canonical",Blue,16]]
PhiA2mSubCanonical=ToFieldStrengths[Ji[]PhiA2mSubCanonical]

DumpSave["SectorValuesSub.mx",{PhiB0pSubCanonical,PhiB1pSubCanonical,PhiB1mSubCanonical,PhiB2pSubCanonical,PhiA0pSubCanonical,PhiA0mSubCanonical,PhiA1pSubCanonical,PhiA1mSubCanonical,PhiA2pSubCanonical,PhiA2mSubCanonical}];
*)
<<SectorValuesSub.mx;

Derivative3B=MakeRule[{CD[-a][B[b,-c]],G3[-a,d]CD[-d][B[b,-c]]},MetricOn->All,ContractMetrics->True];
Derivative3A=MakeRule[{CD[-a][A[b,e,-c]],G3[-a,d]CD[-d][A[b,e,-c]]},MetricOn->All,ContractMetrics->True];
Derivative3=Join[Derivative3B,Derivative3A];

DefTensor[KX[-a,-b,-c],M4];
DefTensor[KKX[-a,-b,-c,-d],M4,Antisymmetric[{-b,-c}]];
InertDerB=MakeRule[{CD[-a][B[-b,-c]],KX[-a,-b,-c]},MetricOn->All,ContractMetrics->True];
InertDerA=MakeRule[{CD[-a][A[-b,-c,-d]],KKX[-a,-b,-c,-d]},MetricOn->All,ContractMetrics->True];
InertDer=Join[InertDerB,InertDerA];
DefConstantSymbol[\[CapitalXi]];
Quit[]
MomentaList={}

StandardSimplifier[x_]:=Module[{temp},temp=x;temp=temp//ToCanonical;temp=temp//ContractMetric;temp=temp//ScreenDollarIndices;temp];

MomentumList
ScalarMomentumList

ProvideBracketAnsatz[expr_,quadrant_]:=Module[{BracketBilinear,BracketIndices,BracketSymmetryTotal,BracketSymmetryIndices,BracketSymmetryUsable,BracketAnsatz,SchematicBracketAnsatz,MomentumList,ScalarMomentumList},Print[Style["Forming bracket ansatz...",Purple,16]];BracketBilinear=expr;
Print[Style["Listing free indices, etc...",Purple,10]];
BracketIndices=FindFreeIndices[Evaluate[BracketBilinear]];
If[quadrant==BB,{MomentumList=MomentumListB,ScalarMomentumList=ScalarMomentumListB}];
If[quadrant==BA,{MomentumList=MomentumListA,ScalarMomentumList=ScalarMomentumListA}];
If[Length[BracketIndices]!=0,
{Print[Style["Finding permutation group of expression, etc...",Purple,10]];
BracketSymmetryTotal=SymmetryOf[BracketBilinear];
BracketSymmetryIndices=Map[ToExpression[StringDelete[ToString[#],"\[FilledCircle]"]]&,BracketSymmetryTotal[[3]]];
BracketSymmetryUsable=BracketSymmetryTotal[[4]]/.BracketSymmetryIndices;
Print[Style["Constructing ansatz, etc...",Purple,10]];
BracketAnsatz=MakeContractionAnsatz[MomentumList,BracketIndices,BracketSymmetryUsable];},{
Print[Style["Constructing ansatz, etc...",Purple,10]];
BracketAnsatz=MakeAnsatz[ScalarMomentumList];}];
SchematicBracketAnsatz=BracketAnsatz//CollectTensors;
Print[Style["Converting to parallel ansatz, etc...",Purple,10]];
BracketAnsatz=BracketAnsatz/.ToParallel/.PADMActivate//ToCanonical;
Print[Style["Expanding symmetrizations of parallel momenta, etc...",Purple,10]];
BracketAnsatz=BracketAnsatz/.PiPActivate//ToCanonical;
Print[Style["Collecting, etc...",Purple,10]];
BracketAnsatz=BracketAnsatz//CollectTensors;
Print[Style["Restricting to shell, etc...",Purple,10]];
BracketAnsatz=BracketAnsatz//StandardSimplifier;
Print[Style["Collecting, etc...",Purple,10]];
BracketAnsatz=BracketAnsatz//CollectTensors;
{BracketAnsatz,SchematicBracketAnsatz}];

ConstraintPoissonBracket[f1x_,f2x_,quadrant_]:=Module[{sur,sur1,sur2,res,ris,f1,f2,f1a,f2a,f1b,f2b,nf1,nf2,NonVanishing,final,failtrue,BracketForm,BracketAnsatzFull,BracketAnsatz,BracketSolution,AnsatzSolutions,difference},Print[Style["Evaluating local Poisson between:",Purple,20]];Print[f1x];Print[f2x];Print[Style["Expanding constraints...",Orange,10]];f1=f1x/.PhiActivate/.Theory/.ExpandStrengths//StandardSimplifier//NoScalar;f2=f2x/.PhiActivate/.Theory/.ExpandStrengths//StandardSimplifier//NoScalar;nf1=Length[FindFreeIndices[f1]];nf2=Length[FindFreeIndices[f2]];(*If[nf1!=0&&nf2!=0,f1a=ChangeFreeIndices[f1,Drop[{-a,-b,-c},Evaluate[3-nf1]]];f2a=ChangeFreeIndices[f2,Drop[{-d,-e,-f},Evaluate[3-nf2]]];,f1a=f1;f2a=f2];*)f1a=ReplaceDummies[f1];f2a=ReplaceDummies[f2];BracketForm=f1x f2x//ToCanonical;If[quadrant==BB||quadrant==BA,BracketAnsatzFull=ProvideBracketAnsatz[BracketForm,quadrant];];f1a=f1a/.Derivative3;f2a=f2a/.Derivative3;f1b=f1a/.InertDer;f2b=f2a/.InertDer;Print[Style["Taking variational derivatives...",Orange,10]];sur=(VarAction[f1a,B[q,-r]]+DVDB[-x,-q,r]VarAction[f1a,V[-x]]+DHDB[-x,y,-q,r]VarAction[f1a,H[-x,y]]+DJDB[-q,r]VarAction[f1a,Ji[]])VarAction[f2a,BPi[-q,r]]-(VarAction[f2a,B[q,-r]]+DVDB[-x,-q,r]VarAction[f2a,V[-x]]+DHDB[-x,y,-q,r]VarAction[f2a,H[-x,y]]+DJDB[-q,r]VarAction[f2a,Ji[]])VarAction[f1a,BPi[-q,r]]+VarAction[f1a,A[q,r,-s]]VarAction[f2a,APi[-q,-r,s]]-VarAction[f2a,A[q,r,-s]]VarAction[f1a,APi[-q,-r,s]];Print[Style["Taking surface 1...",Orange,10]];sur1=-VarAction[f1b,KX[-z,q,-r]]VarAction[f2b,BPi[-q,r]]-VarAction[f1b,KKX[-z,q,r,-s]]VarAction[f2b,APi[-q,-r,s]];Print[Style["Taking surface 2...",Orange,10]];sur2=VarAction[f2b,KX[-z,q,-r]]VarAction[f1b,BPi[-q,r]]+VarAction[f2b,KKX[-z,q,r,-s]]VarAction[f1b,APi[-q,-r,s]];res={sur,sur1,sur2};PrintTemporary[Style["Canonicalizing...",Orange,10]];res=StandardSimplifier/@res;Print[Style["Converting to parallel momenta, etc...",Orange,10]];res=res/.PiToPiP;res=StandardSimplifier/@res;Print[Style["Magic orthogonality, etc...",Orange,10]];res=res/.MagicOrthogonality;res=StandardSimplifier/@res;Print[Style["Moving to shell, etc...",Orange,10]];res=res/.OnShellActivate;res=res/.Derivative3;res=StandardSimplifier/@res;Print[Style["RemoveG3, etc...",Orange,10]];res=res/.NewRemoveG3;res=StandardSimplifier/@res;Print[Style["New assault",Orange,10]];res=res/.NewAssault;res=StandardSimplifier/@res;Print[Style["Checking surfaces are coherent (should give 0)",Orange,10]];test=res[[2]]-res[[3]]//StandardSimplifier//Simplify;If[test==0,failtrue=0,failtrue=1,failtrue=1];Print[Style["Main",Red,16]];(*Print[res[[1]]];*)Print[Style["Surface 1",Red,16]];(*Print[res[[2]]];*)Print[Style["Surface 2",Red,16]];(*Print[res[[3]]];*)Print[Style["Total Poisson bracket at edge of mass shell",Red,10]];If[failtrue==0,final=res[[1]]-CD[-z][res[[2]]]//StandardSimplifier//Simplify,final=res[[1]]//StandardSimplifier//Simplify];Print[final];
If[quadrant==BB||quadrant==BA,{Print[Style["Comparing with bracket ansatz...",Red,16]];
final=final//CollectTensors;
final=final//NoScalar/.ForceMeasureCancellation//CollectTensors;
BracketAnsatz=BracketAnsatzFull[[1]] Ji[]//CollectTensors;
difference=final-BracketAnsatz//CollectTensors;
AnsatzSolutions=SolveConstants[difference==0,!TheoryParameters];
(*Print[AnsatzSolutions];*)
BracketSolution=BracketAnsatzFull[[2]]/.AnsatzSolutions[[1]]//StandardSimplifier;
Print[BracketSolution];}];
Print[Style["Schematic evaluation",Red,16]];
If[final!=0&&failtrue==0,NonVanishing=1,NonVanishing=0,NonVanishing=1];Print[NonVanishing];NonVanishing];

CanonicalSector[sectr_]:=Module[{res},Evaluate[ToExpression["Phi"<>ToString[sectr]<>"CanonicalUse=Phi"<>ToString[sectr]<>"Canonical/.Theory/.ExpandStrengths//ToCanonical//CollectTensors//ScreenDollarIndices;"]];Evaluate[ToExpression["Phi"<>ToString[sectr]<>"Canonical=Phi"<>ToString[sectr]<>"Canonical/.Theory/.ExpandStrengths/.PiToPiP//ToCanonical//CollectTensors//ScreenDollarIndices;"]];Evaluate[ToExpression["Phi"<>ToString[sectr]<>"NonCanonical=Phi"<>ToString[sectr]<>"NonCanonical/.Theory/.ExpandStrengths//ToCanonical//CollectTensors//ScreenDollarIndices;"]];Print[Style["Canonical "<>ToString[sectr],Red,16]];Print[Evaluate[ToExpression["Phi"<>ToString[sectr]<>"Canonical"]]];
Print[Style["Canonical to shell "<>ToString[sectr],Blue,16]];Print[Evaluate[ToExpression["Phi"<>ToString[sectr]<>"Canonical/.OnShellActivate//ToCanonical//CollectTensors//ScreenDollarIndices"]]];Print[Style["Non Canonical "<>ToString[sectr],Orange,10]];tes=Evaluate[ToExpression["Phi"<>ToString[sectr]<>"NonCanonical"]];If[tes==0,Print[Style["Constrained",Orange,10]],Print[Style["Free",Orange,10]],Print[Style["Free",Orange,10]];];];

Scan[CanonicalSector,SectorNames];

Print[Style["Attempting Poisson bracket of constraint with super-Hamiltonian",Orange,10]];
(*
ConstraintPoissonBracket[PhiA2m[-e,-f,-g],PhiB1p[-a,-b],BA];
*)

mat=Table[0,{i,10},{j,10}];
mat//MatrixForm

Sector[ii_,jj_]:=If[ii<=4,If[jj<=4,BB,BA],AA];
Constraint1={PhiB0p[],PhiB1p[-a,-b],PhiB1m[-a],PhiB2p[-a,-b],PhiA0p[],PhiA0m[],PhiA1p[-a,-b],PhiA1m[-a],PhiA2p[-a,-b],PhiA2m[-a,-b,-c]};
Constraint2={PhiB0p[],PhiB1p[-e,-f],PhiB1m[-e],PhiB2p[-e,-f],PhiA0p[],PhiA0m[],PhiA1p[-e,-f],PhiA1m[-e],PhiA2p[-e,-f],PhiA2m[-e,-f,-g]};

For[ii=1,ii<11,ii++,For[jj=1,jj<11,jj++,{If[ii<=jj,If[Evaluate[ToExpression["\[Lambda]"<>ToString[SectorNames[[ii]]]<>"/.Freedoms"]]==0&&Evaluate[ToExpression["\[Lambda]"<>ToString[SectorNames[[jj]]]<>"/.Freedoms"]]==0,Print[Style[ToString[SectorNames[[ii]]]<>" "<>ToString[SectorNames[[jj]]],Green,16]];mat[[ii,jj]]=ConstraintPoissonBracket[Constraint1[[ii]],Constraint2[[jj]],Sector[ii,jj]];,Print[Style[ToString[SectorNames[[ii]]]<>" "<>ToString[SectorNames[[jj]]],Red,16]];mat[[ii,jj]]=Red;,Print[Style[ToString[SectorNames[[ii]]]<>" "<>ToString[SectorNames[[jj]]],Red,16]];mat[[ii,jj]]=Red;]],Print[mat//MatrixForm]}]]

(*
Opts={0,1};
For[ii=1,ii<11,ii++,For[jj=1,jj<11,jj++,If[ii<=jj,If[Evaluate[ToExpression["Phi"<>ToString[SectorNames[[ii]]]<>"NonCanonical"]]==0&&Evaluate[ToExpression["Phi"<>ToString[SectorNames[[jj]]]<>"NonCanonical"]]==0,Print[Style[ToString[SectorNames[[ii]]]<>" "<>ToString[SectorNames[[jj]]],Green,16]];mat[[ii,jj]]=Opts[[RandomInteger[{1,2}]]];,Print[Style[ToString[SectorNames[[ii]]]<>" "<>ToString[SectorNames[[jj]]],Red,16]];mat[[ii,jj]]=Red;,Print[Style[ToString[SectorNames[[ii]]]<>" "<>ToString[SectorNames[[jj]]],Red,16]];mat[[ii,jj]]=Red;]]]]
*)
mat//MatrixForm

RemoveRowsColumns[expr_,a_,b_: Null]:=Module[{M},M=Delete[expr,a];
If[b=!=Null,M=Transpose[Delete[Transpose[M],b]],M];
M];
For[ii=1,ii<11,ii++,For[jj=1,jj<11,jj++,mat[[jj,ii]]=mat[[ii,jj]]]];
mat//MatrixForm
Labels=SectorNames;
Labels
Multiplicities={1,3,3,5,1,1,3,3,5,5};
Tetrads=4;
For[ii=10,ii>0,ii--,If[Evaluate[ToExpression["\[Lambda]"<>ToString[SectorNames[[ii]]]]/.Freedoms]==1,{mat=RemoveRowsColumns[mat,ii,ii],Labels=Drop[Labels,{ii}],Multiplicities=Drop[Multiplicities,{ii}],If[ii<=4,Tetrads-=1]}]]
Labels

mat//MatrixForm

num=Dimensions[mat][[1]];
TaggantKeys={"\\PiP{B0p}","\\PiP{B1p}","\\PiP{B1m}","\\PiP{B2p}","\\PiP{A0p}","\\PiP{A0m}","\\PiP{A1p}","\\PiP{A1m}","\\PiP{A2p}","\\PiP{A2m}"};
(*keys=Join[{"\\APiP","\\BPiP","\\partial A","\\partial b","A","b","\\partial"},TaggantKeys];*)
keys={"\\APiP","\\BPiP","\\partial A","\\partial b","A","b","\\partial"};
Interpretor[x_]:=Module[{str},If[x==1,str="\\BPiP",str="\\cdot"];str];

ToInp[Case_,str_]:=Export["/home/williamb/Documents/physics/papers/paper-4/"<>ToString[Case]<>".txt",str];
str="\\begin{BMAT}(b){r";
For[kk=1,kk<num+1,kk++,str=str<>"c"];
str=str<>"l}{c";
For[kk=1,kk<num+1,kk++,str=str<>"c"];
str=str<>"c}\n";
Print[str];
For[ii=1,ii<num+1,ii++,{str=str<>" & \\scriptstyle{\\pic{"<>ToString[Labels[[ii]]]<>"}} ",If[ii==num,str=str<>"& \\\\\n"]}];
Print[str];
For[ii=1,ii<num+1,ii++,{str=str<>"\\scriptstyle{\\pic{"<>ToString[Labels[[ii]]]<>"}} ",For[jj=1,jj<num+1,jj++,str=str<>" & "<>Interpretor[mat[[ii,jj]]]],If[ii!=Tetrads&&ii!=num,str=str<>"& \\scriptstyle{"<>ToString[Multiplicities[[ii]]]<>"} \\\\\n",str=str<>"& \\scriptstyle{"<>ToString[Multiplicities[[ii]]]<>"} \\\\\n"],Print[str]}];
For[ii=1,ii<num+1,ii++,{str=str<>" & \\scriptstyle{"<>ToString[Multiplicities[[ii]]]<>"} ",If[ii==num,str=str<>"& \\n"]}];
Print[str]
str=str<>"\\addpath{(1,1,0)";
For[kk=1,kk<num+1,kk++,str=str<>"u"];
str=str<>"}\n";
str=str<>"\\addpath{("<>ToString[num+1]<>",1,0)";
For[kk=1,kk<num+1,kk++,str=str<>"u"];
str=str<>"}\n";
If[Tetrads!=0,
str=str<>"\\addpath{("<>ToString[Tetrads+1]<>","<>ToString[num-Tetrads+1]<>",0)l}\n";
str=str<>"\\addpath{("<>ToString[Tetrads+1]<>","<>ToString[num-Tetrads+1]<>",0)r}\n";
str=str<>"\\addpath{("<>ToString[Tetrads+1]<>","<>ToString[num-Tetrads+1]<>",0)u}\n";
str=str<>"\\addpath{("<>ToString[Tetrads+1]<>","<>ToString[num-Tetrads+1]<>",0)d}\n";]
str=str<>"\\end{BMAT}\n";
Print[str]
ToInp["test",str];

Quit[]


