(*===============*)
(*  StudyTheory  *)
(*===============*)

PreparePPM[TheoryName_String]:=Module[{
	PPMArguments,
	IfConstraints,
	NewIndexIfConstraints,
	EvaluatedIfConstraints,
	EvaluatedNewIndexIfConstraints,
	Theory},

	Theory=Evaluate@Symbol@TheoryName;

	IfConstraints=Theory@$IfConstraints;
	EvaluatedIfConstraints=Theory@$EvaluatedIfConstraints;

	NewIndexIfConstraints=(#~ChangeFreeIndices~({-xAct`HiGGS`l,-xAct`HiGGS`m,-xAct`HiGGS`n}~Take~Length@FindFreeIndices@#))&/@IfConstraints;
	EvaluatedNewIndexIfConstraints=(#~ChangeFreeIndices~({-xAct`HiGGS`l,-xAct`HiGGS`m,-xAct`HiGGS`n}~Take~Length@FindFreeIndices@#))&/@EvaluatedIfConstraints;

	PPMArguments=Table[{
				TheoryName,
				IfConstraints[[ii]],
				NewIndexIfConstraints[[jj]],
				EvaluatedIfConstraints[[ii]],
				EvaluatedNewIndexIfConstraints[[jj]]},
		{ii,Length@IfConstraints},
		{jj,ii,Length@IfConstraints}];
PPMArguments];

PrepareVelocities[TheoryName_String]:=Module[{
	PPMArguments,
	IfConstraints,
	EvaluatedIfConstraints,
	Theory},

	Theory=Evaluate@Symbol@TheoryName;

	IfConstraints=Theory@$IfConstraints;
	EvaluatedIfConstraints=Theory@$EvaluatedIfConstraints;

	VelocityArguments=Table[{
				TheoryName,
				IfConstraints[[ii]],
				EvaluatedIfConstraints[[ii]]},
		{ii,Length@IfConstraints}];
VelocityArguments];



(*sometimes the launching of kernels simply hangs on the node: this repeats the process if it lasts more than n seconds*)


InsistLaunchKernels[]:=Module[{$TryKernels},	
	CloseKernels[];
	LaunchKernels[];
(*
	$TryKernels=True;
	If[ValueQ@xAct`HiGGS`$Cores,
		While[$TryKernels,
			Print[" ** StudyTheory: Attempting to launch kernels"];
			CloseKernels[];
			(*launch should be 32*)
			TimeConstrained[
				Check[LaunchKernels[xAct`HiGGS`$Cores],$TryKernels=False;];$TryKernels=False;,
				10,
				CloseKernels[];HiGGSPrint[" ** StudyTheory: Failed to launch kernels, retrying"];
			];
		];,
		While[$TryKernels,
			HiGGSPrint[" ** StudyTheory: Attempting to launch kernels"];
			CloseKernels[];
			(*launch should be 32*)
			TimeConstrained[
				Check[LaunchKernels[],$TryKernels=False;];$TryKernels=False;,
				10,
				CloseKernels[];HiGGSPrint[" ** StudyTheory: Failed to launch kernels, retrying"];
			];
		];
	];
*)
];



Options[StudyTheory]={
	Brackets->False,
	Velocities->False};

(*
StudyTheory[TheoryName_?StringQ,InputSystem___:Null,OptionsPattern[]]:=StudyTheory[{{TheoryName,InputSystem}},OptionsPattern[]];
*)

StudyTheory[ListOfTheories_?ListQ,OptionsPattern[]]:=Module[{
	InputBatch=ListOfTheories,
	TheoryNames,
	Jobs,
	EvaluatedJobs,
	PPMArray,
	EvaluatedPPMArray,
	PrintVariable},


	(*check if a real theory batch was provided*)
	(If[!TheoryQ[#[[2]]],Throw@Message[DefTheory::nottheory,#[[2]]]])&/@InputBatch;
	(If[!StringQ[#[[1]]],Throw@Message[DefTheory::nottheoryname,#[[1]]]])&/@InputBatch;

	TheoryNames=(#[[1]])&/@InputBatch;
	InsistLaunchKernels[];

	(*-----------------*)
	(*  Define theory  *)
	(*-----------------*)

	Jobs=HiGGSParallelSubmit@DefTheory[#1,#2,ImportTheory->False,ExportTheory->True]&@@@InputBatch;
	PrintVariable=PrintTemporary@Jobs;
	WaitAll[Jobs];
	NotebookDelete@PrintVariable;

	(*--------------------------------------------------------------*)
	(*  Load saved theory files into master kernel, and distribute  *)
	(*--------------------------------------------------------------*)

	(DefTheory[#[[1]],ImportTheory->True])&/@InputBatch;
	(Quiet@ToExpression@("DistributeDefinitions@"<>#))&/@TheoryNames;


	(*----------------------------------------*)
	(*  Calculate the primary Poisson matrix  *)
	(*----------------------------------------*)

	If[OptionValue@Brackets,
		PPMArray=PreparePPM/@TheoryNames;
		Jobs=Apply[HiGGSParallelSubmit@PoissonBracket[#4,#5,ToShell->#1,Method->"BruteForce"]&,PPMArray,{3}];
		PrintVariable=PrintTemporary@Jobs;
		EvaluatedJobs=WaitAll[Jobs];
		NotebookDelete@PrintVariable;
		UpdateTheoryAssociation[#1,$PPM,#2,Advertise->True,ExportTheory->True]&~MapThread~{TheoryNames,EvaluatedJobs};
	];

	(*--------------------------------------------------------------------------------------*)
	(*  Calculate the commutators of the primary if-constraints with the super-Hamiltonian  *)
	(*--------------------------------------------------------------------------------------*)

	If[OptionValue@Velocities,
		VelocitiesArray=PrepareVelocities/@TheoryNames;
		(*Print@VelocitiesArray;*)
		EvaluatedJobs=Apply[PoissonBracket[#3,ToExpression@(#1<>"@$SuperHamiltonian"),ToShell->#1,Parallel->True]&,VelocitiesArray,{2}];
		(*Print@EvaluatedJobs;*)
		UpdateTheoryAssociation[#1,$Velocities,#2,Advertise->True,ExportTheory->True]&~MapThread~{TheoryNames,EvaluatedJobs};
	];
];
