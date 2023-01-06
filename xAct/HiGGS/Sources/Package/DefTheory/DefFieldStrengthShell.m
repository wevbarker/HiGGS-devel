(*=========================*)
(*  DefFieldStrengthShell  *)
(*=========================*)

DefFieldStrengthShell[TheoryName_?StringQ]:=Module[{
	Theory,
	$StrengthPShellToStrengthPO3Value,
	TPShellDefinition,
	RPShellParaDefinition,
	RPShellPerpDefinition,
	RPShellDefinition,
	RPShellParaActivate,
	RPShellPerpActivate,
	RPShellParaPerpActivate,
	TPShellActivate,
	RPShellActivate},

	Theory=Evaluate@Symbol@TheoryName;

	TPShellDefinition= ShellParaB1p V[-a]TP1p[-b,-c]+
	-(1/6)ShellParaB0m PT0m[-a,-b,-c]TP0m[]+
	 ShellParaB1m Antisymmetrize[-PPara[-a,-b]TP1m[-c],{-b,-c}]+
	(4/3)ShellParaB2m TP2m[-b,-c,-a]/.(Evaluate@(Theory@$ToShellFreedoms))/.PO3TActivate/.PADMActivate//ToCanonical;

	RPShellParaDefinition=-(1/6)ShellParaA0p(PPara[-a,-d]PPara[-b,-c]-PPara[-a,-c]PPara[-b,-d])RP0p[]-
	ShellParaA1p(PPara[-b,-d]RP1p[-a,-c]-PPara[-b,-c]RP1p[-a,-d]-PPara[-a,-d]RP1p[-b,-c]+PPara[-a,-c]RP1p[-b,-d])+
	ShellParaA2p(PPara[-b,-d]RP2p[-a,-c]-PPara[-b,-c]RP2p[-a,-d]-PPara[-a,-d]RP2p[-b,-c]+PPara[-a,-c]RP2p[-b,-d]);
	RPShellPerpDefinition=-(1/6)ShellParaA0m PR0m[-a,-b,-c]RP0m[]+ ShellParaA1m Antisymmetrize[-PPara[-a,-b]RP1m[-c],{-b,-c}]+(4/3)ShellParaA2m RP2m[-b,-c,-a];

	RPShellParaActivate=MakeRule[{RPShellPara[-a,-b,-c,-d],Evaluate[RPShellParaDefinition]},MetricOn->All,ContractMetrics->True];
	RPShellPerpActivate=MakeRule[{RPShellPerp[-a,-b,-c],Evaluate[RPShellPerpDefinition]},MetricOn->All,ContractMetrics->True];
	RPShellParaPerpActivate=Join[RPShellParaActivate,RPShellPerpActivate];

	RPShellDefinition= RPShellPara[-a,-b,-c,-d]+2Antisymmetrize[V[-a]RPShellPerp[-b,-c,-d],{-a,-b}]/.RPShellParaPerpActivate/.(Evaluate@(Theory@$ToShellFreedoms))/.PO3RActivate/.PADMActivate//ToCanonical;

	TPShellDefinition=TPShellDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;
	RPShellDefinition=RPShellDefinition//CollectTensors//ScreenDollarIndices//CollectTensors;

	TPShellActivate=MakeRule[{TP[-a,-b,-c],Evaluate[TPShellDefinition]},MetricOn->All,ContractMetrics->True];
	RPShellActivate=MakeRule[{RP[-a,-b,-c,-d],Evaluate[RPShellDefinition]},MetricOn->All,ContractMetrics->True];
	$StrengthPShellToStrengthPO3Value=Join[TPShellActivate,RPShellActivate];

	UpdateTheoryAssociation[TheoryName,$StrengthPShellToStrengthPO3,$StrengthPShellToStrengthPO3Value];
];
