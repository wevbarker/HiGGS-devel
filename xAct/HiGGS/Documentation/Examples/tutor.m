(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
$Path~AppendTo~NotebookDirectory[];


(* ::Input::Initialization:: *)
Needs["xAct`HiGGS`"];


(* ::Input::Initialization:: *)
BuildHiGGS[];


(* ::Input::Initialization:: *)
Run@("rm -rf "<>FileNameJoin@{NotebookDirectory[],"fig/*"})
$PaperPrint=True;


(* ::Input::Initialization:: *)
HiGGSOutput@"basic_identities";
HiGGSEcho@(quantity={H[-a,b],B[a,-b],A[a,b,-c],V[a],V[a]V[-a],A[a,-a,-c],A[a,b,-c]+A[b,a,-c],H[-a,i]B[a,-j],H[-a,i]B[c,-i],G3[-a,-b]G3[b,-d],G3[-a,a],B[a,-b]G3[b,-c]V[-a],CD[-a][G3[-c,b]]});
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(ToCanonical@quantity);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"deriv_identities";
HiGGSEcho@(quantity={J[],Lapse[],CD[-a][V[-j]],CD[-a][H[-j,n]],CD[-a][J[]],CD[-a][Lapse[]]}//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"momenta_identities";
HiGGSEcho@(quantity={BPi[-a,b],APi[-a,-b,c],BPiP[-a,-b],APiP[-a,-b,-c],BPiP[-a,-b]V[b],APiP[-a,-b,-c]V[c]});
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity/.PiPToPi//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"pperp_ppara";
HiGGSEcho@(quantity={PPerp[-a,b],PPara[-a,b]});
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity/.PADMActivate//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"fieldstrengths";
HiGGSEcho@(quantity={R[-a,-b,-c,-d],R[a,-a,-c,-d],R[-a,-b,-c,c],T[a,-b,-c],T[a,-b,b]});
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity/.ExpandStrengths//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"multipliers";
HiGGSEcho@(quantity={RLambda[-a,-b,-c,-d],RLambda[a,-a,-c,-d],RLambda[-a,-b,-c,c],TLambda[a,-b,-c],TLambda[a,-b,b]});
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"soonethree";
HiGGSEcho@(R[-a,-b,-c,-d]/.StrengthSO13Activate//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(TLambda[-a,-b,-c]/.StrengthLambdaSO13Activate//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"soonethree_3";
HiGGSEcho@(quantity=(Alp1 PR1[-i,-k,-l,-m,a,b,c,d]+Alp2 PR2[-i,-k,-l,-m,a,b,c,d]+Alp3 PR3[-i,-k,-l,-m,a,b,c,d]+Alp4 PR4[-i,-k,-l,-m,a,b,c,d]+Alp5 PR5[-i,-k,-l,-m,a,b,c,d]+Alp6 PR6[-i,-k,-l,-m,a,b,c,d])R[-a,-b,-c,-d]);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity=quantity/.PActivate/.{Alp1->1,Alp2->1,Alp3->1,Alp4->1,Alp5->1,Alp6->1}//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(T[i,k,l](Bet1 PT1[-i,-k,-l,a,b,c])T[-a,-b,-c]+cAlp6 R[i,k,l,m] PR6[-i,-k,-l,-m,a,b,c,d]R[-a,-b,-c,-d]+T[i,k,l](cBet2 PT2[-i,-k,-l,a,b,c]+cBet3 PT3[-i,-k,-l,a,b,c])TLambda[-a,-b,-c]/.PActivate//ToCanonical//ContractMetric//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"othree";
HiGGSEcho@({APiP[-a,-b,-c],BPiP[-a,-b]}/.PiPToPiPO3//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"othree_2";
$Widetext=False;
HiGGSEcho@(quantity={R[-a,-b,-c,-d],RLambda[-a,-b,-c,-d],T[-a,-b,-c],TLambda[-a,-b,-c]}/.StrengthDecompose/.StrengthLambdaDecompose//ToCanonical//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity[[1]]/.StrengthPToStrengthPO3//ToCanonical//ContractMetric//ScreenDollarIndices//Simplify);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity[[4]]/.StrengthLambdaPToStrengthLambdaPO3/.StrengthLambdaPerpToStrengthLambdaPerpO3//ToCanonical//ContractMetric//ScreenDollarIndices//Simplify);
HiGGSPrint@%;
$Widetext=False;


(* ::Input::Initialization:: *)
HiGGSOutput@"othree_5";
HiGGSEcho@(quantity={PB0p[e,f]PBPara[-e,-f,a,c]BPiP[-a,-c],PB1m[-n,f]PBPerp[-f,a,c]BPiP[-a,-c],PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]APiP[-a,-b,-c],PR0p[e,f,g,h]RP[-e,-f,-g,-h],PR0m[e,f,g]RPerp[-e,-f,-g],PR1p[-n,-m,e,f,g,h]RLambdaP[-e,-f,-g,-h],PT1p[-a,-b,c,d]TPerp[-c,-d],PT2m[-a,-b,-c,d,e,f]TP[-d,-e,-f]}/.PADMPiActivate//ToCanonical//ContractMetric//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity=quantity/.PO3PiActivate/.PO3TActivate/.PO3RActivate/.PiPToPiPO3/.StrengthPToStrengthPO3/.StrengthPerpToStrengthPerpO3/.StrengthLambdaPToStrengthLambdaPO3/.StrengthLambdaPerpToStrengthLambdaPerpO3;
quantity=quantity//ToCanonical//ContractMetric//ScreenDollarIndices//Simplify;
quantity=quantity//ToCanonical//ContractMetric//ScreenDollarIndices//Simplify;);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"derivative";
HiGGSEcho@(quantity={DPiPA2m[-z,-a,-b,-c],CD[-z][PiPA2m[-a,-b,-c]],DRP2p[-z,-a,-b],CD[-z][RP2p[-a,-b]]});
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity=quantity/.DRPDeactivate/.DPiPDeactivate//ToCanonical//ContractMetric//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity=quantity/.DRPActivate/.DPiPActivate//ToCanonical//ContractMetric//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"derivative_4";
$Widetext=True;
HiGGSEcho@(quantity=G3[-y,z]#&/@quantity[[{1,3}]]//ToCanonical//ContractMetric//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity=quantity/.DpRPActivate/.DpPiPActivate//ToCanonical//ContractMetric//ScreenDollarIndices);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity=quantity/.DpRPDeactivate/.DpPiPDeactivate//ToCanonical//ContractMetric//ScreenDollarIndices);
HiGGSPrint@%;
$Widetext=False;


(* ::Input::Initialization:: *)
HiGGSOutput@"highlevel";
HiGGSEcho@(quantity={T[i,-j,-k],PiPB0p[],PiPA1p[-i,-j]}//ToBasicForm);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"highlevel_1";
$Widetext=True;
HiGGSEcho@(DpPiPB1m[-k,-i]//ToBasicForm);
HiGGSPrint@%;
$Widetext=False;


(* ::Input::Initialization:: *)
HiGGSOutput@"bianchi";
HiGGSEcho@(quantity2=epsilonG[r,m,l,n](CD[-l][B[k,-m]B[q,-n]R[i,j,-k,-q]]+A[i,-x,-l]B[k,-m]B[q,-n]R[x,j,-k,-q]+A[j,-x,-l]B[k,-m]B[q,-n]R[i,x,-k,-q])//ToBasicForm;);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"bianchi_1";
HiGGSEcho@(quantity2=((1/2)(#+CommuteCovDs[#,CD,{l,m}])//ToCanonical)&@quantity2;);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"highlevel_2";
HiGGSEcho@(quantity=ToNesterForm[quantity,"ToShell"->False]);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"highlevel_3";
$Widetext=True;
HiGGSEcho@(ToNesterForm[CD[-i][B[-a,-b]],"ToShell"->False]);
HiGGSPrint@%;
$Widetext=False;


(* ::Input::Initialization:: *)
HiGGSOutput@"highlevel_4";
HiGGSEcho@(ToNesterForm[PPara[-y,v]H[-v,w]G3[-w,m]PPara[-q,b1]H[-b1,a1]G3[-a1,l](G3[-l,n]V[-k]CD[-m][B[k,-n]]+G3[-l,n]B[j,-n]A[k,-j,-m]V[-k])/.PADMActivate,"ToShell"->False]);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"bianchi_2";
HiGGSEcho@(quantity=Eps[u,v,w]H[-u,m]H[-v,l]H[-w,n](CD[-m][B[i,-l]B[j,-n]T[s,-i,-j]]+A[s,-x,-m]B[i,-l]B[j,-n]T[x,-i,-j])/.PADMActivate//ToBasicForm;);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity=(V[-r](1/2)(#+CommuteCovDs[#,CD,{j,l}])//ToCanonical)&@quantity;);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSEcho@(quantity=ToNesterForm[quantity,"ToShell"->False];);
HiGGSPrint@%;


(* ::Input::Initialization:: *)
HiGGSOutput@"poissonbracket";
HiGGSEcho@(PoissonBracket[PiPB2p[-a,-b],TP1p[-c,-d],"ToShell"->False];);


(* ::Input::Initialization:: *)
$Widetext=True;
HiGGSOutput@"poissonbracketreadme";
HiGGSEcho@(PoissonBracket[PiPB2p[-a,-b],TP1p[-c,-d],"ToShell"->False];);
$Widetext=False;


(* ::Input::Initialization:: *)
HiGGSOutput@"poissonbracket_2";
$Widetext=True;
HiGGSEcho@(PoissonBracket[PiPB2p[-a,-b],TP1m[-c],"ToShell"->False];);
$Widetext=False;


(* ::Input::Initialization:: *)
HiGGSOutput@"poissonbracket_3";
HiGGSEcho@(PoissonBracket[PiPB2p[-i,-j],TP1m[-l],"ToShell"->False,"Surficial"->True];);


(* ::Input::Initialization:: *)
HiGGSOutput@"deftheory";
HiGGSEcho@(DefTheory[{Alp1==0,Alp2==0,Alp3==0,Alp4==0,Alp5==0,Alp6==0,Bet1==0,Bet2==0,Bet3==0,cAlp1==0,cAlp2==0,cAlp3==0,cAlp4==0,cAlp5==0,cAlp6==0,cBet1==0,cBet2==0,cBet3==0},"Export"->"EinsteinCartan","Order"->Infinity];);


(* ::Input::Initialization:: *)
HiGGSOutput@"viewtheory";
HiGGSEcho@(ViewTheory["EinsteinCartan_vel","Literature"->False];);


(* ::Input::Initialization:: *)
HiGGSOutput@"viewtheory2";
HiGGSEcho@(PoissonBracket[PhiA0m[],TP0m[],"ToShell"->True];);


(* ::Input::Initialization:: *)
HiGGSOutput@"viewtheory3";
HiGGSEcho@(PoissonBracket[PhiA2m[-i,-j,-k],TP2m[-l,-m,-n],"ToShell"->True];);


(* ::Input::Initialization:: *)
(*$Widetext=True;*)
HiGGSOutput@"yonester";
HiGGSEcho@(ViewTheory["simple_spin_1p","Literature"->False,"Velocities"->False];);
(*$Widetext=False;*)


(* ::Input::Initialization:: *)
$Widetext=False;
HiGGSOutput@"yonester2";
HiGGSEcho@(ViewTheory["simple_spin_1p_vel","Literature"->False,"PPM"->False,"Velocities"->True];);
$Widetext=False;
