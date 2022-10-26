Options[ViewTheory]={
	Literature->True,
	Brackets->True,
	Velocities->True};

ViewTheory[TheoryName_String,OptionsPattern[]]:=Module[{
	Theory},

	(*-------------------------------------*)
	(*  DefTheory from some imported file  *)
	(*-------------------------------------*)

	DefTheory[TheoryName,ImportTheory->True];
	Theory=Evaluate@Symbol@TheoryName;



	(*--------------------------------------------------*)
	(*  Present our literature knowledge of the theory  *)
	(*--------------------------------------------------*)


	If[OptionValue[Literature],
		DefIfConstraintToTheoryNesterForm[TheoryName];

		Print["** DefTheory: The super-Hamiltonian is:"];
		Print[SuperHamiltonian0p[]," \[Congruent] ",Theory@$SuperHamiltonian," \[TildeTilde] 0"];

		Print["** DefTheory: The linear super-momentum is:"];
		Print[LinearSuperMomentum1m[-l]," \[Congruent] ",Theory@$LinearSuperMomentum," \[TildeTilde] 0"];

		Print["** DefTheory: The 1+ part of the angular super-momentum is:"];
		Print[RotationalSuperMomentum1p[-n,-m]," \[Congruent] ",Theory@$AngularSuperMomentum1p," \[TildeTilde] 0"];
	];

	(*--------------------------------------*)
	(*  Present the primary Poisson matrix  *)
	(*--------------------------------------*)



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




	(*----------------------------------------------------------------------------*)
	(*  Present the commutators of the if-constraints with the super-Hamiltonian  *)
	(*----------------------------------------------------------------------------*)




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
