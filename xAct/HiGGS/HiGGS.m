(* this file provides the HiGGS package *)

(*xAct`HiGGS`$Version={"1.2.3",{2022,9,4}};*)
(**)
xAct`HiGGS`$Version={"1.2.3-developer",DateList@FileDate@$InputFileName~Drop~(-3)};
(**)

xAct`HiGGS`$Timing;
Off[Global`$Timing::shdw];
xAct`HiGGS`$Node;
Off[Global`$Node::shdw];


 
If[Unevaluated[xAct`xCore`Private`$LastPackage]===xAct`xCore`Private`$LastPackage,xAct`xCore`Private`$LastPackage="xAct`HiGGS`"];


 
BeginPackage["xAct`HiGGS`",{"xAct`xTensor`","xAct`xPerm`","xAct`xCore`","xAct`xTras`"}];


 
ParallelNeeds["xAct`HiGGS`"];


 
SetOptions[$FrontEndSession,EvaluationCompletionAction->"ScrollToOutput"];


 
Print[xAct`xCore`Private`bars];
Print["Package xAct`HiGGS`  version ",$Version[[1]],", ",$Version[[2]]];
Print["CopyRight \[Copyright] 2022, Will E. V. Barker, under the General Public License."];
Print[xAct`xCore`Private`bars];
Print["HiGGS is an open source dependent of the xAct bundle."];
Print["HiGGS incorporates example code by Cyril Pitrou."];
(*Print["HiGGS incorporates Cyril Pitrou's code from the public repository at https://github.com/xAct-contrib/examples."];*)
(*Print[xAct`xCore`Private`bars];*)


 
(*
If[!ValueQ@Global`$Timing,
Global`$Timing=False;
Global`$Node="";
];
*)
(*
Print["Some hard-to-suppress error messages may appear below..."];
*)
Quiet[
DistributeDefinitions@$Timing;
DistributeDefinitions@Global`$Timing;
If[!ValueQ@$Node,
$Node=Global`$Node;
If[!ValueQ@$Node,$Node=""];
DistributeDefinitions@$Node;
DistributeDefinitions@Global`$Node;
];
];
(*
Print["...and that should be it: no further errors should appear below here."];
Print[xAct`xCore`Private`bars];
*)
(*,Print["issues"],{$Node::shdw,Global`$Node::shdw,$Timing::shdw,Global`$Timing::shdw}*)


 
(*Because the developer version of HiGGS is not installed, and sits locally, we need this*)
(*was Needs called on the HiGGS package from a notebook?*)
If[NotebookDirectory[]==$Failed,$WorkingDirectory=Directory[];,$WorkingDirectory=NotebookDirectory[];,$WorkingDirectory=NotebookDirectory[];];
(*Print["The working directory is "<>$WorkingDirectory];*)
$Path~AppendTo~$WorkingDirectory;
$HiGGSInstallDirectory=Select[FileNameJoin[{#,"xAct/HiGGS"}]&/@$Path,DirectoryQ][[1]];
(*Print["At least one HiGGS installation directory was found at "<>$HiGGSInstallDirectory<>"."];
Print[xAct`xCore`Private`bars];*)


 
ActiveCellTags={"build"};
UnitTests={"CheckOrthogonalityToggle","ShowIrrepsToggle","ProjectionNormalisationsCheckToggle","ShowIrrepsToggle","documentation"};
PrematureCellTags={"TransferCouplingsPerpPerpToggle","TransferCouplingsPerpParaToggle"};
BinaryNames={"O13ProjectionsToggle","CompleteO3ProjectionsToggle","ProjectionNormalisationsToggle","CanonicalPhiToggle","NonCanonicalPhiToggle","ChiPerpToggle","ChiSingToggle","GeneralComplementsToggle","CDPiPToCDPiPO3","NesterFormIfConstraints","VelocityToggle"};
BuiltBinaries=BinaryNames~Select~(FileExistsQ@FileNameJoin@{$HiGGSInstallDirectory,"bin/build/"<>#<>".mx"}&);
ActiveCellTags=ActiveCellTags~Join~(BinaryNames~Complement~BuiltBinaries);


 
(*time when the package is called*)
$HiGGSBuildTime=AbsoluteTime[];
(*set up a file to record the start time of a job*)
$BuildTimeFilename=Quiet@FileNameJoin@{$WorkingDirectory,"svy","node-"<>$Node,"peta4.chr.mx"};
(*is this the first kernel launched in the job? if so, record start time to file, otherwise import the file*)
Quiet@If[!FileExistsQ@$BuildTimeFilename,
$BuildTimeFilename~DumpSave~{$HiGGSBuildTime},
ToExpression@("<<"<>$BuildTimeFilename<>";");
];
(*return time since start time*)
HiGGSAbsoluteTime[]:=Module[{},AbsoluteTime[]-$HiGGSBuildTime];


 
(*remember to modify this if you want to time another function in Global/Main.nb *)
$TimedFunctionList={"BuildHiGGS","DefTheory","Velocity","PoissonBracket","DeclareOrder","ToOrderCanonical","VarAction","ToNewCanonical"};
(*initial zeroes, i.e. the default line*)
$HiGGSTimingLine=0.~ConstantArray~(20*2Length@$TimedFunctionList);


 
(*which kernel are we in? This sets the file in which we record stats*)
$HiGGSTimingFile=Quiet@FileNameJoin@{$WorkingDirectory,"svy","node-"<>$Node,"chr","kernel-"<>ToString@$KernelID<>".chr.csv"};
(*a function which writes all current data to the kernel file*)
WriteHiGGSTimingData[]:=Module[{HiGGSOutputStream},
(*open the stream*)
HiGGSOutputStream=OpenAppend[$HiGGSTimingFile];
WriteString[HiGGSOutputStream,ExportString[#,"CSV"]]&@$HiGGSTimingData;
Close[HiGGSOutputStream];
(*Zero the data again, so that we don't have always to be carrying it around*)
$HiGGSTimingData={};
];


 
(*headers for the timing file*)
$HiGGSTimingData={};
(*$HiGGSTimingData~AppendTo~Flatten@(Flatten@(({#,#})&/@$TimedFunctionList)~ConstantArray~10)*)
$HiGGSTimingData~AppendTo~$HiGGSTimingLine;
(*open the kernel files and write the function headers*)
Quiet[WriteHiGGSTimingData[]];


 
(*Try timing, i.e. this only works to print to file once every $PauseSeconds*)
$PauseSeconds=6;
$LastMultiple=0;
TryTiming[]:=Module[{PrintDamper,HiGGSOutputStream,printer},
PrintDamper=AbsoluteTime[];
If[(Ceiling@PrintDamper~Divisible~$PauseSeconds)&&!(Ceiling@PrintDamper/$PauseSeconds==$LastMultiple),
printer=PrintTemporary[" ** TryTiming: recording timing statistics"];
(*
$HiGGSTimingFile~Export~$HiGGSTimingData;
*)
(*do all the writing here*)
WriteHiGGSTimingData[];
(*log the last multiple of seconds on which we were allowed to print*)
$LastMultiple=Ceiling@PrintDamper/$PauseSeconds;
NotebookDelete[printer];
];
];


 
(*This is redefined only when the theory batch is introduced, but only needed beyond that point anyway*)
Quiet@ToExpression["<<"<>FileNameJoin@{$WorkingDirectory,"svy","node-"<>$Node,"peta4.nom.mx"}<>";"];


 
(*don't try timing until we call the function in expr*)
TimeWrapper~SetAttributes~HoldAll;
(*the actual timing function*)
TimeWrapper[Label_String,expr_]:=Module[{res,temp,TimingNowPosition,TimingDurationPosition,$HiGGSTimingNow,$HiGGSTimingDuration,NewHiGGSTimingLine,PrintDamper},
If[Global`$Timing,
$HiGGSTimingNow=HiGGSAbsoluteTime[];
(*Label=ToString@Head@expr;*)(*nothing wrong with this, but we'll include it later*)
res=AbsoluteTiming@expr;
temp=Evaluate@res[[2]];
$HiGGSTimingDuration=Evaluate@res[[1]];
If[StringQ@$TheoryName,TimingDurationPosition=(2Length@$TimedFunctionList)(($TheoryNames~Position~$TheoryName)[[1]][[1]])+2((Flatten@($TimedFunctionList~Position~Label))[[1]]);,
TimingDurationPosition=2((Flatten@($TimedFunctionList~Position~Label))[[1]]);,
TimingDurationPosition=2((Flatten@($TimedFunctionList~Position~Label))[[1]]);];
TimingNowPosition=TimingDurationPosition-1;
NewHiGGSTimingLine=$HiGGSTimingLine~ReplacePart~(TimingDurationPosition->$HiGGSTimingDuration);
NewHiGGSTimingLine=NewHiGGSTimingLine~ReplacePart~(TimingNowPosition->$HiGGSTimingNow);
$HiGGSTimingData~AppendTo~NewHiGGSTimingLine;
(*need to be careful not to spend all our time printing *)
TryTiming[];,
temp=Evaluate@expr,
temp=Evaluate@expr];
temp];


 
ForceTiming[]:=WriteHiGGSTimingData[];


 
If[xAct`xCore`Private`$LastPackage==="xAct`HiGGS`",
Unset[xAct`xCore`Private`$LastPackage];
Print[xAct`xCore`Private`bars];
Print["These packages come with ABSOLUTELY NO WARRANTY; for details type Disclaimer[]. This is free software, and you are welcome to redistribute it under certain conditions. See the General Public License for details."];
Print[xAct`xCore`Private`bars]];


(* main provided functions *) 
BuildHiGGS::usage="BuildHiGGS[] builds the HiGGS environment, which is composed of many symbol definitions and up- and down-values across multiple xAct contexts.";
BuildSO3::usage="BuildSO3 is a boolean option for BuildHiGGS, which determines whether objects referring to the special orthogonal group in three dimensions, SO(3), are also to be built. Default is True.";
Recompile::usage="Recompile is a boolean option for BuildHiGGS, which determines whether to re-compile the sources and save the HiGGS environment into context binaries, or load these binaries. Default is False. Note that you may encounter permissions-related issues when attempting to re-compile a global install.";
ToNesterForm::usage="ToNesterForm[Expr] expresses Expr via human-readable spin-parity irreps of gauge-covariant quantities. In some sense, this \"simplifies\" the output of ToBasicForm.";
ToShell::usage="ToShell is an option for several functions, which determines whether the constraint shell of the defined theory should be imposed during the calculation. ToShell will eventually replace the string option \"ToShell\".";
xTensorCovD::usage="xTensorCovD is a boolean option for ToNesterForm, ToBasicForm and NonlinearPoissonBracket, which determines whether the new structure of xTensor CovD derivatives and induced metrics should be used. Default is False.";
ToBasicForm::usage="ToBasicForm[Expr] expresses Expr in terms of basic gauge fields. In some sense, this \"expands\" the output of ToNesterForm.";
PoissonBracket::usage="PoissonBracket[LeftOperand,RightOperand] calculates a Poisson bracket between the operands.";
Parallel::usage="Parallel is an option for several functions, which determines whether the calculation should be parallelised. Parallel will eventually replace the string option \"Parallel\".";
NonlinearPoissonBracket::usage="NonlinearPoissonBracket[LeftOperand,RightOperand,Options] evaluates the nonlinear Poisson bracket {LeftOperand,RightOperand}, where both arguments must be in Nester form, as tested by NesterFormQ. Options are Parallel->False, ToShell->True and xTensorCovD->False.";
DefTheory::usage="DefTheory[System] defines a theory using System, a system of equations to constrain the coupling coefficients.";
UndefTheory::usage="UndefTheory[TheoryName] undefines a named theory.";
StudyTheory::usage="StudyTheory[TheoryName] calculates the primary Poisson matrix and velocities of a named theory.";
Velocity::usage="DEPRECIATED in v 2.0.0";
NesterFormQ::usage="NesterFormQ[Expr] gives True if Expr is a valid tensor expression in Nester form, and False otherwise.";

(* convenience wrappers, for use beyond HiGGS *)
MakeQuotientRule::usage="MakeQuotientRule[{xTensor,Expr}] makes a rule which takes an expression Expr containing single instance of an xTensor, with a specified valence and some constant or scalar coefficient, assumes that same expression to be zero, and replaces future instances of that xTensor accordingly. The options include the same options as for MakeRule.";
Canonicalise::usage="Canonicalise is an option for MakeQuotientRule, which determines whether ToCanonical is run on the solved expression. Default is True.";
Verify::usage="Verify is an option for MakeQuotientRule, which determines whether the action of the rule is verified.";
ToNewCanonical::usage="ToNewCanonical[Expr] is a convenience wrapper for ScreenDollarIndices@ContractMetric@ToCanonical@Expr. As of v2.0.0 it includes some functionality to remove projection operators.";

(* variables *) 
$Theory::usage="The gauge theory as defined by a system of equations which constrains the coupling coefficients";

Begin["xAct`HiGGS`Private`"];

(* delete print cells during build *)
$PrintCellsBeforeBuildHiGGS=.;
ClearBuild[]:=NotebookDelete@(Flatten@Cells[SelectedNotebook[],CellStyle->{"Print"}]~Complement~$PrintCellsBeforeBuildHiGGS);
BuildGlobally[FileName_String]:=(Get[FileNameJoin@{$HiGGSInstallDirectory,"Global",FileName}];ClearBuild[]);
BuildPrivately[FileName_String]:=Get[FileNameJoin@{$HiGGSInstallDirectory,"Private",FileName}];

(* load all the functions which were written directly into vim *)

BuildHiGGSPrivate[]:=BuildPrivately/@{
	"BuildHiGGS.m",
	"ToNewCanonical.m",
	"MakeQuotientRule.m",
	"ToNesterForm.m",
	"ToBasicForm.m",
	"Smearing.m",
	"NesterFormQ.m",
	"CovD.m",
	"Induced.m",
	"PoissonBracket.m",
	"DefTheory.m",
	"ViewTheory.m",
	"StudyTheory.m"};

BuildHiGGSPrivate[];

(* if you want to recompile the HiGGS sources, pass "Recompile->True" to the command below *)
BuildHiGGS[];
 
End[];
EndPackage[];
