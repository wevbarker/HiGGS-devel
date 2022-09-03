(*The purpose of this file is to provide a function to xAct`HiGGS`Private` which prints the bracket output with the HiGGS-like List head in a mathematically meaningful form using smearing functions. Our understanding of the smearing function formalism is kindly suggested by Manuel Hohmann, through refs 1111.5490, 1111.5498, 1309.4685.*)

Options[PrintPoissonBracket]={ToShell->False};
PrintPoissonBracket[UnevaluatedBracket_List,EvaluatedBracket_List,OptionsPattern[]]:=Catch@Module[{tmp1,tmp2,LHS},
		Dummies1=Table[Superscript[\[ScriptX],i],{i,0,3}];
		Dummies2={Dummies1[[1]]}~Join~Table[Superscript[\[ScriptY],i],{i,1,3}];

		LeftFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@UnevaluatedBracket[[1]]));
		RightFreeIndices=(-#)&/@(FindFreeIndices@(Evaluate@UnevaluatedBracket[[2]]));
	
		If[Length@EvaluatedBracket==3||(PossibleZeroQ@EvaluatedBracket[[2]]&&PossibleZeroQ@EvaluatedBracket[[3]]&&PossibleZeroQ@EvaluatedBracket[[4]]),

		If[PossibleZeroQ@EvaluatedBracket[[1]],
		SmearedEvaluatedBracketTerm1=0,
		SmearedEvaluatedBracketTerm1=
		((EvaluatedBracket[[1]])~Dot~
		(Global`SmearingLeft@@LeftFreeIndices)~Dot~
		(Global`SmearingRight@@RightFreeIndices))];
	
		If[PossibleZeroQ@EvaluatedBracket[[2]],
		SmearedEvaluatedBracketTerm2=0,
		SmearedEvaluatedBracketTerm2=
		((EvaluatedBracket[[2]])~Dot~
		(Global`SmearingLeft@@LeftFreeIndices)~Dot~
		(Global`DSmearingRight@@({-Global`z}~Join~(List@@RightFreeIndices))))];

		If[PossibleZeroQ@EvaluatedBracket[[3]],
		SmearedEvaluatedBracketTerm3=0,
		SmearedEvaluatedBracketTerm3=
		((EvaluatedBracket[[3]])~Dot~
		(Global`SmearingLeft@@LeftFreeIndices)~Dot~
		(Global`DDSmearingRight@@({-Global`z,-Global`w}~Join~(List@@RightFreeIndices))))];

		SmearedEvaluatedBracket=Integrate@@({(SmearedEvaluatedBracketTerm1+
		SmearedEvaluatedBracketTerm2+
		SmearedEvaluatedBracketTerm3)@@#}~Join~(#[[2;;4]]))&@Dummies1;
		
		If[OptionValue@ToShell,
		Print@(SmearedUnevaluatedBracket~TildeTilde~SmearedEvaluatedBracket);,
		Print@(SmearedUnevaluatedBracket~Congruent~SmearedEvaluatedBracket);];,

		Print@" ** xAct`HiGGS`Private`PrintPoissonBracket: bracket provided in four-component list form, of which at least one of the last three components are nonvanishing (you might want to pass the option \"Surficial->True\" to PoissonBracket to get the three-component form, which ought to allow covariant handling of the smearing functions).";
		
		If[OptionValue@ToShell,
		Print@(SmearedUnevaluatedBracket~TildeTilde~EvaluatedBracket);,
		Print@(SmearedUnevaluatedBracket~Congruent~EvaluatedBracket);];
		];
	];
