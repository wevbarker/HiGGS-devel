(*===============*)
(*  NesterFormQ  *)
(*===============*)

ExtractSymbols[Expr_]:=Module[{ExtractedExpr=Expr},
	ExtractedExpr//=ToIndexFree;	
	ExtractedExpr//=Block[{xAct`HiGGS`CD,xAct`HiGGS`GaugeCovD,xAct`HiGGS`LorentzGaugeCovD,xAct`HiGGS`ParaLorentzGaugeCovD},
		xAct`HiGGS`CD[Tensor_]:=xAct`HiGGS`CD*Tensor;
		xAct`HiGGS`GaugeCovD[Tensor_]:=xAct`HiGGS`GaugeCovD*Tensor;
		xAct`HiGGS`LorentzGaugeCovD[Tensor_]:=xAct`HiGGS`LorentzGaugeCovD*Tensor;
		xAct`HiGGS`ParaLorentzGaugeCovD[Tensor_]:=xAct`HiGGS`ParaLorentzGaugeCovD*Tensor;
		Evaluate@#]&;
	ExtractedExpr];

NesterFormQ[Expr_]:=Catch@Module[{TensorList,FinalBool},
		FinalBool=((
		Validate@Expr;
		xAct`xTensor`Private`Identify@Expr;
		(*TensorList=DeleteDuplicates@Cases[ToIndexFree@(Expr),_?xTensorQ,Infinity];*) (*this caused an amusing bug, fixed below*)
		TensorList=DeleteDuplicates@Flatten@((Cases[ExtractSymbols@#,_?xTensorQ,Infinity])&/@(Flatten@({Expr/.Plus->List})));
		TensorList=TensorList~Join~DeleteDuplicates@Flatten@((Cases[ExtractSymbols@#,_?CovDQ,Infinity])&/@(Flatten@({Expr/.Plus->List})));
		!(TensorList~ContainsAny~{xAct`HiGGS`A,xAct`HiGGS`B,xAct`HiGGS`H,xAct`HiGGS`T,xAct`HiGGS`TLambda,xAct`HiGGS`R,xAct`HiGGS`RLambda,
			xAct`HiGGS`PhiB0p,xAct`HiGGS`PhiB0m,xAct`HiGGS`PhiB1p,xAct`HiGGS`PhiB1m,xAct`HiGGS`PhiB2p,xAct`HiGGS`PhiB2m,
			xAct`HiGGS`PhiA0p,xAct`HiGGS`PhiA0m,xAct`HiGGS`PhiA1p,xAct`HiGGS`PhiA1m,xAct`HiGGS`PhiA2p,xAct`HiGGS`PhiA2m,
			xAct`HiGGS`ChiSingB0p,xAct`HiGGS`ChiSingB0m,xAct`HiGGS`ChiSingB1p,
			xAct`HiGGS`ChiSingB1m,xAct`HiGGS`ChiSingB2p,xAct`HiGGS`ChiSingB2m,
			xAct`HiGGS`ChiSingA0p,xAct`HiGGS`ChiSingA0m,xAct`HiGGS`ChiSingA1p,
			xAct`HiGGS`ChiSingA1m,xAct`HiGGS`ChiSingA2p,xAct`HiGGS`ChiSingA2m,
			xAct`HiGGS`ChiPerpB0p,xAct`HiGGS`ChiPerpB0m,xAct`HiGGS`ChiPerpB1p,
			xAct`HiGGS`ChiPerpB1m,xAct`HiGGS`ChiPerpB2p,xAct`HiGGS`ChiPerpB2m,
			xAct`HiGGS`ChiPerpA0p,xAct`HiGGS`ChiPerpA0m,xAct`HiGGS`ChiPerpA1p,
			xAct`HiGGS`ChiPerpA1m,xAct`HiGGS`ChiPerpA2p,xAct`HiGGS`ChiPerpA2m,
			xAct`HiGGS`ChiParaB0p,xAct`HiGGS`ChiParaB0m,xAct`HiGGS`ChiParaB1p,
			xAct`HiGGS`ChiParaB1m,xAct`HiGGS`ChiParaB2p,xAct`HiGGS`ChiParaB2m,
			xAct`HiGGS`ChiParaA0p,xAct`HiGGS`ChiParaA0m,xAct`HiGGS`ChiParaA1p,
			xAct`HiGGS`ChiParaA1m,xAct`HiGGS`ChiParaA2p,xAct`HiGGS`ChiParaA2m,
			xAct`HiGGS`CD,xAct`HiGGS`GaugeCovD,xAct`HiGGS`LorentzGaugeCovD
		})	
		)~Check~(False));
	FinalBool];
