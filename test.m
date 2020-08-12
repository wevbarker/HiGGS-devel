(* ::Package:: *)

BeginPackage["SimpleArithmetic`"]

AddTwo::usage = "AddTwo[a, b] returns a+b";
AddThree::usage = "AddThree[a, b, c] returns a+b+c";
TimesTwo::usage = "TimesTwo[a, b] returns a*b";
TimesThree::usage = "TimesThree[a, b, c] returns a*b*c";

Begin["`Private`"]

plus[args___] := Plus[args];
times[args___] := Times[args]

AddTwo[a_, b_] := plus[a, b];
AddThree[a_, b_, c_] := plus[a, b, c];
TimesTwo[a_, b_] := times[a, b];
TimesThree[a_, b_, c_] := times[a, b, c];

End[]
EndPackage[]
