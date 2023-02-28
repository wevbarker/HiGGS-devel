(*==============*)
(*  BuildHiGGS  *)
(*==============*)

BuildPackage@"BuildHiGGS/SaveBinaryContext.m";
BuildPackage@"BuildHiGGS/SaveBinaryContexts.m";
BuildPackage@"BuildHiGGS/LoadBinaryContext.m";
BuildPackage@"BuildHiGGS/LoadHiGGS.m";

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

			If[FileExistsQ@FileNameJoin[{$HiGGSInstallDirectory,"Binaries","Contexts","xAct`HiGGS`.mx"}],

				PrintVariable=PrintTemporary@" ** BuildHiGGS: Attempting to load HiGGS as usual
				from context binaries...";
				Off[General::shdw];
				LoadHiGGS[];
				On[General::shdw];,
(**)
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
(**)
			];

			NotebookDelete@PrintVariable;	
			Begin["xAct`HiGGS`Private`"];
				BuildHiGGSPackage[];
			End[];
		];
];
