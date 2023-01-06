(*=============*)
(*  CDBToDJDV  *)
(*=============*)

CDBToDJDV[x_]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** CDBToDJDV..."];
	Expr=x;
	Expr=Expr/.xAct`HiGGS`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];
