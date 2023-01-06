(*===============*)
(*  LeibnizList  *)
(*===============*)

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
