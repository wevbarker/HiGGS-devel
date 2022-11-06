(*=====================*)
(*  DefO3MomentaShell  *)
(*=====================*)

DefO3MomentaShell[TheoryName_?StringQ]:=Module[{
	Theory,
	$TheoryCDPiPToCDPiPO3Value,
	$TheoryPiPToPiPO3Value,
	tmp,
	CDBPiPToCDBPiPO3,
	CDAPiPToCDAPiPO3,
	TheoryCDBPiPToCDBPiPO3,
	TheoryBPiPToBPiPO3,
	TheoryCDAPiPToCDAPiPO3,
	TheoryAPiPToAPiPO3},

	Theory=Evaluate@Symbol@TheoryName;

	tmp=ToO3[APiP[-a,-b,-c],ToShell->TheoryName];
	TheoryAPiPToAPiPO3=MakeRule[{APiP[-a,-b,-c],Evaluate[tmp]},MetricOn->All,ContractMetrics->True];
	tmp=CD[-z][tmp]//ToNewCanonical;
	TheoryCDAPiPToCDAPiPO3=MakeRule[{CD[-z][APiP[-a,-b,-c]],Evaluate[tmp]},MetricOn->All,ContractMetrics->True];
	tmp=ToO3[BPiP[-a,-b],ToShell->TheoryName];
	TheoryBPiPToBPiPO3=MakeRule[{BPiP[-a,-b],Evaluate[tmp]},MetricOn->All,ContractMetrics->True];
	tmp=CD[-z][tmp]//ToNewCanonical;
	TheoryCDBPiPToCDBPiPO3=MakeRule[{CD[-z][BPiP[-a,-b]],Evaluate[tmp]},MetricOn->All,ContractMetrics->True];
	$TheoryCDPiPToCDPiPO3Value=Join[TheoryCDAPiPToCDAPiPO3,TheoryCDBPiPToCDBPiPO3];
	$TheoryPiPToPiPO3Value=Join[TheoryAPiPToAPiPO3,TheoryBPiPToBPiPO3];

	UpdateTheoryAssociation[TheoryName,$TheoryCDPiPToCDPiPO3,$TheoryCDPiPToCDPiPO3Value];
	UpdateTheoryAssociation[TheoryName,$TheoryPiPToPiPO3,$TheoryPiPToPiPO3Value];
];
