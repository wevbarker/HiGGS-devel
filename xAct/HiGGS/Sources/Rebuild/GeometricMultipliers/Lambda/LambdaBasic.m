(*===============*)
(*  LambdaBasic  *)
(*===============*)

RLambdaSymb="\!\(\*SubscriptBox[\(\[Lambda]\), \(\[ScriptCapitalR]\)]\)"
DefTensor[RLambda[a, b, -d, -e], M4, {Antisymmetric[{a, b}], Antisymmetric[{-d, -e}]},PrintAs->xAct`HiGGS`Private`SymbolBuild[RLambdaSymb]]; 
TLambdaSymb="\!\(\*SubscriptBox[\(\[Lambda]\), \(\[ScriptCapitalT]\)]\)";
DefTensor[TLambda[a, -d, -e], M4, Antisymmetric[{-d, -e}],PrintAs->xAct`HiGGS`Private`SymbolBuild[TLambdaSymb]]; 
