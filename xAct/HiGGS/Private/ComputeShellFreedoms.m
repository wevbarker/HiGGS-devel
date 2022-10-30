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

	(*We fix $ToOrderRules according to whether there is an Einstein--Hilbert term, recalling that this can change the order of certain constraints*)
	$ToOrderRules={};
	Switch[KeepOnlyObviousZeros@(xAct`HiGGS`Alp0/.(Evaluate@(Theory@$ToShellTheory))),0,$ToOrderRules=$ToNormalOrderRules,1,$ToOrderRules=$ToEHOrderRules];

	(*We impose the theory on the coefficients*)
	cAlpPerpPerpTheory=KeepOnlyObviousZeros/@(cAlpPerpPerp/.TocAlp/.(Evaluate@(Theory@$ToShellTheory)));
	cAlpPerpParaTheory=KeepOnlyObviousZeros/@(cAlpPerpPara/.TocAlp/.(Evaluate@(Theory@$ToShellTheory)));
	cAlpParaPerpTheory=KeepOnlyObviousZeros/@(cAlpParaPerp/.TocAlp/.(Evaluate@(Theory@$ToShellTheory)));
	cAlpParaParaTheory=KeepOnlyObviousZeros/@(cAlpParaPara/.TocAlp/.(Evaluate@(Theory@$ToShellTheory)));
	cAlpDetTheory=KeepOnlyObviousZeros/@(cAlpDeterminants/.TocAlp/.(Evaluate@(Theory@$ToShellTheory)));
	AlpPerpPerpTheory=KeepOnlyObviousZeros/@(AlpPerpPerp/.ToAlp/.(Evaluate@(Theory@$ToShellTheory)));
	AlpPerpParaTheory=KeepOnlyObviousZeros/@(AlpPerpPara/.ToAlp/.(Evaluate@(Theory@$ToShellTheory)));
	AlpParaPerpTheory=KeepOnlyObviousZeros/@(AlpParaPerp/.ToAlp/.(Evaluate@(Theory@$ToShellTheory)));
	AlpParaParaTheory=KeepOnlyObviousZeros/@(AlpParaPara/.ToAlp/.(Evaluate@(Theory@$ToShellTheory)));
	AlpDetTheory=KeepOnlyObviousZeros/@(AlpDeterminants/.ToAlp/.(Evaluate@(Theory@$ToShellTheory)));
	cBetPerpPerpTheory=KeepOnlyObviousZeros/@(cBetPerpPerp/.TocBet/.(Evaluate@(Theory@$ToShellTheory)));
	cBetPerpParaTheory=KeepOnlyObviousZeros/@(cBetPerpPara/.TocBet/.(Evaluate@(Theory@$ToShellTheory)));
	cBetParaPerpTheory=KeepOnlyObviousZeros/@(cBetParaPerp/.TocBet/.(Evaluate@(Theory@$ToShellTheory)));
	cBetParaParaTheory=KeepOnlyObviousZeros/@(cBetParaPara/.TocBet/.(Evaluate@(Theory@$ToShellTheory)));
	cBetDetTheory=KeepOnlyObviousZeros/@(cBetDeterminants/.TocBet/.(Evaluate@(Theory@$ToShellTheory)));
	BetPerpPerpTheory=KeepOnlyObviousZeros/@(BetPerpPerp/.ToBet/.(Evaluate@(Theory@$ToShellTheory)));
	BetPerpParaTheory=KeepOnlyObviousZeros/@(BetPerpPara/.ToBet/.(Evaluate@(Theory@$ToShellTheory)));
	BetParaPerpTheory=KeepOnlyObviousZeros/@(BetParaPerp/.ToBet/.(Evaluate@(Theory@$ToShellTheory)));
	BetParaParaTheory=KeepOnlyObviousZeros/@(BetParaPara/.ToBet/.(Evaluate@(Theory@$ToShellTheory)));
	BetDetTheory=KeepOnlyObviousZeros/@(BetDeterminants/.ToBet/.(Evaluate@(Theory@$ToShellTheory)));

	(*We construct the rule which sends the freedom coefficients to the shell*)
	$ToShellFreedomsValue={};

	For[ii=1,ii<7,ii++,
	If[cAlpPerpPerpTheory[[ii]]cAlpPerpParaTheory[[ii]]cAlpParaPerpTheory[[ii]]cAlpParaParaTheory[[ii]]==0,
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->1"]]],
	If[AlpPerpPerpTheory[[ii]]==0,
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->1"]]]]},
	If[cAlpDetTheory[[ii]]==0,
	If[AlpPerpPerpTheory[[ii]]==0,
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->1"]]],AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->1"]]]},
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->1"]]],AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->0"]]]}
	];,
	If[AlpPerpPerpTheory[[ii]]==0,
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->1"]]],AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->1"]]]},
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[ASectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[ASectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[ASectorNames[[ii]]]<>"->0"]]],AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[ASectorNames[[ii]]]<>"->1"]]]}
	];
	];
	];
	];

	For[ii=1,ii<7,ii++,
	If[cBetPerpPerpTheory[[ii]]cBetPerpParaTheory[[ii]]cBetParaPerpTheory[[ii]]cBetParaParaTheory[[ii]]==0,
	If[ii==2||ii==6,
	If[!(cBetParaParaTheory[[ii]]==0),
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	If[BetPerpPerpTheory[[ii]]==0,
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]]]},
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	If[BetPerpPerpTheory[[ii]]==0,
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]]]}];,
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	If[BetPerpPerpTheory[[ii]]==0,
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]]]}];,
	If[cBetDetTheory[[ii]]==0,
	If[BetPerpPerpTheory[[ii]]==0,
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]],AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]]},
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]],AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->0"]]]}
	];,
	If[BetPerpPerpTheory[[ii]]==0,
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->1"]]],AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]]},
	{AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellOrig"<>ToString[BSectorNames[[ii]]]<>"->1"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPara"<>ToString[BSectorNames[[ii]]]<>"->0"]]],
	AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellPerp"<>ToString[BSectorNames[[ii]]]<>"->0"]]],AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`ShellSing"<>ToString[BSectorNames[[ii]]]<>"->1"]]]}
	];
	];
	];
	];

	UpdateTheoryAssociation[TheoryName,$ToShellFreedoms,$ToShellFreedomsValue];

];
