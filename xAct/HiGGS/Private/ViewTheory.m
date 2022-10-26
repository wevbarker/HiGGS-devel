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
		PPMArray=PreparePPM@TheoryName;
		FilledPPMArray=MapThread[{#1[[1]],#1[[2]],#1[[3]],#1[[4]],#1[[5]],#2},{PPMArray,Theory@$PPM}];
		Print@FilledPPMArray;
		Apply[PoissonBracket[#2,#3,ToShell->#1,AllocatedBracket->#6]&,FilledPPMArray,{1}];
	];

	(*----------------------------------------------------------------------------*)
	(*  Present the commutators of the if-constraints with the super-Hamiltonian  *)
	(*----------------------------------------------------------------------------*)

	If[OptionValue[Velocities],
		VelocitiesArray=PrepareVelocities@TheoryName;
		FilledVelocitiesArray=MapThread[{#1[[1]],#1[[2]],#1[[3]],#2},{VelocitiesArray,Theory@$Velocities}];
		Print@FilledVelocitiesArray;
		Apply[PoissonBracket[#2,SuperHamiltonian0p[],ToShell->#1,AllocatedBracket->#4]&,FilledVelocitiesArray,{1}];
	];
];
