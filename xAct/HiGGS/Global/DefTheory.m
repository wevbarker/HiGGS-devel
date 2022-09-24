Options[DefTheoryParallel]={"Export"->False,"Import"->False,"Velocities"->True,"Order"->1};

DefTheoryParallel[InputSystem___:Null,OptionsPattern[]]:=Module[{},
(*$Timing=True;*)
BuildHiGGS[];
(*import theory names*)
Quiet@ToExpression["<<"<>FileNameJoin@{$WorkingDirectory,"svy","node-"<>$Node,"peta4.nom.mx"}<>";"];
(*Define the theory*)
DefTheory[InputSystem,"Export"->OptionValue["Export"],"Import"->OptionValue["Import"],"Velocities"->OptionValue@"Velocities","Order"->OptionValue@"Order"];
ForceTiming[];
];
DistributeDefinitions@DefTheoryParallel;

(*so that a replacement rule exists, even if no theory is defined*)
dummySymb="\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(matter\)]\)";
DefConstantSymbol[dummy,PrintAs->SymbolBuild[dummySymb]];
Global`$ToTheory={dummy->0};
