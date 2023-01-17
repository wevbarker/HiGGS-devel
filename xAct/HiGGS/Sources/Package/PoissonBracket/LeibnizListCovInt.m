(*=====================*)
(*  LeibnizListCovInt  *)
(*=====================*)

(*a function to strip off the internal covariant derivative*)
LeibnizListCovInt[LeibnizListCovD[_][Expr_]]:=Expr;
