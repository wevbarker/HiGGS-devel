(* provides the PoissonBracket function *)

DefTensor[xAct`HiGGS`Private`CDBDummy[-a,-b,-c],M4];
DefTensor[xAct`HiGGS`Private`CDADummy[-a,-b,-c,-d],M4,Antisymmetric[{-b,-c}]];
DefTensor[xAct`HiGGS`Private`CDBPiDummy[-a,-b,-c],M4];
DefTensor[xAct`HiGGS`Private`CDAPiDummy[-a,-b,-c,-d],M4,Antisymmetric[{-b,-c}]];

xAct`HiGGS`Private`InertDerB=MakeRule[{CD[-a][B[-b,-c]],xAct`HiGGS`Private`CDBDummy[-a,-b,-c]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerA=MakeRule[{CD[-a][A[-b,-c,-d]],xAct`HiGGS`Private`CDADummy[-a,-b,-c,-d]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerBP=MakeRule[{CD[-a][BPi[-b,-c]],xAct`HiGGS`Private`CDBPiDummy[-a,-b,-c]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerAP=MakeRule[{CD[-a][APi[-b,-c,-d]],xAct`HiGGS`Private`CDAPiDummy[-a,-b,-c,-d]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDer=Join[xAct`HiGGS`Private`InertDerB,xAct`HiGGS`Private`InertDerA,xAct`HiGGS`Private`InertDerBP,xAct`HiGGS`Private`InertDerAP];
xAct`HiGGS`Private`InertDerRevB=MakeRule[{xAct`HiGGS`Private`CDBDummy[-a,-b,-c],CD[-a][B[-b,-c]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerRevA=MakeRule[{xAct`HiGGS`Private`CDADummy[-a,-b,-c,-d],CD[-a][A[-b,-c,-d]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerRevBP=MakeRule[{xAct`HiGGS`Private`CDBPiDummy[-a,-b,-c],CD[-a][BPi[-b,-c]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerRevAP=MakeRule[{xAct`HiGGS`Private`CDAPiDummy[-a,-b,-c,-d],CD[-a][APi[-b,-c,-d]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`InertDerRev=Join[xAct`HiGGS`Private`InertDerRevB,xAct`HiGGS`Private`InertDerRevA,xAct`HiGGS`Private`InertDerRevBP,xAct`HiGGS`Private`InertDerRevAP];

xAct`HiGGS`Private`Derivative3B=MakeRule[{CD[-a][B[b,-c]],G3[-a,d]CD[-d][B[b,-c]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`Derivative3A=MakeRule[{CD[-a][A[b,e,-c]],G3[-a,d]CD[-d][A[b,e,-c]]},MetricOn->All,ContractMetrics->True];
xAct`HiGGS`Private`Derivative3=Join[xAct`HiGGS`Private`Derivative3B,xAct`HiGGS`Private`Derivative3A];

PoissonBracketParallel[LeftOperand_,RightOperand_,Theory_String,options___]:=Module[{Result},

	(*$Timing=True;*)
	BuildHiGGS[];
	Quiet@ToExpression["<<"<>FileNameJoin@{$WorkingDirectory,"svy","node-"<>$Node,"peta4.nom.mx"}<>";"];
	DefTheory["Import"->Theory];
	Result=PoissonBracket[LeftOperand,RightOperand,options];
	ForceTiming[];

Result];

DistributeDefinitions@PoissonBracketParallel;


Options[PoissonBracket]={
	xTensorCovD->False,
	"ToShell"->True,
	"Hard"->False,
	"Surficial"->False,
	"Order"->Infinity,
	"GToFoliG"->True,
	"PreTruncate"->False,
	"NesterForm"->True,
	"PrintAnswer"->True,
	"Parallel"->False};

PoissonBracket[LeftOperand_,RightOperand_,OptionsPattern[]]:="PoissonBracket"~TimeWrapper~Catch@Module[{
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

(*distributed defs seem not to be working for split def*)
If[OptionValue["Parallel"],
	(*Build the HiGGS environment*)
	(*$Timing=True;*)
	BuildHiGGS[];
	(*import theory names*)
	Quiet@ToExpression["<<"<>FileNameJoin@{$WorkingDirectory,"svy","node-"<>$Node,"peta4.nom.mx"}<>";"];
	(*Define the theory*)
	DefTheory["Import"->$TheoryName];
];
	PrintVariable={};
	PrintVariable=PrintVariable~Append~PrintTemporary[" ** PoissonBracket ",{LeftOperand,RightOperand}," with options ",Options[PoissonBracket],"..."];
		
	LeftOp=ToBasicForm[LeftOperand,"Hard"->True];
	LeftOp//=NoScalar;
	If[OptionValue["PreTruncate"],LeftOp=ToOrderCanonical[LeftOp,1]];
	RightOp=ToBasicForm[RightOperand,"Hard"->True];
	RightOp//=NoScalar;
	If[OptionValue["PreTruncate"],RightOp=ToOrderCanonical[RightOp,1]];

	PrintVariable=PrintVariable~Append~PrintTemporary[" ** PoissonBracket: BasicForm to be evaluated is:"];
	PrintVariable=PrintVariable~Append~PrintTemporary[{LeftOp,RightOp}];

	LeftOpDummy=ReplaceDummies[LeftOp];
	RightOpDummy=ReplaceDummies[RightOp];
	LeftOpDummy=LeftOpDummy/.xAct`HiGGS`Private`Derivative3;
	RightOpDummy=RightOpDummy/.xAct`HiGGS`Private`Derivative3;
	LeftOpDummyInert=LeftOpDummy/.xAct`HiGGS`Private`InertDer;
	LeftOpDummyInert//=NoScalar;
	RightOpDummyInert=RightOpDummy/.xAct`HiGGS`Private`InertDer;
	RightOpDummyInert//=NoScalar;

	VariationalLeftOpB=
		NewVarAction[LeftOpDummy,B[q,-r]]
		+DVDB[-x,-q,r]NewVarAction[LeftOpDummy,V[-x]]
		+DHDB[-x,y,-q,r]NewVarAction[LeftOpDummy,H[-x,y]]
		+DJDB[-q,r]NewVarAction[LeftOpDummy,J[]]
		+DLapseDB[-q,r]NewVarAction[LeftOpDummy,Lapse[]]
		+DJiDB[-q,r]NewVarAction[LeftOpDummy,Ji[]];
	VariationalRightOpB=
		NewVarAction[RightOpDummy,B[q,-r]]
		+DVDB[-x,-q,r]NewVarAction[RightOpDummy,V[-x]]
		+DHDB[-x,y,-q,r]NewVarAction[RightOpDummy,H[-x,y]]
		+DJDB[-q,r]NewVarAction[RightOpDummy,J[]]
		+DLapseDB[-q,r]NewVarAction[RightOpDummy,Lapse[]]
		+DJiDB[-q,r]NewVarAction[RightOpDummy,Ji[]];
	VariationalLeftOpA=NewVarAction[LeftOpDummy,A[q,r,-s]];
	VariationalRightOpA=NewVarAction[RightOpDummy,A[q,r,-s]];
	VariationalLeftOpBPi=NewVarAction[LeftOpDummy,BPi[-q,r]];
	VariationalRightOpBPi=NewVarAction[RightOpDummy,BPi[-q,r]];
	VariationalLeftOpAPi=NewVarAction[LeftOpDummy,APi[-q,-r,s]];
	VariationalRightOpAPi=NewVarAction[RightOpDummy,APi[-q,-r,s]];

	PartialLeftOpB=
		NewVarAction[LeftOpDummyInert,B[q,-r]]
		+DVDB[-x,-q,r]NewVarAction[LeftOpDummyInert,V[-x]]
		+DHDB[-x,y,-q,r]NewVarAction[LeftOpDummyInert,H[-x,y]]
		+DJDB[-q,r]NewVarAction[LeftOpDummyInert,J[]]
		+DLapseDB[-q,r]NewVarAction[LeftOpDummyInert,Lapse[]]
		+DJiDB[-q,r]NewVarAction[LeftOpDummyInert,Ji[]];
	PartialRightOpB=
		NewVarAction[RightOpDummyInert,B[q,-r]]
		+DVDB[-x,-q,r]NewVarAction[RightOpDummyInert,V[-x]]
		+DHDB[-x,y,-q,r]NewVarAction[RightOpDummyInert,H[-x,y]]
		+DJDB[-q,r]NewVarAction[RightOpDummyInert,J[]]
		+DLapseDB[-q,r]NewVarAction[RightOpDummyInert,Lapse[]]
		+DJiDB[-q,r]NewVarAction[RightOpDummyInert,Ji[]];
	PartialLeftOpA=NewVarAction[LeftOpDummyInert,A[q,r,-s]];
	PartialRightOpA=NewVarAction[RightOpDummyInert,A[q,r,-s]];
	PartialLeftOpBPi=NewVarAction[LeftOpDummyInert,BPi[-q,r]];
	PartialRightOpBPi=NewVarAction[RightOpDummyInert,BPi[-q,r]];
	PartialLeftOpAPi=NewVarAction[LeftOpDummyInert,APi[-q,-r,s]];
	PartialRightOpAPi=NewVarAction[RightOpDummyInert,APi[-q,-r,s]];
	PartialLeftOpDBz=NewVarAction[LeftOpDummyInert,xAct`HiGGS`Private`CDBDummy[-z,q,-r]];
	PartialRightOpDBz=NewVarAction[RightOpDummyInert,xAct`HiGGS`Private`CDBDummy[-z,q,-r]];
	PartialLeftOpDAz=NewVarAction[LeftOpDummyInert,xAct`HiGGS`Private`CDADummy[-z,q,r,-s]];
	PartialRightOpDAz=NewVarAction[RightOpDummyInert,xAct`HiGGS`Private`CDADummy[-z,q,r,-s]];
	PartialLeftOpDBPiz=NewVarAction[LeftOpDummyInert,xAct`HiGGS`Private`CDBPiDummy[-z,-q,r]];
	PartialRightOpDBPiz=NewVarAction[RightOpDummyInert,xAct`HiGGS`Private`CDBPiDummy[-z,-q,r]];
	PartialLeftOpDAPiz=NewVarAction[LeftOpDummyInert,xAct`HiGGS`Private`CDAPiDummy[-z,-q,-r,s]];
	PartialRightOpDAPiz=NewVarAction[RightOpDummyInert,xAct`HiGGS`Private`CDAPiDummy[-z,-q,-r,s]];
	PartialLeftOpDBv=NewVarAction[LeftOpDummyInert,xAct`HiGGS`Private`CDBDummy[-v,q,-r]];
	PartialRightOpDBv=NewVarAction[RightOpDummyInert,xAct`HiGGS`Private`CDBDummy[-v,q,-r]];
	PartialLeftOpDAv=NewVarAction[LeftOpDummyInert,xAct`HiGGS`Private`CDADummy[-v,q,r,-s]];
	PartialRightOpDAv=NewVarAction[RightOpDummyInert,xAct`HiGGS`Private`CDADummy[-v,q,r,-s]];
	PartialLeftOpDBPiv=NewVarAction[LeftOpDummyInert,xAct`HiGGS`Private`CDBPiDummy[-v,-q,r]];
	PartialRightOpDBPiv=NewVarAction[RightOpDummyInert,xAct`HiGGS`Private`CDBPiDummy[-v,-q,r]];
	PartialLeftOpDAPiv=NewVarAction[LeftOpDummyInert,xAct`HiGGS`Private`CDAPiDummy[-v,-q,-r,s]];
	PartialRightOpDAPiv=NewVarAction[RightOpDummyInert,xAct`HiGGS`Private`CDAPiDummy[-v,-q,-r,s]];

	If[OptionValue["Surficial"],
		{
			PrintVariable2={};
			PrintVariable2=PrintVariable2~Append~PrintTemporary[" ** PoissonBracket: Finding barred derivatives..."];

			BarPartialLeftOpB=ReplaceDummies@(PartialLeftOpB-ReplaceIndex[Evaluate[PartialLeftOpDBz],-q->-w] A[w,-q,-z]);
			BarPartialRightOpB=ReplaceDummies@(PartialRightOpB-ReplaceIndex[Evaluate[PartialRightOpDBz],-q->-w] A[w,-q,-z]);
			BarPartialLeftOpA=ReplaceDummies@(PartialLeftOpA-ReplaceIndex[Evaluate[PartialLeftOpDAz],-q->-w] A[w,-q,-z]-ReplaceIndex[Evaluate[PartialLeftOpDAz],-r->-w] A[w,-r,-z]);
			BarPartialRightOpA=ReplaceDummies@(PartialRightOpA-ReplaceIndex[Evaluate[PartialRightOpDAz],-q->-w] A[w,-q,-z]-ReplaceIndex[Evaluate[PartialRightOpDAz],-r->-w] A[w,-r,-z]);
			BarPartialLeftOpBPi=ReplaceDummies@(PartialLeftOpBPi+ReplaceIndex[Evaluate[PartialLeftOpDBPiz],q->w] A[q,-w,-z]);
			BarPartialRightOpBPi=ReplaceDummies@(PartialRightOpBPi+ReplaceIndex[Evaluate[PartialRightOpDBPiz],q->w] A[q,-w,-z]);
			BarPartialLeftOpAPi=ReplaceDummies@(PartialLeftOpAPi+ReplaceIndex[Evaluate[PartialLeftOpDAPiz],q->w] A[q,-w,-z]+ReplaceIndex[Evaluate[PartialLeftOpDAPiz],r->w] A[r,-w,-z]);
			BarPartialRightOpAPi=ReplaceDummies@(PartialRightOpAPi+ReplaceIndex[Evaluate[PartialRightOpDAPiz],q->w] A[q,-w,-z]+ReplaceIndex[Evaluate[PartialRightOpDAPiz],r->w] A[r,-w,-z]);
			BarVariationalLeftOpB=ReplaceDummies@(BarPartialLeftOpB-xAct`HiGGS`Private`ManualCovariantDerivative[-z,PartialLeftOpDBz,IndexList[z,r],w]);
			BarVariationalRightOpB=ReplaceDummies@(BarPartialRightOpB-xAct`HiGGS`Private`ManualCovariantDerivative[-z,PartialRightOpDBz,IndexList[z,r],w]);
			BarVariationalLeftOpA=ReplaceDummies@(BarPartialLeftOpA-xAct`HiGGS`Private`ManualCovariantDerivative[-z,PartialLeftOpDAz,IndexList[z,s],w]);
			BarVariationalRightOpA=ReplaceDummies@(BarPartialRightOpA-xAct`HiGGS`Private`ManualCovariantDerivative[-z,PartialRightOpDAz,IndexList[z,s],w]);
			BarVariationalLeftOpBPi=ReplaceDummies@(BarPartialLeftOpBPi-xAct`HiGGS`Private`ManualCovariantDerivative[-z,PartialLeftOpDBPiz,IndexList[z,-r],w]);
			BarVariationalRightOpBPi=ReplaceDummies@(BarPartialRightOpBPi-xAct`HiGGS`Private`ManualCovariantDerivative[-z,PartialRightOpDBPiz,IndexList[z,-r],w]);
			BarVariationalLeftOpAPi=ReplaceDummies@(BarPartialLeftOpAPi-xAct`HiGGS`Private`ManualCovariantDerivative[-z,PartialLeftOpDAPiz,IndexList[z,-s],w]);
			BarVariationalRightOpAPi=ReplaceDummies@(BarPartialRightOpAPi-xAct`HiGGS`Private`ManualCovariantDerivative[-z,PartialRightOpDAPiz,IndexList[z,-s],w]);

			PrintVariable2=PrintVariable2~Append~PrintTemporary[" ** PoissonBracket: Finding kernel coefficients..."];

			D0Term=BarPartialLeftOpB BarVariationalRightOpBPi+
			2BarPartialLeftOpA BarVariationalRightOpAPi-
			BarPartialLeftOpBPi BarVariationalRightOpB-
			2BarPartialLeftOpAPi BarVariationalRightOpA+
			ReplaceIndex[Evaluate[PartialLeftOpDBz],z->t] xAct`HiGGS`Private`ManualCovariantDerivative[-t,BarVariationalRightOpBPi,IndexList[-r],u]+
			2ReplaceIndex[Evaluate[PartialLeftOpDAz],z->t]xAct`HiGGS`Private`ManualCovariantDerivative[-t,BarVariationalRightOpAPi,IndexList[-s],u]-
			ReplaceIndex[Evaluate[PartialLeftOpDBPiz],z->t] xAct`HiGGS`Private`ManualCovariantDerivative[-t,BarVariationalRightOpB,IndexList[r],u]-
			2ReplaceIndex[Evaluate[PartialLeftOpDAPiz],z->t] xAct`HiGGS`Private`ManualCovariantDerivative[-t,BarVariationalRightOpA,IndexList[s],u];

			D1Term=(-PartialLeftOpDBPiz BarVariationalRightOpB-
			2PartialLeftOpDAPiz BarVariationalRightOpA+
			PartialLeftOpDBz BarVariationalRightOpBPi+
			2PartialLeftOpDAz BarVariationalRightOpAPi+
			BarPartialLeftOpBPi PartialRightOpDBz+
			2BarPartialLeftOpAPi PartialRightOpDAz-
			BarPartialLeftOpB PartialRightOpDBPiz-
			2BarPartialLeftOpA PartialRightOpDAPiz+
			ReplaceIndex[Evaluate[PartialLeftOpDBPiz],z->w] xAct`HiGGS`Private`ManualCovariantDerivative[-w,PartialRightOpDBz,IndexList[z,r],u]+
			2ReplaceIndex[Evaluate[PartialLeftOpDAPiz],z->w] xAct`HiGGS`Private`ManualCovariantDerivative[-w,PartialRightOpDAz,IndexList[z,s],u]-
			ReplaceIndex[Evaluate[PartialLeftOpDBz],z->w] xAct`HiGGS`Private`ManualCovariantDerivative[-w,PartialRightOpDBPiz,IndexList[z,-r],u]-
			2ReplaceIndex[Evaluate[PartialLeftOpDAz],z->w] xAct`HiGGS`Private`ManualCovariantDerivative[-w,PartialRightOpDAPiz,IndexList[z,-s],u]);

			D2Term=PartialLeftOpDBz ReplaceIndex[Evaluate[PartialRightOpDBPiz],z->w]+
			2PartialLeftOpDAz ReplaceIndex[Evaluate[PartialRightOpDAPiz],z->w]-
			PartialLeftOpDBPiz ReplaceIndex[Evaluate[PartialRightOpDBz],z->w]-
			2PartialLeftOpDAPiz ReplaceIndex[Evaluate[PartialRightOpDAz],z->w];

			Expr={D0Term,D1Term,D2Term};
			Expr=Expr/.xAct`HiGGS`Private`InertDerRev;
			Expr=Expr/.xAct`HiGGS`Private`Derivative3;

			NotebookDelete[PrintVariable2];



			If[OptionValue["NesterForm"],
			Expr=ToNesterForm[#,
				"ToShell"->OptionValue["ToShell"],
				"Hard"->OptionValue["Hard"],
				"Order"->OptionValue["Order"],
				"GToFoliG"->OptionValue["GToFoliG"],
				xTensorCovD->OptionValue@xTensorCovD]&/@Expr;
			];
			Expr=CollectTensors/@Expr;
		},	
		{
			PrintVariable3={};
			PrintVariable3=PrintVariable3~Append~PrintTemporary[" ** PoissonBracket: Finding (old) kernel coefficients..."];

			DeltaDelta=VariationalLeftOpB VariationalRightOpBPi+2VariationalLeftOpA VariationalRightOpAPi-VariationalLeftOpBPi VariationalRightOpB-2VariationalLeftOpAPi VariationalRightOpA;

			DDeltaDelta=-PartialLeftOpDBv VariationalRightOpBPi-2PartialLeftOpDAv VariationalRightOpAPi+PartialLeftOpDBPiv VariationalRightOpB +2PartialLeftOpDAPiv VariationalRightOpA;

			DeltaDDelta=-VariationalLeftOpB PartialRightOpDBPiv-2VariationalLeftOpA PartialRightOpDAPiv+VariationalLeftOpBPi PartialRightOpDBv +2VariationalLeftOpAPi PartialRightOpDAv;

			DDeltaDDelta=PartialLeftOpDBz PartialRightOpDBPiv +2PartialLeftOpDAz PartialRightOpDAPiv-PartialLeftOpDBPiz PartialRightOpDBv-2PartialLeftOpDAPiz PartialRightOpDAv;

			Expr={DeltaDelta,DDeltaDelta,DeltaDDelta,DDeltaDDelta};
			Expr=Expr/.xAct`HiGGS`Private`InertDerRev;
			Expr=Expr/.xAct`HiGGS`Private`Derivative3;

			NotebookDelete[PrintVariable3];

			If[OptionValue["NesterForm"],
				Expr=ToNesterForm[#,
					"ToShell"->OptionValue["ToShell"],
					"Hard"->OptionValue["Hard"],
					"Order"->OptionValue["Order"],
					"GToFoliG"->OptionValue["GToFoliG"],
					xTensorCovD->OptionValue@xTensorCovD]&/@Expr,
				Expr=ToBasicForm[Expr,"Hard"->OptionValue["Hard"],"Order"->OptionValue["Order"]]];
			Expr=CollectTensors/@Expr;
		}];

	NotebookDelete[PrintVariable];

	If[OptionValue["PrintAnswer"],
		xAct`HiGGS`Private`PrintPoissonBracket[{LeftOperand,RightOperand},Expr,ToShell->OptionValue["ToShell"]];
	];
Expr];

ClearBuild[];
