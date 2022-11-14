(*======================*)
(*  GeneralComplements  *)
(*======================*)

Begin["xAct`HiGGS`Private`"];

xAct`HiGGS`Private`HiGGSPrint["OrigBComplementDefinition..."];
OrigBComplementDefinition=Evaluate[J[]4 V[g]B[-k,-o]G3[o,-z]H[h,z](Bet1 PT1[-i,-g,-h,a,c,d]+Bet2 PT2[-i,-g,-h,a,c,d]+Bet3 PT3[-i,-g,-h,a,c,d])PPara[-c,x]PPara[-d,y]T[-a,-x,-y]+2J[]V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])PPara[-c,m]PPara[-d,n]TLambda[-a,-m,-n]+
2J[]V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])(PPerp[-c,m]PPara[-d,n]TLambda[-a,-m,-n]+PPara[-c,m]PPerp[-d,n]TLambda[-a,-m,-n])/.PActivate/.PADMActivate//ToCanonical//ContractMetric//CollectTensors];
xAct`HiGGS`Private`HiGGSPrint["PerpBComplementDefinition..."];
PerpBComplementDefinition=Evaluate[2J[]V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])PPara[-c,m]PPara[-d,n]TLambda[-a,-m,-n]+
2J[]V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])(PPerp[-c,m]PPara[-d,n]TLambda[-a,-m,-n]+PPara[-c,m]PPerp[-d,n]TLambda[-a,-m,-n])/.PActivate/.PADMActivate//ToCanonical//ContractMetric//CollectTensors];
xAct`HiGGS`Private`HiGGSPrint["SingBComplementDefinition..."];
SingBComplementDefinition=Evaluate[-J[]4 V[g]B[-k,-o]G3[o,-z]H[h,z](cBet1 PT1[-i,-g,-h,a,c,d]+cBet2 PT2[-i,-g,-h,a,c,d]+cBet3 PT3[-i,-g,-h,a,c,d])PPara[-c,x]PPara[-d,y]T[-a,-x,-y]/.PActivate/.PADMActivate//ToCanonical//ContractMetric//CollectTensors];
xAct`HiGGS`Private`HiGGSPrint["OrigAComplementDefinition..."];
OrigAComplementDefinition=Evaluate[-2Alp0 J[]Antisymmetrize[V[-i]PPara[-j,-k],{-i,-j}]+
J[] 8V[g]B[-k,-o]G3[o,-z]H[h,z](Alp1 PR1[-i,-j,-g,-h,a,b,c,d]+Alp2 PR2[-i,-j,-g,-h,a,b,c,d]+Alp3 PR3[-i,-j,-g,-h,a,b,c,d]+Alp4 PR4[-i,-j,-g,-h,a,b,c,d]+Alp5 PR5[-i,-j,-g,-h,a,b,c,d]+Alp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,x]PPara[-d,y]R[-a,-b,-x,-y]+4J[]V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,m]PPara[-d,n]RLambda[-a,-b,-m,-n]+
4J[]V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])(PPerp[-c,m]PPara[-d,n]RLambda[-a,-b,-m,-n]+PPara[-c,m]PPerp[-d,n]RLambda[-a,-b,-m,-n])/.PActivate/.PADMActivate//ToCanonical//ContractMetric//CollectTensors];
xAct`HiGGS`Private`HiGGSPrint["PerpAComplementDefinition..."];
PerpAComplementDefinition=Evaluate[4J[]V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,m]PPara[-d,n]RLambda[-a,-b,-m,-n]+
4J[]V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])(PPerp[-c,m]PPara[-d,n]RLambda[-a,-b,-m,-n]+PPara[-c,m]PPerp[-d,n]RLambda[-a,-b,-m,-n])/.PActivate/.PADMActivate//ToCanonical//ContractMetric//CollectTensors];
xAct`HiGGS`Private`HiGGSPrint["SingAComplementDefinition..."];
SingAComplementDefinition=Evaluate[-J[] 8V[g]B[-k,-o]G3[o,-z]H[h,z](cAlp1 PR1[-i,-j,-g,-h,a,b,c,d]+cAlp2 PR2[-i,-j,-g,-h,a,b,c,d]+cAlp3 PR3[-i,-j,-g,-h,a,b,c,d]+cAlp4 PR4[-i,-j,-g,-h,a,b,c,d]+cAlp5 PR5[-i,-j,-g,-h,a,b,c,d]+cAlp6 PR6[-i,-j,-g,-h,a,b,c,d])PPara[-c,x]PPara[-d,y]R[-a,-b,-x,-y]/.PActivate/.PADMActivate//ToCanonical//ContractMetric//CollectTensors];

PerpBComplementDefinition=PerpBComplementDefinition/.HG3BExpandLazy//ToNewCanonical//CollectTensors;
OrigBComplementDefinition=OrigBComplementDefinition/.HG3BExpandLazy//ToNewCanonical//CollectTensors;
SingBComplementDefinition=SingBComplementDefinition/.HG3BExpandLazy//ToNewCanonical//CollectTensors;
PerpBComplementDefinition=PerpBComplementDefinition/.ExpandStrengths//ToNewCanonical//CollectTensors;
OrigBComplementDefinition=OrigBComplementDefinition/.ExpandStrengths//ToNewCanonical//CollectTensors;
SingBComplementDefinition=SingBComplementDefinition/.ExpandStrengths//ToNewCanonical//CollectTensors;

PerpAComplementDefinition=PerpAComplementDefinition/.HG3BExpandLazy//ToNewCanonical//CollectTensors;
OrigAComplementDefinition=OrigAComplementDefinition/.HG3BExpandLazy//ToNewCanonical//CollectTensors;
SingAComplementDefinition=SingAComplementDefinition/.HG3BExpandLazy//ToNewCanonical//CollectTensors;
PerpAComplementDefinition=PerpAComplementDefinition/.ExpandStrengths//ToNewCanonical//CollectTensors;
OrigAComplementDefinition=OrigAComplementDefinition/.ExpandStrengths//ToNewCanonical//CollectTensors;
SingAComplementDefinition=SingAComplementDefinition/.ExpandStrengths//ToNewCanonical//CollectTensors;

RawPerpBComplementActivate=MakeRule[{PerpBComplement[-i,-k],Evaluate[PerpBComplementDefinition]},MetricOn->All,ContractMetrics->True];
RawOrigBComplementActivate=MakeRule[{OrigBComplement[-i,-k],Evaluate[OrigBComplementDefinition]},MetricOn->All,ContractMetrics->True];
RawSingBComplementActivate=MakeRule[{SingBComplement[-i,-k],Evaluate[SingBComplementDefinition]},MetricOn->All,ContractMetrics->True];
RawPerpAComplementActivate=MakeRule[{PerpAComplement[-i,-j,-k],Evaluate[PerpAComplementDefinition]},MetricOn->All,ContractMetrics->True];
RawOrigAComplementActivate=MakeRule[{OrigAComplement[-i,-j,-k],Evaluate[OrigAComplementDefinition]},MetricOn->All,ContractMetrics->True];
RawSingAComplementActivate=MakeRule[{SingAComplement[-i,-j,-k],Evaluate[SingAComplementDefinition]},MetricOn->All,ContractMetrics->True];

RawComplementActivate=Join[RawPerpBComplementActivate,RawOrigBComplementActivate,RawSingBComplementActivate,RawPerpAComplementActivate,RawOrigAComplementActivate,RawSingAComplementActivate];

OnShellBLambdaDefinition=(ShellOrigB0p ShellPerpB0p PB0pT[-n,-m,a,c]+
ShellOrigB1p ShellPerpB1p ShellSingB1p PB1pT[-n,-m,a,c]+
ShellOrigB2p ShellPerpB2p PB2pT[-n,-m,a,c]+
ShellOrigB1m ShellPerpB1m ShellSingB1m PB1mT[-n,-m,a,c])BPiP[-a,-c]+
((1-ShellOrigB0p)PB0pT[-n,-m,i,k]+
(1-ShellOrigB1p)PB1pT[-n,-m,i,k]+
(1-ShellOrigB2p)PB2pT[-n,-m,i,k]+
(1-ShellOrigB1m)PB1mT[-n,-m,i,k])OrigBComplement[-i,-k]+
((1-ShellPerpB0p)PB0pT[-n,-m,i,k]+
(1-ShellPerpB1p)PB1pT[-n,-m,i,k]+
(1-ShellPerpB2p)PB2pT[-n,-m,i,k]+
(1-ShellPerpB1m)PB1mT[-n,-m,i,k])PerpBComplement[-i,-k]+
((1-ShellSingB1p)PB1pT[-n,-m,i,k]+
(1-ShellSingB1m)PB1mT[-n,-m,i,k])OrigBComplement[-i,-k]+
((1-ShellSingB1p)(BetPerpPerp1p/cBetPerpPerp1p)PB1pT[-n,-m,i,k]+
(1-ShellSingB1m)(BetPerpPerp1m/cBetPerpPerp1m)PB1mT[-n,-m,i,k])SingBComplement[-i,-k];

OnShellALambdaDefinition=(ShellOrigA0p ShellPerpA0p ShellSingA0p PA0pT[-n,-m,-o,a,b,c]+
ShellOrigA1p ShellPerpA1p ShellSingA1p PA1pT[-n,-m,-o,a,b,c]+
ShellOrigA2p ShellPerpA2p ShellSingA2p PA2pT[-n,-m,-o,a,b,c]+
ShellOrigA0m ShellPerpA0m ShellSingA0m PA0mT[-n,-m,-o,a,b,c]+
ShellOrigA1m ShellPerpA1m ShellSingA1m PA1mT[-n,-m,-o,a,b,c]+
ShellOrigA2m ShellPerpA2m ShellSingA2m PA2mT[-n,-m,-o,a,b,c])APiP[-a,-b,-c]+
((1-ShellOrigA0p)PA0pT[-n,-m,-o,i,j,k]+
(1-ShellOrigA1p)PA1pT[-n,-m,-o,i,j,k]+
(1-ShellOrigA2p)PA2pT[-n,-m,-o,i,j,k]+
(1-ShellOrigA0m)PA0mT[-n,-m,-o,i,j,k]+
(1-ShellOrigA1m)PA1mT[-n,-m,-o,i,j,k]+
(1-ShellOrigA2m)PA2mT[-n,-m,-o,i,j,k])OrigAComplement[-i,-j,-k]+
((1-ShellPerpA0p)PA0pT[-n,-m,-o,i,j,k]+
(1-ShellPerpA1p)PA1pT[-n,-m,-o,i,j,k]+
(1-ShellPerpA2p)PA2pT[-n,-m,-o,i,j,k]+
(1-ShellPerpA0m)PA0mT[-n,-m,-o,i,j,k]+
(1-ShellPerpA1m)PA1mT[-n,-m,-o,i,j,k]+
(1-ShellPerpA2m)PA2mT[-n,-m,-o,i,j,k])PerpAComplement[-i,-j,-k]+
((1-ShellSingA0p)PA0pT[-n,-m,-o,i,j,k]+
(1-ShellSingA1p)PA1pT[-n,-m,-o,i,j,k]+
(1-ShellSingA2p)PA2pT[-n,-m,-o,i,j,k]+
(1-ShellSingA0m)PA0mT[-n,-m,-o,i,j,k]+
(1-ShellSingA1m)PA1mT[-n,-m,-o,i,j,k]+
(1-ShellSingA2m)PA2mT[-n,-m,-o,i,j,k])OrigAComplement[-i,-j,-k]+
((1-ShellSingA0p)(AlpPerpPerp0p/cAlpPerpPerp0p)PA0pT[-n,-m,-o,i,j,k]+
(1-ShellSingA1p)(AlpPerpPerp1p/cAlpPerpPerp1p)PA1pT[-n,-m,-o,i,j,k]+
(1-ShellSingA2p)(AlpPerpPerp2p/cAlpPerpPerp2p)PA2pT[-n,-m,-o,i,j,k]+
(1-ShellSingA0m)(AlpPerpPerp0m/cAlpPerpPerp0m)PA0mT[-n,-m,-o,i,j,k]+
(1-ShellSingA1m)(AlpPerpPerp1m/cAlpPerpPerp1m)PA1mT[-n,-m,-o,i,j,k]+
(1-ShellSingA2m)(AlpPerpPerp2m/cAlpPerpPerp2m)PA2mT[-n,-m,-o,i,j,k])SingAComplement[-i,-j,-k];

OnShellALambdaDefinition=OnShellALambdaDefinition//ToCanonical//ContractMetric;
OnShellALambdaDefinition=OnShellALambdaDefinition/.RawComplementActivate//ToCanonical//ContractMetric;
RawOnShellALambdaDefinition=OnShellALambdaDefinition/.NewPO3TActivate//ToCanonical//ContractMetric;

OnShellBLambdaDefinition=OnShellBLambdaDefinition//ToCanonical//ContractMetric;
OnShellBLambdaDefinition=OnShellBLambdaDefinition/.RawComplementActivate//ToCanonical//ContractMetric;
RawOnShellBLambdaDefinition=OnShellBLambdaDefinition/.NewPO3TActivate//ToCanonical//ContractMetric;

DumpSave[xAct`HiGGS`Private`BinaryLocation["GeneralComplements"],{RawComplementActivate,RawOnShellALambdaDefinition,RawOnShellBLambdaDefinition,OrigBComplementDefinition,PerpBComplementDefinition,SingBComplementDefinition,OrigAComplementDefinition,PerpAComplementDefinition,SingAComplementDefinition}];

End[];
