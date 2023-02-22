(*=========*)
(*  HiGGS  *)
(*=========*)

(*-----------------------*)
(*  Cosmetic to-do list  *)
(*-----------------------*)

(*
- redundant projection operators on derivatives of the spatial measure
- general indices for PoissonBracket please.
- clear up ambiguity over what G actually means, and how it prints
- dollar indices in the intermediate expressions
- one of the example lines of code in the README is wrong, as pointed out by Zhiyuan! It the code corresponds to a `surficial' commutator, so look at the image file to see what is actually needed. 
*)

(*----------------------*)
(*  Serious to-do list  *)
(*----------------------*)

(*
- check the validity of the overall bracket
- Ambiguous use of ToShell for super-Hamiltonian
- RP1p//ToBasicForm//ToNesterForm is returning NEGATIVE of RP1p! Problem appears not to affect momenta and torsion, so there is likely some typo/coonvention clash in the binary sources
- check effect on novel theories of the ToBasicForm problem with decomposed Lagrange multipliers
- shift variables to xAct`HiGGS`
- shift variables into xAct`HiGGS`Private`
*)

(*------------------------------*)
(*  Change version number here  *)
(*------------------------------*)

(*
xAct`HiGGS`$Version={"2.0.0",{2022,11,4}};
*)
xAct`HiGGS`$Version={"2.0.0-developer",DateList@FileDate@$InputFileName~Drop~(-3)};

(*----------------------------------*)
(*  Suppress some shadowing errors  *)
(*----------------------------------*)

xAct`HiGGS`$Timing;
Off[Global`$Timing::shdw];
xAct`HiGGS`$Node;
Off[Global`$Node::shdw];
 
