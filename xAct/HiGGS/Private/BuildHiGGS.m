(*==============*)
(*  BuildHiGGS  *)
(*==============*)

(* note that TangentM4` is not listed by default, and you have to do some digging in the xTensor source to obtain it! *)
ContextList={	
"xAct`HiGGS`",
"xAct`HiGGS`Private`",
"xAct`xTensor`",
"xAct`xTensor`Private`",
"TangentM4`",
"xAct`HiGGS`"};

SaveBinaryContext[Context_String]:=DumpSave[FileNameJoin[{$HiGGSInstallDirectory,"bin","Contexts",Context<>".mx"}],Context];

SaveBinaryContexts[]:=Module[{PrintVariable},
	Run@("rm -rf "<>FileNameJoin[{$HiGGSInstallDirectory,"bin","Contexts"}]<>"/*");
	PrintVariable=PrintTemporary[" ** BuildHiGGS: saving binary definitions for the context ",
		Context];
	SaveBinaryContext/@ContextList;
	NotebookDelete@PrintVariable;	
];

LoadBinaryContext[Context_String]:=Module[{PrintVariable},
	PrintVariable=PrintTemporary[" ** BuildHiGGS: loading binary definitions for the context ",
		Context];
	Off@(RuleDelayed::rhs);(* again emulating the xTensor sources *)
	Get[FileNameJoin[{$HiGGSInstallDirectory,"bin","Contexts",#<>".mx"}]]&/@ContextList;
	On@(RuleDelayed::rhs);
	NotebookDelete@PrintVariable;	
];

LoadHiGGS[]:=Catch@Module[{PrintVariable,InitialMemory,Progress},
	PrintVariable=PrintTemporary[" ** BuildHiGGS: loading binary definitions..."];
	InitialMemory=MemoryInUse[];
	Progress=PrintTemporary@ProgressIndicator[Dynamic[N[(Refresh[MemoryInUse[],UpdateInterval->0.1]-InitialMemory)/10^8]],Appearance->"Percolate"];
	LoadBinaryContext/@ContextList;
	NotebookDelete@PrintVariable;	
	NotebookDelete@Progress;
	(*Print[" ** BuildHiGGS: the HiGGS environment has now been loaded"];*)
];

$HiGGSBuilt=False;
BuildHiGGS::built="The HiGGS environment has already been built.";
Options@BuildHiGGS={Recompile->False,BuildSO3->True};
BuildHiGGS[OptionsPattern[]]:=Module[{PriorMemory,UsedMemory},

(*xAct`xTensor`Private`MakeDefInfo[BuildHiGGS,$KernelID,{"HiGGS environment for kernel",""}];*)
	If[$HiGGSBuilt,Throw@Message[BuildHiGGS::built]];

		If[OptionValue@Recompile,
			
			(*List of all print cells in front end before this notebook starts to run*)
			$PrintCellsBeforeStartBuildHiGGS=Flatten@Cells[SelectedNotebook[],CellStyle->{"Print"}];
			PriorMemory=MemoryInUse[];
			Print[" ** BuildHiGGS: RAM used by kernel ",$KernelID," is ",Dynamic[Refresh[MemoryInUse[],UpdateInterval->1]]," bytes."];
			Get[FileNameJoin@{$HiGGSInstallDirectory,"Global","Main.m"}];
			If[OptionValue@BuildSO3,
			Get[FileNameJoin@{$HiGGSInstallDirectory,"Global","SO3.m"}];
			];
			(*Purge all cells created during build process*)
(*
			Pause[2];
			UsedMemory=MemoryInUse[]-PriorMemory;
			NotebookDelete@(Flatten@Cells[SelectedNotebook[],CellStyle->{"Print"}]~Complement~$PrintCellsBeforeStartBuildHiGGS);
			Print[" ** BuildHiGGS: If build was successful, the HiGGS environment is now ready to use and is occupying ",UsedMemory," bytes in RAM."];
*)

			SaveBinaryContexts[],

			LoadHiGGS[];
			Begin["xAct`HiGGS`Private`"];
				BuildHiGGSPrivate[];
			End[];
		];

	$HiGGSBuilt=True;
];

(* here is a short-list of contexts which we thought might have been involved *)

(*
"xAct`ExpressionManipulation`",
"xAct`ExpressionManipulation`Private`",
"xAct`HiGGS`",
"xAct`HiGGS`Private`",
"xAct`Spinors`Private`",
"xAct`SymManipulator`",
"xAct`SymManipulator`Private`",
"xAct`TexAct`",
"xAct`TexAct`Private`",
"xAct`xCoba`",
"xAct`xCoba`Private`",
"xAct`xCore`",
"xAct`xCore`Private`",
"xAct`xPerm`",
"xAct`xPerm`Private`",
"xAct`xPert`",
"xAct`xPert`Private`",
"xAct`xTableau`",
"xAct`xTensor`",
"xAct`xTensor`Private`",
"xAct`xTras`",
"xAct`xTras`Private`",
*)


(* here is a full list of contexts which were introduced during the loading of the package *)
(*
"Evaluators`CloudKernels`", "Evaluators`CloudKernels`Private`", \
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
"xAct`xTras`", "xAct`xTras`Private`", "$`", "$CellContext`"*)
