(*============*)
(*  Smearing  *)
(*============*)

(*The purpose of this file is to provide a function to xAct`HiGGS`Private` which prints the bracket output with the HiGGS-like List head in a mathematically meaningful form using smearing functions. Our understanding of the smearing function formalism is kindly suggested by Manuel Hohmann, through refs 1111.5490, 1111.5498, 1309.4685.*)

(* xTensor throws "Cannot decide orthogonality to the variable-rank tensor" errors when contracting metric on the variable-index smearing functions, thus we need to tweak xtensor to declare all such functions to not be (strictly) orthogonal to the foliation *)
Unprotect@xAct`xTensor`OrthogonalToVectorQ;
xAct`xTensor`OrthogonalToVectorQ[vector_][tensor_?xTensorQ]:=xUpSet[
	xAct`xTensor`OrthogonalToVectorQ[vector][tensor],
	Module[{inds=SlotsOfTensor[tensor]},
		If[(tensor===xAct`HiGGS`SmearingLeft||tensor===xAct`HiGGS`SmearingRight),
			False,
			If[MemberQ[inds,AnyIndices[_]],
				Throw@Message[xAct`xTensor`OrthogonalToVectoQ::error,"Cannot decide orthogonality to the variable-rank tensor "<>ToString[tensor]],
				inds =DummyIn/@inds;
				xAct`xTensor`Private`OToVcheck[vector,tensor@@inds,Select[inds,EIndexQ]]
			]
		]
	]
];
Protect@xAct`xTensor`OrthogonalToVectorQ;

Options[PrintPoissonBracket]={ToShell->False};
PrintPoissonBracket[UnevaluatedBracket_List,EvaluatedBracket_List,OptionsPattern[]]:=Catch@Module[{
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
		Integrate@@({((UnevaluatedBracket[[1]])~Dot~(xAct`HiGGS`SmearingLeft@@LeftFreeIndices))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1,
		Integrate@@({((UnevaluatedBracket[[2]])~Dot~(xAct`HiGGS`SmearingRight@@RightFreeIndices))@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies2};
	
		If[Length@EvaluatedBracket==3||(PossibleZeroQ@EvaluatedBracket[[2]]&&PossibleZeroQ@EvaluatedBracket[[3]]&&PossibleZeroQ@EvaluatedBracket[[4]]),

		(*Note that the Dot function is a helpful alternative to implicit Times which preserves the ordering of the operands: this is a purely cosmetic choice so as to keep the smearing functions from mixing with the terms in the bracket, and ensure that they sit at the end for easy visual inspection.*)

		If[PossibleZeroQ@EvaluatedBracket[[1]],
		SmearedEvaluatedBracketTerm1=0,
		SmearedEvaluatedBracketTerm1=
		((EvaluatedBracket[[1]])~Dot~
		(xAct`HiGGS`SmearingLeft@@LeftFreeIndices)~Dot~
		(xAct`HiGGS`SmearingRight@@RightFreeIndices))];
	
		If[PossibleZeroQ@EvaluatedBracket[[2]],
		SmearedEvaluatedBracketTerm2=0,
		SmearedEvaluatedBracketTerm2=
		((EvaluatedBracket[[2]])~Dot~
		(xAct`HiGGS`SmearingLeft@@LeftFreeIndices)~Dot~
		(xAct`HiGGS`DSmearingRight@@({-xAct`HiGGS`z}~Join~(List@@RightFreeIndices))))];

		If[PossibleZeroQ@EvaluatedBracket[[3]],
		SmearedEvaluatedBracketTerm3=0,
		SmearedEvaluatedBracketTerm3=
		((EvaluatedBracket[[3]])~Dot~
		(xAct`HiGGS`SmearingLeft@@LeftFreeIndices)~Dot~
		(xAct`HiGGS`DDSmearingRight@@({-xAct`HiGGS`z,-xAct`HiGGS`w}~Join~(List@@RightFreeIndices))))];

		SmearedEvaluatedBracketTotal=SmearedEvaluatedBracketTerm1+
		SmearedEvaluatedBracketTerm2+
		SmearedEvaluatedBracketTerm3;

		If[PossibleZeroQ@SmearedEvaluatedBracketTotal,
		SmearedEvaluatedBracket=0,
		SmearedEvaluatedBracket=Integrate@@({(SmearedEvaluatedBracketTotal)@@#}~Join~(#[[2;;4]]))&@xAct`HiGGS`Dummies1];
		
		If[OptionValue@ToShell,
		xAct`HiGGS`HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~SmearedEvaluatedBracket);,
		xAct`HiGGS`HiGGSPrint@(SmearedUnevaluatedBracket~Congruent~SmearedEvaluatedBracket);];,

		xAct`HiGGS`HiGGSPrint@" ** xAct`HiGGS`Private`PrintPoissonBracket: bracket provided in four-component list form, of which at least one of the last three components are nonvanishing (you might want to pass the option \"Surficial->True\" to PoissonBracket to get the three-component form, which ought to allow covariant handling of the smearing functions).";
		
		If[OptionValue@ToShell,
		xAct`HiGGS`HiGGSPrint@(SmearedUnevaluatedBracket~TildeTilde~EvaluatedBracket);,
		xAct`HiGGS`HiGGSPrint@(SmearedUnevaluatedBracket~Congruent~EvaluatedBracket);];
		];
	];
