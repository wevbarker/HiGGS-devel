Begin["xAct`HiGGS`Private`"];

ProjectLorentzGaugeCovDRule={};
ExpandLorentzGaugeCovDProjectionRule={};
ProjectGaugeCovDRule={};

PrecomputeDerivativeProjections[];

DumpSave[xAct`HiGGS`Private`BinaryLocation["PrecomputeDerivativeProjections"],{ProjectLorentzGaugeCovDRule,ExpandLorentzGaugeCovDProjectionRule,ProjectGaugeCovDRule}];

End[];
