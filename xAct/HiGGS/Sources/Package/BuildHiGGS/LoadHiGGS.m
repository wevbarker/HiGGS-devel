(*=============*)
(*  LoadHiGGS  *)
(*=============*)

LoadHiGGS[]:=Catch@Module[{PrintVariable,InitialMemory,Progress},
	PrintVariable=PrintTemporary[" ** BuildHiGGS: loading binary definitions..."];
	InitialMemory=MemoryInUse[];
	Progress=PrintTemporary@ProgressIndicator[Dynamic[N[(Refresh[MemoryInUse[],UpdateInterval->0.1]-InitialMemory)/10^8]],Appearance->"Percolate"];
	LoadBinaryContext/@ContextList;
	NotebookDelete@PrintVariable;	
	NotebookDelete@Progress;
];
