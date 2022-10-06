(*this file provides the NesterFormQ function*)

NesterFormQ[Expr_]:=Catch@Module[{TensorList,FinalBool},		
		FinalBool=((
		Validate@Expr;
		xAct`xTensor`Private`Identify@Expr;
		TensorList=DeleteDuplicates@Cases[ToIndexFree@(Expr),_?xTensorQ,Infinity];
		!(TensorList~ContainsAny~{xAct`HiGGS`A,xAct`HiGGS`B,xAct`HiGGS`H})	
		)~Check~(False));
	FinalBool];
