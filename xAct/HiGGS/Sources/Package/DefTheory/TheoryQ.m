(*===========*)
(*  TheoryQ  *)
(*===========*)

TheoryQ[x_]:=Module[{Bool},
	Bool=ListQ[x];
	If[Bool,
	Bool=Flatten@{{xAct`HiGGS`Alp0},xAct`HiGGS`Alp,xAct`HiGGS`Bet,xAct`HiGGS`cAlp,xAct`HiGGS`cBet}~SubsetQ~Flatten@(Variables/@Flatten@((List@@(#))&/@x));
];
Bool];
