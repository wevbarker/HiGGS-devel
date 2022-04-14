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
(*
$Path~AppendTo~NotebookDirectory[];
*)
(*Load HiGGS*)
Needs["xAct`HiGGS`"];
(*Build the HiGGS environment*)
BuildHiGGS[];
(*
DefTheory[{Alp1\[Equal]0,Alp2\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp5==0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0},"Export"->"MyTheory"];
Run["pkill -9 monitor_remote"];
Quit[];
*)
(*
DefTheory["Import"->"MyTheory"];
{"simple_spin_1+",{Alp1\[Equal]0,Alp2\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},
,}
*)
JobsBatch={{"simple_spin_0-2m_b",{Alp2==0,Alp4==0,Alp5==0,Alp6==0,Bet1==0,Bet2==0,Bet3==0,cAlp1==0,cAlp2==0,cAlp3==0,cAlp4==0,cAlp5==0,cAlp6==0,cBet1==0,cBet2==0,cBet3==0}}};
JobsBatch~StudyTheory~("Import"->True);
Quit[];



