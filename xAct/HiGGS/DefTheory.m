TheoryQ[x_]:=Module[{Bool},
	Bool=ListQ[x];
	If[Bool,
	Bool=Flatten@{{Globl`Alp0},Globl`Alp,Globl`Bet,Globl`cAlp,Globl`cBet}~SubsetQ~Flatten@(Variables/@Flatten@((List@@(#))&/@x));
];
Bool];

DefTheory::nottheory="Argument `1` is not a linear system in Alp0,...,Alp6, Bet1,...,Bet3, cAlp1,...,cAlp6 and cBet1,...,cBet3, e.g. {Alp0+Alp1==0,...}.";
DefTheory::nobin="The binary at `1` cannot be found; quitting.";

Options[DefTheory]={
	"Export"->False,
	"Import"->False,
	"Velocities"->False,
	"Order"->1,
	"ProtectSurface"->False};

UndefTheory[]:=Clear@@{"xAct`HiGGS`$TheoryName","xAct`HiGGS`$Theory","Global`$ToTheory","Global`$ToShellFreedoms","Global`$StrengthPShellToStrengthPO3","Global`$PiPShellToPiPPO3","Global`$TheoryCDPiPToCDPiPO3","Global`$TheoryPiPToPiPO3","Global`$IfConstraintToTheoryNesterForm","Global`$IfConstraints","Global`$InertVelocity","Global`$ToOrderRules","Global`$PPM","Global`$Velocities"};

DefTheory[InputSystem___:Null,OptionsPattern[]]:=Catch@Module[{},
(*Firstly we remove all definitions which might be associated with a theory already*)
UndefTheory[];
If[StringQ@OptionValue@"Import",
HiGGSPrint[" ** DefTheory: Incorporating the binary at "<>FileNameJoin@{"svy",OptionValue@"Import"<>".thr.mx"}];
xAct`HiGGS`$TheoryName=OptionValue@"Import";
Check[ToExpression["<<"<>FileNameJoin@{$WorkingDirectory,"svy",OptionValue@"Import"<>".thr.mx"}<>";"],
Throw@Message[DefTheory::nobin,FileNameJoin@{$WorkingDirectory,"svy",ToString@OptionValue@"Import"<>".thr.mx"}];
Quit[];
];,
(*check if a real theory was provided*)
If[!TheoryQ[InputSystem],Throw@Message[DefTheory::nottheory,InputSystem]];
(*define the theory constant in Global`*)
xAct`HiGGS`$Theory=InputSystem;
xAct`HiGGS`$Theory=xAct`HiGGS`$Theory~Join~{dummy->0};
(*a message*)
xAct`xTensor`Private`MakeDefInfo[DefTheory,xAct`HiGGS`$Theory,{"$ToTheory for the theory",""}];
(*these are rules we can always use to impose the theory*)
If[xAct`HiGGS`$Theory=={dummy->0},
Global`$ToTheory={dummy->0};,
Global`$ToTheory=Quiet[Solve[InputSystem,Join[cAlp,cBet,{Alp0},Alp,Bet]][[1]]];
];
(*append a dummy replacement rule so that an empty *)
(*these functions do all the hard work*)
ComputeShellFreedoms[Global`$ToTheory,xAct`HiGGS`$Theory];
Print@Global`$ToShellFreedoms;
DefFieldStrengthShell[Global`$ToShellFreedoms,xAct`HiGGS`$Theory];
DefMomentaShell[Global`$ToShellFreedoms,Global`$ToTheory,xAct`HiGGS`$Theory];
DefO3MomentaShell[xAct`HiGGS`$Theory];
DefIfConstraintToTheoryNesterForm[Global`$ToShellFreedoms,Global`$ToTheory,xAct`HiGGS`$Theory];
DefSuperHamiltonian[Global`$ToShellFreedoms,Global`$IfConstraintToNesterForm,Global`$ToTheory,xAct`HiGGS`$Theory,"Order"->OptionValue@"Order","ProtectSurface"->OptionValue@"ProtectSurface"];
DefLinearSuperMomentum[Global`$ToShellFreedoms,Global`$IfConstraintToNesterForm,Global`$ToTheory,xAct`HiGGS`$Theory,"Order"->OptionValue@"Order","ProtectSurface"->OptionValue@"ProtectSurface"];
DefAngularSuperMomentum[Global`$ToShellFreedoms,Global`$IfConstraintToNesterForm,Global`$ToTheory,xAct`HiGGS`$Theory,"Order"->OptionValue@"Order","ProtectSurface"->OptionValue@"ProtectSurface"];
If[OptionValue@"Velocities",
DefInertVelocity[Global`$ToShellFreedoms,Global`$ToTheory,xAct`HiGGS`$Theory];
];
];
If[StringQ@OptionValue@"Export",
HiGGSPrint[" ** DefTheory: Exporting the binary at "<>FileNameJoin@{"svy",OptionValue@"Export"<>".thr.mx"}];
xAct`HiGGS`$TheoryName=OptionValue@"Export";
Print@Global`$IfConstraints;
(FileNameJoin@{$WorkingDirectory,"svy",ToString@OptionValue@"Export"<>".thr.mx"})~DumpSave~{xAct`HiGGS`$TheoryName,xAct`HiGGS`$Theory,Global`$ToTheory,Global`$ToShellFreedoms,Global`$StrengthPShellToStrengthPO3,Global`$PiPShellToPiPPO3,Global`$TheoryCDPiPToCDPiPO3,Global`$TheoryPiPToPiPO3,Global`$IfConstraintToTheoryNesterForm,Global`$IfConstraints,Global`$InertVelocity,Global`$ToOrderRules};
];
];
(*so that a replacement rule exists, even if no theory is defined*)
dummySymb="\!\(\*SubscriptBox[\(\[ScriptCapitalL]\), \(matter\)]\)";
DefConstantSymbol[dummy,PrintAs->SymbolBuild[dummySymb]];
Global`$ToTheory={dummy->0};
