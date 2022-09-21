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
