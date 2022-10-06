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
xAct`HiGGS`$TryKernels=True;
If[ValueQ@xAct`HiGGS`$Cores,
While[xAct`HiGGS`$TryKernels,
HiGGSPrint[" ** StudyTheory: Attempting to launch kernels"];
CloseKernels[];
(*launch should be 32*)
TimeConstrained[Check[LaunchKernels[xAct`HiGGS`$Cores],xAct`HiGGS`$TryKernels=False;];
xAct`HiGGS`$TryKernels=False;,
10,
CloseKernels[];
HiGGSPrint[" ** StudyTheory: Failed to launch kernels, retrying"];
];
];,
While[xAct`HiGGS`$TryKernels,
HiGGSPrint[" ** StudyTheory: Attempting to launch kernels"];
CloseKernels[];
(*launch should be 32*)
TimeConstrained[Check[LaunchKernels[],xAct`HiGGS`$TryKernels=False;];
xAct`HiGGS`$TryKernels=False;,
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
(FileNameJoin@{$WorkingDirectory,"svy","node-"<>xAct`HiGGS`$Node,"peta4.nom.mx"})~DumpSave~{xAct`HiGGS`$TheoryNames};
];


If[OptionValue@"Brackets",
PreparePPM[theory_String,conds_List]:=Module[{res,PPMArguments,IndIfConstraints},
DefTheory["Import"->theory];
IndIfConstraints=(#~ChangeFreeIndices~({-xAct`HiGGS`l,-xAct`HiGGS`m,-xAct`HiGGS`n}~Take~Length@FindFreeIndices@#))&/@xAct`HiGGS`$IfConstraints;
(*Evaluate lots of Poisson brackets*)
PPMArguments=Table[{theory,xAct`HiGGS`$IfConstraints[[ii]],IndIfConstraints[[jj]]},{ii,Length@xAct`HiGGS`$IfConstraints},{jj,ii,Length@xAct`HiGGS`$IfConstraints}];
PPMArguments];
Jobs=(#1~PreparePPM~#2)&@@@InputBatch;
Print@Jobs;
Jobs=Map[(ParallelSubmit@PoissonBracketParallel[#[[2]],#[[3]],#[[1]],"Surficial"->True])&,Jobs,{3}];
Print@Jobs;
PPMs=WaitAll[Jobs];
PPMs=Riffle[xAct`HiGGS`$TheoryNames,PPMs]~Partition~2;
SavePPM[theory_String,PPM_]:=Module[{res,PPMArguments,IndIfConstraints},
DefTheory["Import"->theory];
xAct`HiGGS`$PPM=PPM;
HiGGSPrint["$PPM value is ",xAct`HiGGS`$PPM];
HiGGSPrint[" ** StudyTheory: Exporting the binary at "<>FileNameJoin@{"svy",theory<>".thr.mx"}];
(FileNameJoin@{$WorkingDirectory,"svy",theory<>".thr.mx"})~DumpSave~{xAct`HiGGS`$TheoryName,xAct`HiGGS`$Theory,xAct`HiGGS`$ToTheory,xAct`HiGGS`$ToShellFreedoms,xAct`HiGGS`$StrengthPShellToStrengthPO3,xAct`HiGGS`$PiPShellToPiPPO3,xAct`HiGGS`$TheoryCDPiPToCDPiPO3,xAct`HiGGS`$TheoryPiPToPiPO3,xAct`HiGGS`$IfConstraintToTheoryNesterForm,xAct`HiGGS`$IfConstraints,xAct`HiGGS`$InertVelocity,xAct`HiGGS`$ToOrderRules,xAct`HiGGS`$PPM};
];
HiGGSPrint[PPMs];
SavePPM[#1,#2]&@@@PPMs;
];


If[OptionValue@"Velocities",
PrepareVelocities[theory_String,conds_List]:=Module[{res,IndIfConstraints},
DefTheory["Import"->theory];
IndIfConstraints=(#~ChangeFreeIndices~({-xAct`HiGGS`q1,-xAct`HiGGS`p1,-xAct`HiGGS`v1}~Take~Length@FindFreeIndices@#))&/@xAct`HiGGS`$IfConstraints;

{theory,IndIfConstraints}];
Jobs=(#1~PrepareVelocities~#2)&@@@InputBatch;
Velocities=VelocityParallel@Jobs;
Velocities=Riffle[xAct`HiGGS`$TheoryNames,Velocities]~Partition~2;
SaveVelocity[theory_String,Velocity_]:=Module[{res,PPMArguments,IndIfConstraints},
DefTheory["Import"->theory];
xAct`HiGGS`$Velocities=Velocity;
HiGGSPrint["$Velocities value is ",xAct`HiGGS`$Velocities];
HiGGSPrint[" ** StudyTheory: Exporting the binary at "<>FileNameJoin@{"svy",theory<>".thr.mx"}];
(FileNameJoin@{$WorkingDirectory,"svy",theory<>".thr.mx"})~DumpSave~{xAct`HiGGS`$TheoryName,xAct`HiGGS`$Theory,xAct`HiGGS`$ToTheory,xAct`HiGGS`$ToShellFreedoms,xAct`HiGGS`$StrengthPShellToStrengthPO3,xAct`HiGGS`$PiPShellToPiPPO3,xAct`HiGGS`$TheoryCDPiPToCDPiPO3,xAct`HiGGS`$TheoryPiPToPiPO3,xAct`HiGGS`$IfConstraintToTheoryNesterForm,xAct`HiGGS`$IfConstraints,xAct`HiGGS`$InertVelocity,xAct`HiGGS`$ToOrderRules,xAct`HiGGS`$PPM,xAct`HiGGS`$Velocities};
];
HiGGSPrint[Velocities];
SaveVelocity[#1,#2]&@@@Velocities;
];
];
