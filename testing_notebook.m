(* ::Package:: *)

(* ::Title:: *)
(*HiGGS testing notebook*)


(* ::Input::Initialization:: *)
(*Start timing*)
StartTime=AbsoluteTime[];
(*Because the developer version of HiGGS is not installed, and sits locally, we need this*)
(*AppendTo[$Path,NotebookDirectory[]];*)
AppendTo[$Path,"/home/wb263/HiGGS_development/"];
(*Load the package*)
Needs["xAct`HiGGS`"]
(*Build the HiGGS environment*)
BuildHiGGS[]
(*Define the theory*)
DefTheory[{Alp0==0,Alp1==0,Alp2==0,Alp3==0,Alp4==0,Alp6==0,Bet2==0,Bet1+2Bet3==0,cAlp2==0,cAlp3==0,cAlp5==0,cAlp6==0,cBet1==0,cBet2==0}]
(*Evaluate lots of Poisson brackets*)
PB=PoissonBracket[PhiB0p[],PhiB0p[]];
(*Don't yet bother with all these*)
(*
PoissonBracket[PhiB0p[],PhiB1p[-i,-j]];
PoissonBracket[PhiB0p[],PhiA0p[]];
PoissonBracket[PhiB0p[],PhiA0m[]];
PoissonBracket[PhiB0p[],PhiA2p[-i,-j]];
PoissonBracket[PhiB0p[],PhiA2m[-i,-j,-k]];

PoissonBracket[PhiB1p[-i,-j],PhiB1p[-l,-m]];
PoissonBracket[PhiB1p[-i,-j],PhiA0p[]];
PoissonBracket[PhiB1p[-i,-j],PhiA0m[]];
PoissonBracket[PhiB1p[-i,-j],PhiA2p[-l,-m]];
PoissonBracket[PhiB1p[-i,-j],PhiA2m[-l,-m,-n]];
*)
(*Stop timing*)
EndTime=AbsoluteTime[];
TotTime=EndTime-StartTime;
Print["Time taken is: ",TotTime];
DumpSave["/home/wb263/HiGGS_development/tests.nb",{TotTime,PB}];
Quit[];



