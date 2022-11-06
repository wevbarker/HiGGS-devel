(*======================*)
(*  DefNesterFormShell  *)
(*======================*)

TensorList[Expr_]:=DeleteDuplicates@Flatten@((Cases[ExtractSymbols@#,_?xTensorQ,Infinity])&/@(Flatten@({Expr/.Plus->List})));

DefNesterFormShell[TheoryName_?StringQ]:=Module[{
	Theory,
	BasicFormTensorsToReplace,
	ShellNesterFormTensorsToReplace,
	NesterFormShell},

	Theory=Evaluate@Symbol@TheoryName;

	NesterFormTensorsToReplace={
		xAct`HiGGS`PiPB0p[],	
		xAct`HiGGS`PiPB1p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`PiPB1m[-xAct`HiGGS`i],	
		xAct`HiGGS`PiPB2p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`PiPA0p[],	
		xAct`HiGGS`PiPA0m[],	
		xAct`HiGGS`PiPA1p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`PiPA1m[-xAct`HiGGS`i],	
		xAct`HiGGS`PiPA2p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`PiPA2m[-xAct`HiGGS`i,-xAct`HiGGS`j,-xAct`HiGGS`k],	
		xAct`HiGGS`TP0m[],	
		xAct`HiGGS`TP1p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`TP1m[-xAct`HiGGS`i],	
		xAct`HiGGS`TP2m[-xAct`HiGGS`i,-xAct`HiGGS`j,-xAct`HiGGS`k],	
		xAct`HiGGS`RP0p[],	
		xAct`HiGGS`RP0m[],	
		xAct`HiGGS`RP1p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`RP1m[-xAct`HiGGS`i],	
		xAct`HiGGS`RP2p[-xAct`HiGGS`i,-xAct`HiGGS`j],	
		xAct`HiGGS`RP2m[-xAct`HiGGS`i,-xAct`HiGGS`j,-xAct`HiGGS`k]           
	};

	BasicFormTensorsToReplace=ToBasicForm/@NesterFormTensorsToReplace;

	ShellNesterFormTensorsToReplace=ToNesterForm[#,ToShell->TheoryName]&/@BasicFormTensorsToReplace;

	ShellNesterFormTensorsToReplace=MapThread[If[(TensorList@#1)==(TensorList@#2),#1,#2,#2]&,{NesterFormTensorsToReplace,ShellNesterFormTensorsToReplace}];

	NesterFormShell={};

	MapThread[(NesterFormShell=NesterFormShell~Join~MakeRule[{#1,#2},MetricOn->All,ContractMetrics->True])&,{NesterFormTensorsToReplace,ShellNesterFormTensorsToReplace}];

	UpdateTheoryAssociation[TheoryName,$NesterFormShell,NesterFormShell];
];
