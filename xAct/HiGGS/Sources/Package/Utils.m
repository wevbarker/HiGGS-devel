(*=========*)
(*  Utils  *)
(*=========*)

BinaryLocation[RelevantTag_?StringQ]:=FileNameJoin@{$HiGGSInstallDirectory,"Binaries","Definitions",RelevantTag<>".mx"};
BuildHiGGS::nobin="The binary at `1` cannot be found; quitting.";

SetAttributes[IfBuild,HoldAll];
IfBuild[RelevantTag_?StringQ,expr_]:=Catch@If[PrematuroCellTags~MemberQ~RelevantTag,
	Print[" ** BuildHiGGS: The binary at "<>BinaryLocation@RelevantTag<>" has been ignored."];,
	If[BinariesToRebuild~MemberQ~RelevantTag,
		Print[" ** BuildHiGGS: Building the binary at "<>BinaryLocation@RelevantTag<>"..."];
		$BinaryLocation=BinaryLocation@RelevantTag;
		Evaluate@expr;,
		If[UnitTests~MemberQ~RelevantTag,
			Print[" ** BuildHiGGS: The unit test labelled "<>RelevantTag<>" has been ignored."];,
			Print[" ** BuildHiGGS: Incorporating the binary at "<>BinaryLocation@RelevantTag<>"..."];
			Check[
				ToExpression["<<\""<>(BinaryLocation@RelevantTag~StringReplace~("\\"->"\\\\"))<>"\";"],
				Throw@Message[BuildHiGGS::nobin,BinaryLocation@RelevantTag];
				Quit[];
			];
		];
	];
];

IfBuild[RelevantTag_?StringQ]:=Catch@If[PrematuroCellTags~MemberQ~RelevantTag,
	Print[" ** BuildHiGGS: The binary at "<>BinaryLocation@RelevantTag<>" has been ignored."];,
	If[BinariesToRebuild~MemberQ~RelevantTag,
		Print[" ** BuildHiGGS: Building the binary at "<>BinaryLocation@RelevantTag<>"..."];
		$BinaryLocation=BinaryLocation@RelevantTag;
		BuildRebuild[RelevantTag<>".m"];,
		If[UnitTests~MemberQ~RelevantTag,
			Print[" ** BuildHiGGS: The unit test labelled "<>RelevantTag<>" has been ignored."];,
			Print[" ** BuildHiGGS: Incorporating the binary at "<>BinaryLocation@RelevantTag<>"..."];
			Check[
				ToExpression["<<\""<>(BinaryLocation@RelevantTag~StringReplace~("\\"->"\\\\"))<>"\";"],
				Throw@Message[BuildHiGGS::nobin,BinaryLocation@RelevantTag];
				Quit[];
			];
		];
	];
];

If[$PaperPrint,
	If[NotebookDirectory[]==$Failed,
		Print[" ** BuildHiGGS: Purging figures directory at "<>FileNameJoin@{NotebookDirectory[],"fig/*"}<>"..."];,
		Run@("rm -rf "<>FileNameJoin@{NotebookDirectory[],"fig/*"});,
		Run@("rm -rf "<>FileNameJoin@{NotebookDirectory[],"fig/*"});
	];
];


$OldLine=$Line;
$SubLine=1;
(*$PaperPrint=False;*)

HiGGSOutput[x_String]:=Module[{},
	$ListingsOutput=x;
	Run@("rm "<>FileNameJoin@{$WorkingDirectory,"fig",$ListingsOutput});
];

SetAttributes[HiGGSEcho,HoldAll]
HiGGSEcho[x_]:=Block[{str,res,$ListingsFile},
	str=ToString[Unevaluated[x]~ToString~InputForm];
	$ListingsFile=OpenAppend[FileNameJoin@{$WorkingDirectory,"fig",$ListingsOutput},PageWidth->Infinity];
	WriteString[$ListingsFile,"In[]:= "<>str<>"\nOut[]= "];
	(*WriteString[$ListingsFile,"|\nIn[]:= "<>str<>"\n|\n"];*)
	Close@$ListingsFile;
	res=Evaluate@x;
res];

