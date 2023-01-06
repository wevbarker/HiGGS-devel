(*=====================*)
(*  LoadBinaryContext  *)
(*=====================*)

LoadBinaryContext[Context_String]:=Module[{PrintVariable},
	PrintVariable=PrintTemporary[" ** BuildHiGGS: loading binary definitions for the context ",
		Context];
	Off@(RuleDelayed::rhs);(* again emulating the xTensor sources *)
	Get[FileNameJoin[{$HiGGSInstallDirectory,"Binaries","Contexts",#<>".mx"}]]&/@ContextList;
	On@(RuleDelayed::rhs);
	NotebookDelete@PrintVariable;	
];
