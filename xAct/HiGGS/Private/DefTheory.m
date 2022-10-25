(*=============*)
(*  DefTheory  *)
(*=============*)

TheoryQ[x_]:=Module[{Bool},
	Bool=ListQ[x];
	If[Bool,
	Bool=Flatten@{{xAct`HiGGS`Alp0},xAct`HiGGS`Alp,xAct`HiGGS`Bet,xAct`HiGGS`cAlp,xAct`HiGGS`cBet}~SubsetQ~Flatten@(Variables/@Flatten@((List@@(#))&/@x));
];
Bool];

DefTheory::nottheory="Argument `1` is not a linear system in Alp0,...,Alp6, Bet1,...,Bet3, cAlp1,...,cAlp6 and cBet1,...,cBet3, e.g. {Alp0+Alp1==0,...}.";
DefTheory::nottheoryname="Argument `1` is not a string from which a symbol can be defined to store the theory association.";
DefTheory::nobin="The binary at `1` cannot be found; quitting.";


UndefTheory[TheoryName_?StringQ]:=Clear@TheoryName;

Options@UpdateTheoryAssociation={Advertise->False,ExportTheory->False};

UpdateTheoryAssociation[Name_?StringQ,AssocKey_,Val_,OptionsPattern[]]:=Module[{TheoryAssociation,PrintVariable},

	PrintVariable=PrintTemporary["** DefTheory: Defining association key ",ToString@AssocKey," for the theory association ",Name];

	If[!(AssociationQ@Evaluate@Symbol@Name),(Evaluate@Symbol@Name)=<||>];
	TheoryAssociation=Evaluate@Symbol@Name;
	Clear@Name;
	TheoryAssociation@AssocKey=Val;
	(Evaluate@Symbol@Name)=TheoryAssociation;
	NotebookDelete@PrintVariable;

	DistributeDefinitions@Symbol@Name;

	If[OptionValue@Advertise,
		Print["** DefTheory: Defining association key ",ToString@AssocKey," for the theory association ",Name];
	];

	If[OptionValue@ExportTheory,
		Print[" ** DefTheory: Exporting the binary at "<>Name<>".thr.mx"];
		DumpSave[FileNameJoin@{$WorkingDirectory,Name<>".thr.mx"},{Name}];
	];

];

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
		(*these functions do all the hard work*)
		ComputeShellFreedoms[TheoryName];
		DefFieldStrengthShell[TheoryName];
		DefMomentaShell[TheoryName];
		DefO3MomentaShell[TheoryName];
		DefIfConstraintToTheoryNesterForm[TheoryName];
		DefSuperHamiltonian[TheoryName];	
		DefLinearSuperMomentum[TheoryName];
		DefAngularSuperMomentum[TheoryName];
		DefIfConstraints[TheoryName];
	];

	If[OptionValue@ExportTheory,
		Print[" ** DefTheory: Exporting the binary at "<>TheoryName<>".thr.mx"];
		DumpSave[FileNameJoin@{$WorkingDirectory,TheoryName<>".thr.mx"},{TheoryName}];
	];
];
