
theories:=table([
1=[{R1,R3/2-R4,T1,T3,L,R6},[{X0m},{X,Y}]],
2=[{R1,R3/2-R4,T1,L,R6},[{X0m},{X,Y}]],
3=[{R1,R3,R4,T1+T2,T3,L,R6},[{X0m},{X,Y}]],
4=[{R2,R1-R3,R4,T1+T2,T3,L,R6},[{X2m},{X,Y}]],
5=[{R2,R1-R3,R4,T2,T1+T3,L,R6},[{X2m},{X,Y}]],
6=[{R1,2*R3-R4,T1+T2,T3,L,R6},[{X0m},{X,Y}]],
7=[{R2,2*R1-2*R3+R4,T1+T2,T3,L,R6},[{X2m},{X,Y}]],
8=[{R2,R1-R3,R4,T1,T2,L,R6},[{},{X,Y}]],
9=[{R2,R1-R3,R4,T1,T2,T3,L,R6},[{},{X,Y}]],
10=[{R1,R2,R3/2-R4,T1,T2,T3,L,R6},[{},{X,Y}]],
11=[{R1,R3/2-R4,T1,T2,T3,L,R6},[{},{X,Y}]],
12=[{R1,R2,R3/2-R4,T1,T3,L,R6},[{},{X,Y}]],
13=[{R2,2*R1-2*R3+R4,T1,T2,T3,L,R6},[{},{X,Y}]],
14=[{R1,R2,R3/2-R4,T1,T2,L,R6},[{},{X,Y}]],
15=[{R1,R2,R3/2-R4,T1,L,R6},[{},{X,Y}]],
16=[{R1,R3/2-R4,T1,T2,L,R6},[{},{X,Y}]],
17=[{R1,R2,R3,R4,T1+T2,T3,L,R6},[{},{X,Y}]],
18=[{R1,R2,R3,R4,T2,T1+T3,L,R6},[{},{X,Y}]],
19=[{R1,R2,2*R3-R4,T1+T2,T3,L,R6},[{},{X,Y}]],
20=[{R1,R3,R4,R5,L,R6},[{X0m},{}]],
21=[{R1,R3,R4,R5,T1+T2,L,R6},[{X0m},{}]],
22=[{R1,R3,R4,R5,T1+T3,L,R6},[{X0m},{}]],
23=[{R1,R3,R4,R5,T1+T2,T1+T3,L,R6},[{X0m},{}]],
24=[{R1,R3,R4,T1,L,R6},[{X0m},{}]],
25=[{R1,R3,R4,R5,T1,L,R6},[{X0m},{}]],
26=[{R1,R3,R4,R5,T1,T3,L,R6},[{X0m},{}]],
27=[{R1,R3/2-R4,R3/2+R5,T1,T3,L,R6},[{X0m},{}]],
28=[{R1,R3,R4,T1,T3,L,R6},[{X0m},{}]],
29=[{R1-R3,R4,2*R1+R5,T1,L,R6},[{X0m},{}]],
30=[{R1-R3,R4,2*R1+R5,T1,T3,L,R6},[{X0m},{}]],
31=[{R1,2*R3-R4,2*R3+R5,T1,T3,L,R6},[{X0m},{}]],
32=[{R1,R3,R4,R5,T3,L,R6},[{X0m},{}]],
33=[{R1,R3,R4,R5,T1+T2,T3,L,R6},[{X0m},{}]],
34=[{R1,2*R3-R4,T1,T3,L,R6},[{X0m},{}]],
35=[{R1,R3/2-R4,2*R3+R5,T1,T3,L,R6},[{X0m},{}]],
36=[{2*R1-2*R3+R4,2*R3+R5,T1,T3,L,R6},[{X0m},{}]],
37=[{R1,R3/2-R4,2*R3+R5,T1,L,R6},[{X0m},{}]],
38=[{R1,2*R3-R4,2*R3+R5,T3,L,R6},[{X0m},{}]],
39=[{R1,2*R3-R4,2*R3+R5,T1+T2,T3,L,R6},[{X0m},{}]],
40=[{R1,R4+R5,T1,T3,L,R6},[{X0m},{}]],
41=[{R1,R3/2-R4,R3/2+R5,T1,L,R6},[{X0m},{}]],
YN1p=[{hB1,hB2,hA1,hA2,hA3,hA4,hA6},[{X1p},{}]],
YN1m=[{hB1,hB3,hA1,hA2,hA3,hA4,hA6},[{X1m},{}]],
YN2p=[{hB2,hB3,hA2,hA3,hA4,hB5,hA6},[{X2p},{}]],
YN2m=[{hB1,hB2,hB3,hA2,hA3,hA4,hB5,hA6},[{X2m},{}]],
YN0m2m1=[{hB1,hB2,hB3,hA1,hA3,hA4,hB5,hA6},[{X0m,X2m},{}]],
YN0m2m2=[{hB1,hB2,hB3,hA2,hA4,hB5,hA6},[{X0m,X2m},{}]],
SN1=[{hB1+2*hB3,hA1+hA2,hA4+hA5},[{X2p,X0p,X0m},{}]],
SN2=[{hB1+2*hB3,hA1+hA2,hA1+hA4},[{X1m,X0p,X0m},{}]],
SN3=[{hB1+2*hB3,hA1+hA2,hA4+hA6},[{X2p,X1m,X0m},{}]],
SN4=[{2*hB1+hB2,hA1+hA2,hA1+hA4},[{X1p,X0p,X0m},{}]],
SN5=[{2*hB1+hB2,hA1+hA2,hA4+hA6},[{X2p,X1p,X0m},{}]],
SN6=[{hB1,hA1+hA2,hA4+hA5},[{X1p,X0p,X0m},{}]],
SN7=[{hB1,hA1+hA2,hA4+hA6},[{X1p,X1m,X0m},{}]],
SN8=[{hB1+2*hB3,hA2+hA3,hA1+hA4},[{X2m,X1m,X0p},{}]],
SN9=[{2*hB1+hB2,hA2+hA3,hA1+hA4},[{X2m,X1p,X0p},{}]],
SN10=[{2*hB1+hB2,hA2+hA5,hA1+hA4},[{X2m,X0p,X0m},{}]],
SN11=[{hB1,hB2,hA1+hA2},[{X1p,X0m},{}]],
SN12=[{hA1+hA2,hA4+hA5,hA2+hA5},[{X0p,X0m},{}]]
]):

Hamiltonian_partitions:=table([
b0p=[hB2,none,[hA,hA/2+hB3]],
b1m=[2*hB1+hB2,hB1-hB2,[2*hA+hB2,hB1-hA]],
b1p=[hB1+2*hB3,hB1-hB3,[hA/2+hB3,hB1-hA]],
b2p=[hB1,none,[hB1-hA,hA]],
A0p=[hA4+hA6,hA4-hA6,[hA,hA/2+hB3]],
A0m=[hA2+hA3,hA2-hA3,[hA/2+hB3]],
A1p=[hA2+hA5,hA2-hA5,[hA/2+hB3,hB1-hA]],
A1m=[hA4+hA5,hA4-hA5,[2*hA+hB2,hB1-hA]],
A2p=[hA1+hA4,hA1-hA4,[hB1-hA,hA]],
A2m=[hA1+hA2,hA1-hA2,[hB1-hA]]]):

























