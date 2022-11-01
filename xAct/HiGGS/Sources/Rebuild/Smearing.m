(*This snippet is a patch to the Global` part of the build, to be implemented near PoissonBracket, so that xAct`HiGGS`Private`PrintPoissonBracket is facilitated. These lines just define the smearing functions.*)

(*some dummy coordinate functions, where x^0 is the time which defines the slicing*)
Dummies1=Table[Superscript[\[ScriptX],i],{i,0,3}];
Dummies2={Dummies1[[1]]}~Join~Table[Superscript[\[ScriptY],i],{i,1,3}];

(*the smearing functions, and their gauge-covariant (with greek index) derivatives*)

SmearingLeftSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalS]\), \((1)\)]\)";
SmearingRightSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalS]\), \((2)\)]\)";

DefTensor[SmearingLeft[AnyIndices@TangentM4],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild@SmearingLeftSymb];
DefTensor[SmearingRight[AnyIndices@TangentM4],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild@SmearingRightSymb];
