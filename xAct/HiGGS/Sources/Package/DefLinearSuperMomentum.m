(*==========================*)
(*  DefLinearSuperMomentum  *)
(*==========================*)

DefLinearSuperMomentum[TheoryName_?StringQ,OptionsPattern[]]:=Module[{
	Theory,
	MainPart,
	GradPart,
	res},

	Theory=Evaluate@Symbol@TheoryName;

	MainPart=BPiP[-i,r]PPara[-r,p]PPara[-l,q]T[i,-q,-p]+(1/2)APiP[-i,-j,r]PPara[-r,p]PPara[-l,q]R[i,j,-q,-p];
	MainPart=ToBasicForm[MainPart,ToShell->False];
	MainPart=ToNesterForm[MainPart,ToShell->False,Hard->True];
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;

	GradPart=-PPara[-l,k]G3[-b,n](CD[-n][BPiP[-k,j]H[-j,b]]-A[i,-k,-n]BPiP[-i,j]PPara[-j,m]H[-m,b]);
	GradPart=ToBasicForm[GradPart,ToShell->False];
	GradPart=ToNesterForm[GradPart,ToShell->False,Hard->True];
	GradPart=GradPart//ToNewCanonical;

	GradPart=MainPart+GradPart//ToNewCanonical;

	GradPart=GradPart//CollectTensors;

	Print["** DefTheory: The linear super-momentum is:"];
	Print[LinearSuperMomentum1m[-l]," \[Congruent] ",GradPart," \[TildeTilde] 0"];

	UpdateTheoryAssociation[TheoryName,$LinearSuperMomentum,GradPart,Advertise->True];
];
