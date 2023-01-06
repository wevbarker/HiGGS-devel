(*=====================*)
(*  ActiveProjectorGP  *)
(*=====================*)

ActiveProjectorGP[Expr_]:=Module[{ActiveExpr=Expr},
		ActiveExpr=InertExpr/.{xAct`HiGGS`FoliG->xAct`HiGGS`GP};
		ActiveExpr//=xAct`HiGGS`ProjectorGP;
ActiveExpr];
