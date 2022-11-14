(*========================*)
(*  ComputeShellFreedoms  *)
(*========================*)

ComputeShellFreedoms[TheoryName_?StringQ]:=Module[{
	Theory,
	$ToShellFreedomsValue,
	KeepOnlyObviousZeros,
	cAlpPerpPerpTheory,
	cAlpPerpParaTheory,
	cAlpParaPerpTheory,
	cAlpParaParaTheory,
	cAlpDetTheory,
	AlpPerpPerpTheory,
	AlpPerpParaTheory,
	AlpParaPerpTheory,
	AlpParaParaTheory,
	AlpDetTheory,
	cBetPerpPerpTheory,
	cBetPerpParaTheory,
	cBetParaPerpTheory,
	cBetParaParaTheory,
	cBetDetTheory,
	BetPerpPerpTheory,
	BetPerpParaTheory,
	BetParaPerpTheory,
	BetParaParaTheory,
	BetDetTheory},

	Theory=Evaluate@Symbol@TheoryName;
	
	(*We don't want our theory-defining rules to have unintended side-effects... so we only keep zeros which pop out of the initial rules.*)
	KeepOnlyObviousZeros[q_]:=If[q==0,0,1,1];

	(*We impose the theory on the coefficients*)
	cAlpPerpPerpTheory=KeepOnlyObviousZeros/@(cAlpPerpPerp/.TocAlp/.(Evaluate@(Theory@$ToTheory)));
	cAlpPerpParaTheory=KeepOnlyObviousZeros/@(cAlpPerpPara/.TocAlp/.(Evaluate@(Theory@$ToTheory)));
	cAlpParaPerpTheory=KeepOnlyObviousZeros/@(cAlpParaPerp/.TocAlp/.(Evaluate@(Theory@$ToTheory)));
	cAlpParaParaTheory=KeepOnlyObviousZeros/@(cAlpParaPara/.TocAlp/.(Evaluate@(Theory@$ToTheory)));
	cAlpDetTheory=KeepOnlyObviousZeros/@(cAlpDeterminants/.TocAlp/.(Evaluate@(Theory@$ToTheory)));
	AlpPerpPerpTheory=KeepOnlyObviousZeros/@(AlpPerpPerp/.ToAlp/.(Evaluate@(Theory@$ToTheory)));
	AlpPerpParaTheory=KeepOnlyObviousZeros/@(AlpPerpPara/.ToAlp/.(Evaluate@(Theory@$ToTheory)));
	AlpParaPerpTheory=KeepOnlyObviousZeros/@(AlpParaPerp/.ToAlp/.(Evaluate@(Theory@$ToTheory)));
	AlpParaParaTheory=KeepOnlyObviousZeros/@(AlpParaPara/.ToAlp/.(Evaluate@(Theory@$ToTheory)));
	AlpDetTheory=KeepOnlyObviousZeros/@(AlpDeterminants/.ToAlp/.(Evaluate@(Theory@$ToTheory)));
	cBetPerpPerpTheory=KeepOnlyObviousZeros/@(cBetPerpPerp/.TocBet/.(Evaluate@(Theory@$ToTheory)));
	cBetPerpParaTheory=KeepOnlyObviousZeros/@(cBetPerpPara/.TocBet/.(Evaluate@(Theory@$ToTheory)));
	cBetParaPerpTheory=KeepOnlyObviousZeros/@(cBetParaPerp/.TocBet/.(Evaluate@(Theory@$ToTheory)));
	cBetParaParaTheory=KeepOnlyObviousZeros/@(cBetParaPara/.TocBet/.(Evaluate@(Theory@$ToTheory)));
	cBetDetTheory=KeepOnlyObviousZeros/@(cBetDeterminants/.TocBet/.(Evaluate@(Theory@$ToTheory)));
	BetPerpPerpTheory=KeepOnlyObviousZeros/@(BetPerpPerp/.ToBet/.(Evaluate@(Theory@$ToTheory)));
	BetPerpParaTheory=KeepOnlyObviousZeros/@(BetPerpPara/.ToBet/.(Evaluate@(Theory@$ToTheory)));
	BetParaPerpTheory=KeepOnlyObviousZeros/@(BetParaPerp/.ToBet/.(Evaluate@(Theory@$ToTheory)));
	BetParaParaTheory=KeepOnlyObviousZeros/@(BetParaPara/.ToBet/.(Evaluate@(Theory@$ToTheory)));
	BetDetTheory=KeepOnlyObviousZeros/@(BetDeterminants/.ToBet/.(Evaluate@(Theory@$ToTheory)));

	(*We construct the rule which sends the freedom coefficients to the shell*)
	$ToShellFreedomsValue={};

	(*-------------------------------------------------*)
	(*  Shell structure for the Riemann-Cartan sector  *)
	(*-------------------------------------------------*)

	For[ii=1,ii<7,ii++,
		If[(cAlpPerpPerpTheory[[ii]]==0)&&(cAlpPerpParaTheory[[ii]]==0)&&(cAlpParaPerpTheory[[ii]]==0)&&(cAlpParaParaTheory[[ii]]==0),
			AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
			AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
			AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
			If[AlpPerpPerpTheory[[ii]]==0,
				AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->0"]]];,
				AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
			];,
			If[cAlpDetTheory[[ii]]==0,
				If[AlpPerpPerpTheory[[ii]]==0,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->1"]]];,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->0"]]];
				];,
				If[AlpPerpPerpTheory[[ii]]==0,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->1"]]];,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->1"]]];
				];
			];
		];
	];

	(*-------------------------------------------*)
	(*  Shell structure for the torsion sector   *)
	(*-------------------------------------------*)

	For[ii=1,ii<7,ii++,
		If[(cBetPerpPerpTheory[[ii]]==0)&&(cBetPerpParaTheory[[ii]]==0)&&(cBetParaPerpTheory[[ii]]==0)&&(cBetParaParaTheory[[ii]]==0),
			If[ii==2||ii==6,
				If[!(cBetParaParaTheory[[ii]]==0),
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					If[BetPerpPerpTheory[[ii]]==0,
						AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]];,
						AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					];,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					If[BetPerpPerpTheory[[ii]]==0,
						AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]];,
						AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					];
				];,
				AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
				AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
				AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
				If[BetPerpPerpTheory[[ii]]==0,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]];,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
				];
			];,
			If[cBetDetTheory[[ii]]==0,
				If[BetPerpPerpTheory[[ii]]==0,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]];,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->0"]]];
				];,
				If[BetPerpPerpTheory[[ii]]==0,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]];,
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->0"]]];
					AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]];
				];
			];
		];
	];

	UpdateTheoryAssociation[TheoryName,$ToShellFreedoms,$ToShellFreedomsValue];
];
