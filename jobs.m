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
(*Load HiGGS*)
Needs["xAct`HiGGS`"];
(*A list of jobs defined according to a theory and a name of that theory*)
(*
TheoryList={{"simple_spin_1+",{Alp1\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp5\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,Bet3\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},{"simple_spin_1-",{Alp1\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp5\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,Bet3\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},{"simple_spin_2-",{Alp1\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp5\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,Bet3\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},{"simple_spin_0-2-_a",{Alp1\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp5\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,Bet3\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},
{"simple_spin_0-2-_b",{Alp1\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp5\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,Bet3\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}}};
*)
(*
TheoryList={{"simple_spin_1+",{Alp1\[Equal]0,Alp2\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},{"simple_spin_1-",{Alp1==0,Alp2\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet3==0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},{"simple_spin_2-",{Alp2\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp5==0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,Bet3==0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},{"simple_spin_0-2-_a",{Alp1\[Equal]0,Alp3\[Equal]0,Alp4\[Equal]0,Alp5\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,Bet3\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}},
{"simple_spin_0-2-_b",{Alp2\[Equal]0,Alp4\[Equal]0,Alp5\[Equal]0,Alp6\[Equal]0,Bet1==0,Bet2\[Equal]0,Bet3\[Equal]0,cAlp1==0,cAlp2\[Equal]0,cAlp3\[Equal]0,cAlp4\[Equal]0,cAlp5\[Equal]0,cAlp6\[Equal]0,cBet1\[Equal]0,cBet2\[Equal]0,cBet3\[Equal]0}}};
*)

(*Build the HiGGS environment*)
BuildHiGGS[];
(**)
DefTheory[{Alp2==0,Alp3==0,Alp4==0,Alp5==0,Alp6==0,Bet1==0,Bet2==0,Bet3==0,cAlp1==0,cAlp2==0,cAlp3==0,cAlp4==0,cAlp5==0,cAlp6==0,cBet1==0,cBet2==0,cBet3==0},"Export"->"MyTheory"];
(**)
PoissonBracket[PhiB0p[],PhiB0p[]];
(**)
Quit[];

TheoryList={{"simple_spin_2-",{Alp2==0,Alp3==0,Alp4==0,Alp5==0,Alp6==0,Bet1==0,Bet2==0,Bet3==0,cAlp1==0,cAlp2==0,cAlp3==0,cAlp4==0,cAlp5==0,cAlp6==0,cBet1==0,cBet2==0,cBet3==0}},{"simple_spin_0-2-_a",{Alp1==0,Alp3==0,Alp4==0,Alp5==0,Alp6==0,Bet1==0,Bet2==0,Bet3==0,cAlp1==0,cAlp2==0,cAlp3==0,cAlp4==0,cAlp5==0,cAlp6==0,cBet1==0,cBet2==0,cBet3==0}},
{"simple_spin_0-2-_b",{Alp2==0,Alp4==0,Alp5==0,Alp6==0,Bet1==0,Bet2==0,Bet3==0,cAlp1==0,cAlp2==0,cAlp3==0,cAlp4==0,cAlp5==0,cAlp6==0,cBet1==0,cBet2==0,cBet3==0}}};
(*Batch job*)
BatchJob[x_]:=Module[{},
(*Start timing*)
StartTime=AbsoluteTime[];
(*Build the HiGGS environment*)
BuildHiGGS[];
(*Define the theory*)
DefTheory[x[[2]]];
(*List of constraints with fresh indices for PBs*)
IndIfConstraints=(#~ChangeFreeIndices~({-l,-m,-n}~Take~Length@FindFreeIndices@#))&/@$IfConstraints;
(*Evaluate lots of Poisson brackets*)
PrimaryPoissonMatrix=Table[{$IfConstraints[[ii]],IndIfConstraints[[jj]],PoissonBracket[$IfConstraints[[ii]],IndIfConstraints[[jj]]]},{ii,Length@$IfConstraints},{jj,ii,Length@$IfConstraints}];
(*New indices again*)
IndIfConstraints2=(#~ChangeFreeIndices~({-q1,-p1,-v1}~Take~Length@FindFreeIndices@#))&/@$IfConstraints;
(*eval velocities*)
Velocities=(Velocity@#)&/@IndIfConstraints2;
(*extend constraints*)
$IfConstraints=$IfConstraints~Join~Velocities;
(*List of constraints with fresh indices for PBs*)
IndIfConstraints=(#~ChangeFreeIndices~({-l,-m,-n}~Take~Length@FindFreeIndices@#))&/@$IfConstraints;
(*Evaluate lots of Poisson brackets*)
SecondaryPoissonMatrix=Table[{$IfConstraints[[ii]],IndIfConstraints[[jj]],PoissonBracket[$IfConstraints[[ii]],IndIfConstraints[[jj]]]},{ii,Length@$IfConstraints},{jj,ii,Length@$IfConstraints}];
(*Finish timing*)
EndTime=AbsoluteTime[];
TotTime=EndTime-StartTime;
(*save to mx cache*)
DumpSave[FileNameJoin@{Directory[],"bin","results-"<>ToString@x[[1]]<>".mx"},{TotTime,PrimaryPoissonMatrix,Velocities,SecondaryPoissonMatrix}];
(*It is very important to kill each kernel after the evaluation, otherwise it blocks the queue!*)
(*Quit[];*)
];
(*Make sure the BatchJob function is distributed over all parallel kernels*)
DistributeDefinitions[BatchJob];
(*Make sure all other Mathematica kernels are dead*)
(*CloseKernels[];*)
(*Specify to load HiGGS in all new kernels*)
ParallelNeeds["xAct`HiGGS`"];
(*Off we go...*)
(*LaunchKernels[];*)
(*Submit to the queue*)
Jobs=(ParallelSubmit@BatchJob@#)&/@TheoryList;
(*{ParallelSubmit@BatchJob["firstjob"],ParallelSubmit@BatchJob["secondjob"],ParallelSubmit@BatchJob["thirdjob"]};*)
(*Do the work*)
WaitAll[Jobs];
(*Make sure all kernerls are dead again*)
(*CloseKernels[];*)
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

