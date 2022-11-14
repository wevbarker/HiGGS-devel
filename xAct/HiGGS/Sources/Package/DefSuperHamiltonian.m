(*=======================*)
(*  DefSuperHamiltonian  *)
(*=======================*)

DefSuperHamiltonian[TheoryName_?StringQ,OptionsPattern[]]:=Module[{
	Theory,
	MainPart,
	GradPart,
	res},

	Theory=Evaluate@Symbol@TheoryName;


	MainPart=J[]((1/16)(cPerpB0p (1/BetPerpPerp0p) ShellOrigB0p PhiB0p[]PhiB0p[]+
	cPerpB1p (1/BetPerpPerp1p) ShellOrigB1p  PhiB1p[-a,-b]PhiB1p[a,b]+
	cPerpB1m (1/BetPerpPerp1m) ShellOrigB1m  PhiB1m[-a]PhiB1m[a]+
	cPerpB2p (1/BetPerpPerp2p) ShellOrigB2p  PhiB2p[-a,-b]PhiB2p[a,b]+
	(1/4)(cPerpA0p (1/AlpPerpPerp0p) ShellOrigA0p  PhiA0p[]PhiA0p[]+
	cPerpA0m (1/AlpPerpPerp0m) ShellOrigA0m  PhiA0m[]PhiA0m[]+
	cPerpA1p (1/AlpPerpPerp1p) ShellOrigA1p  PhiA1p[-a,-b]PhiA1p[a,b]+
	cPerpA1m (1/AlpPerpPerp1m) ShellOrigA1m  PhiA1m[-a]PhiA1m[a]+
	cPerpA2p (1/AlpPerpPerp2p) ShellOrigA2p  PhiA2p[-a,-b]PhiA2p[a,b]+
	cPerpA2m (1/AlpPerpPerp2m) ShellOrigA2m  PhiA2m[-a,-b,-c]PhiA2m[a,b,c])))-
	(J[]T[i,-m,-n]PPara[m,g]PPara[n,h](Bet1 PT1[-i,-g,-h,a,c,d]+
	Bet2 PT2[-i,-g,-h,a,c,d]+
	Bet3 PT3[-i,-g,-h,a,c,d])PPara[-c,e]PPara[-d,f]T[-a,-e,-f]+
	J[]TLambda[i,g,h](cBet1 PT1[-i,-g,-h,a,c,d]+
	cBet2 PT2[-i,-g,-h,a,c,d]+
	cBet3 PT3[-i,-g,-h,a,c,d])PPara[-c,p]PPara[-d,q]T[-a,-p,-q]+
	J[](R[i,j,-m,-n]PPara[m,g]PPara[n,h](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+
	Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+
	Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+
	Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+
	Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+
	Alp6 PR6[-i,-j,-g,-h,a,b,c,d])-(1/2)Alp0 PPara[a,c]PPara[b,d])PPara[-c,e]PPara[-d,f]R[-a,-b,-e,-f]+
	RLambda[i,j,g,h](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+
	cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+
	cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+
	cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+
	cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+
	cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,p]PPara[-d,q]R[-a,-b,-p,-q]);

	MainPart=MainPart/.TocPerp;
	MainPart=MainPart/.ToAlp;
	MainPart=MainPart/.ToBet;
	MainPart=MainPart/.PActivate;
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart/.PADMActivate;
	(*Remember to enforce zeros above zeros in advance*)
	MainPart=MainPart/.(Evaluate@(Theory@$ToShellFreedoms));
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;
	MainPart=MainPart/.(Evaluate@(Theory@$ToTheory));
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;
	MainPart=MainPart//NoScalar;
	MainPart=MainPart/.(Evaluate@(Theory@$IfConstraintToTheoryNesterForm));
	MainPart=ToNesterForm[MainPart,ToShell->TheoryName,Hard->True];
	MainPart=MainPart//ToNewCanonical;
	MainPart=MainPart//CollectTensors;






	GradPart=-V[k]G3[-b,n](CD[-n][BPiP[-k,j]H[-j,b]]-A[i,-k,-n]BPiP[-i,j]PPara[-j,m]H[-m,b]);

	GradPart=ToBasicForm[GradPart,ToShell->False];
	GradPart=ToNesterForm[GradPart,ToShell->False,Hard->True];

	GradPart=MainPart+GradPart//ToNewCanonical;
	GradPart=GradPart//CollectTensors;
	Print["** DefTheory: The super-Hamiltonian is:"];
	Print[SuperHamiltonian0p[]," \[Congruent] ",GradPart," \[TildeTilde] 0"];

	UpdateTheoryAssociation[TheoryName,$SuperHamiltonian,GradPart,Advertise->True];
];
