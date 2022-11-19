(*===============*)
(*  DefManifold  *)
(*===============*)

DefManifold[M4,4,IndexRange[{a,z}]];
AddIndices[TangentM4,{a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1,l1,n1,m1,o1,p1,q1,r1,s1,t1,u1,v1,w1,x1,y1,z1}];

xAct`HiGGS`Private`$PreMetricNames=Names["xAct`HiGGS`*"];

Quiet@DefMetric[-1,G[-a,-c],CD,{",","\[PartialD]"},PrintAs->"\[Gamma]",FlatMetric->True,SymCovDQ->True];

(*--------------------------------------------------------------*)
(*  This definition is important only for the GeoHiGGS package  *)
(*--------------------------------------------------------------*)

xAct`HiGGS`Private`$PostMetricNames=Names["xAct`HiGGS`*"];

xAct`HiGGS`Private`StandardIndices=ToExpression/@Alphabet[];
xAct`HiGGS`Private`ExtendedIndices=ToExpression@(ToString@#<>"1")&/@xAct`HiGGS`Private`StandardIndices;


xAct`HiGGS`Private`StandardIndicesSymb=ToString@ToExpression@("\\[Gothic"<>ToUpperCase@ToString@#<>"]")&/@Alphabet[];
xAct`HiGGS`Private`ExtendedIndicesSymb=ToString@ToExpression@("\\[Gothic"<>ToUpperCase@ToString@#<>"]'")&/@Alphabet[];


(PrintAs@Evaluate@#1^=Evaluate@#2)&~MapThread~{xAct`HiGGS`Private`StandardIndices,xAct`HiGGS`Private`StandardIndicesSymb};
(PrintAs@Evaluate@#1^=Evaluate@#2)&~MapThread~{xAct`HiGGS`Private`ExtendedIndices,xAct`HiGGS`Private`ExtendedIndicesSymb};
