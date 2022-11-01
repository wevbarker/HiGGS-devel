(*==============*)
(*  BuildHiGGS  *)
(*==============*)

SaveBinaryContext[Context_String]:=DumpSave[FileNameJoin[{$HiGGSInstallDirectory,"Binaries","Contexts",Context<>".mx"}],Context];

SaveBinaryContexts[]:=Module[{PrintVariable},
	Run@("rm -rf "<>FileNameJoin[{$HiGGSInstallDirectory,"Binaries","Contexts"}]<>"/*");
	PrintVariable=PrintTemporary[" ** BuildHiGGS: saving binary definitions for the context ",
		Context];
	SaveBinaryContext/@ContextList;
	NotebookDelete@PrintVariable;	
];

LoadBinaryContext[Context_String]:=Module[{PrintVariable},
	PrintVariable=PrintTemporary[" ** BuildHiGGS: loading binary definitions for the context ",
		Context];
	Off@(RuleDelayed::rhs);(* again emulating the xTensor sources *)
	Get[FileNameJoin[{$HiGGSInstallDirectory,"Binaries","Contexts",#<>".mx"}]]&/@ContextList;
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
];

$HiGGSBuilt=False;
BuildHiGGS::built="The HiGGS environment has already been built.";
Options@BuildHiGGS={Recompile->False};
BuildHiGGS[OptionsPattern[]]:=Module[{PriorMemory,UsedMemory},

	If[$HiGGSBuilt,Throw@Message[BuildHiGGS::built]];

		If[OptionValue@Recompile,
			
			PriorMemory=MemoryInUse[];
			Print[" ** BuildHiGGS: RAM used by kernel ",$KernelID," is ",Dynamic[Refresh[MemoryInUse[],UpdateInterval->1]]," bytes."];

			BuildRebuild["BuildHiGGS.m"];

			SaveBinaryContexts[],

			LoadHiGGS[];
			Begin["xAct`HiGGS`Private`"];
				BuildHiGGSPackage[];
			End[];
		];

	$HiGGSBuilt=True;
];
