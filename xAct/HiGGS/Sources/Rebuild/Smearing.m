(*============*)
(*  Smearing  *)
(*============*)

(*This snippet is a patch to the Global` part of the build, to be implemented near PoissonBracket, so that xAct`HiGGS`Private`PrintPoissonBracket is facilitated. These lines just define the smearing functions.*)

(*some dummy coordinate functions, where x^0 is the time which defines the slicing*)
Dummies1=Table[Superscript[\[ScriptX],i],{i,0,3}];
Dummies2={Dummies1[[1]]}~Join~Table[Superscript[\[ScriptY],i],{i,1,3}];

(*the smearing functions, and their gauge-covariant (with greek index) derivatives*)

SmearingLeftSymb="\[ScriptCapitalS]";
SmearingRightSymb="\[ScriptCapitalS]";

DefTensor[SmearingLeft[AnyIndices@TangentM4],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[SmearingLeftSymb,xAct`HiGGS`Private`SmearingLeftIndex,"Smearing"->True]];
DefTensor[SmearingRight[AnyIndices@TangentM4],M4,PrintAs->xAct`HiGGS`Private`SymbolBuild[SmearingRightSymb,xAct`HiGGS`Private`SmearingRightIndex,"Smearing"->True]];

(*make sure that the internal covariant derivative cannot act on the smearing functions*)

xAct`HiGGS`Private`LeibnizListCovD[Index_][SmearingLeft[Indices__]]^=0;
xAct`HiGGS`Private`LeibnizListCovD[Index_][SmearingRight[Indices__]]^=0;
