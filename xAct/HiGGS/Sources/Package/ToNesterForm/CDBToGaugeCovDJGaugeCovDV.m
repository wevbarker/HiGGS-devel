(*=============================*)
(*  CDBToGaugeCovDJGaugeCovDV  *)
(*=============================*)

CDBToGaugeCovDJGaugeCovDV[x_]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** CDBToGaugeCovDJGaugeCovDV..."];
	Expr=x;
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
