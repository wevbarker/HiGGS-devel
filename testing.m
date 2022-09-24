(* this file implements the nonlinear Poisson bracket, with the Leibniz rule *)

(* a function to smear the Poisson bracket which has been provided as a list *)
Options[SmearPoissonBracket]={ToShell->True};
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
		Integrate@@({((UnevaluatedBracket[[1]])~Dot~(LeftSmearing))@@#}~Join~(#[[2;;4]]))&@Global`Dummies1,
		Integrate@@({((UnevaluatedBracket[[2]])~Dot~(RightSmearing))@@#}~Join~(#[[2;;4]]))&@Global`Dummies2};
	
		If[PossibleZeroQ@EvaluatedBracket[[1]],
		SmearedEvaluatedBracketTerm1=0,
		SmearedEvaluatedBracketTerm1=
		((EvaluatedBracket[[1]])~Dot~
		(LeftSmearing)~Dot~
		(RightSmearing))];
	
		If[PossibleZeroQ@EvaluatedBracket[[2]],
		SmearedEvaluatedBracketTerm2=0,
		SmearedEvaluatedBracketTerm2=
		((EvaluatedBracket[[2]])~Dot~
		(LeftSmearing)~Dot~
		(Global`G3[Global`z1,-Global`z]Global`GaugeCovD[-Global`z1]@RightSmearing))];

		If[PossibleZeroQ@EvaluatedBracket[[3]],
		SmearedEvaluatedBracketTerm3=0,
		SmearedEvaluatedBracketTerm3=
		((EvaluatedBracket[[3]])~Dot~
		(Global`SmearingLeft@@LeftFreeIndices)~Dot~
		(Global`G3[Global`z1,-Global`z]Global`GaugeCovD[-Global`z1]@(Global`G3[Global`w1,-Global`w]Global`GaugeCovD[-Global`w1]@RightSmearing)))];

		SmearedEvaluatedBracketTotal=SmearedEvaluatedBracketTerm1+
		SmearedEvaluatedBracketTerm2+
		SmearedEvaluatedBracketTerm3;

		If[PossibleZeroQ@SmearedEvaluatedBracketTotal,
		SmearedEvaluatedBracket=0,
		SmearedEvaluatedBracket=Integrate@@({(SmearedEvaluatedBracketTotal)@@#}~Join~(#[[2;;4]]))&@Global`Dummies1];	
	SmearedEvaluatedBracket];

(* a function to form the Poisson bracket on a given term *)
SmearedPoissonBracket[{LeftOperand_,LeftSmearing_},{RightOperand_,RightSmearing_}]:=Catch@Module[{
	UnevaluatedBracket,
	EvaluatedBracket,
	SmearedEvaluatedBracket},
	UnevaluatedBracket={LeftOperand,RightOperand};
	EvaluatedBracket=PoissonBracket[LeftOperand,RightOperand,
		xTensorCovD->True,
		"Surficial"->True,
		"ToShell"->False];
	(*Print@EvaluatedBracket;*)
	SmearedEvaluatedBracket=SmearPoissonBracket[UnevaluatedBracket,EvaluatedBracket,LeftSmearing,RightSmearing];
	SmearedEvaluatedBracket];

(* a function to test whether the argument is a derivative *)
DQ[Expr_]:=((Head@Evaluate@Expr)==D);

(*I'm sure we will have some to add!*)
Options@NonlinearPoissonBracket={Parallel->False,ToShell->False};

(* main function for nonlinear Poisson bracket *)
NonlinearPoissonBracket[LeftOperand_,RightOperand_,OptionsPattern[]]:=Catch@Module[{
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
	EvaluatedBracket},

	PrintVariable=PrintTemporary[" ** NonlinearPoissonBracket: organising covariant sub-brackets according to Leibniz rule..."];

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

	LeftExpansion=({(First@(List@@(First@Cases[#,_?DQ,Infinity]))),({D}~Block~(D[x___]:=1;#))})&/@LeftList;

	RightExpansion=({(First@(List@@(First@Cases[#,_?DQ,Infinity]))),({D}~Block~(D[x___]:=1;#))})&/@RightList;

	NotebookDelete@PrintVariable;

	Print@" ** NonlinearPoissonBracket: evaluated the following covariant sub-brackets according to Leibniz rule:";

	LeibnizArray=Outer[SmearedPoissonBracket,LeftExpansion,RightExpansion,1];

	EvaluatedBracket=Total@(Head@First@(List@@#)&/@(LeibnizArray~Flatten~1))/.{Dot->Times};
	EvaluatedBracket//=ToNewCanonical;

	RecoverQuantity=EvaluatedBracket;

	EvaluatedBracket//=ToNesterForm[#,"ToShell"->OptionValue@ToShell,xTensorCovD->True]&;

	Print@" ** NonlinearPoissonBracket: composed the total bracket:";

	Print@EvaluatedBracket;

	EvaluatedBracket];