$Widetext=False;

Options[HiGGSPrint]={"Widetext"->False};
HiGGSPrint[expr__,OptionsPattern[]]:=Block[{
	res,
	$ListingsFile,
	size},

	If[$Widetext,size=(510/246)*350,size=350];
	res=expr;
	Print@res;

	If[$PaperPrint,
		If[$Line==$OldLine,
			$SubLine=$SubLine+1,
			$SubLine=1;
			$OldLine=$Line;
		];
		$ListingsFile=OpenAppend[FileNameJoin@{$WorkingDirectory,"fig",$ListingsOutput},PageWidth->Infinity];
		If[{res}~AllTrue~StringQ,
			WriteString[$ListingsFile,"|\n\\vspace{-10pt}\n|\n"<>""<>StringJoin@{res}<>"\n"];,
			res=Panel[Row@{"",res},ImageSize->size,Background->RGBColor[0.95,1.,0.8],FrameMargins->None,ContentPadding->True,Alignment->Right];
			Print@res;
			FileNameJoin@{$WorkingDirectory,"fig",$ListingsOutput<>ToString@$OldLine<>"-"<>ToString@$SubLine<>"fig.pdf"}~Export~res;
			WriteString[$ListingsFile,"|\n\\vspace{-4pt}\n\\begin{flushleft}\n\\includegraphics[width=\\linewidth]{figures/"<>$ListingsOutput<>ToString@$OldLine<>"-"<>ToString@$SubLine<>"fig.pdf}\n\\end{flushleft}\n\\vspace{-5pt}\n|\n"];
		];
		Close@$ListingsFile;
	];
];

(*
DefConstantSymbol[Prt,PrintAs->"\[Epsilon]"];
$ToNormalOrderRules={};
$ToEHOrderRules={};
Options[DeclareOrder]={"IsUnityWithEHTerm"->False,"approximation"->False};
DeclareOrder[tensor_,order_,OptionsPattern[]]:="DeclareOrder"~TimeWrapper~Module[{tmp},
If[OptionValue["approximation"]==False,
tmp=MakeRule[{tensor,Evaluate[Prt^order tensor]},MetricOn->All,ContractMetrics->True];,
tmp=MakeRule[{tensor,Evaluate[Prt^order Evaluate[OptionValue["approximation"]]]},MetricOn->All,ContractMetrics->True];,
tmp=MakeRule[{tensor,Evaluate[Prt^order Evaluate[OptionValue["approximation"]]]},MetricOn->All,ContractMetrics->True];
];
If[OptionValue["IsUnityWithEHTerm"]==False,
$ToNormalOrderRules=Join[$ToNormalOrderRules,tmp];
$ToEHOrderRules=Join[$ToEHOrderRules,tmp];,
$ToNormalOrderRules=Join[$ToNormalOrderRules,tmp];
];
];
*)

