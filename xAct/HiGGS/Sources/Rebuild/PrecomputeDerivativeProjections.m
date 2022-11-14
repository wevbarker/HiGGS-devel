(*===================================*)
(*  PrecomputeDerivativeProjections  *)
(*===================================*)

Begin["xAct`HiGGS`Private`"];

ProjectLorentzGaugeCovDRule={};
ProjectParaLorentzGaugeCovDRule={};
FullyProjectParaLorentzGaugeCovDRule={};
ExpandLorentzGaugeCovDProjectionRule={};
ExpandParaLorentzGaugeCovDProjectionRule={};
ProjectGaugeCovDRule={};
FullyProjectSmearingFunctionsRule={};

PrecomputeDerivativeProjections[];
PrecomputeSmearingProjections[];

DumpSave[xAct`HiGGS`Private`BinaryLocation["PrecomputeDerivativeProjections"],{ProjectLorentzGaugeCovDRule,ProjectParaLorentzGaugeCovDRule,FullyProjectParaLorentzGaugeCovDRule,ExpandLorentzGaugeCovDProjectionRule,ExpandParaLorentzGaugeCovDProjectionRule,ProjectGaugeCovDRule,FullyProjectSmearingFunctionsRule}];

End[];
