(*===============*)
(*  LeibnizList  *)
(*===============*)

BuildPackage@"PoissonBracket/LeibnizListCovDQ.m";
BuildPackage@"PoissonBracket/LeibnizListCovInt.m";

LeibnizList[Expr_]:=Module[{
	PrintVariable,
	ManipulatedExpr=Expr//NoScalar},

	PrintVariable=PrintTemporary@" ** xAct`HiGGS`Private`LeibnizList...";

	ManipulatedExpr=(Evaluate@LeibnizListCovD[-Zq5][ManipulatedExpr])/.{Plus->List};
	ManipulatedExpr//=List;
	ManipulatedExpr//=Flatten;

	ManipulatedExpr=(
	{
		LeibnizListCovInt@First@Cases[#,_?LeibnizListCovDQ,Infinity],
		({LeibnizListCovD}~Block~(LeibnizListCovD[ArbitraryIndex_][ArbitraryExpr___]:=1;#))
	}
	)&/@ManipulatedExpr;

	NotebookDelete@PrintVariable;

ManipulatedExpr];
