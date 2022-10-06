Options[DefLinearSuperMomentum]={OrderOption->1,"ProtectSurface"->False};

DefLinearSuperMomentum[TheoryName_?StringQ,OptionsPattern[]]:=Module[{
	Theory,
	MainPart,
	GradPart,
	res},

	Theory=Evaluate@Symbol@TheoryName;

	(*a message*)
	xAct`xTensor`Private`MakeDefInfo[DefTheory,(Evaluate@(Theory@$Theory)),{"linear super-momentum for the theory",""}];
	MainPart=BPiP[-i,r]PPara[-r,p]PPara[-l,q]T[i,-q,-p]+(1/2)APiP[-i,-j,r]PPara[-r,p]PPara[-l,q]R[i,j,-q,-p];
	MainPart=MainPart/.PADMActivate;
	MainPart=ToNesterForm[MainPart,ToShell->True,Hard->True,OrderOption->OptionValue@OrderOption];
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;

	GradPart=-PPara[-l,k]G3[-b,n](CD[-n][BPiP[-k,j]H[-j,b]]+A[i,-k,-n]BPiP[-i,j]PPara[-j,m]H[-m,b]);
	GradPart=GradPart/.PADMActivate;
	If[!OptionValue@"ProtectSurface",
	GradPart=ToNesterForm[GradPart,ToShell->True,Hard->True,OrderOption->OptionValue@OrderOption];
	];
	GradPart=MainPart+GradPart//ToNewCanonical;
	GradPart=GradPart//CollectTensors;

	xAct`HiGGS`Private`HiGGSPrint["** DefTheory: The linear super-momentum is:"];
	xAct`HiGGS`Private`HiGGSPrint[LinearSuperMomentum1m[-l]," \[Congruent] ",GradPart," \[TildeTilde] 0"];

	UpdateTheoryAssociation[TheoryName,$LinearSuperMomentum,GradPart];
];
