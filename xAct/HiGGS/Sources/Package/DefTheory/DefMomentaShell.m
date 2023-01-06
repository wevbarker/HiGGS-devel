(*===================*)
(*  DefMomentaShell  *)
(*===================*)

DefMomentaShell[TheoryName_?StringQ]:=Module[{
	Theory,
	$PiPShellToPiPPO3Value,
	PerpBComplementActivate,
	OrigBComplementActivate,
	SingBComplementActivate,
	PerpAComplementActivate,
	OrigAComplementActivate,
	SingAComplementActivate,
	OnShellBLambdaDefinition,
	OnShellALambdaDefinition,
	OnShellBLambdaActivate,
	OnShellALambdaActivate},

	Theory=Evaluate@Symbol@TheoryName;

	OrigBComplementDefinition=OrigBComplementDefinition/.(Evaluate@(Theory@$ToTheory))//ToNewCanonical//CollectTensors;
	PerpBComplementDefinition=PerpBComplementDefinition/.(Evaluate@(Theory@$ToTheory))//ToNewCanonical//CollectTensors;
	SingBComplementDefinition=SingBComplementDefinition/.(Evaluate@(Theory@$ToTheory))//ToNewCanonical//CollectTensors;
	OrigAComplementDefinition=OrigAComplementDefinition/.(Evaluate@(Theory@$ToTheory))//ToNewCanonical//CollectTensors;
	PerpAComplementDefinition=PerpAComplementDefinition/.(Evaluate@(Theory@$ToTheory))//ToNewCanonical//CollectTensors;
	SingAComplementDefinition=SingAComplementDefinition/.(Evaluate@(Theory@$ToTheory))//ToNewCanonical//CollectTensors;

	PerpBComplementActivate=MakeRule[{PerpBComplement[-i,-k],Evaluate[PerpBComplementDefinition]},MetricOn->All,ContractMetrics->True];
	OrigBComplementActivate=MakeRule[{OrigBComplement[-i,-k],Evaluate[OrigBComplementDefinition]},MetricOn->All,ContractMetrics->True];
	SingBComplementActivate=MakeRule[{SingBComplement[-i,-k],Evaluate[SingBComplementDefinition]},MetricOn->All,ContractMetrics->True];
	PerpAComplementActivate=MakeRule[{PerpAComplement[-i,-j,-k],Evaluate[PerpAComplementDefinition]},MetricOn->All,ContractMetrics->True];
	OrigAComplementActivate=MakeRule[{OrigAComplement[-i,-j,-k],Evaluate[OrigAComplementDefinition]},MetricOn->All,ContractMetrics->True];
	SingAComplementActivate=MakeRule[{SingAComplement[-i,-j,-k],Evaluate[SingAComplementDefinition]},MetricOn->All,ContractMetrics->True];

	ComplementActivate=Join[PerpBComplementActivate,OrigBComplementActivate,SingBComplementActivate,PerpAComplementActivate,OrigAComplementActivate,SingAComplementActivate];

	OnShellALambdaDefinition=RawOnShellALambdaDefinition/.(Evaluate@(Theory@$ToShellFreedoms))/.ToAlp/.TocAlp/.(Evaluate@(Theory@$ToTheory))//ToNewCanonical;
	OnShellBLambdaDefinition=RawOnShellBLambdaDefinition/.(Evaluate@(Theory@$ToShellFreedoms))/.ToBet/.TocBet/.(Evaluate@(Theory@$ToTheory))//ToNewCanonical;

	OnShellBLambdaActivate=MakeRule[{BPiP[-n,-m],Evaluate[OnShellBLambdaDefinition]},MetricOn->All,ContractMetrics->True];
	OnShellALambdaActivate=MakeRule[{APiP[-n,-m,-o],Evaluate[OnShellALambdaDefinition]},MetricOn->All,ContractMetrics->True];
	$PiPShellToPiPPO3Value=Join[OnShellBLambdaActivate,OnShellALambdaActivate];

	UpdateTheoryAssociation[TheoryName,$PiPShellToPiPPO3,$PiPShellToPiPPO3Value];
];
