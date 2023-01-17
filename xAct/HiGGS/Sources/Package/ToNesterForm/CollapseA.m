(*=============*)
(*  CollapseA  *)
(*=============*)

CollapseA[InputExpr_]:=Module[{Expr=InputExpr,PrintVariable},
	PrintVariable=PrintTemporary[" ** xAct`HiGGS`Private`CollapseA..."];
	Expr=Expr/.xAct`HiGGS`CDAToCDAInert;
	Expr=Expr/.xAct`HiGGS`AExpand;
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HG3VCDAToHVCDA;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HG3VAToHVA;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDAInertToCDA;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HG3BExpand;(*to deal with the strange combination of A epsilon which cancels*)
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr=Expr/.xAct`HiGGS`HEpsToHG3Eps;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`AHEpsExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`EpsEpsExpand;
	Expr//=ToNewCanonical;(*finished dealing with this combination*)
	NotebookDelete[PrintVariable];
Expr];
