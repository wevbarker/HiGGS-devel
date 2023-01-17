(*=========================*)
(*  PoissonBracketOfAtoms  *)
(*=========================*)

Options[PoissonBracketOfAtoms]={
	ToShell->False,
	GToFoliGOption->True,
	PreTruncate->False,
	NesterForm->True,
	Parallel->False};

PoissonBracketOfAtoms[LeftOperand_,RightOperand_,OptionsPattern[]]:=Module[{
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
	VariationalLeftOpTLambda,
	VariationalRightOpA,
	VariationalRightOpTLambda,
	VariationalLeftOpBPi,
	VariationalRightOpBPi,
	VariationalLeftOpAPi,
	VariationalLeftOpTLambdaPi,
	VariationalRightOpAPi,
	VariationalRightOpTLambdaPi,
	PartialLeftOpB,
	PartialRightOpB,
	PartialLeftOpA,
	PartialLeftOpTLambda,
	PartialRightOpA,
	PartialRightOpTLambda,
	PartialLeftOpBPi,
	PartialRightOpBPi,
	PartialLeftOpAPi,
	PartialLeftOpTLambdaPi,
	PartialRightOpAPi,
	PartialRightOpTLambdaPi,
	PartialLeftOpDBz,
	PartialRightOpDBz,
	PartialLeftOpDAz,
	PartialLeftOpDTLambdaz,
	PartialRightOpDAz,
	PartialRightOpDTLambdaz,
	PartialLeftOpDBPiz,
	PartialRightOpDBPiz,
	PartialLeftOpDAPiz,
	PartialLeftOpDTLambdaPiz,
	PartialRightOpDAPiz,
	PartialRightOpDTLambdaPiz,
	PartialLeftOpDBv,
	PartialRightOpDBv,
	PartialLeftOpDAv,
	PartialLeftOpDTLambdav,
	PartialRightOpDAv,
	PartialRightOpDTLambdav,
	PartialLeftOpDBPiv,
	PartialRightOpDBPiv,
	PartialLeftOpDAPiv,
	PartialLeftOpDTLambdaPiv,
	PartialRightOpDAPiv,
	PartialRightOpDTLambdaPiv,
	BarPartialLeftOpB,
	BarPartialRightOpB,
	BarPartialLeftOpA,
	BarPartialLeftOpTLambda,
	BarPartialRightOpA,
	BarPartialRightOpTLambda,
	BarPartialLeftOpBPi,
	BarPartialRightOpBPi,
	BarPartialLeftOpAPi,
	BarPartialLeftOpTLambdaPi,
	BarPartialRightOpAPi,
	BarPartialRightOpTLambdaPi,
	BarVariationalLeftOpB,
	BarVariationalRightOpB,
	BarVariationalLeftOpA,
	BarVariationalLeftOpTLambda,
	BarVariationalRightOpA,
	BarVariationalRightOpTLambda,
	BarVariationalLeftOpBPi,
	BarVariationalRightOpBPi,
	BarVariationalLeftOpAPi,
	BarVariationalLeftOpTLambdaPi,
	BarVariationalRightOpAPi,
	BarVariationalRightOpTLambdaPi,
	DeltaDelta,
	DDeltaDelta,
	DeltaDDelta,
	DDeltaDDelta,
	D0Term,
	D1Term,
	D2Term,
	PrintVariable},

	PrintVariable=PrintTemporary@" ** xAct`HiGGS`Private`PoissonBracketOfAtoms...";

	(*----------------------------------*)
	(*  Initial processing of operands  *)
	(*----------------------------------*)

	LeftOp=ToBasicForm[LeftOperand,Hard->True];
	LeftOp//=NoScalar;
	If[OptionValue[PreTruncate],LeftOp=LeftOp//ToNewCanonical];
	RightOp=ToBasicForm[RightOperand,Hard->True];
	RightOp//=NoScalar;
	If[OptionValue[PreTruncate],RightOp=RightOp//ToNewCanonical];

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

	VariationalLeftOpTLambda=NewVarAction[LeftOpDummy,xAct`HiGGS`TLambda[Zs,-Zq,-Zr]];
	VariationalRightOpTLambda=NewVarAction[RightOpDummy,xAct`HiGGS`TLambda[Zs,-Zq,-Zr]];
	VariationalLeftOpTLambdaPi=NewVarAction[LeftOpDummy,xAct`HiGGS`TLambdaPi[-Zs,Zq,Zr]];
	VariationalRightOpTLambdaPi=NewVarAction[RightOpDummy,xAct`HiGGS`TLambdaPi[-Zs,Zq,Zr]];

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

	PartialLeftOpTLambda=NewVarAction[LeftOpDummyInert,xAct`HiGGS`TLambda[Zs,-Zq,-Zr]];
	PartialRightOpTLambda=NewVarAction[RightOpDummyInert,xAct`HiGGS`TLambda[Zs,-Zq,-Zr]];
	PartialLeftOpTLambdaPi=NewVarAction[LeftOpDummyInert,xAct`HiGGS`TLambdaPi[-Zs,Zq,Zr]];
	PartialRightOpTLambdaPi=NewVarAction[RightOpDummyInert,xAct`HiGGS`TLambdaPi[-Zs,Zq,Zr]];

	PartialLeftOpDTLambdaz=NewVarAction[LeftOpDummyInert,CDADummy[-Zz,Zs,-Zq,-Zr]];
	PartialRightOpDTLambdaz=NewVarAction[RightOpDummyInert,CDTLambdaDummy[-Zz,Zs,-Zq,-Zr]];
	PartialLeftOpDTLambdaPiz=NewVarAction[LeftOpDummyInert,CDTLambdaPiDummy[-Zz,-Zs,Zq,Zr]];
	PartialRightOpDTLambdaPiz=NewVarAction[RightOpDummyInert,CDTLambdaPiDummy[-Zz,-Zs,Zq,Zr]];

	PartialLeftOpDTLambdav=NewVarAction[LeftOpDummyInert,CDTLambdaDummy[-Zv,Zs,-Zq,-Zr]];
	PartialRightOpDTLambdav=NewVarAction[RightOpDummyInert,CDTLambdaDummy[-Zv,Zs,-Zq,-Zr]];
	PartialLeftOpDTLambdaPiv=NewVarAction[LeftOpDummyInert,CDTLambdaPiDummy[-Zv,-Zs,Zq,Zr]];
	PartialRightOpDTLambdaPiv=NewVarAction[RightOpDummyInert,CDTLambdaPiDummy[-Zv,-Zs,Zq,Zr]];

	(*--------------------------------*)
	(*  Composing barred derivatives  *)
	(*--------------------------------*)

	BarPartialLeftOpB=ReplaceDummies@(PartialLeftOpB-ReplaceIndex[Evaluate[PartialLeftOpDBz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]);
	BarPartialRightOpB=ReplaceDummies@(PartialRightOpB-ReplaceIndex[Evaluate[PartialRightOpDBz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]);
	BarPartialLeftOpA=ReplaceDummies@(PartialLeftOpA-ReplaceIndex[Evaluate[PartialLeftOpDAz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]-ReplaceIndex[Evaluate[PartialLeftOpDAz],-Zr->-Zw] xAct`HiGGS`A[Zw,-Zr,-Zz]);
	BarPartialRightOpA=ReplaceDummies@(PartialRightOpA-ReplaceIndex[Evaluate[PartialRightOpDAz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]-ReplaceIndex[Evaluate[PartialRightOpDAz],-Zr->-Zw] xAct`HiGGS`A[Zw,-Zr,-Zz]);
	BarPartialLeftOpBPi=ReplaceDummies@(PartialLeftOpBPi+ReplaceIndex[Evaluate[PartialLeftOpDBPiz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]);
	BarPartialRightOpBPi=ReplaceDummies@(PartialRightOpBPi+ReplaceIndex[Evaluate[PartialRightOpDBPiz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]);
	BarPartialLeftOpAPi=ReplaceDummies@(PartialLeftOpAPi+ReplaceIndex[Evaluate[PartialLeftOpDAPiz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]+ReplaceIndex[Evaluate[PartialLeftOpDAPiz],Zr->Zw] xAct`HiGGS`A[Zr,-Zw,-Zz]);
	BarPartialRightOpAPi=ReplaceDummies@(PartialRightOpAPi+ReplaceIndex[Evaluate[PartialRightOpDAPiz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]+ReplaceIndex[Evaluate[PartialRightOpDAPiz],Zr->Zw] xAct`HiGGS`A[Zr,-Zw,-Zz]);

	BarPartialLeftOpTLambda=ReplaceDummies@(PartialLeftOpTLambda+ReplaceIndex[Evaluate[PartialLeftOpDTLambdaz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]+ReplaceIndex[Evaluate[PartialLeftOpDTLambdaz],Zr->Zw] xAct`HiGGS`A[Zr,-Zw,-Zz]-ReplaceIndex[Evaluate[PartialLeftOpDTLambdaz],-Zs->-Zw] xAct`HiGGS`A[Zw,-Zs,-Zz]);
	BarPartialRightOpTLambda=ReplaceDummies@(PartialRightOpTLambda+ReplaceIndex[Evaluate[PartialRightOpDTLambdaz],Zq->Zw] xAct`HiGGS`A[Zq,-Zw,-Zz]+ReplaceIndex[Evaluate[PartialRightOpDTLambdaz],Zr->Zw] xAct`HiGGS`A[Zr,-Zw,-Zz]-ReplaceIndex[Evaluate[PartialRightOpDTLambdaz],-Zs->-Zw] xAct`HiGGS`A[Zw,-Zs,-Zz]);
	BarPartialLeftOpTLambdaPi=ReplaceDummies@(PartialLeftOpTLambdaPi-ReplaceIndex[Evaluate[PartialLeftOpDTLambdaPiz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]-ReplaceIndex[Evaluate[PartialLeftOpDTLambdaPiz],-Zr->-Zw] xAct`HiGGS`A[Zw,-Zr,-Zz]+ReplaceIndex[Evaluate[PartialLeftOpDTLambdaPiz],Zs->Zw] xAct`HiGGS`A[Zs,-Zw,-Zz]);
	BarPartialRightOpTLambdaPi=ReplaceDummies@(PartialRightOpTLambdaPi-ReplaceIndex[Evaluate[PartialRightOpDTLambdaPiz],-Zq->-Zw] xAct`HiGGS`A[Zw,-Zq,-Zz]-ReplaceIndex[Evaluate[PartialRightOpDTLambdaPiz],-Zr->-Zw] xAct`HiGGS`A[Zw,-Zr,-Zz]+ReplaceIndex[Evaluate[PartialRightOpDTLambdaPiz],Zs->Zw] xAct`HiGGS`A[Zs,-Zw,-Zz]);

	BarVariationalLeftOpB=ReplaceDummies@(BarPartialLeftOpB-ManualCovariantDerivative[-Zz,PartialLeftOpDBz,IndexList[Zz,Zr],Zw]);
	BarVariationalRightOpB=ReplaceDummies@(BarPartialRightOpB-ManualCovariantDerivative[-Zz,PartialRightOpDBz,IndexList[Zz,Zr],Zw]);
	BarVariationalLeftOpA=ReplaceDummies@(BarPartialLeftOpA-ManualCovariantDerivative[-Zz,PartialLeftOpDAz,IndexList[Zz,Zs],Zw]);
	BarVariationalRightOpA=ReplaceDummies@(BarPartialRightOpA-ManualCovariantDerivative[-Zz,PartialRightOpDAz,IndexList[Zz,Zs],Zw]);
	BarVariationalLeftOpBPi=ReplaceDummies@(BarPartialLeftOpBPi-ManualCovariantDerivative[-Zz,PartialLeftOpDBPiz,IndexList[Zz,-Zr],Zw]);
	BarVariationalRightOpBPi=ReplaceDummies@(BarPartialRightOpBPi-ManualCovariantDerivative[-Zz,PartialRightOpDBPiz,IndexList[Zz,-Zr],Zw]);
	BarVariationalLeftOpAPi=ReplaceDummies@(BarPartialLeftOpAPi-ManualCovariantDerivative[-Zz,PartialLeftOpDAPiz,IndexList[Zz,-Zs],Zw]);
	BarVariationalRightOpAPi=ReplaceDummies@(BarPartialRightOpAPi-ManualCovariantDerivative[-Zz,PartialRightOpDAPiz,IndexList[Zz,-Zs],Zw]);

	BarVariationalLeftOpTLambda=ReplaceDummies@(BarPartialLeftOpTLambda-ManualCovariantDerivative[-Zz,PartialLeftOpDTLambdaz,IndexList[Zz],Zw]);
	BarVariationalRightOpTLambda=ReplaceDummies@(BarPartialRightOpTLambda-ManualCovariantDerivative[-Zz,PartialRightOpDTLambdaz,IndexList[Zz],Zw]);
	BarVariationalLeftOpTLambdaPi=ReplaceDummies@(BarPartialLeftOpTLambdaPi-ManualCovariantDerivative[-Zz,PartialLeftOpDTLambdaPiz,IndexList[Zz],Zw]);
	BarVariationalRightOpTLambdaPi=ReplaceDummies@(BarPartialRightOpTLambdaPi-ManualCovariantDerivative[-Zz,PartialRightOpDTLambdaPiz,IndexList[Zz],Zw]);

	(*------------------------------------------------------------------------*)
	(*  Composing covariant coefficients of covariant differential operators  *)
	(*------------------------------------------------------------------------*)

	D0Term=BarPartialLeftOpB BarVariationalRightOpBPi+
	2BarPartialLeftOpA BarVariationalRightOpAPi+
	2BarPartialLeftOpTLambda BarVariationalRightOpTLambdaPi-
	BarPartialLeftOpBPi BarVariationalRightOpB-
	2BarPartialLeftOpAPi BarVariationalRightOpA-
	2BarPartialLeftOpTLambdaPi BarVariationalRightOpTLambda+
	ReplaceIndex[Evaluate[PartialLeftOpDBz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpBPi,IndexList[-Zr],Zu]+
	2ReplaceIndex[Evaluate[PartialLeftOpDAz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpAPi,IndexList[-Zs],Zu]+
	2ReplaceIndex[Evaluate[PartialLeftOpDTLambdaz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpTLambdaPi,IndexList[],Zu]-
	ReplaceIndex[Evaluate[PartialLeftOpDBPiz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpB,IndexList[Zr],Zu]-
	2ReplaceIndex[Evaluate[PartialLeftOpDAPiz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpA,IndexList[Zs],Zu]-
	2ReplaceIndex[Evaluate[PartialLeftOpDTLambdaPiz],Zz->Zt] ManualCovariantDerivative[-Zt,BarVariationalRightOpTLambda,IndexList[],Zu];

	D1Term=(-PartialLeftOpDBPiz BarVariationalRightOpB-
	2PartialLeftOpDAPiz BarVariationalRightOpA-
	2PartialLeftOpDTLambdaPiz BarVariationalRightOpTLambda+
	PartialLeftOpDBz BarVariationalRightOpBPi+
	2PartialLeftOpDAz BarVariationalRightOpAPi+
	2PartialLeftOpDTLambdaz BarVariationalRightOpTLambdaPi+
	BarPartialLeftOpBPi PartialRightOpDBz+
	2BarPartialLeftOpAPi PartialRightOpDAz+
	2BarPartialLeftOpTLambdaPi PartialRightOpDTLambdaz-
	BarPartialLeftOpB PartialRightOpDBPiz-
	2BarPartialLeftOpA PartialRightOpDAPiz-
	2BarPartialLeftOpTLambda PartialRightOpDTLambdaPiz+
	ReplaceIndex[Evaluate[PartialLeftOpDBPiz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDBz,IndexList[Zz,Zr],Zu]+
	2ReplaceIndex[Evaluate[PartialLeftOpDAPiz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDAz,IndexList[Zz,Zs],Zu]+
	2ReplaceIndex[Evaluate[PartialLeftOpDTLambdaPiz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDTLambdaz,IndexList[Zz],Zu]-
	ReplaceIndex[Evaluate[PartialLeftOpDBz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDBPiz,IndexList[Zz,-Zr],Zu]-
	2ReplaceIndex[Evaluate[PartialLeftOpDAz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDAPiz,IndexList[Zz,-Zs],Zu]-
	2ReplaceIndex[Evaluate[PartialLeftOpDTLambdaz],Zz->Zw] ManualCovariantDerivative[-Zw,PartialRightOpDTLambdaPiz,IndexList[Zz],Zu]);

	D2Term=PartialLeftOpDBz ReplaceIndex[Evaluate[PartialRightOpDBPiz],Zz->Zw]+
	2PartialLeftOpDAz ReplaceIndex[Evaluate[PartialRightOpDAPiz],Zz->Zw]+
	2PartialLeftOpDTLambdaz ReplaceIndex[Evaluate[PartialRightOpDTLambdaPiz],Zz->Zw]-
	PartialLeftOpDBPiz ReplaceIndex[Evaluate[PartialRightOpDBz],Zz->Zw]-
	2PartialLeftOpDAPiz ReplaceIndex[Evaluate[PartialRightOpDAz],Zz->Zw]-
	2PartialLeftOpDTLambdaPiz ReplaceIndex[Evaluate[PartialRightOpDTLambdaz],Zz->Zw];

	Expr={D0Term,D1Term,D2Term};
	Expr=Expr/.InertDerRev;
	Expr=Expr/.Derivative3;
	Expr=Expr/.GaugeField3;

	Expr=ToNesterForm[#,ToShell->OptionValue@ToShell,GToFoliGOption->OptionValue@GToFoliGOption]&/@Expr;

	NotebookDelete@PrintVariable;
Expr];
