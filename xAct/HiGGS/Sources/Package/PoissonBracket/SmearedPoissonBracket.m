(*===========================*)
(*  SmearedEvaluatedBracket  *)
(*===========================*)

(*----------------------------------------------------------*)
(*  A function to form the Poisson bracket on a given term  *)
(*----------------------------------------------------------*)

Options[SmearedPoissonBracket]={ToShell->False};
SmearedPoissonBracket[{LeftOperand_,LeftSmearing_},{RightOperand_,RightSmearing_},OptionsPattern[]]:=Catch@Module[{
	PrintVariable,
	UnevaluatedBracket,
	EvaluatedBracket,
	SmearedEvaluatedBracket},

	PrintVariable=PrintTemporary@" ** xAct`HiGGS`Private`SmearedPoissonBracket...";

	UnevaluatedBracket={LeftOperand,RightOperand};
	EvaluatedBracket=PoissonBracketOfAtoms[LeftOperand,RightOperand,ToShell->OptionValue@ToShell];
	SmearedEvaluatedBracket=SmearPoissonBracket[UnevaluatedBracket,EvaluatedBracket,LeftSmearing,RightSmearing,ToShell->OptionValue@ToShell];

	NotebookDelete@PrintVariable;

SmearedEvaluatedBracket];
