(*==========================================*)
(*  A short file to address Manuel's email  *)
(*==========================================*)

Print@"First load the latest version of the HiGGS package:";

<<xAct`HiGGS`;

Print@"We are working in the context of the TEGR, so we need to load it into memory. I didn't document this, but we can pass some options to hide basically all the details:"

ViewTheory["TEGR", Literature->False, Brackets->False, Velocities->False];

Print@"Now we want to construct a specific combination of constraints:";

Combination = (PhiB1p[-i,-j]-PhiB1p[-j,-i]+V[-i]*PhiB1m[-j]-V[-j]*PhiB1m[-i]);

Print@Combination;

Print@"In Nester form, and for the couplings of the TEGR:";

Combination//=ToBasicForm;
Combination=Combination/.TEGR@xAct`HiGGS`Private`$ToTheory;
Combination=ToNesterForm[Combination, ToShell->False];

Print@Combination;

Print@"Okay, so recalling that for the TEGR we switched out all the dimensionful couplings for rational numbers, something of the shape returned above looks fairly sensible. Now we will try to compute the Poisson bracket with the super-Hamiltonian. Notice here that there is no need to remove ProjectorGP at all, this is already done internally:";

MyNewVelocity = PoissonBracket[Combination,TEGR@$SuperHamiltonian,ToShell->False,Parallel->True];

Quit[];
