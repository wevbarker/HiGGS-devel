(*==================*)
(*  PoissonBracket  *)
(*==================*)

(*--------------------------------------------------------------------------------*)
(*  A function to provide some final tidying after ToNesterForm has been applied  *)
(*--------------------------------------------------------------------------------*)

BracketSimplify[Expr_]:=Module[{Simplified=Expr},
	Simplified=Simplified/.{xAct`HiGGS`FoliG->xAct`HiGGS`GP};
	Simplified//=ToNewCanonical;
	Simplified=Simplified/.xAct`HiGGS`ProjectorGP->ProjectWith[xAct`HiGGS`GP];
	Simplified//=ToNewCanonical;
	Simplified=Simplified/.FullyProjectSmearingFunctionsRule;
	Simplified//=ToNewCanonical;
	Simplified=Simplified/.FullyProjectParaLorentzGaugeCovDRule;
	Simplified//=ToNewCanonical;
	Simplified//=CollectTensors;
	Simplified//=ScreenDollarIndices;	(*I believe this is made necessary by CollectTensors, which can introduce dummies?*)
	Simplified//=Simplify;
Simplified];

ManualCovariantDerivative[DerivativeIndex_,Expr_,GreekIndices_,DummyIndex_]:=Module[{
	DerivativeExpr,
	Indices,
	UpperIndices,
	LowerIndices},

	Indices=Complement[FindFreeIndices[Expr],GreekIndices];
	LowerIndices=Select[Indices,(Quiet[#[[1]]]==-1)&];
	UpperIndices=Complement[Indices,LowerIndices];
	DerivativeExpr=xAct`HiGGS`CD[DerivativeIndex][Expr];
	Scan[(DerivativeExpr=DerivativeExpr-xAct`HiGGS`A[DummyIndex,#,DerivativeIndex]ReplaceIndex[Evaluate[Expr],#->-DummyIndex])&,LowerIndices];
	Scan[(DerivativeExpr=DerivativeExpr+xAct`HiGGS`A[#,-DummyIndex,DerivativeIndex]ReplaceIndex[Evaluate[Expr],#->DummyIndex])&,UpperIndices];
	DerivativeExpr//=ToNewCanonical;
DerivativeExpr];

(*-----------------------------------------------------------------------------*)
(*  A function to smear the Poisson bracket which has been provided as a list  *)
(*-----------------------------------------------------------------------------*)

Options[SmearPoissonBracket]={ToShell->False};
SmearPoissonBracket[UnevaluatedBracket_List,EvaluatedBracket_List,LeftSmearing_,RightSmearing_,OptionsPattern[]]:=Catch@Module[{
	LeftFreeIndices,
	RightFreeIndices,
	SmearedUnevaluatedBracket,
	SmearedEvaluatedBracket,
	SmearedEvaluatedBracketTerm1,
	SmearedEvaluatedBracketTerm2,
	SmearedEvaluatedBracketTerm3,
	SmearedEvaluatedBracketTotal},

		LeftFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@UnevaluatedBracket[[1]]));
		RightFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@UnevaluatedBracket[[2]]));

		SmearedUnevaluatedBracket={
		Integrate@@({((UnevaluatedBracket[[1]])~Dot~(LeftSmearing~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1,
		Integrate@@({((UnevaluatedBracket[[2]])~Dot~(RightSmearing~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies2};
	
		If[PossibleZeroQ@EvaluatedBracket[[1]],
		SmearedEvaluatedBracketTerm1=0,
		SmearedEvaluatedBracketTerm1=
		((ReplaceDummiesZ1@(NoScalar@(EvaluatedBracket[[1]]//ToNewCanonical)))~Dot~
		(ReplaceDummiesZ2@(NoScalar@LeftSmearing))~Dot~
		(ReplaceDummiesZ3@(NoScalar@RightSmearing)))];
	
		If[PossibleZeroQ@EvaluatedBracket[[2]],
		SmearedEvaluatedBracketTerm2=0,
		SmearedEvaluatedBracketTerm2=
		((ReplaceDummiesZ1@(NoScalar@(EvaluatedBracket[[2]]//ToNewCanonical)))~Dot~
		(ReplaceDummiesZ2@(NoScalar@LeftSmearing))~Dot~
		(ReplaceDummiesZ3@(xAct`HiGGS`G3[Zz1,-Zz]xAct`HiGGS`GaugeCovD[-Zz1]@(NoScalar@RightSmearing))))];

		If[PossibleZeroQ@EvaluatedBracket[[3]],
		SmearedEvaluatedBracketTerm3=0,
		SmearedEvaluatedBracketTerm3=
		((ReplaceDummiesZ1@(NoScalar@(EvaluatedBracket[[3]]//ToNewCanonical)))~Dot~
		(ReplaceDummiesZ2@(xAct`HiGGS`SmearingLeft@@LeftFreeIndices))~Dot~
		(ReplaceDummiesZ3@(xAct`HiGGS`G3[Zz1,-Zz]xAct`HiGGS`GaugeCovD[-Zz1]@(xAct`HiGGS`G3[Zw1,-Zw]xAct`HiGGS`GaugeCovD[-Zw1]@(NoScalar@RightSmearing)))))];

		SmearedEvaluatedBracketTotal=SmearedEvaluatedBracketTerm1+
		SmearedEvaluatedBracketTerm2+
		SmearedEvaluatedBracketTerm3;

		SmearedEvaluatedBracketTotal=SmearedEvaluatedBracketTotal/.{Dot->Times};
		SmearedEvaluatedBracketTotal//=ToNewCanonical;

		SmearedEvaluatedBracketTotal//=ToNesterForm[#,ToShell->OptionValue@ToShell]&;

		If[PossibleZeroQ@SmearedEvaluatedBracketTotal,
		SmearedEvaluatedBracket=0,
		SmearedEvaluatedBracket=Integrate@@({(SmearedEvaluatedBracketTotal)@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1];	

		If[StringQ@OptionValue@ToShell,
			HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~SmearedEvaluatedBracket);,
			HiGGSPrint@(SmearedUnevaluatedBracket~Congruent~SmearedEvaluatedBracket);
		];

	SmearedEvaluatedBracket];

(*----------------------------------------------------------*)
(*  A function to form the Poisson bracket on a given term  *)
(*----------------------------------------------------------*)

Options[SmearedPoissonBracket]={ToShell->False};
SmearedPoissonBracket[{LeftOperand_,LeftSmearing_},{RightOperand_,RightSmearing_},OptionsPattern[]]:=Catch@Module[{
	UnevaluatedBracket,
	EvaluatedBracket,
	SmearedEvaluatedBracket},
	UnevaluatedBracket={LeftOperand,RightOperand};
	EvaluatedBracket=PoissonBracketNewList[LeftOperand,RightOperand,ToShell->OptionValue@ToShell];
	SmearedEvaluatedBracket=SmearPoissonBracket[UnevaluatedBracket,EvaluatedBracket,LeftSmearing,RightSmearing,ToShell->OptionValue@ToShell];
	SmearedEvaluatedBracket];

(*-----------------------------------------------------------*)
(*  A function to test whether the argument is a derivative  *)
(*-----------------------------------------------------------*)

DQ[Expr_]:=((Head@Evaluate@Expr)==D);


LeibnizList[Expr_,DifferentiableTensors_?ListQ]:=Module[{
	ManipulatedExpr=Expr//NoScalar,
	ManipulatedDiffenentiableTensors=DifferentiableTensors,
	CanonicalVariables},

	(*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*)
	(*  We will use D to create a Leibniz list, but we have to be careful that functions of tensors (as covariant derivatives and projectors are interpreted by Wolfram) are not differentiated according to chain rule but instead treated as atomic expressions to be fed into PoissonBracket  *)
	(*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*)

	ManipulatedExpr=Block[{	
		CD,
		GaugeCovD,
		LorentzGaugeCovD,
		ParaLorentzGaugeCovD,
		ProjectorGP},

		CD[Index_][Operand_]:=CDInert[Index,ToString@Operand];
		GaugeCovD[Index_][Operand_]:=GaugeCovDInert[Index,ToString@Operand];
		LorentzGaugeCovD[Index_][Operand_]:=LorentzGaugeCovDInert[Index,ToString@Operand];
		ParaLorentzGaugeCovD[Index_][Operand_]:=ParaLorentzGaugeCovDInert[Index,ToString@Operand];
		ProjectorGP[Index_][Operand_]:=ProjectorGPInert[ToString@Operand];

		Evaluate@ManipulatedExpr
	];

	(*----------------------------------------------------------------------------------------------------------------------*)
	(*  The basic atomic units into which we split expressions include not only defined xTensors, but also now these heads  *)
	(*----------------------------------------------------------------------------------------------------------------------*)
	ManipulatedDiffenentiableTensors=ManipulatedDiffenentiableTensors~Join~{
		CDInert,
		GaugeCovDInert,
		LorentzGaugeCovDInert,
		ProjectorGPInert};

	(*------------------------------------------------*)
	(*  Use D to create a "Leibniz list" accordingly  *)
	(*------------------------------------------------*)
	ManipulatedExpr=Flatten@List@((Evaluate@D[ManipulatedExpr,CanonicalVariables,NonConstants->ManipulatedDiffenentiableTensors])/.{Plus->List});

	ManipulatedExpr=({(First@(List@@(First@Cases[#,_?DQ,Infinity]))),({D}~Block~(D[x___]:=1;#))})&/@ManipulatedExpr;

	(*-------------------------------------------------*)
	(*  We now want to activate the inert heads again  *)
	(*-------------------------------------------------*)
	ManipulatedExpr=Block[{	
		CDInert,
		GaugeCovDInert,
		LorentzGaugeCovDInert,
		ParaLorentzGaugeCovDInert,
		ProjectorGPInert},

		CDInert[Index_,OperandString_]:=CD[Index][ToExpression@OperandString];
		GaugeCovDInert[Index_,OperandString_]:=GaugeCovD[Index][ToExpression@OperandString];
		LorentzGaugeCovDInert[Index_,OperandString_]:=LorentzGaugeCovD[Index][ToExpression@OperandString];
		ParaLorentzGaugeCovDInert[Index_,OperandString_]:=ParaLorentzGaugeCovD[Index][ToExpression@OperandString];
		ProjectorGPInert[OperandString_]:=ProjectorGP[ToExpression@OperandString];

		Evaluate@ManipulatedExpr
	];

	ManipulatedExpr];

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

(*---------------------------------------------------------------------------------------*)
(*  Sometimes we want to use the smearing functionality to print a pre-computed bracket  *)
(*---------------------------------------------------------------------------------------*)

AllocatedPoissonBracket[LeftOperand_,RightOperand_,AllocatedBracket_]:=Catch@Module[{
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

	HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~AllocatedBracket);
];
