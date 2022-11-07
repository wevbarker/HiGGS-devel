(*===========*)
(*  ChiSing  *)
(*===========*)

ChiSingExtraB1pDefinition=(BetPerpPerp1p/cBetPerpPerp1p)PB1p[-n,-m,e,f]PBPara[-e,-f,a,c]BChiSingExtra[-a,-c]/.ToBet/.TocBet/.BChiSingExtraActivate//ActivateGeneralO3Projections;
ChiSingExtraB1mDefinition=(BetPerpPerp1m/cBetPerpPerp1m)PB1m[-n,f]PBPerp[-f,a,c]BChiSingExtra[-a,-c]/.ToBet/.TocBet/.BChiSingExtraActivate//ActivateGeneralO3Projections;

ChiSingExtraA0pDefinition=(AlpPerpPerp0p/cAlpPerpPerp0p)PA0p[e,f]PAPerp[-e,-f,a,b,c]AChiSingExtra[-a,-b,-c]/.ToAlp/.TocAlp/.AChiSingExtraActivate//ActivateGeneralO3Projections;
ChiSingExtraA1pDefinition=(AlpPerpPerp1p/cAlpPerpPerp1p)PA1p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]AChiSingExtra[-a,-b,-c]/.ToAlp/.TocAlp/.AChiSingExtraActivate//ActivateGeneralO3Projections;
ChiSingExtraA2pDefinition=(AlpPerpPerp2p/cAlpPerpPerp2p)PA2p[-n,-m,e,f]PAPerp[-e,-f,a,b,c]AChiSingExtra[-a,-b,-c]/.ToAlp/.TocAlp/.AChiSingExtraActivate//ActivateGeneralO3Projections;
ChiSingExtraA0mDefinition=(AlpPerpPerp0m/cAlpPerpPerp0m)PA0m[d,e,f]PAPara[-d,-e,-f,a,b,c]AChiSingExtra[-a,-b,-c]/.ToAlp/.TocAlp/.AChiSingExtraActivate//ActivateGeneralO3Projections;
ChiSingExtraA1mDefinition=(AlpPerpPerp1m/cAlpPerpPerp1m)PA1m[-n,d,e,f]PAPara[-d,-e,-f,a,b,c]AChiSingExtra[-a,-b,-c]/.ToAlp/.TocAlp/.AChiSingExtraActivate//ActivateGeneralO3Projections;
ChiSingExtraA2mDefinition=(AlpPerpPerp2m/cAlpPerpPerp2m)PA2m[-n,-m,-o,d,e,f]PAPara[-d,-e,-f,a,b,c]AChiSingExtra[-a,-b,-c]/.ToAlp/.TocAlp/.AChiSingExtraActivate//ActivateGeneralO3Projections;

ChiSingB1pDefinition=PhiB1p[-n,-m]+ChiSingExtraB1pDefinition/.PhiActivate//NoScalar//ToNewCanonical;
ChiSingB1mDefinition=PhiB1m[-n]+ChiSingExtraB1mDefinition/.PhiActivate//NoScalar//ToNewCanonical;

ChiSingA0pDefinition=PhiA0p[]+ChiSingExtraA0pDefinition/.PhiActivate//NoScalar//ToNewCanonical;
ChiSingA0mDefinition=PhiA0m[]+ChiSingExtraA0mDefinition/.PhiActivate//NoScalar//ToNewCanonical;
ChiSingA1pDefinition=PhiA1p[-n,-m]+ChiSingExtraA1pDefinition/.PhiActivate//NoScalar//ToNewCanonical;
ChiSingA1mDefinition=PhiA1m[-n]+ChiSingExtraA1mDefinition/.PhiActivate//NoScalar//ToNewCanonical;
ChiSingA2pDefinition=PhiA2p[-n,-m]+ChiSingExtraA2pDefinition/.PhiActivate//NoScalar//ToNewCanonical;
ChiSingA2mDefinition=PhiA2m[-n,-m,-o]+ChiSingExtraA2mDefinition/.PhiActivate//NoScalar//ToNewCanonical;

ChiSingB1pActivate=MakeRule[{ChiSingB1p[-n,-m],Evaluate[ChiSingB1pDefinition]},MetricOn->All,ContractMetrics->True];
ChiSingB1mActivate=MakeRule[{ChiSingB1m[-n],Evaluate[ChiSingB1mDefinition]},MetricOn->All,ContractMetrics->True];
ChiSingA0pActivate=MakeRule[{ChiSingA0p[],Scalar[Evaluate[ChiSingA0pDefinition]]},MetricOn->All,ContractMetrics->True];
ChiSingA0mActivate=MakeRule[{ChiSingA0m[],Scalar[Evaluate[ChiSingA0mDefinition]]},MetricOn->All,ContractMetrics->True];
ChiSingA1pActivate=MakeRule[{ChiSingA1p[-n,-m],Evaluate[ChiSingA1pDefinition]},MetricOn->All,ContractMetrics->True];
ChiSingA1mActivate=MakeRule[{ChiSingA1m[-n],Evaluate[ChiSingA1mDefinition]},MetricOn->All,ContractMetrics->True];
ChiSingA2pActivate=MakeRule[{ChiSingA2p[-n,-m],Evaluate[ChiSingA2pDefinition]},MetricOn->All,ContractMetrics->True];
ChiSingA2mActivate=MakeRule[{ChiSingA2m[-n,-m,-o],Evaluate[ChiSingA2mDefinition]},MetricOn->All,ContractMetrics->True];

ChiSingActivate=Join[ChiSingB1pActivate,ChiSingB1mActivate,ChiSingA0pActivate,ChiSingA0mActivate,ChiSingA1pActivate,ChiSingA1mActivate,ChiSingA2pActivate,ChiSingA2mActivate];

DumpSave[xAct`HiGGS`Private`BinaryLocation["ChiSing"],{ChiSingActivate}];
