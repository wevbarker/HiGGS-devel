Begin["xAct`HiGGS`Private`"];

ProjectLorentzGaugeCovDRule={};
ProjectParaLorentzGaugeCovDRule={};
ExpandLorentzGaugeCovDProjectionRule={};
ExpandParaLorentzGaugeCovDProjectionRule={};
ProjectGaugeCovDRule={};

PrecomputeDerivativeProjections[];

DumpSave[xAct`HiGGS`Private`BinaryLocation["PrecomputeDerivativeProjections"],{ProjectLorentzGaugeCovDRule,ProjectParaLorentzGaugeCovDRule,ExpandLorentzGaugeCovDProjectionRule,ExpandParaLorentzGaugeCovDProjectionRule,ProjectGaugeCovDRule}];

End[];
