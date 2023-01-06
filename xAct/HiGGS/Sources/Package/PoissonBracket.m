(*==================*)
(*  PoissonBracket  *)
(*==================*)

BuildPackage@"PoissonBracket/VarAction.m";
BuildPackage@"PoissonBracket/PoissonBracketList.m";
BuildPackage@"PoissonBracket/BracketSimplify.m";
BuildPackage@"PoissonBracket/ManualCovariantDerivative.m";
BuildPackage@"PoissonBracket/SmearPoissonBracket.m";
BuildPackage@"PoissonBracket/SmearedPoissonBracket.m";
BuildPackage@"PoissonBracket/DQ.m";
BuildPackage@"PoissonBracket/LeibnizList.m";
BuildPackage@"PoissonBracket/AllocatedPoissonBracket.m";

Options@PoissonBracket={
	Parallel->False,
	ToShell->False,	
	Method->"NesterFormDecomposition"};

PoissonBracket::nometh="Method `1` is not one of \"NesterFormDecomposition\" or \"BruteForce\".";

PoissonBracket[LeftOperand_?PossibleZeroQ,RightOperand_,OptionsPattern[]]:=0;
PoissonBracket[LeftOperand_,RightOperand_?PossibleZeroQ,OptionsPattern[]]:=0;

(*-------------------------------------------------------------------*)
(*  The main function implementation for nonlinear Poisson brackets  *)
(*-------------------------------------------------------------------*)

PoissonBracket[LeftOperand_?NesterFormQ,RightOperand_?NesterFormQ,OptionsPattern[]]:=Catch@Module[{
	PrintVariable,
	LeftExpansion,
	LeftList,
	RightExpansion,
	RightList,
	LeibnizArray,
	DifferentiableTensors,
	LeftFreeIndices,
	RightFreeIndices,
	CanonicalVariables,
	SmearedUnevaluatedBracket,
	EvaluatedBracket,
	OptionSmearedPoissonBracket},

	LeftFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@LeftOperand));
	RightFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@RightOperand));

	SmearedUnevaluatedBracket={
		Integrate@@({((LeftOperand)~Dot~((xAct`HiGGS`SmearingLeft@@LeftFreeIndices)~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1,
		Integrate@@({((RightOperand)~Dot~((xAct`HiGGS`SmearingRight@@RightFreeIndices)~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies2};
	
	PrintVariable=PrintTemporary[" ** PoissonBracket: organising covariant sub-brackets according to Leibniz rule..."];

	(*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*)
	(*  list of xTensors which we want to be treated as atomic operands in each Poisson bracket, better to re-evaluate on each call in case new quantities were defined by the user  *)
	(*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*)
	DifferentiableTensors=$Tensors~Complement~{
	xAct`HiGGS`SmearingLeft,
	xAct`HiGGS`SmearingRight};

	Switch[OptionValue@Method,
		"NesterFormDecomposition",
			LeftExpansion=(ReplaceDummiesZ4@((SmearingLeft@@LeftFreeIndices)*LeftOperand))~LeibnizList~DifferentiableTensors;
			RightExpansion=(ReplaceDummiesZ5@((SmearingRight@@RightFreeIndices)*RightOperand))~LeibnizList~DifferentiableTensors;,
		"BruteForce",
			LeftExpansion={{ReplaceDummiesZ4@LeftOperand,SmearingLeft@@LeftFreeIndices}};
			RightExpansion={{ReplaceDummiesZ5@RightOperand,SmearingRight@@RightFreeIndices}};,
		_,
			Throw@Message[PoissonBracket::nometh,OptionValue@Method];
	];

	NotebookDelete@PrintVariable;

	Print[" ** PoissonBracket: Note that ",xAct`HiGGS`SmearingLeft[]," and ",xAct`HiGGS`SmearingRight[]," are arbitrarily-indexed and independent smearing functions, the yellow background indicates that the quantity is formally held constant, and the center dot is an ordinary multiplication."];

	Print@" ** PoissonBracket: evaluated the following covariant sub-brackets according to Leibniz rule:";

	OptionSmearedPoissonBracket[{LeftOp_,LeftSmear_},{RightOp_,RightSmear_}]:=SmearedPoissonBracket[{LeftOp,LeftSmear},{RightOp,RightSmear},ToShell->OptionValue@ToShell];

	If[OptionValue@Parallel,	
		LeibnizArray=Outer[(HiGGSParallelSubmit@(SmearedPoissonBracket[#1,#2,ToShell->OptionValue@ToShell]))&,LeftExpansion,RightExpansion,1];
		PrintVariable=PrintTemporary@LeibnizArray;
		LeibnizArray=WaitAll[LeibnizArray];
		NotebookDelete@PrintVariable;,
		LeibnizArray=Outer[OptionSmearedPoissonBracket,LeftExpansion,RightExpansion,1]
	];

	If[LeibnizArray=={{0}},	
		EvaluatedBracket=0,	
		EvaluatedBracket=Total@(Head@First@(List@@#)&/@(DeleteCases[(LeibnizArray~Flatten~1),0,Infinity]))/.{Dot->Times};
		EvaluatedBracket//=ToNewCanonical,
		EvaluatedBracket=Total@(Head@First@(List@@#)&/@(DeleteCases[(LeibnizArray~Flatten~1),0,Infinity]))/.{Dot->Times};
		EvaluatedBracket//=ToNewCanonical];

	EvaluatedBracket//=ToNesterForm[#,ToShell->OptionValue@ToShell]&;
	EvaluatedBracket//=BracketSimplify;

	Print@" ** PoissonBracket: composed the total bracket:";

	If[PossibleZeroQ@EvaluatedBracket,
		EvaluatedBracket=0,
		EvaluatedBracket=Integrate@@({(EvaluatedBracket)@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1];	

	If[StringQ@OptionValue@ToShell,
		HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~EvaluatedBracket);,
		HiGGSPrint@(SmearedUnevaluatedBracket~Congruent~EvaluatedBracket);
	];

EvaluatedBracket];

PoissonBracket::nester="The current version of HiGGS can only calculate Poisson brackets on pairs of quantities in Nester form. The arguments provided were not a pair PoissonBracket[LeftOperand,RightOperand,Options...], where ToNesterForm[LeftOperand] and ToNesterForm[RightOperand] both return True."
PoissonBracket[OtherArgs___,OptionsPattern[]]:=Throw@Message[PoissonBracket::nester];
