(*==============*)
(*  ViewTheory  *)
(*==============*)

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

		Print["** ViewTheory: The super-Hamiltonian is:"];
		Print[xAct`HiGGS`SuperHamiltonian0p[]," \[Congruent] ",Theory@$SuperHamiltonian," \[TildeTilde] 0"];

		Print["** ViewTheory: The linear super-momentum is:"];
		Print[xAct`HiGGS`LinearSuperMomentum1m[-xAct`HiGGS`l]," \[Congruent] ",Theory@$LinearSuperMomentum," \[TildeTilde] 0"];

		Print["** ViewTheory: The 1+ part of the angular super-momentum is:"];
		Print[xAct`HiGGS`RotationalSuperMomentum1p[-xAct`HiGGS`n,-xAct`HiGGS`m]," \[Congruent] ",Theory@$AngularSuperMomentum1p," \[TildeTilde] 0"];
	];

	(*--------------------------------------*)
	(*  Present the primary Poisson matrix  *)
	(*--------------------------------------*)

	If[OptionValue[Brackets],
		PPMArray=PreparePPM@TheoryName;
		FilledPPMArray=MapThread[{#1[[1]],#1[[2]],#1[[3]],#1[[4]],#1[[5]],#2}&,{PPMArray~Flatten~1,Theory@$PPM~Flatten~1}];
		Print["** ViewTheory: The on-shell brackets between the various if-constraints are:"];
		Apply[AllocatedPoissonBracket[#2,#3,#6]&,FilledPPMArray,{1}];
	];

	(*----------------------------------------------------------------------------*)
	(*  Present the commutators of the if-constraints with the super-Hamiltonian  *)
	(*----------------------------------------------------------------------------*)

	If[OptionValue[Velocities],
		VelocitiesArray=PrepareVelocities@TheoryName;
		FilledVelocitiesArray=MapThread[{#1[[1]],#1[[2]],#1[[3]],#2}&,{VelocitiesArray,Theory@$Velocities}];
		Print["** ViewTheory: The commutators between the various if-constraints and the super-Hamiltonian are:"];
		Apply[AllocatedPoissonBracket[#2,xAct`HiGGS`SuperHamiltonian0p[],#4]&,FilledVelocitiesArray,{1}];
	];
];
