(*This would have produced a set of tensors with variable numbers of indices, but xAct actually supports a better way!*)
(*
(UndefTensor@Symbol@"Smearing1";DefTensor[(Symbol@"Smearing1")@@(ToExpression/@Alphabet[][[1;;i]]),M4,PrintAs->SymbolBuild[(ToString@\[ScriptS])]];)~Table~({i,0,10});
*)
(*SmearingLeftSymb=(ToString@\[ScriptCapitalS])<>"1";*)
SmearingLeftSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalS]\), \((1)\)]\)";
DSmearingLeftSymb=(ToString@\[GothicCapitalD])<>SmearingLeftSymb;
DDSmearingLeftSymb=(ToString@\[GothicCapitalD])<>DSmearingLeftSymb;
SmearingRightSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalS]\), \((2)\)]\)";
DSmearingRightSymb=(ToString@\[GothicCapitalD])<>SmearingRightSymb;
DDSmearingRightSymb=(ToString@\[GothicCapitalD])<>DSmearingRightSymb;
UndefTensor@SmearingLeft;
DefTensor[SmearingLeft[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@SmearingLeftSymb];
UndefTensor@DSmearingLeft;
DefTensor[DSmearingLeft[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@DSmearingLeftSymb];
UndefTensor@DDSmearingLeft;
DefTensor[DDSmearingLeft[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@DDSmearingLeftSymb];
UndefTensor@SmearingRight;
DefTensor[SmearingRight[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@SmearingRightSymb];
UndefTensor@DSmearingRight;
DefTensor[DSmearingRight[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@DSmearingRightSymb];
UndefTensor@DDSmearingRight;
DefTensor[DDSmearingRight[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@DDSmearingRightSymb];


