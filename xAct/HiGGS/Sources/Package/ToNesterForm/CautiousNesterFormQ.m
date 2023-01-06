(*=======================*)
(*  CautiousNesterFormQ  *)
(*=======================*)

CautiousNesterFormQ[Expr_]:=Quiet@Check[NesterFormQ@Expr,False];
