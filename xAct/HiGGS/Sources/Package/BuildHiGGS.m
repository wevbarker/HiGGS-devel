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

Options@BuildHiGGS={Recompile->False};
BuildHiGGS[OptionsPattern[]]:=Module[{PrintVariable},

	If[$HiGGSBuilt,Throw@Message[BuildHiGGS::built]];

		If[OptionValue@Recompile,
			
			Print@" ** BuildHiGGS: A rebuild of the context binaries was requested by an edit to HiGGS.m...";
			BuildRebuild["BuildHiGGS.m"];
			SaveBinaryContexts[];
			Print@" ** BuildHiGGS: The context binaries have been rebuilt, the kernel will
			now quit. Please reload HiGGS.";
			Quit[];,

			Quiet@Check[

				PrintVariable=PrintTemporary@" ** BuildHiGGS: Attempting to load HiGGS as usual
				from context binaries...";
				LoadHiGGS[];,

				Print@" ** BuildHiGGS: No suitable context binaries found, rebuilding them from
				scratch. Don't worry: this should happen if it is your first time loading the
				package from a fresh install! It is *very important* that HiGGS is installed to
				a place where Mathematica has permissions to write files. For example on linux
				this might be ~/.Mathematica/Applications/xAct/HiGGS/.";
				BuildRebuild["BuildHiGGS.m"];
				SaveBinaryContexts[];
				Print@" ** BuildHiGGS: The context binaries have been rebuilt, the kernel will
				now quit. Please reload HiGGS.";
				Quit[];
			];

			NotebookDelete@PrintVariable;	
			Begin["xAct`HiGGS`Private`"];
				BuildHiGGSPackage[];
			End[];
		];
];
