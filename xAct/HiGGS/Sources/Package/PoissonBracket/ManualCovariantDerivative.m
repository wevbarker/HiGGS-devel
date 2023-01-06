(*=============================*)
(*  ManualCovariantDerivative  *)
(*=============================*)

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
