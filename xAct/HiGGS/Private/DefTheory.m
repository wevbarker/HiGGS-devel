TheoryQ[x_]:=Module[{Bool},
	Bool=ListQ[x];
	If[Bool,
	Bool=Flatten@{{xAct`HiGGS`Alp0},xAct`HiGGS`Alp,xAct`HiGGS`Bet,xAct`HiGGS`cAlp,xAct`HiGGS`cBet}~SubsetQ~Flatten@(Variables/@Flatten@((List@@(#))&/@x));
];
Bool];

DefTheory::nottheory="Argument `1` is not a linear system in Alp0,...,Alp6, Bet1,...,Bet3, cAlp1,...,cAlp6 and cBet1,...,cBet3, e.g. {Alp0+Alp1==0,...}.";
DefTheory::nobin="The binary at `1` cannot be found; quitting.";

Options[DefTheory]={
	ExportOption->False,
	ImportOption->False};

UndefTheory[]:=Clear@@{"xAct`HiGGS`$TheoryName","xAct`HiGGS`$Theory","xAct`HiGGS`$ToTheory","xAct`HiGGS`$ToShellFreedoms","xAct`HiGGS`$StrengthPShellToStrengthPO3","xAct`HiGGS`$PiPShellToPiPPO3","xAct`HiGGS`$TheoryCDPiPToCDPiPO3","xAct`HiGGS`$TheoryPiPToPiPO3","xAct`HiGGS`$IfConstraintToTheoryNesterForm","xAct`HiGGS`$IfConstraints","xAct`HiGGS`$InertVelocity","xAct`HiGGS`$ToOrderRules","xAct`HiGGS`$PPM","xAct`HiGGS`$Velocities"};

UpdateTheoryAssociation[Name_?StringQ,AssocKey_,Val_]:=Module[{TheoryAssociation},
	If[!(AssociationQ@Evaluate@Symbol@Name),(Evaluate@Symbol@Name)=<||>];
	TheoryAssociation=Evaluate@Symbol@Name;
	Clear@Name;
	TheoryAssociation@AssocKey=Val;
	(Evaluate@Symbol@Name)=TheoryAssociation;
];

DefTheory[InputSystem___:Null,TheoryName_?StringQ,OptionsPattern[]]:=Catch@Module[{},
	(*Firstly we remove all definitions which might be associated with a theory already*)
	UndefTheory[];
	If[OptionValue@ImportOption,

		HiGGSPrint[" ** DefTheory: Incorporating the binary at "<>FileNameJoin@{"svy",OptionValue@TheoryName<>".thr.mx"}];

		Check[ToExpression["<<"<>FileNameJoin@{$WorkingDirectory,"svy",OptionValue@TheoryName<>".thr.mx"}<>";"],Throw@Message[DefTheory::nobin,FileNameJoin@{$WorkingDirectory,"svy",ToString@OptionValue@TheoryName<>".thr.mx"}];Quit[];];,

		(*check if a real theory was provided*)
		If[!TheoryQ[InputSystem],Throw@Message[DefTheory::nottheory,InputSystem]];

		Print@"trying";

		(*define the theory constant in xAct`HiGGS`*)
		UpdateTheoryAssociation[TheoryName,$Theory,InputSystem];
		(*a message*)
		xAct`xTensor`Private`MakeDefInfo[DefTheory,xAct`HiGGS`$Theory,{"$ToTheory for the theory",""}];
		(*these are rules we can always use to impose the theory*)
		UpdateTheoryAssociation[TheoryName,$ToTheory,Quiet[Solve[InputSystem,Join[xAct`HiGGS`cAlp,xAct`HiGGS`cBet,{xAct`HiGGS`Alp0},xAct`HiGGS`Alp,xAct`HiGGS`Bet]][[1]]]];
		(*these functions do all the hard work*)
		ComputeShellFreedoms[TheoryName];
		DefFieldStrengthShell[TheoryName];
		DefMomentaShell[TheoryName];
		DefO3MomentaShell[TheoryName];
		DefIfConstraintToTheoryNesterForm[TheoryName];
		DefSuperHamiltonian[TheoryName,OrderOption->OptionValue@OrderOption,"ProtectSurface"->OptionValue@"ProtectSurface"];	
		DefLinearSuperMomentum[TheoryName,OrderOption->OptionValue@OrderOption,"ProtectSurface"->OptionValue@"ProtectSurface"];
		DefAngularSuperMomentum[TheoryName,OrderOption->OptionValue@OrderOption,"ProtectSurface"->OptionValue@"ProtectSurface"];
	];

	If[OptionValue@ExportOption,
		HiGGSPrint[" ** DefTheory: Exporting the binary at "<>FileNameJoin@{"svy",OptionValue@TheoryName<>".thr.mx"}];
		xAct`HiGGS`$TheoryName=OptionValue@TheoryName;
		Print@xAct`HiGGS`$IfConstraints;
		(FileNameJoin@{$WorkingDirectory,"svy",ToString@OptionValue@TheoryName<>".thr.mx"})~DumpSave~{xAct`HiGGS`$TheoryName,xAct`HiGGS`$Theory,xAct`HiGGS`$ToTheory,xAct`HiGGS`$ToShellFreedoms,xAct`HiGGS`$StrengthPShellToStrengthPO3,xAct`HiGGS`$PiPShellToPiPPO3,xAct`HiGGS`$TheoryCDPiPToCDPiPO3,xAct`HiGGS`$TheoryPiPToPiPO3,xAct`HiGGS`$IfConstraintToTheoryNesterForm,xAct`HiGGS`$IfConstraints,xAct`HiGGS`$InertVelocity,xAct`HiGGS`$ToOrderRules};
	];
];
