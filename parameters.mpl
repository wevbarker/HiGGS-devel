#	storage for all the parameters for the action

parameter_system_names_table:=table([M="Mike's",W="Will's",Y="Yun-Cherng's",NY="Yun-Cherng's note version",Z="Zhang's",V="Minkevich's",G="Goenner's",cW1="Will's major cosmological",cW2="Will's minor cosmological",cZ="Zhang's major cosmological",cV="Minkevich's major cosmological",cG="Goenner's major cosmological"]):
parameter_system_list:=[W,Y,NY,Z,V,G]:
cosmological_system_list:=[cW1,cW2,cZ,cV,cG]:

vY:=<R1,R2,R3,R4,R5,R6,T1,T2,T3,L>:
vY_orig:=<R1,R2,R3,R4,R5,R6,T1,T2,T3,L>:
vM:=<A1,A2,A3,A4,A5,A6,B1,B2,B3,A>:
A1_Y:=<0|0|0|0|0|1|0|0|0|0>:
A2_Y:=<0|0|0|1|1|0|0|0|0|0>:
A3_Y:=<0|0|0|1|-1|0|0|0|0|0>:
A4_Y:=<1/3|1/6|0|0|0|0|0|0|0|0>:
A5_Y:=<2/3|-2/3|0|0|0|0|0|0|0|0>:
A6_Y:=<1/3|1/6|-1|0|0|0|0|0|0|0>:
B1_Y:=<0|0|0|0|0|0|1/3|1/12|0|1/4>:
B2_Y:=<0|0|0|0|0|0|1/3|-1/6|0|1/2>:
B3_Y:=<0|0|0|0|0|0|-1/3|0|2/3|-1>:
A_Y:=<0|0|0|0|0|0|0|0|0|2>:
mMY:=<A1_Y,A2_Y,A3_Y,A4_Y,A5_Y,A6_Y,B1_Y,B2_Y,B3_Y,A_Y>:

vNY:=<R1,R2,R3,R4,R5,R6,T1,T2,T3,L>:
A1_NY:=<0|0|0|1/4|-1/4|0|0|0|0|0>:
A2_NY:=<0|0|0|1|1|0|0|0|0|0>:
A3_NY:=<0|0|0|0|0|1|0|0|0|0>:
A4_NY:=<1/3|1/6|0|0|0|0|0|0|0|0>:
A5_NY:=<2/3|-2/3|0|0|0|0|0|0|0|0>:
A6_NY:=<1/3|1/6|-1|1/4|-1/4|0|0|0|0|0>:
B1_NY:=<0|0|0|0|0|0|1/3|1/12|0|1/4>:
B2_NY:=<0|0|0|0|0|0|1/3|-1/6|0|1/2>:
B3_NY:=<0|0|0|0|0|0|-1/3|0|2/3|-1>:
A_NY:=<0|0|0|0|0|0|0|0|0|-1>:
mMNY:=<A1_NY,A2_NY,A3_NY,A4_NY,A5_NY,A6_NY,B1_NY,B2_NY,B3_NY,A_NY>:

vW:=<cA1,cA2,cA3,cA4,cA5,cA6,cB1,cB2,cB3,cA>:
cA1_M:=<1|0|0|0|0|0|0|0|0|0>:
cA2_M:=<0|1|0|0|0|0|0|0|0|0>:
cA3_M:=<0|0|1|0|0|0|0|0|0|0>:
cA4_M:=<0|0|0|2|1|0|0|0|0|0>:
cA5_M:=<0|0|0|0|1|0|0|0|0|0>:
cA6_M:=<0|0|0|0|0|2|0|0|0|0>:
cB1_M:=<0|0|0|0|0|0|-2|-1|0|0>:
cB2_M:=<0|0|0|0|0|0|0|1|0|0>:
cB3_M:=<0|0|0|0|0|0|0|0|1|0>:
cA_M:=<0|0|0|0|0|0|0|0|0|1>:
mWM:=<cA1_M,cA2_M,cA3_M,cA4_M,cA5_M,cA6_M,cB1_M,cB2_M,cB3_M,cA_M>:

