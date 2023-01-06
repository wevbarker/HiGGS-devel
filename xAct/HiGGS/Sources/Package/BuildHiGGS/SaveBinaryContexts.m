(*======================*)
(*  SaveBinaryContexts  *)
(*======================*)

SaveBinaryContexts[]:=Module[{PrintVariable},
	Run@("rm -rf "<>FileNameJoin[{$HiGGSInstallDirectory,"Binaries","Contexts"}]<>"/*");
	PrintVariable=PrintTemporary[" ** BuildHiGGS: saving binary definitions for the context ",
		Context];
	SaveBinaryContext/@ContextList;
	NotebookDelete@PrintVariable;	
];
