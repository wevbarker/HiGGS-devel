(*=============================*)
(*  CDBToGaugeCovDJGaugeCovDV  *)
(*=============================*)

CDBToGaugeCovDJGaugeCovDV[InputExpr_]:=Module[{Expr=InputExpr,PrintVariable},
	PrintVariable=PrintTemporary[" ** xAct`HiGGS`Private`CDBToGaugeCovDJGaugeCovDV..."];
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];
