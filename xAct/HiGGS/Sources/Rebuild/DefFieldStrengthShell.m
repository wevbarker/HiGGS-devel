(*=========================*)
(*  DefFieldStrengthShell  *)
(*=========================*)

Begin["xAct`HiGGS`Private`"];
	DefTensor[RPShellPara[-a,-b,-c,-d],M4,{Antisymmetric[{-a,-b}],Antisymmetric[{-c,-d}]},OrthogonalTo->{V[a],V[b],V[c],V[d]}];
	DefTensor[RPShellPerp[-a,-b,-c],M4,Antisymmetric[{-b,-c}],OrthogonalTo->{V[a],V[b],V[c]}];
End[];