vZ:=<b_1,b_2,b_3,b_4,b_5,b_6,a_1,a_2,a_3,a>:
Zb1_M:=<0|0|0|2|1/2|0|0|0|0|0>:
Zb2_M:=<0|0|0|0|1/2|2|0|0|0|0>:
Zb3_M:=<0|2|0|0|0|0|0|0|0|0>:
Zb4_M:=<0|0|2|0|0|0|0|0|0|0>:
Zb5_M:=<2|0|0|0|0|0|0|0|0|0>:
Zb6_M:=<0|0|0|0|1/8|0|0|0|0|0>:
Za1_M:=<0|0|0|0|0|0|-2|0|0|0>:
Za2_M:=<0|0|0|0|0|0|0|-2|0|0>:
Za3_M:=<0|0|0|0|0|0|0|0|-2|0>:
Zb0_M:=<0|0|0|0|0|0|0|0|0|1>:
mZM:=<Zb1_M,Zb2_M,Zb3_M,Zb4_M,Zb5_M,Zb6_M,Za1_M,Za2_M,Za3_M,Zb0_M>:

vV:=<f_1,f_2,f_3,f_4,f_5,f_6,a_1,a_2,a_3,f_0>:
Vf1_M:=<0|0|0|1|0|0|0|0|0|0>:
Vf2_M:=<0|0|0|0|1|0|0|0|0|0>:
Vf3_M:=<0|0|0|0|0|1|0|0|0|0>:
Vf4_M:=<0|1|0|0|0|0|0|0|0|0>:
Vf5_M:=<0|0|1|0|0|0|0|0|0|0>:
Vf6_M:=<1|0|0|0|0|0|0|0|0|0>:
Va1_M:=<0|0|0|0|0|0|4|0|0|0>:
Va2_M:=<0|0|0|0|0|0|0|4|0|0>:
Va3_M:=<0|0|0|0|0|0|0|0|4|0>:
Vf0_M:=<0|0|0|0|0|0|0|0|0|1/2>:
mVM:=<Vf1_M,Vf2_M,Vf3_M,Vf4_M,Vf5_M,Vf6_M,Va1_M,Va2_M,Va3_M,Vf0_M>:

vG:=<c_5,c_6,c_7,c_8,c_9,c_10,c_1,c_2,c_3,c_4>:
Gc5_M:=<1|0|0|0|0|0|0|0|0|0>:
Gc6_M:=<0|1|0|0|0|0|0|0|0|0>:
Gc7_M:=<0|0|1|0|0|0|0|0|0|0>:
Gc8_M:=<0|0|0|-2|0|0|0|0|0|0>:
Gc9_M:=<0|0|0|0|-1|0|0|0|0|0>:
Gc10_M:=<0|0|0|0|0|1|0|0|0|0>:
Gc1_M:=<0|0|0|0|0|0|-2|-1|0|0>:
Gc2_M:=<0|0|0|0|0|0|0|1|0|0>:
Gc3_M:=<0|0|0|0|0|0|0|0|-1|0>:
Gc4_M:=<0|0|0|0|0|0|0|0|0|1/2>:
mGM:=<Gc5_M,Gc6_M,Gc7_M,Gc8_M,Gc9_M,Gc10_M,Gc1_M,Gc2_M,Gc3_M,Gc4_M>:

mYM:=MatrixInverse(mMY):
mNYM:=MatrixInverse(mMNY):
for ii in parameter_system_list do
  mM||ii:=MatrixInverse(m||ii||M):
end do:
for ii in parameter_system_list do
  for jj in parameter_system_list do
    m||ii||jj:=Multiply(m||ii||M,m||M||jj):
  end do:
