(*=====================*)
(*  RepairProjectorGP  *)
(*=====================*)

(*----------------------------------------------------------------------------------------------------------------------------*)
(*  Summands within Projector heads (e.g. from expansion of the induced metric) can throw an exception upon canonicalisation  *)
(*----------------------------------------------------------------------------------------------------------------------------*)

RepairProjectorGP[Expr_]:=Module[{RepairedExpr},
	If[(Expr~Cases~_Plus)=={},

		(*---------------------------------------------------------*)
		(*  In most cases, we expect the argument not to be a sum  *)
		(*---------------------------------------------------------*)

		RepairedExpr=xAct`HiGGS`ProjectorGP@Expr,	

		(*------------------------------------------------------------*)
		(*  Otherwise, we re-decompose the argument and pass it back  *)
		(*------------------------------------------------------------*)

		RepairedExpr=Expr//ProjectWith@xAct`HiGGS`GP;
		RepairedExpr//=ToNewCanonical;
		RepairedExpr//=ContractMetric;
		RepairedExpr//=ScreenDollarIndices;
		RepairedExpr=RepairedExpr~InducedDecomposition~{xAct`HiGGS`GP,xAct`HiGGS`V};
		RepairedExpr//=NoScalar;
		RepairedExpr//=ToCanonical;

		(*-------------------------------------------------------------------*)
		(*  Before passing back, newly-generated dummies must be made safe   *)
		(*-------------------------------------------------------------------*)

		RepairedExpr//=ReplaceDummies;
	];
RepairedExpr];
