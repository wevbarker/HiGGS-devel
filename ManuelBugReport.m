(*==========================================*)
(*  A short file to address Manuel's email  *)
(*==========================================*)

Print@"First load the latest version of the HiGGS package:";

<<xAct`HiGGS`;

Print@"We are working in the context of the TEGR, so we need to load it into memory. I didn't document this, but we can pass some options to hide basically all the details:"

ViewTheory["TEGR", Literature->False, Brackets->False, Velocities->False];
(*
Print@"Now we want to construct a specific combination of constraints:";

Combination = (PhiB1p[-i,-j]-PhiB1p[-j,-i]+V[-i]*PhiB1m[-j]-V[-j]*PhiB1m[-i]);

Print@Combination;

Print@"In Nester form, and for the couplings of the TEGR:";

Combination//=ToBasicForm;
Combination=Combination/.TEGR@xAct`HiGGS`Private`$ToTheory;
Combination=ToNesterForm[Combination, ToShell->False];

Print@Combination;
*)
Print@"Okay, so recalling that for the TEGR we switched out all the dimensionful couplings for rational numbers, something of the shape returned above looks fairly sensible. Now we will try to compute the Poisson bracket with the super-Hamiltonian. Notice here that there is no need to remove ProjectorGP at all, this is already done internally:";
(*
MyNewVelocity = PoissonBracket[Combination,TEGR@$SuperHamiltonian,ToShell->False,Parallel->True];
*)
Print@"Note above that you can pass the option Parallel. This evaluates each sub-bracket on a separate core: I am using the threadripper with sixteen cores (the limit is from my Mathematica license) and the whole velocity takes me about twenty minutes. As you write in your email, the output is rather lengthy! It fills my whole window, but at least it appears to be covariant. I can notice that the 1^+ and 1^- tetrad momenta, and torsion irreps, appear very frequently. On this basis, I'd be tempted to try collecting these somehow into the their primary constraint form (e.g. write a replacement rule manually), and work from there. Another thing I see lots of is the 2^- torsion: this may remain simply because its cyclic symmetry cannot be handled by xAct, so some careful treatment there might be needed. Making sense of this looks like a pretty brutal task to be honest, so let me know as soon as you suspect there is an error in the code (i.e. when your hand calculations produce something that couldn't possibly match the output).";

Print@"Now to move on to your second problem, the auto-commutator of the super-Hamiltonian. Before we begin, I can imagine this will be the toughest computation that has so far been attempted, because the complexity of typical velocities will be squared in some sense.";

AutoCommutator = PoissonBracket[TEGR@$SuperHamiltonian,TEGR@$SuperHamiltonian,ToShell->False,Parallel->True];



Quit[];
