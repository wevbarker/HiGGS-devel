(*This file defines the gauge covariant derivative with a Greek index from the middle of the alphabet, i.e. spannig 1--3 indices*)

UndefCovD@GaugeCovD;
DefCovD[GaugeCovD[-a],{"~","\[ScriptCapitalD]"}];

CDToGaugeCovD[Expr_]:=Module[{ConvertedExpr},
	ConvertedExpr=ChangeCovD[Expr,CD,GaugeCovD];
	ConvertedExpr];

(*
NesterFormQ[Expr_]:=Catch@Module[{TensorList,FinalBool},		
		FinalBool=((
		Validate@Expr;
		xAct`xTensor`Private`Identify@Expr;
		TensorList=DeleteDuplicates@Cases[ToIndexFree@(Expr),_?xTensorQ,Infinity];
		!(TensorList~ContainsAny~{Global`A,Global`B,Global`H})	
		)~Check~(False));
	FinalBool];
		*)


(*
SmearingLeftSymb="\!\(\*SuperscriptBox[\(\[ScriptCapitalD]\), \((1)\)]\)";
*)
