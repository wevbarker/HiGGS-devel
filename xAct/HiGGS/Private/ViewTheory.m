Options[ViewTheory]={
	Literature->True,
	Brackets->True,
	Velocities->True};

ViewTheory[theory_String,OptionsPattern[]]:=Module[{IndIfConstraints,ii,jj},
DefTheory["Import"->theory];

	If[OptionValue[Literature],
		DefIfConstraintToTheoryNesterForm[Global$ToShellFreedoms,Global$ToTheory,Global$Theory];
	];

	If[OptionValue[Brackets],
		IndIfConstraints=(#~ChangeFreeIndices~({-xAct`HiGGS`l,-xAct`HiGGS`m,-xAct`HiGGS`n}~Take~Length@FindFreeIndices@#))&/@Global$IfConstraints;
		Global$PPMlabels=Table[{Global$IfConstraints[[ii]],IndIfConstraints[[jj]]},{ii,Length@Global$IfConstraints},{jj,ii,Length@Global$IfConstraints}]~PadLeft~{Length@Global$IfConstraints,Length@Global$IfConstraints};
		Global$PPM=Global$PPM~PadLeft~{Length@Global$IfConstraints,Length@Global$IfConstraints};
		PrintBracket[x_,y_]:=Module[{nontrivial},
		nontrivial=!(x=={0,0,0}||x=={0,0,0,0}||y==0);
		If[nontrivial,
			xAct`HiGGS`Private`PrintPoissonBracket[y,x,ToShell->True];,Null;,
			xAct`HiGGS`Private`PrintPoissonBracket[y,x,ToShell->True];];
		];
		Print@" ** ViewTheory: encountered the following nonvanishing Poisson brackets:";
		MapThread[PrintBracket,{Global$PPM,Global$PPMlabels},2];
	];

	If[OptionValue["Velocities"],
		IndVelocities=(#~ChangeFreeIndices~({-xAct`HiGGS`i,-xAct`HiGGS`j,-xAct`HiGGS`k}~Take~Length@FindFreeIndices@#))&/@Global$Velocities;
		PrintVelocity[x_,y_]:=Module[{nontrivial},
		nontrivial=!(x==0);
		If[nontrivial,
		HiGGSPrint["\!\(\*FractionBox[\(\[DifferentialD]\), \(\[DifferentialD]t\)]\)",y," \[TildeTilde] ",x],Null;,
		HiGGSPrint["\!\(\*FractionBox[\(\[DifferentialD]\), \(\[DifferentialD]t\)]\)",y," \[TildeTilde] ",x]];
		];
		Print@" ** ViewTheory: encountered the following nonvanishing velocities:";
		MapThread[PrintVelocity,{IndVelocities,Global$IfConstraints}];
	];
];
