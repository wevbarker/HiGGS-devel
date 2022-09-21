(* this file provides tools for the projection of derivatives *)

ProjectLorentzGaugeCovDRule={};
ExpandLorentzGaugeCovDProjectionRule={};
ProjectGaugeCovDRule={};

PrecomputeDerivativeProjectionGradientToProject[GradientToProject_]:=Catch@Module[{	
	ExpandedExpr},		

		ProjectionToExpand=Global`ProjectorGP@GradientToProject;

		(* Lorentz gradients to total projections plus perpendicular Lorentz gradients *)

		ExpandedExpr=GradientToProject~InducedDecomposition~{Global`GP,Global`V};
		ExpandedExpr//=NoScalar;
		ExpandedExpr//=ToNewCanonical;
		ExpandedExpr-=ProjectionToExpand;
		ExpandedExpr=ExpandedExpr/.Global`ProjectorGP->ProjectWith@Global`GP;
		ExpandedExpr//=ProjectorToMetric;
		ExpandedExpr//=ToNewCanonical;
		ExpandedExpr+=ProjectionToExpand;
		ExpandedExpr//=ToNewCanonical;

		ProjectLorentzGaugeCovDRule=ProjectLorentzGaugeCovDRule~Join~MakeRule[{Evaluate@GradientToProject,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];

		(* total projections to Lorentz gradients plus perpendicular Lorentz gradients *)

		ExpandedExpr=ProjectWith[Global`GP]@First@(List@@ProjectionToExpand);
		ExpandedExpr//=ProjectorToMetric;
		ExpandedExpr//=ToNewCanonical;

		ExpandLorentzGaugeCovDProjectionRule=ExpandLorentzGaugeCovDProjectionRule~Join~MakeRule[{Evaluate@ProjectionToExpand,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];

		(* gradients to projections of Lorentz gradients plus perpendicular gradients *)

		CoordinateGradient=GradientToProject*Global`G3[-Global`w,Global`u]*Global`B[Global`z,-Global`u]//xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovD//ToNewCanonical;

		ExpandedExpr=CoordinateGradient-Global`G3[-Global`w,Global`u]*Global`B[Global`z,-Global`u]*ProjectionToExpand;
		ExpandedExpr=ExpandedExpr/.xAct`HiGGS`Private`ExpandLorentzGaugeCovDProjectionRule;
		ExpandedExpr//=xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovD;
		ExpandedExpr+=Global`G3[-Global`w,Global`u]*Global`B[Global`z,-Global`u]*ProjectionToExpand;
		ExpandedExpr//=ToNewCanonical;	

		ProjectGaugeCovDRule=ProjectGaugeCovDRule~Join~MakeRule[{Evaluate@CoordinateGradient,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];

];

PrecomputeDerivativeProjection[TensorHead_?xTensorQ]:=Catch@Module[{
	SlotsOfTensorHead,
	GradientToProject},

	SlotsOfTensorHead=SlotsOfTensor@TensorHead;

	If[SlotsOfTensorHead===List@AnyIndices@Global`TangentM4,
		GradientToProject=(Global`LorentzGaugeCovD[-Global`z]@(TensorHead@@(("Global`"~SymbolJoin~#)&/@(Alphabet[][[1;;LengthSlots]]))))~Table~{LengthSlots,0,4};
		PrecomputeDerivativeProjectionGradientToProject/@GradientToProject,
		GradientToProject=Global`LorentzGaugeCovD[-Global`z]@(TensorHead@@(("Global`"~SymbolJoin~#)&/@(Alphabet[][[1;;Length@SlotsOfTensorHead]])));
		PrecomputeDerivativeProjectionGradientToProject@GradientToProject];
];

(*selects tensor heads which refer to the spin-parity sectors*)
NesterFormTensorQ[TensorHead_]:=MatchQ[TensorHead,_?(StringMatchQ[SymbolName@#,
	(___~~"0p"~~___)|
	(___~~"0m"~~___)|
	(___~~"1p"~~___)|
	(___~~"1m"~~___)|
	(___~~"2p"~~___)|
	(___~~"2m"~~___)|
	(___~~"J"~~___)|
	(___~~"V"~~___)|
	(___~~"SmearingLeft"~~___)|
	(___~~"SmearingRight"~~___)]&)];

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
	("Var"~~___)|
	("TPerp"~~___)|
	("RPerp"~~___)|
	("AP"~~___)]&)];

TensorsForDerivativeProjection[]:=((Cases[xAct`xTensor`$Tensors,_?NesterFormTensorQ])~Complement~(Cases[xAct`xTensor`$Tensors,_?UnwantedTensorQ]));

PrecomputeDerivativeProjections[]:=PrecomputeDerivativeProjection/@TensorsForDerivativeProjection[];
