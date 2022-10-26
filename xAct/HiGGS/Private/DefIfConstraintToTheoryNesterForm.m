(*=====================================*)
(*  DefIfConstraintToTheoryNesterForm  *)
(*=====================================*)

DefIfConstraintToTheoryNesterForm[TheoryName_?StringQ]:=Module[{
	Theory,
	$IfConstraintsValue,
	Phis,
	ChiPerps,
	ChiParas,
	ChiSings},

	Theory=Evaluate@Symbol@TheoryName;

	UpdateTheoryAssociation[TheoryName,$IfConstraintToTheoryNesterForm,{}];

	$IfConstraintsValue={};
	Phis=DeleteCases[Evaluate[{(1-ShellOrigB0p)PhiB0p[],(1-ShellOrigB1p)PhiB1p[-i,-j],(1-ShellOrigB1m)PhiB1m[-i],(1-ShellOrigB2p)PhiB2p[-i,-j],(1-ShellOrigA0p)PhiA0p[],(1-ShellOrigA0m)PhiA0m[],(1-ShellOrigA1p)PhiA1p[-i,-j],(1-ShellOrigA1m)PhiA1m[-i],(1-ShellOrigA2p)PhiA2p[-i,-j],(1-ShellOrigA2m)PhiA2m[-i,-j,-k]}/.(Evaluate@(Theory@$ToShellFreedoms))],0,Infinity];
	$IfConstraintsValue=$IfConstraintsValue~Join~Phis;
	Phis=({#,ImposeTheory[#,TheoryName]})&/@Phis;
	Print["** DefTheory: Found the following primary if-constraints:"];
	(Print[#[[1]]," \[Congruent] ",#[[2]]," \[TildeTilde] 0"])&/@Phis;
	Phis=DeleteCases[Evaluate[{(ShellOrigB0p)PhiB0p[],(ShellOrigB1p)PhiB1p[-i,-j],(ShellOrigB1m)PhiB1m[-i],(ShellOrigB2p)PhiB2p[-i,-j],(ShellOrigA0p)PhiA0p[],(ShellOrigA0m)PhiA0m[],(ShellOrigA1p)PhiA1p[-i,-j],(ShellOrigA1m)PhiA1m[-i],(ShellOrigA2p)PhiA2p[-i,-j],(ShellOrigA2m)PhiA2m[-i,-j,-k]}/.(Evaluate@(Theory@$ToShellFreedoms))],0,Infinity];
	Phis=({#,ImposeTheory[#,TheoryName]})&/@Phis;
	ChiPerps=DeleteCases[Evaluate[{(1-ShellPerpB0p)ChiPerpB0p[],(1-ShellPerpB1p)ChiPerpB1p[-i,-j],(1-ShellPerpB1m)ChiPerpB1m[-i],(1-ShellPerpB2p)ChiPerpB2p[-i,-j],(1-ShellPerpA0p)ChiPerpA0p[],(1-ShellPerpA0m)ChiPerpA0m[],(1-ShellPerpA1p)ChiPerpA1p[-i,-j],(1-ShellPerpA1m)ChiPerpA1m[-i],(1-ShellPerpA2p)ChiPerpA2p[-i,-j],(1-ShellPerpA2m)ChiPerpA2m[-i,-j,-k]}/.(Evaluate@(Theory@$ToShellFreedoms))],0,Infinity];
	$IfConstraintsValue=$IfConstraintsValue~Join~ChiPerps;
	ChiPerps=({#,ImposeTheory[#,TheoryName]})&/@ChiPerps;
	Print["** DefTheory: Found the following secondary perpendicular if-constraints:"];
	(Print[#[[1]]," \[Congruent] ",#[[2]]," \[TildeTilde] 0"])&/@ChiPerps;
	ChiParas=DeleteCases[Evaluate[{(1-ShellParaB0m)ChiParaB0m[],(1-ShellParaB1p)ChiParaB1p[-i,-j],(1-ShellParaB1m)ChiParaB1m[-i],(1-ShellParaB2m)ChiParaB2m[-i,-j,-k],(1-ShellParaA0p)ChiParaA0p[],(1-ShellParaA0m)ChiParaA0m[],(1-ShellParaA1p)ChiParaA1p[-i,-j],(1-ShellParaA1m)ChiParaA1m[-i],(1-ShellParaA2p)ChiParaA2p[-i,-j],(1-ShellParaA2m)ChiParaA2m[-i,-j,-k]}/.(Evaluate@(Theory@$ToShellFreedoms))],0,Infinity];
	$IfConstraintsValue=$IfConstraintsValue~Join~ChiParas;
	ChiParas=({#,ImposeTheory[#,TheoryName]})&/@ChiParas;
	Print["** DefTheory: Found the following secondary parallel if-constraints:"];
	(Print[#[[1]]," \[Congruent] ",#[[2]]," \[TildeTilde] 0"])&/@ChiParas;
	ChiSings=DeleteCases[Evaluate[{(1-ShellSingB1p)ChiSingB1p[-i,-j],(1-ShellSingB1m)ChiSingB1m[-i],(1-ShellSingA0p)ChiSingA0p[],(1-ShellSingA0m)ChiSingA0m[],(1-ShellSingA1p)ChiSingA1p[-i,-j],(1-ShellSingA1m)ChiSingA1m[-i],(1-ShellSingA2p)ChiSingA2p[-i,-j],(1-ShellSingA2m)ChiSingA2m[-i,-j,-k]}/.(Evaluate@(Theory@$ToShellFreedoms))],0,Infinity];
	$IfConstraintsValue=$IfConstraintsValue~Join~ChiSings;
	ChiSings=({#,ImposeTheory[#,TheoryName]})&/@ChiSings;
	Print["** DefTheory: Found the following secondary singular if-constraints:"];
	(Print[#[[1]]," \[Congruent] ",#[[2]]," \[TildeTilde] 0"])&/@ChiSings;

	UpdateTheoryAssociation[TheoryName,$IfConstraints,$IfConstraintsValue,Advertise->True];
];