(*it is better that coupling constants format in colour*)
$Coupling=RGBColor[1,0,0];
Colour[x_String,ColorKey_]:=ColorString[x,ColorKey];
(*a more systematic way to format tensors*)
$TensorColour=RGBColor[0,0,0];
$SmearingColour=Gray;
$IrrepColour=RGBColor[0,0,1];
Spin0p="\!\(\*OverscriptBox[\(.\), SuperscriptBox[\(0\), \(+\)]]\)";
Spin0m="\!\(\*OverscriptBox[\(.\), SuperscriptBox[\(0\), \(-\)]]\)";
Spin1p="\!\(\*OverscriptBox[\(.\), SuperscriptBox[\(1\), \(+\)]]\)";
Spin1m="\!\(\*OverscriptBox[\(.\), SuperscriptBox[\(1\), \(-\)]]\)";
Spin2p="\!\(\*OverscriptBox[\(.\), SuperscriptBox[\(2\), \(+\)]]\)";
Spin2m="\!\(\*OverscriptBox[\(.\), SuperscriptBox[\(2\), \(-\)]]\)";
SO0="\!\(\*OverscriptBox[\(.\), \(0\)]\)";
SO1="\!\(\*OverscriptBox[\(.\), \(1\)]\)";
SO2="\!\(\*OverscriptBox[\(.\), \(2\)]\)";
SO3="\!\(\*OverscriptBox[\(.\), \(3\)]\)";
SO4="\!\(\*OverscriptBox[\(.\), \(4\)]\)";
SO5="\!\(\*OverscriptBox[\(.\), \(5\)]\)";
SO6="\!\(\*OverscriptBox[\(.\), \(6\)]\)";
xAct`HiGGS`Private`SmearingLeftIndex="\!\(\*OverscriptBox[\(.\), \((1)\)]\)";
xAct`HiGGS`Private`SmearingRightIndex="\!\(\*OverscriptBox[\(.\), \((2)\)]\)";
GB="\!\(\*OverscriptBox[\(.\), \(GB\)]\)";
dSpin0p="\!\(\*UnderscriptBox[\(.\), SuperscriptBox[\(0\), \(+\)]]\)";
dSpin0m="\!\(\*UnderscriptBox[\(.\), SuperscriptBox[\(0\), \(-\)]]\)";
dSpin1p="\!\(\*UnderscriptBox[\(.\), SuperscriptBox[\(1\), \(+\)]]\)";
dSpin1m="\!\(\*UnderscriptBox[\(.\), SuperscriptBox[\(1\), \(-\)]]\)";
dSpin2p="\!\(\*UnderscriptBox[\(.\), SuperscriptBox[\(2\), \(+\)]]\)";
dSpin2m="\!\(\*UnderscriptBox[\(.\), SuperscriptBox[\(2\), \(-\)]]\)";
dSOX="\!\(\*UnderscriptBox[\(.\), \(.\)]\)";
dSO0="\!\(\*UnderscriptBox[\(.\), \(0\)]\)";
dSO1="\!\(\*UnderscriptBox[\(.\), \(1\)]\)";
dSO2="\!\(\*UnderscriptBox[\(.\), \(2\)]\)";
dSO3="\!\(\*UnderscriptBox[\(.\), \(3\)]\)";
dSO4="\!\(\*UnderscriptBox[\(.\), \(4\)]\)";
dSO5="\!\(\*UnderscriptBox[\(.\), \(5\)]\)";
dSO6="\!\(\*UnderscriptBox[\(.\), \(6\)]\)";
dGB="\!\(\*UnderscriptBox[\(.\), \(GB\)]\)";

(* ::Input::Initialization:: *)
Options[SymbolBuild]={"Derivative"->0,"Constant"->False,"Smearing"->False};
SymbolBuild[TensorSymbol_,IrrepSymbol:_?StringQ :"",OptionsPattern[]]:=Module[{res},
If[PossibleZeroQ@StringLength@IrrepSymbol,
res=ColorString[TensorSymbol,$TensorColour];,

If[OptionValue@"Constant",
	res=ColorString[TensorSymbol,$Coupling]~StringJoin~ColorString[IrrepSymbol,$IrrepColour];,
	If[OptionValue@"Smearing",
		res=ColorString[IrrepSymbol,$SmearingColour]~StringJoin~ColorString[TensorSymbol,$SmearingColour];,
		res=ColorString[IrrepSymbol,$IrrepColour]~StringJoin~ColorString[TensorSymbol,$TensorColour];
	];
];
];
If[OptionValue@"Derivative"==1,
	res="\[GothicCapitalD]"~StringJoin~res;
];
If[OptionValue@"Derivative"==2,
	res="(\[ScriptCapitalD]"~StringJoin~res;
	res=res~StringJoin~"\!\(\*SuperscriptBox[\()\), \(\[DoubleVerticalBar]\)]\)";
];
res];
