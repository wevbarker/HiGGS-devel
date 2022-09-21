(* this file provides tools for the projection of derivatives *)

ProjectLorentzGaugeCovDRule={};
ExpandLorentzGaugeCovDProjectionRule={};

PrecomputeDerivativeProjection[TensorHead_?xTensorQ]:=Catch@Module[{
GradientToProject,
ExpandedExpr},		
	GradientToProject=Global`LorentzGaugeCovD[-Global`z]@(TensorHead@@(("Global`"~SymbolJoin~#)&/@(Alphabet[][[1;;(Length@SlotsOfTensor@TensorHead)]])));

	ExpandedExpr=GradientToProject~InducedDecomposition~{Global`GP,Global`V};
	ExpandedExpr//=NoScalar;
	ExpandedExpr//=ToNewCanonical;
	ProjectLorentzGaugeCovDRule=ProjectLorentzGaugeCovDRule~Join~MakeRule[{Evaluate@GradientToProject,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];

	ProjectionToExpand=Global`ProjectorGP@GradientToProject;
	ExpandedExpr=ProjectWith[Global`GP]@First@(List@@ProjectionToExpand);
	ExpandedExpr//=ProjectorToMetric;
	ExpandedExpr//=ToNewCanonical;
	ExpandLorentzGaugeCovDProjectionRule=ExpandLorentzGaugeCovDProjectionRule~Join~MakeRule[{Evaluate@ProjectionToExpand,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];
];

(*selects tensor heads which refer to the spin-parity sectors*)
NesterFormTensorQ[TensorHead_]:=MatchQ[TensorHead,_?(StringMatchQ[SymbolName@#,
(___~~"0p"~~___)|
(___~~"0m"~~___)|
(___~~"1p"~~___)|
(___~~"1m"~~___)|
(___~~"2p"~~___)|
(___~~"2m"~~___)]&)];

(*selects tensor heads which do not feature certain character combinations*)
UnwantedTensorQ[TensorHead_]:=MatchQ[TensorHead,_?(StringMatchQ[SymbolName@#,
("D"~~___)|
("Phi"~~___)|
("FP"~~___)|
("Chi"~~___)|
("Tau"~~___)|
("Sigma"~~___)|
("PA"~~___)|
("PB"~~___)|
("PP"~~___)|
("U"~~___)|
("TPerp"~~___)|
("RPerp"~~___)|
("AP"~~___)]&)];

TensorsForDerivativeProjection[]:=((Cases[xAct`xTensor`$Tensors,_?NesterFormTensorQ])~Complement~(Cases[xAct`xTensor`$Tensors,_?UnwantedTensorQ]));

PrecomputeDerivativeProjections[]:=PrecomputeDerivativeProjection/@TensorsForDerivativeProjection[];
