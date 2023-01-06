(*====================*)
(*  InertProjectorGP  *)
(*====================*)

(*--------------------------------------------------------------------------------*)
(*  To reduce the chance of this happening, we must render GP inert within heads  *)
(*--------------------------------------------------------------------------------*)

InertProjectorGP[Expr_]:=Module[{InertExpr=Expr},
		InertExpr=InertExpr/.{xAct`HiGGS`GP->xAct`HiGGS`FoliG};
		InertExpr//=xAct`HiGGS`ProjectorGP;
InertExpr];
