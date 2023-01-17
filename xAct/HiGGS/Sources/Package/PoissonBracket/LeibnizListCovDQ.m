(*====================*)
(*  LeibnizListCovDQ  *)
(*====================*)

(*a function to test for the internal covariant derivative*)
LeibnizListCovDQ[Expr_]:=((Head@Head@Evaluate@Expr)==LeibnizListCovD);
