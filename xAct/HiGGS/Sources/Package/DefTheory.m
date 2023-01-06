(*=============*)
(*  DefTheory  *)
(*=============*)

BuildPackage@"DefTheory/ComputeShellFreedoms.m";
BuildPackage@"DefTheory/DefFieldStrengthShell.m";
BuildPackage@"DefTheory/DefMomentaShell.m";
BuildPackage@"DefTheory/DefO3MomentaShell.m";
BuildPackage@"DefTheory/ImposeTheory.m";
BuildPackage@"DefTheory/DefIfConstraintToTheoryNesterForm.m";
BuildPackage@"DefTheory/DefSuperHamiltonian.m";
BuildPackage@"DefTheory/DefLinearSuperMomentum.m";
BuildPackage@"DefTheory/DefAngularSuperMomentum.m";
BuildPackage@"DefTheory/DefIfConstraints.m";
BuildPackage@"DefTheory/DefNesterFormShell.m";

BuildPackage@"DefTheory/TheoryQ.m";
BuildPackage@"DefTheory/UndefTheory.m";
BuildPackage@"DefTheory/UpdateTheoryAssociation.m";

DefTheory::nottheory="Argument `1` is not a linear system in Alp0,...,Alp6, Bet1,...,Bet3, cAlp1,...,cAlp6 and cBet1,...,cBet3, e.g. {Alp0+Alp1==0,...}.";
DefTheory::nottheoryname="Argument `1` is not a string from which a symbol can be defined to store the theory association.";
DefTheory::nobin="The binary at `1` cannot be found; quitting.";

Options[DefTheory]={
	ExportTheory->False,
	ImportTheory->False};

DefTheory[TheoryName_?StringQ,InputSystem___:Null,OptionsPattern[]]:=Module[{},
	(*Firstly we remove all definitions which might be associated with a theory already*)
	UndefTheory[];
	If[OptionValue@ImportTheory,

		Print[" ** DefTheory: Incorporating the binary at "<>TheoryName<>".thr.mx"];

		Check[ToExpression["<<"<>FileNameJoin@{$WorkingDirectory,TheoryName<>".thr.mx"}<>";"],Throw@Message[DefTheory::nobin,FileNameJoin@{$WorkingDirectory,TheoryName<>".thr.mx"}];Quit[];];,

		(*check if a real theory was provided*)
		If[!TheoryQ[InputSystem],Throw@Message[DefTheory::nottheory,InputSystem]];

		Print["** DefTheory: The information presented below will be stored in the association ",TheoryName,", so you will be able to recover it later in your session by typing \"",TheoryName,"[<--some_association_key-->]\"."];

		(*define the theory constant in xAct`HiGGS`*)
		UpdateTheoryAssociation[TheoryName,$Theory,InputSystem];
		(*these are rules we can always use to impose the theory*)
		UpdateTheoryAssociation[TheoryName,$ToTheory,Quiet[Solve[InputSystem,Join[xAct`HiGGS`cAlp,xAct`HiGGS`cBet,{xAct`HiGGS`Alp0},xAct`HiGGS`Alp,xAct`HiGGS`Bet]][[1]]]];
		(*this step is needed when processing theories which are not defined in the "==0" format (as was suggested to Manuel H.) -- if we run ComputeShellFreedoms using $ToTheory then we will pick up incorrect constraint structures in the shell*)
		UpdateTheoryAssociation[TheoryName,$ToShellTheory,Quiet[Solve[((#~Complement~(#~DeleteCases~(_Symbol==_?PossibleZeroQ)))&@InputSystem),Join[xAct`HiGGS`cAlp,xAct`HiGGS`cBet,{xAct`HiGGS`Alp0},xAct`HiGGS`Alp,xAct`HiGGS`Bet]][[1]]]];

		(*--------------------------------------------*)
		(*  These functions do much of the hard work  *)
		(*--------------------------------------------*)

		ComputeShellFreedoms[TheoryName];
		DefFieldStrengthShell[TheoryName];
		DefMomentaShell[TheoryName];
		DefO3MomentaShell[TheoryName];
		DefIfConstraintToTheoryNesterForm[TheoryName];
		DefSuperHamiltonian[TheoryName];	
		DefLinearSuperMomentum[TheoryName];
		DefAngularSuperMomentum[TheoryName];
		DefNesterFormShell[TheoryName];
		DefIfConstraints[TheoryName];
	];

	If[OptionValue@ExportTheory,
		Print[" ** DefTheory: Exporting the binary at "<>TheoryName<>".thr.mx"];
		DumpSave[FileNameJoin@{$WorkingDirectory,TheoryName<>".thr.mx"},{TheoryName}];
	];
];
