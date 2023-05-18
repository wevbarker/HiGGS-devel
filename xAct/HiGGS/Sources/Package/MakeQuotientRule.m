(*====================*)
(*  MakeQuotientRule  *)
(*====================*)

Options[MakeQuotientRule]={
	MetricOn->All,
	ContractMetrics->True,
	Canonicalise->True,
	Verify->False,
	Method->"SolveTensors"};

MakeQuotientRule::method="Option Method should be strings \"SolveTensors\" or \"Coefficient\".";

MakeQuotientRule[{xTensor_[Indices___],Expr_},OptionsPattern[]]:=Module[{
	QuotientRule,
	ScalarCoefficient,
	ReplacementValue,
	SelfApplied,
	PrintVariable},

	PrintVariable={};
	PrintVariable=PrintVariable~Append~PrintTemporary@" ** MakeQuotientRule...";

	Switch[OptionValue@Method,
		"SolveTensors",
		QuotientRule=First@SolveTensors[Expr==0,xTensor[Indices]];,
		"Coefficient",
		ScalarCoefficient=Expr~Coefficient~xTensor[Indices];
		ReplacementValue=Evaluate@(-(Expr-xTensor[Indices] ScalarCoefficient)/ScalarCoefficient);
		QuotientRule=MakeRule[{xTensor[Indices],Evaluate@ReplacementValue},MetricOn->OptionValue@MetricOn,ContractMetrics->OptionValue@ContractMetrics];,
		_,Throw@Message@(MakeQuotientRule::method)
	];

	If[OptionValue@Canonicalise,
		(*Print@" ** MakeQuotientRule: canonicalised expression with tensor substituted by rule:";*)ReplacementValue=ToCanonical@ReplacementValue;
	];

	If[OptionValue@Verify,
		PrintVariable=PrintVariable~Append~PrintTemporary@" ** ToCanonical...";SelfApplied=Expr/.QuotientRule;SelfApplied=SelfApplied//NoScalar;SelfApplied=SelfApplied//ToCanonical;Print@SelfApplied;
	];

	NotebookDelete@PrintVariable;

QuotientRule];
