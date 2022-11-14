(*==================*)
(*  CDPiPToCDPiPO3  *)
(*==================*)

Begin["xAct`HiGGS`Private`"];

tmp=ToO3[APiP[-a,-b,-c],ToShell->False];
tmp=CD[-z][tmp]//ToNewCanonical;  
CDAPiPToCDAPiPO3=MakeRule[{CD[-z][APiP[-a,-b,-c]],Evaluate[tmp]},MetricOn->All,ContractMetrics->True];
tmp=ToO3[BPiP[-a,-b],ToShell->False];
tmp=CD[-z][tmp]//ToNewCanonical;
CDBPiPToCDBPiPO3=MakeRule[{CD[-z][BPiP[-a,-b]],Evaluate[tmp]},MetricOn->All,ContractMetrics->True];
$CDPiPToCDPiPO3=Join[CDAPiPToCDAPiPO3,CDBPiPToCDBPiPO3];
DumpSave[xAct`HiGGS`Private`BinaryLocation["CDPiPToCDPiPO3"],{$CDPiPToCDPiPO3}];

End[];
