(*=======================*)
(*  SmearPoissonBracket  *)
(*=======================*)

(*-----------------------------------------------------------------------------*)
(*  A function to smear the Poisson bracket which has been provided as a list  *)
(*-----------------------------------------------------------------------------*)

Options[SmearPoissonBracket]={ToShell->False};
SmearPoissonBracket[UnevaluatedBracket_List,EvaluatedBracket_List,LeftSmearing_,RightSmearing_,OptionsPattern[]]:=Catch@Module[{
	PrintVariable,
	LeftFreeIndices,
	RightFreeIndices,
	SmearedUnevaluatedBracket,
	SmearedEvaluatedBracket,
	SmearedEvaluatedBracketTerm1,
	SmearedEvaluatedBracketTerm2,
	SmearedEvaluatedBracketTerm3,
	SmearedEvaluatedBracketTotal},

	PrintVariable=PrintTemporary@" ** xAct`HiGGS`Private`SmearPoissonBracket...";

		LeftFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@UnevaluatedBracket[[1]]));
		RightFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@UnevaluatedBracket[[2]]));

		SmearedUnevaluatedBracket={
		Integrate@@({((UnevaluatedBracket[[1]])~Dot~(LeftSmearing~Style~(Background->RGBColor[0.95,0.95,0.95])))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1,
		Integrate@@({((UnevaluatedBracket[[2]])~Dot~(RightSmearing~Style~(Background->RGBColor[0.95,0.95,0.95])))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies2};
	
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
		NotebookDelete@PrintVariable;

SmearedEvaluatedBracket];
