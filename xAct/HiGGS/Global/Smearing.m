(*This snippet is a patch to the Global` part of the build, to be implemented near PoissonBracket, so that xAct`HiGGS`Private`PrintPoissonBracket is facilitated. These lines just define the smearing functions.*)

(*some dummy coordinate functions, where x^0 is the time which defines the slicing*)
Dummies1=Table[Superscript[\[ScriptX],i],{i,0,3}];
Dummies2={Dummies1[[1]]}~Join~Table[Superscript[\[ScriptY],i],{i,1,3}];

(*the smearing functions, and their gauge-covariant (with greek index) derivatives*)

SmearingLeftSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalS]\), \((1)\)]\)";
DSmearingLeftSymb=(ToString@\[GothicCapitalD])<>SmearingLeftSymb;
DDSmearingLeftSymb=(ToString@\[GothicCapitalD])<>DSmearingLeftSymb;

SmearingRightSymb="\!\(\*SubscriptBox[\(\[ScriptCapitalS]\), \((2)\)]\)";
DSmearingRightSymb=(ToString@\[GothicCapitalD])<>SmearingRightSymb;
DDSmearingRightSymb=(ToString@\[GothicCapitalD])<>DSmearingRightSymb;

DefTensor[SmearingLeft[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@SmearingLeftSymb];
DefTensor[DSmearingLeft[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@DSmearingLeftSymb];
DefTensor[DDSmearingLeft[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@DDSmearingLeftSymb];
DefTensor[SmearingRight[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@SmearingRightSymb];
DefTensor[DSmearingRight[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@DSmearingRightSymb];
DefTensor[DDSmearingRight[AnyIndices@TangentM4],M4,PrintAs->SymbolBuild@DDSmearingRightSymb];
