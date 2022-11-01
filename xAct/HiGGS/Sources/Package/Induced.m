(*===========*)
(*  Induced  *)
(*===========*)

PrecomputeSmearingToProject[SmearingToProject_]:=Module[{},
	FullyProjectSmearingFunctionsRule=FullyProjectSmearingFunctionsRule~Join~MakeRule[{Evaluate@SmearingToProject,Evaluate@NoScalar@(SmearingToProject~InducedDecomposition~{xAct`HiGGS`GP,xAct`HiGGS`V})},MetricOn->All,ContractMetrics->True];
];

PrecomputeDerivativeProjectionGradientToProject[GradientToProject_]:=Module[{	
	ExpandedExpr},		

		ProjectionToExpand=xAct`HiGGS`ProjectorGP@GradientToProject;

		(* Lorentz gradients to total projections plus perpendicular Lorentz gradients *)

		ExpandedExpr=GradientToProject~InducedDecomposition~{xAct`HiGGS`GP,xAct`HiGGS`V};

		FullyProjectParaLorentzGaugeCovDRule=FullyProjectParaLorentzGaugeCovDRule~Join~MakeRule[{Evaluate@GradientToProject,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];

		ExpandedExpr//=NoScalar;
		ExpandedExpr//=ToNewCanonical;
		ExpandedExpr-=ProjectionToExpand;
		ExpandedExpr=ExpandedExpr/.xAct`HiGGS`ProjectorGP->ProjectWith@xAct`HiGGS`GP;
		ExpandedExpr//=ProjectorToMetric;
		ExpandedExpr//=ToNewCanonical;
		ExpandedExpr+=ProjectionToExpand;
		ExpandedExpr//=ToNewCanonical;

		ProjectParaLorentzGaugeCovDRule=ProjectParaLorentzGaugeCovDRule~Join~MakeRule[{Evaluate@GradientToProject,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];

		(* total projections to Lorentz gradients plus perpendicular Lorentz gradients *)

		ExpandedExpr=ProjectWith[xAct`HiGGS`GP]@First@(List@@ProjectionToExpand);
		ExpandedExpr//=ProjectorToMetric;
		ExpandedExpr//=ToNewCanonical;

		ExpandParaLorentzGaugeCovDProjectionRule=ExpandParaLorentzGaugeCovDProjectionRule~Join~MakeRule[{Evaluate@ProjectionToExpand,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];

		(* gradients to projections of Lorentz gradients plus perpendicular gradients *)

		CoordinateGradient=GradientToProject*xAct`HiGGS`G3[-xAct`HiGGS`w,xAct`HiGGS`u]*xAct`HiGGS`B[xAct`HiGGS`z,-xAct`HiGGS`u]//xAct`HiGGS`Private`ParaLorentzGaugeCovDToLorentzGaugeCovD//xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovD//ToNewCanonical;

		ExpandedExpr=CoordinateGradient-xAct`HiGGS`G3[-xAct`HiGGS`w,xAct`HiGGS`u]*xAct`HiGGS`B[xAct`HiGGS`z,-xAct`HiGGS`u]*ProjectionToExpand;
		ExpandedExpr=ExpandedExpr/.xAct`HiGGS`Private`ExpandParaLorentzGaugeCovDProjectionRule;
		ExpandedExpr//=xAct`HiGGS`Private`ParaLorentzGaugeCovDToLorentzGaugeCovD;
		ExpandedExpr//=xAct`HiGGS`Private`LorentzGaugeCovDToGaugeCovD;
		ExpandedExpr+=xAct`HiGGS`G3[-xAct`HiGGS`w,xAct`HiGGS`u]*xAct`HiGGS`B[xAct`HiGGS`z,-xAct`HiGGS`u]*ProjectionToExpand;
		ExpandedExpr//=ToNewCanonical;	

		ProjectGaugeCovDRule=ProjectGaugeCovDRule~Join~MakeRule[{Evaluate@CoordinateGradient,Evaluate@ExpandedExpr},MetricOn->All,ContractMetrics->True];

];

PrecomputeDerivativeProjection[TensorHead_?xTensorQ]:=Module[{
	SlotsOfTensorHead,
	GradientToProject},

	SlotsOfTensorHead=SlotsOfTensor@TensorHead;

	If[SlotsOfTensorHead===List@AnyIndices@xAct`HiGGS`TangentM4,
		GradientToProject=(xAct`HiGGS`ParaLorentzGaugeCovD[-xAct`HiGGS`z]@(TensorHead@@(("xAct`HiGGS`"~SymbolJoin~#)&/@(Alphabet[][[1;;LengthSlots]]))))~Table~{LengthSlots,0,4};
		PrecomputeDerivativeProjectionGradientToProject/@GradientToProject;
		(*AutomaticRules[Evaluate@TensorHead,MakeRule[{Evaluate[xAct`HiGGS`V[xAct`HiGGS`z]#],0},MetricOn->All,ContractMetrics->True]]&/@GradientToProject*),
		GradientToProject=xAct`HiGGS`ParaLorentzGaugeCovD[-xAct`HiGGS`z]@(TensorHead@@(("xAct`HiGGS`"~SymbolJoin~#)&/@(Alphabet[][[1;;Length@SlotsOfTensorHead]])));
		PrecomputeDerivativeProjectionGradientToProject@GradientToProject;
		(*AutomaticRules[Evaluate@TensorHead,MakeRule[{Evaluate[xAct`HiGGS`V[xAct`HiGGS`z]GradientToProject],0},MetricOn->All,ContractMetrics->True]]*)];
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
SmearingFunctions[]:=((xAct`HiGGS`SmearingLeft@@(("xAct`HiGGS`"~SymbolJoin~#)&/@(Alphabet[][[1;;LengthSlots]])))~Table~{LengthSlots,0,4})~Join~((xAct`HiGGS`SmearingRight@@(("xAct`HiGGS`"~SymbolJoin~#)&/@(Alphabet[][[1;;LengthSlots]])))~Table~{LengthSlots,0,4});

PrecomputeDerivativeProjections[]:=PrecomputeDerivativeProjection/@TensorsForDerivativeProjection[];
PrecomputeSmearingProjections[]:=PrecomputeSmearingToProject/@SmearingFunctions[];
