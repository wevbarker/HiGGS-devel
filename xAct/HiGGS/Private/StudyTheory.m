Options[StudyTheory]={
	"Export"->False,
	"Import"->False,
	"DefTheory"->True,
	"Brackets"->True,
	"Velocities"->True};

StudyTheory[InputBatch___:Null,OptionsPattern[]]:=Module[{
	LaunchSome,
	DefinedTheories,
	IndIfConstraints2,
	Jobs,
	PreparePPM,
	PPMs,
	SavePPM,
	PrepareVelocities,
	Velocities,
	SaveVelocity},

(*sometimes the launching of kernels simply hangs on the node: this repeats the process if it lasts more than n seconds*)
Global`$TryKernels=True;
If[ValueQ@Global`$Cores,
While[Global`$TryKernels,
HiGGSPrint[" ** StudyTheory: Attempting to launch kernels"];
CloseKernels[];
(*launch should be 32*)
TimeConstrained[Check[LaunchKernels[Global`$Cores],Global`$TryKernels=False;];
Global`$TryKernels=False;,
10,
CloseKernels[];
HiGGSPrint[" ** StudyTheory: Failed to launch kernels, retrying"];
];
];,
While[Global`$TryKernels,
HiGGSPrint[" ** StudyTheory: Attempting to launch kernels"];
CloseKernels[];
(*launch should be 32*)
TimeConstrained[Check[LaunchKernels[],Global`$TryKernels=False;];
Global`$TryKernels=False;,
10,
CloseKernels[];
HiGGSPrint[" ** StudyTheory: Failed to launch kernels, retrying"];
];
];];

If[OptionValue@"DefTheory",
If[!OptionValue@"Import",
If[OptionValue@"Velocities",
Jobs=ParallelSubmit@DefTheoryParallel[#2,"Export"->#1,"Velocities"->True]&@@@InputBatch;,
Jobs=ParallelSubmit@DefTheoryParallel[#2,"Export"->#1,"Velocities"->False]&@@@InputBatch;,
Jobs=ParallelSubmit@DefTheoryParallel[#2,"Export"->#1,"Velocities"->False]&@@@InputBatch;
];
HiGGSPrint[Jobs];
DefinedTheories=WaitAll[Jobs];
];
(*problems were encountered using DistributeDefinitions on the list of theory name strings for use in timing, so we use a binary*)
Print@InputBatch;
xAct`HiGGS`$TheoryNames=(#[[1]])&/@InputBatch;
(FileNameJoin@{$WorkingDirectory,"svy","node-"<>Global`$Node,"peta4.nom.mx"})~DumpSave~{xAct`HiGGS`$TheoryNames};
];


If[OptionValue@"Brackets",
PreparePPM[theory_String,conds_List]:=Module[{res,PPMArguments,IndIfConstraints},
DefTheory["Import"->theory];
IndIfConstraints=(#~ChangeFreeIndices~({-Global`l,-Global`m,-Global`n}~Take~Length@FindFreeIndices@#))&/@Global`$IfConstraints;
(*Evaluate lots of Poisson brackets*)
PPMArguments=Table[{theory,Global`$IfConstraints[[ii]],IndIfConstraints[[jj]]},{ii,Length@Global`$IfConstraints},{jj,ii,Length@Global`$IfConstraints}];
PPMArguments];
Jobs=(#1~PreparePPM~#2)&@@@InputBatch;
Print@Jobs;
Jobs=Map[(ParallelSubmit@PoissonBracketParallel[#[[2]],#[[3]],#[[1]],"Surficial"->True])&,Jobs,{3}];
Print@Jobs;
PPMs=WaitAll[Jobs];
PPMs=Riffle[xAct`HiGGS`$TheoryNames,PPMs]~Partition~2;
SavePPM[theory_String,PPM_]:=Module[{res,PPMArguments,IndIfConstraints},
DefTheory["Import"->theory];
Global`$PPM=PPM;
HiGGSPrint["$PPM value is ",Global`$PPM];
HiGGSPrint[" ** StudyTheory: Exporting the binary at "<>FileNameJoin@{"svy",theory<>".thr.mx"}];
(FileNameJoin@{$WorkingDirectory,"svy",theory<>".thr.mx"})~DumpSave~{xAct`HiGGS`$TheoryName,xAct`HiGGS`$Theory,Global`$ToTheory,Global`$ToShellFreedoms,Global`$StrengthPShellToStrengthPO3,Global`$PiPShellToPiPPO3,Global`$TheoryCDPiPToCDPiPO3,Global`$TheoryPiPToPiPO3,Global`$IfConstraintToTheoryNesterForm,Global`$IfConstraints,Global`$InertVelocity,Global`$ToOrderRules,Global`$PPM};
];
HiGGSPrint[PPMs];
SavePPM[#1,#2]&@@@PPMs;
];


If[OptionValue@"Velocities",
PrepareVelocities[theory_String,conds_List]:=Module[{res,IndIfConstraints},
DefTheory["Import"->theory];
IndIfConstraints=(#~ChangeFreeIndices~({-Global`q1,-Global`p1,-Global`v1}~Take~Length@FindFreeIndices@#))&/@Global`$IfConstraints;

{theory,IndIfConstraints}];
Jobs=(#1~PrepareVelocities~#2)&@@@InputBatch;
Velocities=VelocityParallel@Jobs;
Velocities=Riffle[xAct`HiGGS`$TheoryNames,Velocities]~Partition~2;
SaveVelocity[theory_String,Velocity_]:=Module[{res,PPMArguments,IndIfConstraints},
DefTheory["Import"->theory];
Global`$Velocities=Velocity;
HiGGSPrint["$Velocities value is ",Global`$Velocities];
HiGGSPrint[" ** StudyTheory: Exporting the binary at "<>FileNameJoin@{"svy",theory<>".thr.mx"}];
(FileNameJoin@{$WorkingDirectory,"svy",theory<>".thr.mx"})~DumpSave~{xAct`HiGGS`$TheoryName,xAct`HiGGS`$Theory,Global`$ToTheory,Global`$ToShellFreedoms,Global`$StrengthPShellToStrengthPO3,Global`$PiPShellToPiPPO3,Global`$TheoryCDPiPToCDPiPO3,Global`$TheoryPiPToPiPO3,Global`$IfConstraintToTheoryNesterForm,Global`$IfConstraints,Global`$InertVelocity,Global`$ToOrderRules,Global`$PPM,Global`$Velocities};
];
HiGGSPrint[Velocities];
SaveVelocity[#1,#2]&@@@Velocities;
];
];
