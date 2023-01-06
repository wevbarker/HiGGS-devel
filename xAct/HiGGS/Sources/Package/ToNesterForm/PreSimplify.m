(*===============*)
(*  PreSimplify  *)
(*===============*)

Options[PreSimplify]={Hard->False};
PreSimplify[x_,OptionsPattern[]]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** TotalToO3 with Hard ",OptionValue[Hard],"..."];
	Expr=x;
	Expr//=ToNewCanonical;
	If[OptionValue[Hard],Expr=Expr/.xAct`HiGGS`HExpand];
	Expr//=ToNewCanonical;
	(*Expr=Expr/.xAct`HiGGS`HG3BExpandLazy;*)
	Expr=Expr/.xAct`HiGGS`HG3BExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr//=ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];
