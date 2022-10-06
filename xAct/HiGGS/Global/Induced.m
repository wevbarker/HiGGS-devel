(* this file defines the induced metric *)

(* firstly define the parallel eta metric, recall that this has the same meaning as PPara, and so we may wish to merge the quantities at some point *)
GPSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[Eta]\), \(^\)], \(\[DoubleVerticalBar]\)]\)";

Quiet@DefMetric[1,GP[-a,-b],CDP,{"~","error"},InducedFrom->{G,V},PrintAs->GPSymb];

(* a rule which switches the induce metric for FoliG within ToNewCanonical *)

xAct`HiGGS`Private`GPToFoliG=MakeRule[{GP[-a,-b],G[-a,-b]-V[-a]V[-b]},MetricOn->All,ContractMetrics->True];

(* generate projection rules over the Lorentzian derivative for all the most imporant Nester form tensors *)

xAct`HiGGS`Private`ProjectLorentzGaugeCovDRule={};
xAct`HiGGS`Private`ExpandLorentzGaugeCovDProjectionRule={};
xAct`HiGGS`Private`ProjectGaugeCovDRule={};

xAct`HiGGS`Private`PrecomputeDerivativeProjections[];

(* another miscellaneous rule whose counterpart we need to form using induced structure *)

xAct`HiGGS`Private`ProjectedLorentzGaugeCovDVExpand=MakeRule[{Evaluate@(ProjectorGP@(LorentzGaugeCovD[-m]@V[-j])),Evaluate[Symmetrize[ProjectorGP@(LorentzGaugeCovD[-m]@V[-j]),{-m,-j}]-(1/2)V[-i]TP[i,-m,-j]/.PADMActivate]},MetricOn->All,ContractMetrics->True];
