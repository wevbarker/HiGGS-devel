(*===========================*)
(*  DefAngularSuperMomentum  *)
(*===========================*)

DefAngularSuperMomentum[TheoryName_?StringQ,OptionsPattern[]]:=Module[{
	Theory,
	MainPart,
	GradPart,
	res},

	Theory=Evaluate@Symbol@TheoryName;

	MainPart=2V[k]PPara[-m,l]Antisymmetrize[BPi[-k,a]G3[-a,b]B[-l,-b],{-k,-l}];
	MainPart=ToBasicForm[MainPart,ToShell->False];
	MainPart=ToNesterForm[MainPart,ToShell->False,Hard->True];
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;

	GradPart=V[k]PPara[-m,l]G3[-b,p](CD[-p][APiP[-k,-l,j]H[-j,b]])+V[k]PPara[-m,l]G3[-b,p](-2Antisymmetrize[A[i,-k,-p]APiP[-i,-l,j] PPara[-j,z]H[-z,b],{-k,-l}]);
	GradPart=ToBasicForm[GradPart,ToShell->False];
	GradPart=ToNesterForm[GradPart,ToShell->False,Hard->True];
	GradPart=MainPart+GradPart//ToNewCanonical;
	GradPart=GradPart//CollectTensors;

	Print["** DefTheory: The 1- part of the angular super-momentum is:"];
	Print[RotationalSuperMomentum1m[-m]," \[Congruent] ",GradPart," \[TildeTilde] 0"];

	UpdateTheoryAssociation[TheoryName,$AngularSuperMomentum1m,GradPart];

	MainPart=2PPara[-n,k]PPara[-m,l]Antisymmetrize[BPi[-k,a]G3[-a,b]B[-l,-b],{-k,-l}];
	MainPart=ToBasicForm[MainPart,ToShell->False];
	MainPart=ToNesterForm[MainPart,ToShell->False,Hard->True];
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;

	GradPart=PPara[-n,k]PPara[-m,l]G3[-b,p](CD[-p][APiP[-k,-l,j]H[-j,b]])+PPara[-n,k]PPara[-m,l]G3[-b,p](-2Antisymmetrize[A[i,-k,-p]APiP[-i,-l,j] PPara[-j,z]H[-z,b],{-k,-l}]);
	GradPart=ToBasicForm[GradPart,ToShell->False];
	GradPart=ToNesterForm[GradPart,ToShell->False,Hard->True];
	GradPart=MainPart+GradPart//ToNewCanonical;
	GradPart=GradPart//CollectTensors;

	Print["** DefTheory: The 1+ part of the angular super-momentum is:"];
	Print[RotationalSuperMomentum1p[-n,-m]," \[Congruent] ",GradPart," \[TildeTilde] 0"];

	UpdateTheoryAssociation[TheoryName,$AngularSuperMomentum1p,GradPart,Advertise->True];
];
