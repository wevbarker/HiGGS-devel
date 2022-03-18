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
(*Load a general form of xAct so that the contexts distributed are not just Global`*)
Needs["xAct`xTras`"];
(*Batch job*)
BatchJob[x_]:=Module[{},
(*Start timing*)
StartTime=AbsoluteTime[];
(*Build the HiGGS environment*)
xAct`HiGGS`BuildHiGGS[];
(*
(*Define the theory*)
xAct`HiGGS`DefTheory[{Alp1\[Equal]0,Alp2\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}];
(*List of constraints with fresh indices for PBs*)
IndIfConstraints=(#~ChangeFreeIndices~({-l,-m,-n}~Take~Length@FindFreeIndices@#))&/@xAct`HiGGS`$IfConstraints;
(*Evaluate lots of Poisson brackets*)
xAct`HiGGS`PrimaryPoissonMatrix=Table[{xAct`HiGGS`$IfConstraints[[ii]],IndIfConstraints[[jj]],xAct`HiGGS`PoissonBracket[xAct`HiGGS`$IfConstraints[[ii]],IndIfConstraints[[jj]]]},{ii,Length@xAct`HiGGS`$IfConstraints},{jj,ii,Length@xAct`HiGGS`$IfConstraints}];
*)
TensorsList=$Tensors;
EndTime=AbsoluteTime[];
TotTime=EndTime-StartTime;
(*save to mx cache*)
DumpSave[FileNameJoin@{Directory[],"bin","results-"<>ToString@x<>".mx"},{TotTime,TensorsList}];
Quit[];
];
(*Make sure the BatchJob function is distributed over all parallel kernels*)
DistributeDefinitions[BatchJob];
(*Make sure all other Mathematica kernels are dead*)
CloseKernels[];
(*Specify to load HiGGS in all new kernels*)
ParallelNeeds["xAct`HiGGS`"];
(*Off we go...*)
LaunchKernels[];
(*Submit to the queue*)
JobLabels=Table[ii,{ii,20}];
Jobs=(ParallelSubmit@BatchJob@#)&/@JobLabels;
(*{ParallelSubmit@BatchJob["firstjob"],ParallelSubmit@BatchJob["secondjob"],ParallelSubmit@BatchJob["thirdjob"]};*)
(*Do the work*)
WaitAll[Jobs];
(*Make sure all kernerls are dead again*)
CloseKernels[];
(*what are the kernels*)
Print@Kernels[];
(*kill this kernel too*)
Quit[];
(*
(*maybe we use this some day!*)
ParallelTable[Brackets[[ii]],{ii,1,3}]
*)
(*Consider batch running in parallel*)
(*Evaluate some velocities*)
(*
Vel=Velocity[PhiB0p[]];
*)

