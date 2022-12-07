(*==========================================*)
(*  A short file to address Manuel's email  *)
(*==========================================*)

Print@"First load the latest version of the HiGGS package:";

<<xAct`HiGGS`;

Print@"Now we want to construct a specific combination of constraints:";

Combination = (PhiB1p[-i,-j]-PhiB1p[-j,-i]+V[-i]*PhiB1m[-j]-V[-j]*PhiB1m[-i]);

Print@Combination;

Print@"In Nester form, and for the couplings of the TEGR:";

Combination//=ToBasicForm;
Combination=Combination/.TEGR@xAct`HiGGS`Private`$ToTheory;

Print@Combination;

Quit[];
