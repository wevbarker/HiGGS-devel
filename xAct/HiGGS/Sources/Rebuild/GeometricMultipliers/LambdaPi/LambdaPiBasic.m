(*===============*)
(*  LambdaPiBasic  *)
(*===============*)

RLambdaPiSymb="\!\(\*SubscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalR]\)]\)"
DefTensor[RLambdaPi[a, b, -d, -e], M4, {Antisymmetric[{a, b}], Antisymmetric[{-d, -e}]},PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaPiSymb]]; 
TLambdaPiSymb="\!\(\*SubscriptBox[\(\[CurlyPi]\), \(\[ScriptCapitalT]\)]\)";
DefTensor[TLambdaPi[a, -d, -e], M4, Antisymmetric[{-d, -e}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaPiSymb]]; 
