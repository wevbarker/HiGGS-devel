(*====================*)
(*  DefIfConstraints  *)
(*====================*)

DefIfConstraints[TheoryName_?StringQ]:=Module[{
	Theory,
	IfConstraints,
	EvaluatedIfConstraints},

	Theory=Evaluate@Symbol@TheoryName;


	IfConstraints=Theory@$IfConstraints;
	EvaluatedIfConstraints=(ToNesterForm@((#//ToBasicForm)/.(Evaluate@Theory@$ToTheory)))&/@IfConstraints;
	UpdateTheoryAssociation[TheoryName,$EvaluatedIfConstraints,EvaluatedIfConstraints,Advertise->True];
];
