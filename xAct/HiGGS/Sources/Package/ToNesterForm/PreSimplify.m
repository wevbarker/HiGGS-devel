(*===============*)
(*  PreSimplify  *)
(*===============*)

Options[PreSimplify]={Hard->False};
PreSimplify[InputExpr_,OptionsPattern[]]:=Module[{Expr=InputExpr,PrintVariable},
	PrintVariable=PrintTemporary[" ** xAct`HiGGS`Private`PreSimplify..."];
	Expr//=ToNewCanonical;
	If[OptionValue[Hard],Expr=Expr/.xAct`HiGGS`HExpand];
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HG3BExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr//=ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];
