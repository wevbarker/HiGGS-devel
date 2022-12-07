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

Quit[];
