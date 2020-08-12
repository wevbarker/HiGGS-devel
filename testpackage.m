(* ::Package:: *)

BeginPackage["testpackage`"]

TestF::usage="silly";
Tez::usage="silly";

Begin["`Private`"]
TestF[x_]:=x+12;
Tez[x_]:=x+1;
End[]
EndPackage[]
