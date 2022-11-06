(*=========================*)
(*  PoissonBracketNewList  *)
(*=========================*)

Options[PoissonBracketNewList]={
	ToShell->False,
	GToFoliGOption->True,
	PreTruncate->False,
	NesterForm->True,
	Parallel->False};

PoissonBracketNewList[LeftOperand_,RightOperand_,OptionsPattern[]]:=Module[{
	Expr,
	LeftOp,
	RightOp,
	LeftOpDummy,
	RightOpDummy,
	LeftOpDummyInert,
	RightOpDummyInert,
	VariationalLeftOpB,
	VariationalRightOpB,
	VariationalLeftOpA,
	VariationalRightOpA,
	VariationalLeftOpBPi,
	VariationalRightOpBPi,
	VariationalLeftOpAPi,
	VariationalRightOpAPi,
	PartialLeftOpB,
	PartialRightOpB,
	PartialLeftOpA,
	PartialRightOpA,
	PartialLeftOpBPi,
	PartialRightOpBPi,
	PartialLeftOpAPi,
	PartialRightOpAPi,
	PartialLeftOpDBz,
	PartialRightOpDBz,
	PartialLeftOpDAz,
	PartialRightOpDAz,
	PartialLeftOpDBPiz,
	PartialRightOpDBPiz,
	PartialLeftOpDAPiz,
	PartialRightOpDAPiz,
	PartialLeftOpDBv,
	PartialRightOpDBv,
	PartialLeftOpDAv,
	PartialRightOpDAv,
	PartialLeftOpDBPiv,
	PartialRightOpDBPiv,
	PartialLeftOpDAPiv,
	PartialRightOpDAPiv,
	BarPartialLeftOpB,
	BarPartialRightOpB,
	BarPartialLeftOpA,
	BarPartialRightOpA,
	BarPartialLeftOpBPi,
	BarPartialRightOpBPi,
	BarPartialLeftOpAPi,
	BarPartialRightOpAPi,
	BarVariationalLeftOpB,
	BarVariationalRightOpB,
	BarVariationalLeftOpA,
	BarVariationalRightOpA,
	BarVariationalLeftOpBPi,
	BarVariationalRightOpBPi,
	BarVariationalLeftOpAPi,
	BarVariationalRightOpAPi,
	DeltaDelta,
	DDeltaDelta,
	DeltaDDelta,
	DDeltaDDelta,
	D0Term,
	D1Term,
	D2Term,
	PrintVariable,
	PrintVariable2,
	PrintVariable3},

	(*----------------------------------*)
	(*  Initial processing of operands  *)
	(*----------------------------------*)

	PrintVariable={};
	PrintVariable=PrintVariable~Append~PrintTemporary[" ** PoissonBracketNewList..."];
		
	LeftOp=ToBasicForm[LeftOperand,Hard->True];
	LeftOp//=NoScalar;
	If[OptionValue[PreTruncate],LeftOp=LeftOp//ToNewCanonical];
	RightOp=ToBasicForm[RightOperand,Hard->True];
	RightOp//=NoScalar;
	If[OptionValue[PreTruncate],RightOp=RightOp//ToNewCanonical];

	PrintVariable=PrintVariable~Append~PrintTemporary[" ** PoissonBracket: BasicForm of left operand is:"];
	PrintVariable=PrintVariable~Append~PrintTemporary[LeftOp];
	PrintVariable=PrintVariable~Append~PrintTemporary[" ** PoissonBracket: BasicForm of right operand is:"];
	PrintVariable=PrintVariable~Append~PrintTemporary[RightOp];

	LeftOpDummy=ReplaceDummies[LeftOp];
	RightOpDummy=ReplaceDummies[RightOp];
	LeftOpDummy=LeftOpDummy/.Derivative3;
	LeftOpDummy=LeftOpDummy/.GaugeField3;
	RightOpDummy=RightOpDummy/.Derivative3;
	RightOpDummy=RightOpDummy/.GaugeField3;
	LeftOpDummyInert=LeftOpDummy/.InertDer;
	LeftOpDummyInert//=NoScalar;
	RightOpDummyInert=RightOpDummy/.InertDer;
	RightOpDummyInert//=NoScalar;

	(*---------------------------*)
	(*  Variational derivatives  *)
	(*---------------------------*)

	VariationalLeftOpB=
		NewVarAction[LeftOpDummy,xAct`HiGGS`B[Zq,-Zr]]
		+xAct`HiGGS`DVDB[-Zx,-Zq,Zr]NewVarAction[LeftOpDummy,xAct`HiGGS`V[-Zx]]
		+xAct`HiGGS`DHDB[-Zx,Zy,-Zq,Zr]NewVarAction[LeftOpDummy,xAct`HiGGS`H[-Zx,Zy]]
		+xAct`HiGGS`DJDB[-Zq,Zr]NewVarAction[LeftOpDummy,xAct`HiGGS`J[]]
		+xAct`HiGGS`DLapseDB[-Zq,Zr]NewVarAction[LeftOpDummy,xAct`HiGGS`Lapse[]]
		+xAct`HiGGS`DJiDB[-Zq,Zr]NewVarAction[LeftOpDummy,xAct`HiGGS`Ji[]];
	VariationalRightOpB=
		NewVarAction[RightOpDummy,xAct`HiGGS`B[Zq,-Zr]]
		+xAct`HiGGS`DVDB[-Zx,-Zq,Zr]NewVarAction[RightOpDummy,xAct`HiGGS`V[-Zx]]
		+xAct`HiGGS`DHDB[-Zx,Zy,-Zq,Zr]NewVarAction[RightOpDummy,xAct`HiGGS`H[-Zx,Zy]]
		+xAct`HiGGS`DJDB[-Zq,Zr]NewVarAction[RightOpDummy,xAct`HiGGS`J[]]
		+xAct`HiGGS`DLapseDB[-Zq,Zr]NewVarAction[RightOpDummy,xAct`HiGGS`Lapse[]]
		+xAct`HiGGS`DJiDB[-Zq,Zr]NewVarAction[RightOpDummy,xAct`HiGGS`Ji[]];
	VariationalLeftOpA=NewVarAction[LeftOpDummy,xAct`HiGGS`A[Zq,Zr,-Zs]];
	VariationalRightOpA=NewVarAction[RightOpDummy,xAct`HiGGS`A[Zq,Zr,-Zs]];
	VariationalLeftOpBPi=NewVarAction[LeftOpDummy,xAct`HiGGS`BPi[-Zq,Zr]];
	VariationalRightOpBPi=NewVarAction[RightOpDummy,xAct`HiGGS`BPi[-Zq,Zr]];
	VariationalLeftOpAPi=NewVarAction[LeftOpDummy,xAct`HiGGS`APi[-Zq,-Zr,Zs]];
	VariationalRightOpAPi=NewVarAction[RightOpDummy,xAct`HiGGS`APi[-Zq,-Zr,Zs]];

	PartialLeftOpB=
		NewVarAction[LeftOpDummyInert,xAct`HiGGS`B[Zq,-Zr]]
		+xAct`HiGGS`DVDB[-Zx,-Zq,Zr]NewVarAction[LeftOpDummyInert,xAct`HiGGS`V[-Zx]]
		+xAct`HiGGS`DHDB[-Zx,Zy,-Zq,Zr]NewVarAction[LeftOpDummyInert,xAct`HiGGS`H[-Zx,Zy]]
		+xAct`HiGGS`DJDB[-Zq,Zr]NewVarAction[LeftOpDummyInert,xAct`HiGGS`J[]]
		+xAct`HiGGS`DLapseDB[-Zq,Zr]NewVarAction[LeftOpDummyInert,xAct`HiGGS`Lapse[]]
		+xAct`HiGGS`DJiDB[-Zq,Zr]NewVarAction[LeftOpDummyInert,xAct`HiGGS`Ji[]];
	PartialRightOpB=
		NewVarAction[RightOpDummyInert,xAct`HiGGS`B[Zq,-Zr]]
		+xAct`HiGGS`DVDB[-Zx,-Zq,Zr]NewVarAction[RightOpDummyInert,xAct`HiGGS`V[-Zx]]
		+xAct`HiGGS`DHDB[-Zx,Zy,-Zq,Zr]NewVarAction[RightOpDummyInert,xAct`HiGGS`H[-Zx,Zy]]
		+xAct`HiGGS`DJDB[-Zq,Zr]NewVarAction[RightOpDummyInert,xAct`HiGGS`J[]]
		+xAct`HiGGS`DLapseDB[-Zq,Zr]NewVarAction[RightOpDummyInert,xAct`HiGGS`Lapse[]]
		+xAct`HiGGS`DJiDB[-Zq,Zr]NewVarAction[RightOpDummyInert,xAct`HiGGS`Ji[]];
	PartialLeftOpA=NewVarAction[LeftOpDummyInert,xAct`HiGGS`A[Zq,Zr,-Zs]];
	PartialRightOpA=NewVarAction[RightOpDummyInert,xAct`HiGGS`A[Zq,Zr,-Zs]];
	PartialLeftOpBPi=NewVarAction[LeftOpDummyInert,xAct`HiGGS`BPi[-Zq,Zr]];
	PartialRightOpBPi=NewVarAction[RightOpDummyInert,xAct`HiGGS`BPi[-Zq,Zr]];
	PartialLeftOpAPi=NewVarAction[LeftOpDummyInert,xAct`HiGGS`APi[-Zq,-Zr,Zs]];
	PartialRightOpAPi=NewVarAction[RightOpDummyInert,xAct`HiGGS`APi[-Zq,-Zr,Zs]];
	PartialLeftOpDBz=NewVarAction[LeftOpDummyInert,CDBDummy[-Zz,Zq,-Zr]];
	PartialRightOpDBz=NewVarAction[RightOpDummyInert,CDBDummy[-Zz,Zq,-Zr]];
	PartialLeftOpDAz=NewVarAction[LeftOpDummyInert,CDADummy[-Zz,Zq,Zr,-Zs]];
	PartialRightOpDAz=NewVarAction[RightOpDummyInert,CDADummy[-Zz,Zq,Zr,-Zs]];
	PartialLeftOpDBPiz=NewVarAction[LeftOpDummyInert,CDBPiDummy[-Zz,-Zq,Zr]];
	PartialRightOpDBPiz=NewVarAction[RightOpDummyInert,CDBPiDummy[-Zz,-Zq,Zr]];
	PartialLeftOpDAPiz=NewVarAction[LeftOpDummyInert,CDAPiDummy[-Zz,-Zq,-Zr,Zs]];
	PartialRightOpDAPiz=NewVarAction[RightOpDummyInert,CDAPiDummy[-Zz,-Zq,-Zr,Zs]];
	PartialLeftOpDBv=NewVarAction[LeftOpDummyInert,CDBDummy[-Zv,Zq,-Zr]];
	PartialRightOpDBv=NewVarAction[RightOpDummyInert,CDBDummy[-Zv,Zq,-Zr]];
	PartialLeftOpDAv=NewVarAction[LeftOpDummyInert,CDADummy[-Zv,Zq,Zr,-Zs]];
	PartialRightOpDAv=NewVarAction[RightOpDummyInert,CDADummy[-Zv,Zq,Zr,-Zs]];
	PartialLeftOpDBPiv=NewVarAction[LeftOpDummyInert,CDBPiDummy[-Zv,-Zq,Zr]];
	PartialRightOpDBPiv=NewVarAction[RightOpDummyInert,CDBPiDummy[-Zv,-Zq,Zr]];
	PartialLeftOpDAPiv=NewVarAction[LeftOpDummyInert,CDAPiDummy[-Zv,-Zq,-Zr,Zs]];
	PartialRightOpDAPiv=NewVarAction[RightOpDummyInert,CDAPiDummy[-Zv,-Zq,-Zr,Zs]];

	(*--------------------------------*)
	(*  Composing barred derivatives  *)
	(*--------------------------------*)

	PrintVariable2={};
	PrintVariable2=PrintVariable2~Append~PrintTemporary[" ** PoissonBracket: Finding barred derivatives..."];

	BarPartialLeftOpB=ReplaceDummies@(PartialLeftOpB-ReplaceIndex[Evaluate[PartialLeftOpDBz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]);
	BarPartialRightOpB=ReplaceDummies@(PartialRightOpB-ReplaceIndex[Evaluate[PartialRightOpDBz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]);
	BarPartialLeftOpA=ReplaceDummies@(PartialLeftOpA-ReplaceIndex[Evaluate[PartialLeftOpDAz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]-ReplaceIndex[Evaluate[PartialLeftOpDAz],-Zr->-Zw] xAct`HiGGS`A[Zw,-Zr,-Zz]);
	BarPartialRightOpA=ReplaceDummies@(PartialRightOpA-ReplaceIndex[Evaluate[PartialRightOpDAz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]-ReplaceIndex[Evaluate[PartialRightOpDAz],-Zr->-Zw] xAct`HiGGS`A[Zw,-Zr,-Zz]);
	BarPartialLeftOpBPi=ReplaceDummies@(PartialLeftOpBPi+ReplaceIndex[Evaluate[PartialLeftOpDBPiz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]);
	BarPartialRightOpBPi=ReplaceDummies@(PartialRightOpBPi+ReplaceIndex[Evaluate[PartialRightOpDBPiz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]);
	BarPartialLeftOpAPi=ReplaceDummies@(PartialLeftOpAPi+ReplaceIndex[Evaluate[PartialLeftOpDAPiz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]+ReplaceIndex[Evaluate[PartialLeftOpDAPiz],Zr->Zw] xAct`HiGGS`A[Zr,-Zw,-Zz]);
	BarPartialRightOpAPi=ReplaceDummies@(PartialRightOpAPi+ReplaceIndex[Evaluate[PartialRightOpDAPiz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]+ReplaceIndex[Evaluate[PartialRightOpDAPiz],Zr->Zw] xAct`HiGGS`A[Zr,-Zw,-Zz]);
	BarVariationalLeftOpB=ReplaceDummies@(BarPartialLeftOpB-ManualCovariantDerivative[-Zz,PartialLeftOpDBz,IndexList[Zz,Zr],Zw]);
	BarVariationalRightOpB=ReplaceDummies@(BarPartialRightOpB-ManualCovariantDerivative[-Zz,PartialRightOpDBz,IndexList[Zz,Zr],Zw]);
	BarVariationalLeftOpA=ReplaceDummies@(BarPartialLeftOpA-ManualCovariantDerivative[-Zz,PartialLeftOpDAz,IndexList[Zz,Zs],Zw]);
	BarVariationalRightOpA=ReplaceDummies@(BarPartialRightOpA-ManualCovariantDerivative[-Zz,PartialRightOpDAz,IndexList[Zz,Zs],Zw]);
	BarVariationalLeftOpBPi=ReplaceDummies@(BarPartialLeftOpBPi-ManualCovariantDerivative[-Zz,PartialLeftOpDBPiz,IndexList[Zz,-Zr],Zw]);
	BarVariationalRightOpBPi=ReplaceDummies@(BarPartialRightOpBPi-ManualCovariantDerivative[-Zz,PartialRightOpDBPiz,IndexList[Zz,-Zr],Zw]);
	BarVariationalLeftOpAPi=ReplaceDummies@(BarPartialLeftOpAPi-ManualCovariantDerivative[-Zz,PartialLeftOpDAPiz,IndexList[Zz,-Zs],Zw]);
	BarVariationalRightOpAPi=ReplaceDummies@(BarPartialRightOpAPi-ManualCovariantDerivative[-Zz,PartialRightOpDAPiz,IndexList[Zz,-Zs],Zw]);

	(*------------------------------------------------------------------------*)
	(*  Composing covariant coefficients of covariant differential operators  *)
	(*------------------------------------------------------------------------*)

	PrintVariable2=PrintVariable2~Append~PrintTemporary[" ** PoissonBracket: Finding kernel coefficients..."];

	D0Term=BarPartialLeftOpB BarVariationalRightOpBPi+
	2BarPartialLeftOpA BarVariationalRightOpAPi-
	BarPartialLeftOpBPi BarVariationalRightOpB-
	2BarPartialLeftOpAPi BarVariationalRightOpA+
	ReplaceIndex[Evaluate[PartialLeftOpDBz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpBPi,IndexList[-Zr],Zu]+
	2ReplaceIndex[Evaluate[PartialLeftOpDAz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpAPi,IndexList[-Zs],Zu]-
	ReplaceIndex[Evaluate[PartialLeftOpDBPiz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpB,IndexList[Zr],Zu]-
	2ReplaceIndex[Evaluate[PartialLeftOpDAPiz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpA,IndexList[Zs],Zu];

	D1Term=(-PartialLeftOpDBPiz BarVariationalRightOpB-
	2PartialLeftOpDAPiz BarVariationalRightOpA+
	PartialLeftOpDBz BarVariationalRightOpBPi+
	2PartialLeftOpDAz BarVariationalRightOpAPi+
	BarPartialLeftOpBPi PartialRightOpDBz+
	2BarPartialLeftOpAPi PartialRightOpDAz-
	BarPartialLeftOpB PartialRightOpDBPiz-
	2BarPartialLeftOpA PartialRightOpDAPiz+
	ReplaceIndex[Evaluate[PartialLeftOpDBPiz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDBz,IndexList[Zz,Zr],Zu]+
	2ReplaceIndex[Evaluate[PartialLeftOpDAPiz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDAz,IndexList[Zz,Zs],Zu]-
	ReplaceIndex[Evaluate[PartialLeftOpDBz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDBPiz,IndexList[Zz,-Zr],Zu]-
	2ReplaceIndex[Evaluate[PartialLeftOpDAz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDAPiz,IndexList[Zz,-Zs],Zu]);

	D2Term=PartialLeftOpDBz ReplaceIndex[Evaluate[PartialRightOpDBPiz],Zz->Zw]+
	2PartialLeftOpDAz ReplaceIndex[Evaluate[PartialRightOpDAPiz],Zz->Zw]-
	PartialLeftOpDBPiz ReplaceIndex[Evaluate[PartialRightOpDBz],Zz->Zw]-
	2PartialLeftOpDAPiz ReplaceIndex[Evaluate[PartialRightOpDAz],Zz->Zw];

	Expr={D0Term,D1Term,D2Term};
	Expr=Expr/.InertDerRev;
	Expr=Expr/.Derivative3;
	Expr=Expr/.GaugeField3;

	NotebookDelete[PrintVariable2];

	Expr=ToNesterForm[#,ToShell->OptionValue@ToShell,GToFoliGOption->OptionValue@GToFoliGOption]&/@Expr;

	NotebookDelete[PrintVariable];
Expr];
