(* provides some tools for PoissonBracket *)

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

(* a function to smear the Poisson bracket which has been provided as a list *)
Options[SmearPoissonBracket]={ToShell->False,TheoryNameOption->""};
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
		((EvaluatedBracket[[1]]//ToNewCanonical)~Dot~
		(LeftSmearing)~Dot~
		(RightSmearing))];
	
		If[PossibleZeroQ@EvaluatedBracket[[2]],
		SmearedEvaluatedBracketTerm2=0,
		SmearedEvaluatedBracketTerm2=
		((EvaluatedBracket[[2]]//ToNewCanonical)~Dot~
		(LeftSmearing)~Dot~
		(xAct`HiGGS`G3[Zz1,-Zz]xAct`HiGGS`GaugeCovD[-Zz1]@RightSmearing))];

		If[PossibleZeroQ@EvaluatedBracket[[3]],
		SmearedEvaluatedBracketTerm3=0,
		SmearedEvaluatedBracketTerm3=
		((EvaluatedBracket[[3]]//ToNewCanonical)~Dot~
		(xAct`HiGGS`SmearingLeft@@LeftFreeIndices)~Dot~
		(xAct`HiGGS`G3[Zz1,-Zz]xAct`HiGGS`GaugeCovD[-Zz1]@(xAct`HiGGS`G3[Zw1,-Zw]xAct`HiGGS`GaugeCovD[-Zw1]@RightSmearing)))];

		SmearedEvaluatedBracketTotal=SmearedEvaluatedBracketTerm1+
		SmearedEvaluatedBracketTerm2+
		SmearedEvaluatedBracketTerm3;

		SmearedEvaluatedBracketTotal=SmearedEvaluatedBracketTotal/.{Dot->Times};
		SmearedEvaluatedBracketTotal//=ToNewCanonical;

		SmearedEvaluatedBracketTotal//=ToNesterForm[#,ToShell->OptionValue@ToShell,TheoryNameOption->OptionValue@TheoryNameOption]&;

		If[PossibleZeroQ@SmearedEvaluatedBracketTotal,
		SmearedEvaluatedBracket=0,
		SmearedEvaluatedBracket=Integrate@@({(SmearedEvaluatedBracketTotal)@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1];	

		If[OptionValue@ToShell,
			HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~SmearedEvaluatedBracket);,
			HiGGSPrint@(SmearedUnevaluatedBracket~Congruent~SmearedEvaluatedBracket);
		];

	SmearedEvaluatedBracket];

(* a function to form the Poisson bracket on a given term *)
Options[SmearedPoissonBracket]={ToShell->False,TheoryNameOption->""};
SmearedPoissonBracket[{LeftOperand_,LeftSmearing_},{RightOperand_,RightSmearing_},OptionsPattern[]]:=Catch@Module[{
	UnevaluatedBracket,
	EvaluatedBracket,
	SmearedEvaluatedBracket},
	UnevaluatedBracket={LeftOperand,RightOperand};
	EvaluatedBracket=PoissonBracketNewList[LeftOperand,RightOperand,
		xTensorCovD->True,
		Surficial->True,
		ToShell->OptionValue@ToShell,
		TheoryNameOption->OptionValue@TheoryNameOption,
		PrintAnswer->False];
	SmearedEvaluatedBracket=SmearPoissonBracket[UnevaluatedBracket,EvaluatedBracket,LeftSmearing,RightSmearing,ToShell->OptionValue@ToShell,TheoryNameOption->OptionValue@TheoryNameOption];
	SmearedEvaluatedBracket];

(* a function to test whether the argument is a derivative *)
DQ[Expr_]:=((Head@Evaluate@Expr)==D);


LeibnizList[Expr_,DifferentiableTensors_?ListQ]:=Module[{
	ManipulatedExpr=Expr//NoScalar,
	ManipulatedDiffenentiableTensors=DifferentiableTensors,
	CanonicalVariables},

	(* We will use D to create a Leibniz list, but we have to be careful that functions of tensors (as covariant derivatives and projectors are interpreted by Wolfram) are not differentiated according to chain rule but instead treated as atomic expressions to be fed into PoissonBracket *)	
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

	(* The basic atomic units into which we split expressions include not only defined xTensors, but also now these heads *)
	ManipulatedDiffenentiableTensors=ManipulatedDiffenentiableTensors~Join~{
		CDInert,
		GaugeCovDInert,
		LorentzGaugeCovDInert,
		ProjectorGPInert};

	(* Use D to create a "Leibniz list" accordingly *)	
	ManipulatedExpr=Flatten@List@((Evaluate@D[ManipulatedExpr,CanonicalVariables,NonConstants->ManipulatedDiffenentiableTensors])/.{Plus->List});

	ManipulatedExpr=({(First@(List@@(First@Cases[#,_?DQ,Infinity]))),({D}~Block~(D[x___]:=1;#))})&/@ManipulatedExpr;

	(* We now want to activate the inert heads again *)
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

	(*Print@ManipulatedExpr;*)

	ManipulatedExpr];

(*I'm sure we will have some to add!*)
Options@PoissonBracket={
	Parallel->False,
	ToShell->False,
	TheoryNameOption->""};

PoissonBracket[LeftOperand_?PossibleZeroQ,RightOperand_]:=0;
PoissonBracket[LeftOperand_,RightOperand_?PossibleZeroQ]:=0;

(* main function for nonlinear Poisson bracket *)
PoissonBracket[LeftOperand_?NesterFormQ,RightOperand_?NesterFormQ,OptionsPattern[]]:=Catch@Module[{
	OptionValueToShell,
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
	
	OptionValueToShell=StringQ@OptionValue@ToShell;
	OptionValueTheoryNameOption=ToString@OptionValue@ToShell;

	PrintVariable=PrintTemporary[" ** PoissonBracket: organising covariant sub-brackets according to Leibniz rule..."];

	(* list of xTensors which we want to be treated as atomic operands in each Poisson bracket, better to re-evaluate on each call in case new quantities were defined by the user *)
	DifferentiableTensors=$Tensors~Complement~{
	xAct`HiGGS`SmearingLeft,
	xAct`HiGGS`SmearingRight};

	LeftFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@LeftOperand));
	RightFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@RightOperand));


	SmearedUnevaluatedBracket={
		Integrate@@({((LeftOperand)~Dot~((xAct`HiGGS`SmearingLeft@@LeftFreeIndices)~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1,
		Integrate@@({((RightOperand)~Dot~((xAct`HiGGS`SmearingRight@@RightFreeIndices)~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies2};

	LeftExpansion=((SmearingLeft@@LeftFreeIndices)*LeftOperand)~LeibnizList~DifferentiableTensors;
	RightExpansion=((SmearingRight@@RightFreeIndices)*RightOperand)~LeibnizList~DifferentiableTensors;

	NotebookDelete@PrintVariable;

	Print[" ** PoissonBracket: Note that ",xAct`HiGGS`SmearingLeft[]," and ",xAct`HiGGS`SmearingRight[]," are arbitrarily-indexed and independent smearing functions, the yellow background indicates that the quantity is formally held constant, and the center dot is an ordinary multiplication."];

	Print@" ** PoissonBracket: evaluated the following covariant sub-brackets according to Leibniz rule:";

	OptionSmearedPoissonBracket[{LeftOp_,LeftSmear_},{RightOp_,RightSmear_}]:=SmearedPoissonBracket[{LeftOp,LeftSmear},{RightOp,RightSmear},ToShell->OptionValueToShell,TheoryNameOption->OptionValueTheoryNameOption];

	If[OptionValue@Parallel,	
		LeibnizArray=Outer[(HiGGSParallelSubmit@(SmearedPoissonBracket[#1,#2,ToShell->OptionValueToShell,TheoryNameOption->OptionValueTheoryNameOption]))&,LeftExpansion,RightExpansion,1];
		Print@LeibnizArray;
		LeibnizArray=WaitAll[LeibnizArray];
		(*Print@LeibnizArray;*),
		LeibnizArray=Outer[OptionSmearedPoissonBracket,LeftExpansion,RightExpansion,1]
	];


	If[LeibnizArray=={{0}},	
		EvaluatedBracket=0,	
		EvaluatedBracket=Total@(Head@First@(List@@#)&/@(DeleteCases[(LeibnizArray~Flatten~1),0,Infinity]))/.{Dot->Times};
		Print@(DeleteCases[(LeibnizArray~Flatten~1),0,Infinity]);
		EvaluatedBracket//=ToNewCanonical,
		EvaluatedBracket=Total@(Head@First@(List@@#)&/@(DeleteCases[(LeibnizArray~Flatten~1),0,Infinity]))/.{Dot->Times};
		Print@(DeleteCases[(LeibnizArray~Flatten~1),0,Infinity]);
		EvaluatedBracket//=ToNewCanonical];

	EvaluatedBracket//=ToNesterForm[#,ToShell->OptionValueToShell,TheoryNameOption->OptionValueTheoryNameOption]&;

	Print@" ** PoissonBracket: composed the total bracket:";

	If[PossibleZeroQ@EvaluatedBracket,
		EvaluatedBracket=0,
		EvaluatedBracket=Integrate@@({(EvaluatedBracket)@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1];	

	If[OptionValueToShell,
		HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~EvaluatedBracket);,
		HiGGSPrint@(SmearedUnevaluatedBracket~Congruent~EvaluatedBracket);
	];

	EvaluatedBracket];

PoissonBracket::nester="The current version of HiGGS can only calculate Poisson brackets on pairs of quantities in Nester form. The arguments provided were not a pair PoissonBracket[LeftOperand,RightOperand,Options...], where ToNesterForm[LeftOperand] and ToNesterForm[RightOperand] both return True."
PoissonBracket[OtherArgs___,OptionsPattern[]]:=Throw@Message[PoissonBracket::nester];
