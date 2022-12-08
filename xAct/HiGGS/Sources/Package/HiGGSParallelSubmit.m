(*=======================*)
(*  HiGGSParallelSubmit  *)
(*=======================*)

HiGGSParallelSubmit~SetAttributes~HoldAll;

(*HiGGSParallelSubmit[Expr_] :=ParallelSubmit@Expr;*)
HiGGSParallelSubmit[Expr_] :=ParallelSubmit@Block[{Print=Null&, PrintTemporary=Null&}, Expr];
