(*========================*)
(*  ComputeShellFreedoms  *)
(*========================*)

ComputeShellFreedoms[TheoryName_?StringQ]:=Module[{
	Theory,
	TranslationalSpinParitySectors,
	RotationalSpinParitySectors,
	EnforcedConstraintsForSpinParitySector,
	AddEnforcedConstraintsForSpinParitySector,
	MakeEnforcedConstraintsForSpinParitySector,
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

	TranslationalSpinParitySectors={"B0p","B0m","B1p","B1m","B2p","B2m"};
	RotationalSpinParitySectors={"A0p","A0m","A1p","A1m","A2p","A2m"};
	
	(*We don't want our theory-defining rules to have unintended side-effects... so we only keep zeros which pop out of the initial rules.*)
	KeepOnlyObviousZeros[q_]:=If[q==0,0,1,1];

	(*We impose the theory on the coefficients*)
	cAlpPerpPerpTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(cAlpPerpPerp/.TocAlp/.(Evaluate@(Theory@$ToTheory))))];
	cAlpPerpParaTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(cAlpPerpPara/.TocAlp/.(Evaluate@(Theory@$ToTheory))))];
	cAlpParaPerpTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(cAlpParaPerp/.TocAlp/.(Evaluate@(Theory@$ToTheory))))];
	cAlpParaParaTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(cAlpParaPara/.TocAlp/.(Evaluate@(Theory@$ToTheory))))];
	cAlpDetTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(cAlpDeterminants/.TocAlp/.(Evaluate@(Theory@$ToTheory))))];
	AlpPerpPerpTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(AlpPerpPerp/.ToAlp/.(Evaluate@(Theory@$ToTheory))))];
	AlpPerpParaTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(AlpPerpPara/.ToAlp/.(Evaluate@(Theory@$ToTheory))))];
	AlpParaPerpTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(AlpParaPerp/.ToAlp/.(Evaluate@(Theory@$ToTheory))))];
	AlpParaParaTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(AlpParaPara/.ToAlp/.(Evaluate@(Theory@$ToTheory))))];
	AlpDetTheory=AssociationThread[RotationalSpinParitySectors->(KeepOnlyObviousZeros/@(AlpDeterminants/.ToAlp/.(Evaluate@(Theory@$ToTheory))))];

	cBetPerpPerpTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(cBetPerpPerp/.TocBet/.(Evaluate@(Theory@$ToTheory))))];
	cBetPerpParaTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(cBetPerpPara/.TocBet/.(Evaluate@(Theory@$ToTheory))))];
	cBetParaPerpTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(cBetParaPerp/.TocBet/.(Evaluate@(Theory@$ToTheory))))];
	cBetParaParaTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(cBetParaPara/.TocBet/.(Evaluate@(Theory@$ToTheory))))];
	cBetDetTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(cBetDeterminants/.TocBet/.(Evaluate@(Theory@$ToTheory))))];
	BetPerpPerpTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(BetPerpPerp/.ToBet/.(Evaluate@(Theory@$ToTheory))))];
	BetPerpParaTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(BetPerpPara/.ToBet/.(Evaluate@(Theory@$ToTheory))))];
	BetParaPerpTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(BetParaPerp/.ToBet/.(Evaluate@(Theory@$ToTheory))))];
	BetParaParaTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(BetParaPara/.ToBet/.(Evaluate@(Theory@$ToTheory))))];
	BetDetTheory=AssociationThread[TranslationalSpinParitySectors->(KeepOnlyObviousZeros/@(BetDeterminants/.ToBet/.(Evaluate@(Theory@$ToTheory))))];

	AddEnforcedConstraintsForSpinParitySector[KindsOfConstraints___]:=(EnforcedConstraintsForSpinParitySector~AppendTo~(List@KindsOfConstraints));

	MakeEnforcedConstraintsForSpinParitySector[SpinParitySector_String,EnforcedConstraintsForSpinParitySector_List]:=Module[{	
		ConstraintsNotEnforced,
		AllKindsOfConstraints={"ShellOrig","ShellPara","ShellPerp","ShellSing","ShellParaLamb","ShellPerpLamb","ShellSingLamb"}},
		ConstraintsNotEnforced=AllKindsOfConstraints~Complement~EnforcedConstraintsForSpinParitySector;
		(*Then the next two lines set up some conditions later used internally by DefTheory*)
		AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`"<>#<>SpinParitySector<>"->0"]]]&/@EnforcedConstraintsForSpinParitySector;
		AppendTo[$ToShellFreedomsValue,Evaluate[ToExpression["xAct`HiGGS`Private`"<>#<>SpinParitySector<>"->1"]]]&/@ConstraintsNotEnforced;
	];

	(*We construct the rule which sends the freedom coefficients to the shell*)
	$ToShellFreedomsValue={};

	(*-------------------------------------------------*)
	(*  Shell structure for the Riemann-Cartan sector  *)
	(*-------------------------------------------------*)

	Table[
		EnforcedConstraintsForSpinParitySector={};
		If[(cAlpPerpPerpTheory@SpinParitySector===0)&&(cAlpPerpParaTheory@SpinParitySector===0)&&(cAlpParaPerpTheory@SpinParitySector===0)&&(cAlpParaParaTheory@SpinParitySector===0),
			If[AlpPerpPerpTheory@SpinParitySector===0,
				AddEnforcedConstraintsForSpinParitySector@"ShellOrig";
			];,
			If[cAlpDetTheory@SpinParitySector===0,
				AddEnforcedConstraintsForSpinParitySector@"ShellParaLamb";
				If[AlpPerpPerpTheory@SpinParitySector===0,
					AddEnforcedConstraintsForSpinParitySector@"ShellOrig";,
					AddEnforcedConstraintsForSpinParitySector@"ShellSing";
				];,
				AddEnforcedConstraintsForSpinParitySector@"ShellPerpLamb";
				AddEnforcedConstraintsForSpinParitySector@"ShellParaLamb";
				If[AlpPerpPerpTheory@SpinParitySector===0,
					AddEnforcedConstraintsForSpinParitySector@"ShellOrig";
					AddEnforcedConstraintsForSpinParitySector@"ShellPara";,
					AddEnforcedConstraintsForSpinParitySector@"ShellPerp";
					AddEnforcedConstraintsForSpinParitySector@"ShellPara";
				];
			];
		];
		SpinParitySector~MakeEnforcedConstraintsForSpinParitySector~EnforcedConstraintsForSpinParitySector;,
		{SpinParitySector,RotationalSpinParitySectors}
	];

	(*-------------------------------------------*)
	(*  Shell structure for the torsion sector   *)
	(*-------------------------------------------*)

	Table[
		EnforcedConstraintsForSpinParitySector={};
		If[(cBetPerpPerpTheory@SpinParitySector===0)&&(cBetPerpParaTheory@SpinParitySector===0)&&(cBetParaPerpTheory@SpinParitySector===0)&&(cBetParaParaTheory@SpinParitySector===0),
			If[BetPerpPerpTheory@SpinParitySector===0,
				AddEnforcedConstraintsForSpinParitySector@"ShellOrig";
			];,
			If[(SpinParitySector==="B0m"||SpinParitySector==="B2m")&&(cBetParaParaTheory@SpinParitySector===1),
				AddEnforcedConstraintsForSpinParitySector@"ShellPara";
				AddEnforcedConstraintsForSpinParitySector@"ShellParaLamb";
				If[BetPerpPerpTheory@SpinParitySector===0,
					AddEnforcedConstraintsForSpinParitySector@"ShellOrig";
				];,
				If[(SpinParitySector==="B0p"||SpinParitySector==="B2p")&&(cBetPerpPerpTheory@SpinParitySector===1),
					AddEnforcedConstraintsForSpinParitySector@"ShellPerpLamb";
					If[BetPerpPerpTheory@SpinParitySector===0,
						AddEnforcedConstraintsForSpinParitySector@"ShellOrig";
					];,
					If[cBetDetTheory@SpinParitySector===0,
						AddEnforcedConstraintsForSpinParitySector@"ShellParaLamb";
						If[BetPerpPerpTheory@SpinParitySector===0,
							AddEnforcedConstraintsForSpinParitySector@"ShellOrig";,
							AddEnforcedConstraintsForSpinParitySector@"ShellSing";
						];,
						AddEnforcedConstraintsForSpinParitySector@"ShellPerpLamb";
						AddEnforcedConstraintsForSpinParitySector@"ShellParaLamb";
						If[BetPerpPerpTheory@SpinParitySector===0,
							AddEnforcedConstraintsForSpinParitySector@"ShellOrig";
							AddEnforcedConstraintsForSpinParitySector@"ShellPara";,
							AddEnforcedConstraintsForSpinParitySector@"ShellPerp";
							AddEnforcedConstraintsForSpinParitySector@"ShellPara";
						];
					];
				];
			];
		];
		SpinParitySector~MakeEnforcedConstraintsForSpinParitySector~EnforcedConstraintsForSpinParitySector;,
		{SpinParitySector,TranslationalSpinParitySectors}
	];

	UpdateTheoryAssociation[TheoryName,$ToShellFreedoms,$ToShellFreedomsValue];
];
