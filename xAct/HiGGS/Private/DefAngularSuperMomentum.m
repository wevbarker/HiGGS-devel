Options[DefAngularSuperMomentum]={OrderOption->1,"ProtectSurface"->False};

DefAngularSuperMomentum[TheoryName_?StringQ,OptionsPattern[]]:=Module[{
	Theory,
	MainPart,
	GradPart,
	res},

	Theory=Evaluate@Symbol@TheoryName;

	(*a message*)
	xAct`xTensor`Private`MakeDefInfo[DefTheory,(Evaluate@(Theory@$Theory)),{"angular super-momentum for the theory",""}];
	MainPart=2V[k]PPara[-m,l]Antisymmetrize[BPi[-k,a]G3[-a,b]B[-l,-b],{-k,-l}];
	MainPart=MainPart/.PADMActivate;
	MainPart=ToNesterForm[MainPart,ToShell->True,Hard->True,OrderOption->OptionValue@OrderOption];
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;

	GradPart=V[k]PPara[-m,l]G3[-b,p](CD[-p][APiP[-k,-l,j]H[-j,b]])+V[k]PPara[-m,l]G3[-b,p](-2Antisymmetrize[A[i,-k,-p]APiP[-i,-l,j] PPara[-j,z]H[-z,b],{-k,-l}]);
	GradPart=GradPart/.PADMActivate;
	If[!OptionValue@"ProtectSurface",
	GradPart=ToNesterForm[GradPart,ToShell->True,Hard->True,OrderOption->OptionValue@OrderOption];
	];
	GradPart=MainPart+GradPart//ToNewCanonical;
	GradPart=GradPart//CollectTensors;

	xAct`HiGGS`Private`HiGGSPrint["** DefTheory: The 1- part of the angular super-momentum is:"];
	xAct`HiGGS`Private`HiGGSPrint[RotationalSuperMomentum1m[-m]," \[Congruent] ",GradPart," \[TildeTilde] 0"];

	MainPart=2PPara[-n,k]PPara[-m,l]Antisymmetrize[BPi[-k,a]G3[-a,b]B[-l,-b],{-k,-l}];
	MainPart=MainPart/.PADMActivate;
	MainPart=ToNesterForm[MainPart,ToShell->True,Hard->True,OrderOption->OptionValue@OrderOption];
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;

	GradPart=PPara[-n,k]PPara[-m,l]G3[-b,p](CD[-p][APiP[-k,-l,j]H[-j,b]])+PPara[-n,k]PPara[-m,l]G3[-b,p](-2Antisymmetrize[A[i,-k,-p]APiP[-i,-l,j] PPara[-j,z]H[-z,b],{-k,-l}]);
	GradPart=GradPart/.PADMActivate;
	If[!OptionValue@"ProtectSurface",
	GradPart=ToNesterForm[GradPart,ToShell->True,Hard->True,OrderOption->OptionValue@OrderOption];
	];
	GradPart=MainPart+GradPart//ToNewCanonical;
	GradPart=GradPart//CollectTensors;

	xAct`HiGGS`Private`HiGGSPrint["** DefTheory: The 1+ part of the angular super-momentum is:"];
	xAct`HiGGS`Private`HiGGSPrint[RotationalSuperMomentum1p[-n,-m]," \[Congruent] ",GradPart," \[TildeTilde] 0"];

	UpdateTheoryAssociation[TheoryName,$AngularSuperMomentum,GradPart];
];