end do:

vcW2:=<C1,C2,M1,M2,M3,M>:
C1_W:=<3/2|0|1/4|0|0|-1/4|0|0|0|0>:
C2_W:=<3/2|0|1/2|0|0|1/4|0|0|0|0>:
#C1_W:=<6|0|1|0|0|-1|0|0|0|0>:
#C2_W:=<6|0|2|0|0|1|0|0|0|0>:
M1_W:=<1/6|-1|0|1|0|0|0|0|0|0>:
M2_W:=<1/6|0|-1|0|0|1|0|0|0|0>:
M3_W:=<0|1/2|-1/2|0|1|0|0|0|0|0>:
M_W:=<0|1|-1|0|0|0|0|0|0|0>:
mcW2W:=<C1_W,C2_W,M1_W,M2_W,M3_W,M_W>:
mcW2M:=Multiply(mcW2W,mWM):

vcW1:=<S1,S2,S3,U1,U2,cA>:
S1_W:=C1_W+<0|1/4|0|0|1/4|0|0|0|0|0>:
S2_W:=C2_W+<0|1/2|0|3/4|-1|0|0|0|0|0>:
S3_W:=C2_W+<0|1/2|0|1/4|0|0|0|0|0|0>:
U1_W:=<0|0|0|0|0|0|1|3|0|0>:
U2_W:=<0|0|0|0|0|0|-1|0|3|0>:
cA_W:=<0|0|0|0|0|0|0|0|0|1>:
#S1_W:=C1_W+<0|1|0|0|1|0|0|0|0|0>:
#S2_W:=C2_W+<0|2|0|3|-4|0|0|0|0|0>:
#S3_W:=C2_W+<0|2|0|1|0|0|0|0|0|0>:
#U1_W:=<0|0|0|0|0|0|1|3|0|0>:
#U2_W:=<0|0|0|0|0|0|-1|0|3|0>:
#cA_W:=<0|0|0|0|0|0|0|0|0|1>:
mcW1W:=<S1_W,S2_W,S3_W,U1_W,U2_W,cA_W>:
mcW1M:=Multiply(mcW1W,mWM):

vcZ:=<A_0,A_1,B_0,B_1,B_2,alpha>:
A0_Z:=<0|0|0|0|0|0|1|-1|0|0>:
A1_Z:=<0|0|0|0|0|0|2|1|3|0>:
B0_Z:=<1|1|1|1|3|0|0|0|0|0>:
B1_Z:=<1|0|0|0|0|-12|0|0|0|0>:
B2_Z:=<0|4|1|1|0|0|0|0|0|0>:
alpha_Z:=<0|0|0|0|0|0|0|0|0|1>:
mcZZ:=<A0_Z,A1_Z,B0_Z,B1_Z,B2_Z,alpha_Z>:
mcZM:=Multiply(mcZZ,mZM):

vcV:=<a,b,f,q_1,q_2,f_0>:
a_V:=<0|0|0|0|0|0|2|1|3|0>:
b_V:=<0|0|0|0|0|0|-1|1|0|0>:
f_V:=<1|1/2|1|1|1|3|0|0|0|0>:
q_1_V:=<0|1|-2|1|1|6|0|0|0|0>:
q_2_V:=<2|-1|0|0|0|0|0|0|0|0>:
f_0_V:=<0|0|0|0|0|0|0|0|0|1>:
mcVV:=<a_V,b_V,f_V,q_1_V,q_2_V,f_0_V>:
mcVM:=Multiply(mcVV,mVM):

for ii in cosmological_system_list do
  for jj in parameter_system_list do
    m||ii||jj:=Multiply(m||ii||M,mM||jj):	
  end do:
end do:

parameters_sets_table:=table([]):
for ii in {op(parameter_system_list)} union {op(cosmological_system_list)} do
  parameters_sets_table[ii]:=convert(v||ii,set):
end do:










