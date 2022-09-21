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


 
BuildHiGGS::usage="Rebuild the HiGGS session";
ToNesterForm::usage="Express quantity in terms of human-readable irreps";
ToBasicForm::usage="Express quantity in terms of basic gauge fields";
PoissonBracket::usage="Calculate a Poisson bracket between two quantities";
NonlinearPoissonBracket::usage="NonlinearPoissonBracket[LeftOperand,RightOperand,Options] evaluates the nonlinear Poisson bracket {LeftOperand,RightOperand}, where both arguments must be in Nester form, as tested by NesterFormQ. Options are Parallel->False, ToShell->True and xTensorCovD->False.";
DefTheory::usage="Define a theory using a system of equations to constrain the coupling coefficients";
UndefTheory::usage="Undefine a theory using a system of equations to constrain the coupling coefficients";
StudyTheory::usage="Calculate the links in the constraint chain down do a certain level";
Velocity::usage="Calculate the velocity of a quantity with respect to the Hamiltonian indicated by DefTheory";



MakeQuotientRule::usage="MakeQuotientRule[{xTensor,Expr}] makes a rule which takes an expression Expr containing single instance of an xTensor, with a specified valence and some constant or scalar coefficient, assumes that same expression to be zero, and replaces future instances of that xTensor accordingly. The options include the same options as for MakeRule.";
ToNewCanonical::usage="ToNewCanonical[Expr] is a convenience wrapper for ScreenDollarIndices@ContractMetric@ToCanonical@Expr.";
NesterFormQ::usage="NesterFormQ[expr] gives True if expr is a valid tensor expression in Nester form, and False otherwise.";
BuildSO3::usage="BuildSO3 is a boolean option for BuildHiGGS, which determines whether objects referring to the special orthogonal group in three dimensions, SO(3), are also to be built. Default is True.";
Canonicalise::usage="Canonicalise is an option for MakeQuotientRule, which determines whether ToCanonical is run on the solved expression.";
Verify::usage="Verify is an option for MakeQuotientRule, which determines whether the action of the rule is verified.";
Parallel::usage="Parallel is an option for several functions, which determines whether the calculation should be parallelised. Parallel will eventually replace the string option \"Parallel\".";
ToShell::usage="ToShell is an option for several functions, which determines whether the constraint shell of the defined theory should be imposed during the calculation. ToShell will eventually replace the string option \"ToShell\".";
xTensorCovD::usage="xTensorCovD is a boolean option for ToNesterForm, ToBasicForm and NonlinearPoissonBracket, which determines whether the new structure of xTensor CovD derivatives and induced metrics should be used. Default is False.";

 
$Theory::usage="The gauge theory as defined by a system of equations which constrains the coupling coefficients";

Begin["xAct`HiGGS`Private`"];

