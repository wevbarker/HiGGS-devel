(*=======================*)
(*  HiGGSParallelSubmit  *)
(*=======================*)

HiGGSParallelSubmit~SetAttributes~HoldAll;

HiGGSParallelSubmit[Expr_] :=ParallelSubmit@Block[{Print=Null&, PrintTemporary=Null&}, Expr];
