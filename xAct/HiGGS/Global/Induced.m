(* this file defines the induced metric *)

(* firstly define the parallel eta metric, recall that this has the same meaning as PPara, and so we may wish to merge the quantities at some point *)
GPSymb="\!\(\*SuperscriptBox[OverscriptBox[\(\[Eta]\), \(^\)], \(\[DoubleVerticalBar]\)]\)";

(*
Quiet@UndefTensor@PerturbationGP;  (*we find using VisitorsOf that the calling of xPert automatically assigns PerturbationG, so we need to remove it first*)
Quiet@UndefMetric@GP;
*)
Catch@Quiet@DefMetric[1,GP[-a,-b],CDP,{"~","error"},InducedFrom->{G,V},PrintAs->GPSymb];

(* generate projection rules over the Lorentzian derivative for all the most imporant Nester form tensors *)

xAct`HiGGS`Private`PrecomputeDerivativeProjections[];