(*HiGGS cannot build itself more than once, since xAct does not forgive mutability...!*)
$HiGGSBuilt=False;
BuildHiGGS::built="The HiGGS environment has already been built.";
Options@BuildHiGGS={BuildSO3->True};
BuildHiGGS[OptionsPattern[]]:="BuildHiGGS"~TimeWrapper~Catch@Module[{PriorMemory,UsedMemory},
(*A message*)
xAct`xTensor`Private`MakeDefInfo[BuildHiGGS,$KernelID,{"HiGGS environment for kernel",""}];
(*Check for pre-existing build*)
If[$HiGGSBuilt,Throw@Message[BuildHiGGS::built]];
(*List of all print cells in front end before this notebook starts to run*)
$PrintCellsBeforeStartBuildHiGGS=Flatten@Cells[SelectedNotebook[],CellStyle->{"Print"}];
PriorMemory=MemoryInUse[];
Print[" ** BuildHiGGS: RAM used by kernel ",$KernelID," is ",Dynamic[Refresh[MemoryInUse[],UpdateInterval->1]]," bytes."];
Print[" ** BuildHiGGS: Building session from ",FileNameJoin@{$HiGGSInstallDirectory,"Global","Main.nb"}," with active CellTags ",ActiveCellTags,"."];
Get[FileNameJoin@{$HiGGSInstallDirectory,"Global","Main.m"}];
If[OptionValue@BuildSO3,
Get[FileNameJoin@{$HiGGSInstallDirectory,"Global","SO3.m"}];
];
(*Purge all cells created during build process*)
Pause[2];
UsedMemory=MemoryInUse[]-PriorMemory;
NotebookDelete@(Flatten@Cells[SelectedNotebook[],CellStyle->{"Print"}]~Complement~$PrintCellsBeforeStartBuildHiGGS);
Print[" ** BuildHiGGS: If build was successful, the HiGGS environment is now ready to use and is occupying ",UsedMemory," bytes in RAM."];
$HiGGSBuilt=True;
];

GPToFoliG={DummyReplacementVariable->0};

ToNewCanonical[Expr_]:="ToNewCanonical"~TimeWrapper~Module[{temp,printer},
	printer=PrintTemporary[" ** ToNewCanonical..."];

	(*Beep[];*)
	temp=Expr//ToCanonical;
	temp=temp/.GPToFoliG;
	temp=temp//ContractMetric;
	temp=temp//ScreenDollarIndices;
	NotebookDelete@printer;
temp];

Options[MakeQuotientRule]={MetricOn->All,ContractMetrics->True,Canonicalise->True,Verify->True,Method->"SolveTensors"};
MakeQuotientRule::method="Option Method should be strings \"SolveTensors\" or \"Coefficient\".";
MakeQuotientRule[{xTensor_[Indices___],Expr_},OptionsPattern[]]:=Catch@Module[{QuotientRule,ScalarCoefficient,ReplacementValue,SelfApplied,printer},
printer={};
printer=printer~Append~PrintTemporary@" ** MakeQuotientRule...";
Switch[OptionValue@Method,"SolveTensors",
QuotientRule=First@SolveTensors[Expr==0,xTensor[Indices]];,
"Coefficient",
ScalarCoefficient=Expr~Coefficient~xTensor[Indices];
ReplacementValue=Evaluate@(-(Expr-xTensor[Indices] ScalarCoefficient)/ScalarCoefficient);
QuotientRule=MakeRule[{xTensor[Indices],Evaluate@ReplacementValue},MetricOn->OptionValue@MetricOn,ContractMetrics->OptionValue@ContractMetrics];,
_,Throw@Message@(MakeQuotientRule::method)];
If[OptionValue@Canonicalise,Print@" ** MakeQuotientRule: canonicalised expression with tensor substituted by rule:";ReplacementValue=ToCanonical@ReplacementValue;];
If[OptionValue@Verify,printer=printer~Append~PrintTemporary@" ** ToCanonical...";SelfApplied=Expr/.QuotientRule;SelfApplied=SelfApplied//NoScalar;SelfApplied=SelfApplied//ToCanonical;Print@SelfApplied;];
NotebookDelete@printer;
QuotientRule];

(* delete print cells during build *)
$PrintCellsBeforeBuildHiGGS=.;
ClearBuild[]:=NotebookDelete@(Flatten@Cells[SelectedNotebook[],CellStyle->{"Print"}]~Complement~$PrintCellsBeforeBuildHiGGS);
BuildGlobally[FileName_String]:=(Get[FileNameJoin@{$HiGGSInstallDirectory,"Global",FileName}];ClearBuild[]);
BuildPrivately[FileName_String]:=Get[FileNameJoin@{$HiGGSInstallDirectory,FileName}];

(* load all the functions which were written directly into vim *)

BuildPrivately/@{
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


TrialContexts={"Evaluators`CloudKernels`", "Evaluators`CloudKernels`Private`", \
"Evaluators`LocalKernels`", "Evaluators`LocalKernels`Private`", \
"Evaluators`LWGKernels`", "Evaluators`LWGKernels`Private`", \
"Evaluators`SelfKernels`", "Evaluators`SelfKernels`Private`", \
"Evaluators`SshKernels`", "Evaluators`SshKernels`Private`", \
"Evaluators`WSTPServerKernels`", \
"Evaluators`WSTPServerKernels`Private`", "FEImage3D`", "Forms`", \
"Globl`", "Graphics`GraphicsGridDump`", "Image`Utilities`Private`", \
"KernelConfiguration`Private`", "KernelObject`Private`", \
"KernelObjects`Implementations`Private`", "Language`ContainsDump`", \
"Language`SequencesDump`", "LightweightGridClient`", \
"LightweightGridClient`Kernel`", "MachineLearning`PackageScope`", \
"MessageMenu`Dump`", "NotebookTools`ControlsDump`", \
"OpenCVLink`FilteringOps`", "OpenCVLink`PhotoOps`", \
"Parallel`Client`", "Parallel`Client`Private`", "Parallel`Combine`", \
"Parallel`Combine`Private`", "Parallel`Concurrency`", \
"Parallel`Concurrency`Private`", "Parallel`Debug`Perfmon`", \
"Parallel`Debug`Perfmon`Private`", "Parallel`Debug`Private`", \
"Parallel`Evaluate`Private`", "Parallel`Kernels`", \
"Parallel`Kernels`Private`", "Parallel`OldClient`", \
"Parallel`Parallel`Private`", "Parallel`Protected`", \
"Parallel`Protected`Private`", "Parallel`Queue`FIFO`", \
"Parallel`Queue`FIFO`Private`", "Parallel`Queue`Interface`", \
"Parallel`Queue`Interface`Private`", "Parallel`Queue`Priority`", \
"Parallel`Queue`Priority`Private`", "Parallel`Settings`Private`", \
"Parallel`Status`", "Parallel`Status`Private`", \
"Parallel`VirtualShared`Private`", "SubKernels`", \
"SubKernels`Protected`", "SVTools`", "SVTools`Private`", \
"SVTools`Private`LLU`", "SVTools`Private`LLU`Logger`", \
"SVTools`Private`LLU`Private`", "System`HypergeometricDump`", \
"System`MeijerGDump`", "Templating`Evaluator`PackagePrivate`", \
"Templating`Files`PackagePrivate`", \
"Templating`GenerateHTTPResponse`PackagePrivate`", \
"Templating`HTMLExport`PackagePrivate`", \
"Templating`HTML`PackagePrivate`", "Templating`PackageScope`", \
"Templating`Pagination`PackagePrivate`", \
"Templating`PanelLanguage`PackagePrivate`", \
"Templating`Parsing`PackagePrivate`", \
"Templating`Primitives`PackagePrivate`", "Templating`Private`", \
"Templating`Utils`PackagePrivate`", "Workbench`", "WrappersDump`", \
"WSTPCommand`", "xAct`ExpressionManipulation`", \
"xAct`ExpressionManipulation`Private`", "xAct`HiGGS`", \
"xAct`HiGGS`Private`", "xAct`Invar`", "xAct`Invar`Private`", \
"xAct`Spinors`", "xAct`Spinors`Private`", "xAct`SymManipulator`", \
"xAct`SymManipulator`Private`", "xAct`TexAct`", \
"xAct`TexAct`Private`", "xAct`xCoba`", "xAct`xCoba`Private`", \
"xAct`xCore`", "xAct`xCore`Private`", "xAct`xPerm`", \
"xAct`xPerm`Private`", "xAct`xPert`", "xAct`xPert`Private`", \
"xAct`xTableau`", "xAct`xTensor`", "xAct`xTensor`Private`", \
"xAct`xTras`", "xAct`xTras`Private`", "$`", "$CellContext`"};

SaveEverything[]:=DumpSave[FileNameJoin[{"$WorkingDirectory","SaveEverything.mx"}],TrialContexts];

 
End[];
EndPackage[];
