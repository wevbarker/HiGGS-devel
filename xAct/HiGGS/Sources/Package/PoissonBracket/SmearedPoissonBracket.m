(*===========================*)
(*  SmearedEvaluatedBracket  *)
(*===========================*)

(*----------------------------------------------------------*)
(*  A function to form the Poisson bracket on a given term  *)
(*----------------------------------------------------------*)

Options[SmearedPoissonBracket]={ToShell->False};
SmearedPoissonBracket[{LeftOperand_,LeftSmearing_},{RightOperand_,RightSmearing_},OptionsPattern[]]:=Catch@Module[{
	UnevaluatedBracket,
	EvaluatedBracket,
	SmearedEvaluatedBracket},
	UnevaluatedBracket={LeftOperand,RightOperand};
	EvaluatedBracket=PoissonBracketNewList[LeftOperand,RightOperand,ToShell->OptionValue@ToShell];
	SmearedEvaluatedBracket=SmearPoissonBracket[UnevaluatedBracket,EvaluatedBracket,LeftSmearing,RightSmearing,ToShell->OptionValue@ToShell];
SmearedEvaluatedBracket];
