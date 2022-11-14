(*===================*)
(*  CDBToGaugeCovDB  *)
(*===================*)

xAct`HiGGS`Private`G3VCDBToG3GaugeCovDV=MakeRule[{G3[-l,n]V[-k]CD[-m][B[k,-n]],-G3[-l,n]B[j,-n]A[k,-j,-m]V[-k]-G3[-l,n]B[j,-n]GaugeCovD[-m][V[-j]]},MetricOn->All,ContractMetrics->True];

xAct`HiGGS`Private`G3HCDBToGaugeCovDJ=MakeRule[{G3[n,-s]H[-k,s]CD[-m][B[k,-n]],Ji[]GaugeCovD[-m][J[]]-V[k]H[-k,a]G3[-a,b](B[j,-b]GaugeCovD[-m][V[-j]]+V[-l]A[l,-j,-m]B[j,-b])},MetricOn->All,ContractMetrics->True];
