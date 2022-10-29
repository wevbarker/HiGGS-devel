(*----------------------*)
(*  DefNesterFormShell  *)
(*----------------------*)

DefNesterFormShell[TheoryName_?StringQ]:=Module[{
	Theory,
	BasicFormTensorsToReplace,
	ShellNesterFormTensorsToReplace,
	NesterFormShell},

	Theory=Evaluate@Symbol@TheoryName;

	NesterFormTensorsToReplace={
		xAct`HiGGS`PIPB0p[],	
		xAct`HiGGS`PIPB1p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`PIPB1m[-xAct`HiGGS`i],	
		xAct`HiGGS`IPB2p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`IPA0p[],	
		xAct`HiGGS`IPA0m[],	
		xAct`HiGGS`IPA1p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`IPA1m[-xAct`HiGGS`i],	
		xAct`HiGGS`IPA2p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`IPA2m[-xAct`HiGGS`i,-xAct`HiGGS`j,-xAct`HiGGS`k],	
		xAct`HiGGS`P0m[],	
		xAct`HiGGS`P1p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`P1m[-xAct`HiGGS`i],	
		xAct`HiGGS`P2m[-xAct`HiGGS`i,-xAct`HiGGS`j,-xAct`HiGGS`k],	
		xAct`HiGGS`P0p[],	
		xAct`HiGGS`P0m[],	
		xAct`HiGGS`P1p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`P1m[-xAct`HiGGS`i],	
		xAct`HiGGS`P2p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`P2m[-xAct`HiGGS`i,-xAct`HiGGS`j,-xAct`HiGGS`k]           
	};

	BasicFormTensorsToReplace=ToBasicForm/@NesterFormTensorsToReplace;

	ShellNesterFormTensorsToReplace=ToNesterForm[#,ToShell->TheoryName]&/@BasicFormTensorsToReplace;

	NesterFormShell={};

	MapThread[(NesterFormShell=NesterFormShell~Join~MakeRule[{#1,#2},MetricOn->All,ContractMetrics->True])&,{NesterFormTensorsToReplace,ShellNesterFormTensorsToReplace}];

	UpdateTheoryAssociation[TheoryName,$NesterFormShell,NesterFormShell];
];
