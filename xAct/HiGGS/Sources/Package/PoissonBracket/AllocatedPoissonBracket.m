(*===========================*)
(*  AllocatedPoissonBracket  *)
(*===========================*)

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