If[Unevaluated[xAct`xCore`Private`$LastPackage]===xAct`xCore`Private`$LastPackage,xAct`xCore`Private`$LastPackage="xAct`HiGGS`"];

(*===============*)
(*  xAct`HiGGS`  *)
(*===============*)
 
BeginPackage["xAct`HiGGS`",{"xAct`xTensor`","xAct`xPerm`","xAct`xCore`","xAct`xTras`"}];
 
ParallelNeeds["xAct`HiGGS`"];

(*----------------------------------------------------------------------------------------------*)
(*  The Hamiltonian analysis makes some long outputs, so it is prererable to scroll to the end  *)
(*----------------------------------------------------------------------------------------------*)
 
SetOptions[$FrontEndSession,EvaluationCompletionAction->"ScrollToOutput"];
 
Print[xAct`xCore`Private`bars];
Print["Package xAct`HiGGS`  version ",$Version[[1]],", ",$Version[[2]]];
Print["CopyRight \[Copyright] 2022, Will E. V. Barker and Manuel Hohmann, under the General Public License."];
Print[xAct`xCore`Private`bars];
Print["HiGGS incorporates code by Cyril Pitrou."];

(*-------------------------------------------------------------------*)
(*  Modify the path to accommodate notebook and install directories  *)
(*-------------------------------------------------------------------*)

Quiet@If[NotebookDirectory[]==$Failed,$WorkingDirectory=Directory[];,$WorkingDirectory=NotebookDirectory[];,$WorkingDirectory=NotebookDirectory[];];
$Path~AppendTo~$WorkingDirectory;
$HiGGSInstallDirectory=Select[FileNameJoin[{#,"xAct/HiGGS"}]&/@$Path,DirectoryQ][[1]];
  
(*------------------------------*)
(*  Node variable for HPC use   *)
(*------------------------------*)
 
Quiet[
If[!ValueQ@$Node,
$Node=Global`$Node;
If[!ValueQ@$Node,$Node=""];
DistributeDefinitions@$Node;
DistributeDefinitions@Global`$Node;
];
];
Quiet@ToExpression["<<"<>FileNameJoin@{$WorkingDirectory,"svy","node-"<>$Node,"peta4.nom.mx"}<>";"];
 
(*--------------*)
(*  Disclaimer  *)
(*--------------*)
 
If[xAct`xCore`Private`$LastPackage==="xAct`HiGGS`",
Unset[xAct`xCore`Private`$LastPackage];
Print[xAct`xCore`Private`bars];
Print["These packages come with ABSOLUTELY NO WARRANTY; for details type Disclaimer[]. This is free software, and you are welcome to redistribute it under certain conditions. See the General Public License for details."];
Print[xAct`xCore`Private`bars]];

(*----------------------------------------------------------*)
(*  Declaration of provied functions and symbols for HiGGS  *)
(*----------------------------------------------------------*)

NesterFormQ::usage="NesterFormQ[Expr] gives True if Expr is a valid tensor expression in Nester form, and False otherwise.";
ToNesterForm::usage="ToNesterForm[Expr] expresses Expr via human-readable spin-parity irreps of gauge-covariant quantities. All Greek (coordinate) indices are replaced by Roman (Lorentzian) indices, there are no time derivatives, all quantities are canonical and there is no reference to the unphysical (time) part of the gauge fields or their conjugate momenta. In some sense, this \"simplifies\" the output of ToBasicForm.";
ToShell::usage="ToShell is an option for several functions, which determines whether the constraint shell of the defined theory should be imposed during the calculation. ToShell will eventually replace the string option \"ToShell\".";
Hard::usage="Hard is an option for several functions.";
ToBasicForm::usage="ToBasicForm[Expr] expresses Expr in terms of basic gauge fields. In some sense, this \"expands\" the output of ToNesterForm.";
PoissonBracket::usage="PoissonBracket[LeftOperand,RightOperand] calculates a Poisson bracket between the operands.";
Parallel::usage="Parallel is an option for several functions, which determines whether the calculation should be parallelised. Parallel will eventually replace the string option \"Parallel\".";
DefTheory::usage="DefTheory[System] defines a theory using System, a system of equations to constrain the coupling coefficients.";
ExportTheory::usage="ExportTheory is a boolean option for DefTheory and StudyTheory, which determines whether the association for the theory should be exported as a thr.mx file. Default is False.";
ImportTheory::usage="ImportTheory is a boolean option for DefTheory and StudyTheory, which determines whether the association for the theory should be imported as a thr.mx file. Default is False.";

$IfConstraints::usage="$IfConstraints is an association key for theories produced by DefTheory.";
$EvaluatedIfConstraints::usage="$EvaluatedIfConstraints is an association key for theories produced by DefTheory.";
$SuperHamiltonian::usage="$SuperHamiltonian is an association key for theories produced by DefTheory.";
$LinearSuperMomentum::usage="$LinearSuperMomentum is an association key for theories produced by DefTheory.";
$AngularSuperMomentum1p::usage="$AngularSuperMomentum is an association key for theories produced by DefTheory.";
$AngularSuperMomentum1m::usage="$AngularSuperMomentum is an association key for theories produced by DefTheory.";
$PPM::usage="$PPM is an association key for theories produced by DefTheory.";
$Velocities::usage="$Velocities is an association key for theories produced by DefTheory.";

UndefTheory::usage="UndefTheory[TheoryName] undefines a named theory.";
StudyTheory::usage="StudyTheory[TheoryName] calculates the primary Poisson matrix and velocities of a named theory.";
Brackets::usage="Brackets is an option for StudyTheory, which determines whether the primary Poisson matrices should be computed. Default is False.";
Velocities::usage="Velocities is an option for StudyTheory, which determines whether the velocities of the primary if-constraints should be computed. Default is False.";
ViewTheory::usage="ViewTheory[TheoryName] presents the literature-based information, primary Poisson matrix and velocities associated with a theory.";

(*-------------------------------------------------------------------*)
(*  Declarations for convenience wrappers which we use beyond HiGGS  *)
(*-------------------------------------------------------------------*)

MakeQuotientRule::usage="MakeQuotientRule[{xTensor,Expr}] makes a rule which takes an expression Expr containing single instance of an xTensor, with a specified valence and some constant or scalar coefficient, assumes that same expression to be zero, and replaces future instances of that xTensor accordingly. The options include the same options as for MakeRule.";
Canonicalise::usage="Canonicalise is an option for MakeQuotientRule, which determines whether ToCanonical is run on the solved expression. Default is True.";
Verify::usage="Verify is an option for MakeQuotientRule, which determines whether the action of the rule is verified.";
ToNewCanonical::usage="ToNewCanonical[Expr] is a convenience wrapper for ScreenDollarIndices@ContractMetric@ToCanonical@Expr. As of v2.0.0 it includes some functionality to remove projection operators.";

(*=======================*)
(*  xAct`HiGGS`Private`  *)
(*=======================*)

Begin["xAct`HiGGS`Private`"];

BuildPackage[FileName_String]:=Get[FileNameJoin@{$HiGGSInstallDirectory,"Sources","Package",FileName}];
BuildRebuild[FileName_String]:=Get[FileNameJoin@{$HiGGSInstallDirectory,"Sources","Rebuild",FileName}];

(*-------------------------------------------------------------------------------------------------------*)
(*  Load all the structures which constitute the Private` part of the package (this acts as a registry)  *)
(*-------------------------------------------------------------------------------------------------------*)

BuildHiGGSPackage[]:=BuildPackage/@{
	"BuildHiGGS.m",
	"ToNewCanonical.m",
	"MakeQuotientRule.m",
	"ToNesterForm.m",
	"ToBasicForm.m",
	"Smearing.m",
	"CovD.m",
	"Induced.m",
	"PoissonBracket.m",
	"InternalIndices.m",
	"DefTheory.m",
	"HiGGSParallelSubmit.m",
	"StudyTheory.m",
	"ViewTheory.m",
	"Utils.m"
};

BuildHiGGSPackage[];

(*-----------------------*)
(*  Cached binary files  *)
(*-----------------------*)

UnitTests={
	"CheckOrthogonality",
	"ShowIrreps",
	"ProjectionNormalisationsCheck",
	"ShowIrreps",
	"documentation"
};

NotYetImplemented={
	"TransferCouplingsPerpPerp",
	"TransferCouplingsPerpPara"
};

BinaryNames={
	"IfConstraints/VarPhiPerp/Rules",
	"IfConstraints/VarPhiPara/Rules",
	"CanonicalPhi",
	"CDPiPToCDPiPO3",
	"ChiPerp",
	"ChiSing",
	"CompleteO3Projections",
	"GeneralComplements",
	"NesterFormIfConstraints",
	"NesterFormIfConstraintsVarPhi",
	"NonCanonicalPhi",
	"O13Projections",
	"PiPToPiPO3",
	"PrecomputeDerivativeProjections",
	"ProjectionNormalisations"
};

BuiltBinaries=BinaryNames~Select~(FileExistsQ@FileNameJoin@{$HiGGSInstallDirectory,"Binaries","Definitions",#<>".mx"}&);
BinariesToRebuild=BinaryNames~Complement~BuiltBinaries;

(*-------------------*)
(*  Cached contexts  *)
(*-------------------*)

(*----------------------------------------------------------------------------------------------------------------------*)
(*  note that TangentM4` is not listed by default, and you have to do some digging in the xTensor source to obtain it!  *)
(*----------------------------------------------------------------------------------------------------------------------*)

ContextList={	
	"xAct`HiGGS`",
	"xAct`HiGGS`Private`",
	"xAct`xTensor`",
	"xAct`xTensor`Private`",
	"TangentM4`",
	"xAct`HiGGS`"
};

(*--------------------------------------------------------------------------------------------------------------*)
(*  If you want to recompile the HiGGS sources, pass "xAct`HiGGS`Private`Recompile->True" to the command below  *)
(*--------------------------------------------------------------------------------------------------------------*)

Begin["xAct`HiGGS`"];
	xAct`HiGGS`Private`BuildHiGGS[xAct`HiGGS`Private`Recompile->False];
End[];
 
End[];
EndPackage[];
