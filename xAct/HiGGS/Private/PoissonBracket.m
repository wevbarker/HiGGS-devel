(* provides some tools for PoissonBracket *)

ManualCovariantDerivative[DerivativeIndex_,Expr_,GreekIndices_,DummyIndex_]:=Module[{
	DerivativeExpr,
	Indices,
	UpperIndices,
	LowerIndices},

	Indices=Complement[FindFreeIndices[Expr],GreekIndices];
	LowerIndices=Select[Indices,(Quiet[#[[1]]]==-1)&];
	UpperIndices=Complement[Indices,LowerIndices];
	DerivativeExpr=Global`CD[DerivativeIndex][Expr];
	Scan[(DerivativeExpr=DerivativeExpr-Global`A[DummyIndex,#,DerivativeIndex]ReplaceIndex[Evaluate[Expr],#->-DummyIndex])&,LowerIndices];
	Scan[(DerivativeExpr=DerivativeExpr+Global`A[#,-DummyIndex,DerivativeIndex]ReplaceIndex[Evaluate[Expr],#->DummyIndex])&,UpperIndices];
	DerivativeExpr//=ToNewCanonical;
DerivativeExpr];

(* a function to smear the Poisson bracket which has been provided as a list *)
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
		Integrate@@({((UnevaluatedBracket[[1]])~Dot~(LeftSmearing~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@Global`Dummies1,
		Integrate@@({((UnevaluatedBracket[[2]])~Dot~(RightSmearing~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@Global`Dummies2};
	
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
		(Global`G3[Global`z1,-Global`z]Global`GaugeCovD[-Global`z1]@RightSmearing))];

		If[PossibleZeroQ@EvaluatedBracket[[3]],
		SmearedEvaluatedBracketTerm3=0,
		SmearedEvaluatedBracketTerm3=
		((EvaluatedBracket[[3]]//ToNewCanonical)~Dot~
		(Global`SmearingLeft@@LeftFreeIndices)~Dot~
		(Global`G3[Global`z1,-Global`z]Global`GaugeCovD[-Global`z1]@(Global`G3[Global`w1,-Global`w]Global`GaugeCovD[-Global`w1]@RightSmearing)))];

		SmearedEvaluatedBracketTotal=SmearedEvaluatedBracketTerm1+
		SmearedEvaluatedBracketTerm2+
		SmearedEvaluatedBracketTerm3;

		SmearedEvaluatedBracketTotal=SmearedEvaluatedBracketTotal/.{Dot->Times};
		SmearedEvaluatedBracketTotal//=ToNewCanonical;

		SmearedEvaluatedBracketTotal//=ToNesterForm[#,ToShell->OptionValue@ToShell,xTensorCovD->True]&;

		If[PossibleZeroQ@SmearedEvaluatedBracketTotal,
		SmearedEvaluatedBracket=0,
		SmearedEvaluatedBracket=Integrate@@({(SmearedEvaluatedBracketTotal)@@#}~Join~(#[[2;;4]]))&@Global`Dummies1];	

		If[OptionValue@ToShell,
			Global`HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~SmearedEvaluatedBracket);,
			Global`HiGGSPrint@(SmearedUnevaluatedBracket~Congruent~SmearedEvaluatedBracket);
		];

	SmearedEvaluatedBracket];

(* a function to form the Poisson bracket on a given term *)
Options[SmearedPoissonBracket]={ToShell->False};
SmearedPoissonBracket[{LeftOperand_,LeftSmearing_},{RightOperand_,RightSmearing_},OptionsPattern[]]:=Catch@Module[{
	UnevaluatedBracket,
	EvaluatedBracket,
	SmearedEvaluatedBracket},
	UnevaluatedBracket={LeftOperand,RightOperand};
	EvaluatedBracket=PoissonBracketList[LeftOperand,RightOperand,
		xTensorCovD->True,
		Surficial->True,
		ToShell->False,
		PrintAnswer->False];
	(*Print@EvaluatedBracket;*)
	SmearedEvaluatedBracket=SmearPoissonBracket[UnevaluatedBracket,EvaluatedBracket,LeftSmearing,RightSmearing,ToShell->OptionValue@ToShell];
	SmearedEvaluatedBracket];

(* a function to test whether the argument is a derivative *)
DQ[Expr_]:=((Head@Evaluate@Expr)==D);

(*I'm sure we will have some to add!*)
Options@PoissonBracket={Parallel->False,ToShell->False};

PoissonBracket[LeftOperand_?PossibleZeroQ,RightOperand_]:=0;
PoissonBracket[LeftOperand_,RightOperand_?PossibleZeroQ]:=0;

(* main function for nonlinear Poisson bracket *)
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

	PrintVariable=PrintTemporary[" ** PoissonBracket: organising covariant sub-brackets according to Leibniz rule..."];

	DifferentiableTensors=$Tensors~Complement~{
	Global`SmearingLeft,
	Global`DSmearingLeft,
	Global`DDSmearingLeft,
	Global`SmearingRight,
	Global`DSmearingRight,
	Global`DDSmearingRight};

	LeftFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@LeftOperand));
	RightFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@RightOperand));

	LeftList=Flatten@List@((Evaluate@D[(Global`SmearingLeft@@LeftFreeIndices)*LeftOperand,CanonicalVariables,NonConstants->DifferentiableTensors])/.{Plus->List});
	RightList=Flatten@List@((Evaluate@D[(Global`SmearingRight@@RightFreeIndices)*RightOperand,CanonicalVariables,NonConstants->DifferentiableTensors])/.{Plus->List});

	SmearedUnevaluatedBracket={
	Integrate@@({((LeftOperand)~Dot~((Global`SmearingLeft@@LeftFreeIndices)~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@Global`Dummies1,
	Integrate@@({((RightOperand)~Dot~((Global`SmearingRight@@RightFreeIndices)~Style~(Background->Yellow)))@@#}~Join~(#[[2;;4]]))&@Global`Dummies2};

	LeftExpansion=({(First@(List@@(First@Cases[#,_?DQ,Infinity]))),({D}~Block~(D[x___]:=1;#))})&/@LeftList;
	RightExpansion=({(First@(List@@(First@Cases[#,_?DQ,Infinity]))),({D}~Block~(D[x___]:=1;#))})&/@RightList;

	NotebookDelete@PrintVariable;

	Print[" ** PoissonBracket: Note that ",Global`SmearingLeft[]," and ",Global`SmearingRight[]," are arbitrarily-indexed and independent smearing functions, the yellow background indicates that the quantity is formally held constant, and the center dot is an ordinary multiplication."];

	Print@" ** PoissonBracket: evaluated the following covariant sub-brackets according to Leibniz rule:";

	OptionSmearedPoissonBracket[{LeftOp_,LeftSmear_},{RightOp_,RightSmear_}]:=SmearedPoissonBracket[{LeftOp,LeftSmear},{RightOp,RightSmear},ToShell->OptionValue@ToShell];

	LeibnizArray=Outer[OptionSmearedPoissonBracket,LeftExpansion,RightExpansion,1];

	If[LeibnizArray=={{0}},	
		EvaluatedBracket=0,	
		EvaluatedBracket=Total@(Head@First@(List@@#)&/@(DeleteCases[(LeibnizArray~Flatten~1),0,Infinity]))/.{Dot->Times};
		EvaluatedBracket//=ToNewCanonical,
		EvaluatedBracket=Total@(Head@First@(List@@#)&/@(DeleteCases[(LeibnizArray~Flatten~1),0,Infinity]))/.{Dot->Times};
		EvaluatedBracket//=ToNewCanonical];

	EvaluatedBracket//=ToNesterForm[#,ToShell->OptionValue@ToShell,xTensorCovD->True]&;

	Print@" ** PoissonBracket: composed the total bracket:";

	If[PossibleZeroQ@EvaluatedBracket,
		EvaluatedBracket=0,
		EvaluatedBracket=Integrate@@({(EvaluatedBracket)@@#}~Join~(#[[2;;4]]))&@Global`Dummies1];	

	If[OptionValue@ToShell,
		Global`HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~EvaluatedBracket);,
		Global`HiGGSPrint@(SmearedUnevaluatedBracket~Congruent~EvaluatedBracket);
	];

	EvaluatedBracket];

PoissonBracket::nester="The current version of HiGGS can only calculate Poisson brackets on pairs of quantities in Nester form. The arguments provided were not a pair PoissonBracket[LeftOperand,RightOperand,Options...], where ToNesterForm[LeftOperand] and ToNesterForm[RightOperand] both return True."
PoissonBracket[OtherArgs___,OptionsPattern[]]:=Throw@Message[PoissonBracket::nester];
