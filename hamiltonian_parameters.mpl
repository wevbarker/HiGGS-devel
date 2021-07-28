with(LinearAlgebra):
with(StringTools):
with(Physics):
with(CLIo):
read(`theory_tools.mpl`):

dit({},"test");

convert_parameters_print_equations(N,M);
convert_parameters_print_equations(N,Y);
convert_parameters_print_equations(Y,N);
convert_parameters_print_equations(N,W);
convert_parameters_print_equations(cW1,M);
convert_parameters_print_equations(cW1,N);
dit({},"now looking at function");


dit({},"simplify..");

read(`theories.mpl`):

sectors:=indices(Hamiltonian_partitions,`nolist`):
cases:=[indices(theories,`nolist`)]:
minimal_theories:=table([]):
eqs:=convert_parameters_return_equations(Y,N);
eqs2:=convert_parameters_return_equations(cW1,N);
eqs3:=convert_parameters_return_equations(Y,M);

dit({},"general");

fullequations:=proc(XX,YY):
  res:=subs(T1=kappa*T1,T2=kappa*T2,T3=kappa*T3,L=kappa*L,subsop(1=NULL,convert(convert_parameters_return_equations(XX,YY),list))):
  res:=subs(cA=EHW,A=EHM,hA=EHN,L=EHY,res):
  return res
end proc:

cfullequations:=proc(XX,YY):
  res:=subs(T1=kappa*T1,T2=kappa*T2,T3=kappa*T3,L=kappa*L,subsop(6=NULL,convert(convert_parameters_return_equations(XX,YY),list))):
  res:=subs(cA=EHW,A=EHM,hA=EHN,L=EHY,res):
  return res
end proc:

eqMW:=fullequations(M,W);
eqMY:=fullequations(M,Y);
eqMN:=fullequations(M,N);
eqWM:=fullequations(W,M);
eqWY:=fullequations(W,Y);
eqWN:=fullequations(W,N);
eqYM:=fullequations(Y,M);
eqYW:=fullequations(Y,W);
eqYN:=fullequations(Y,N);
eqNM:=fullequations(N,M);
eqNW:=fullequations(N,W);
eqNY:=fullequations(N,Y);


eqcW1M:=cfullequations(cW1,M);
eqcW1W:=cfullequations(cW1,W);
eqcW1Y:=cfullequations(cW1,Y);
eqcW1N:=cfullequations(cW1,N);

_LatexSmallFractionConstant:=1:

lequation:=proc(mequation):  
  res:=latex(mequation,output=string);
  res:=SubstituteAll(res,"\\it","");
  res:=SubstituteAll(res,"\\,","");
  res:=SubstituteAll(res,"=","&\\equiv ");
  res:=SubstituteAll(res,"kappa","\kappa ");
  res:=SubstituteAll(res,"EHM","\\alpha_0 ");
  res:=SubstituteAll(res,"EHW","\\check{\\alpha}_0 ");
  res:=SubstituteAll(res,"EHN","\\alp{0} ");
  res:=SubstituteAll(res,"EHY"," l ");
  res:=RegSubs("hB(.)"="\\bet\{\\1\}",res);
  res:=RegSubs("hA(.)"="\\alp\{\\1\}",res);
  res:=RegSubs("cB(.)"="\\check\{\\beta\}_\{\\1\}",res);
  res:=RegSubs("cA(.)"="\\check\{\\alpha\}_\{\\1\}",res);
  res:=RegSubs("B(.)"="\\beta_\{\\1\}",res);
  res:=RegSubs("A(.)"="\\alpha_\{\\1\}",res);
  res:=RegSubs("T(.)"="t_\{\\1\}",res);
  res:=RegSubs("R(.)"="r_\{\\1\}",res);
  res:=RegSubs("S(.)"="\\sigma_\{\\1\}",res);
  res:=RegSubs("U(.)"="\\upsilon_\{\\1\}",res);
  res:=cat(res,",");
  return res:
end proc:

sequation:="":
tmp:=map(lequation,eqcW1M):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[3]," & ",tmp[4]," \\quad ",SubstituteAll(tmp[5],"&","")," \\label{eqcW1M} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqcW1W):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[3]," & ",tmp[4]," \\quad ",SubstituteAll(tmp[5],"&","")," \\label{eqcW1W} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqcW1Y):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[3]," & ",tmp[4]," \\quad ",SubstituteAll(tmp[5],"&","")," \\label{eqcW1Y} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqcW1N):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[3]," & ",tmp[4]," \\quad ",SubstituteAll(tmp[5],"&","")," \\label{eqcW1N} "):
print(sequation);

fprintf("../thesis/phd-thesis-template-2.4/Appendix2/cosmotest",sequation):

fin();

sequation:="":
tmp:=map(lequation,eqMW):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\label{eqMW} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqMY):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\label{eqMY} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqMN):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\label{eqMN} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqWM):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\label{eqWM} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqWY):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\label{eqWY} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqWN):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\label{eqWN} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqYM):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\label{eqYM} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqYW):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\label{eqYW} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqYN):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\label{eqYN} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqNM):
sequation:=cat(sequation,tmp[2]," & ",tmp[3]," & ",tmp[6]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[1]," & ",tmp[4]," & ",tmp[5]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\label{eqNM} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqNW):
sequation:=cat(sequation,tmp[2]," & ",tmp[3]," & ",tmp[6]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[1]," & ",tmp[4]," & ",tmp[5]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\label{eqNW} \\\\ \\cline{2-5} \n"):
tmp:=map(lequation,eqNY):
sequation:=cat(sequation,tmp[1]," & ",tmp[2]," & ",tmp[3]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[4]," & ",tmp[5]," & ",tmp[6]," \\nonumber \\\\\n "):
sequation:=cat(sequation,tmp[7]," & ",tmp[8]," & ",tmp[9]," \\label{eqNY}  "):
print(sequation);

#fprintf("../thesis/phd-thesis-template-2.4/Appendix2/test",sequation):
fin();


eqMW:=fullequations(M,W);
eqMY:=fullequations(M,Y);
eqMN:=fullequations(M,N);
eqWM:=fullequations(W,M);
eqWY:=fullequations(W,Y);
eqWN:=fullequations(W,N);
eqYM:=fullequations(Y,M);
eqYW:=fullequations(Y,W);
eqYN:=fullequations(Y,N);
eqNM:=fullequations(N,M);
eqNW:=fullequations(N,W);
eqNY:=fullequations(N,Y);

#minimal:=RegSubs("hA(.)"="\\[Alpha]\\1W",convert(minimal,string));
#minimal:=cat("TheoryCase",convert(ii,string),"=",minimal,";\n"):
#fprintf("./grand_tables",minimal):

dit({},"cosmological");
eqs2:=convert_parameters_return_equations(cW1,M);
eqs2:=convert_parameters_return_equations(cW1,W);
eqs2:=convert_parameters_return_equations(cW1,Y);
minimal:=convert_parameters_return_equations(cW1,N);


#eqs:=convert_parameters_return_equations(N,M);
#eqs:=convert_parameters_return_equations(M,N);
#fin();

cases:={seq(i,i=1..58)}:
limited_cases:={2,16}:

viable_cases:={1,2,3,4,5,6,7,10,11,12,14,15,16,17,18,19,26}:

converted_theories:=table([]):

for ii in cases do
  converted_theories[ii]:=[simplify(theories[ii][1],eqs),theories[ii][2]]:
end do:

converted_theories2:=table([]):

for ii in cases do
  converted_theories2[ii]:=[simplify(eqs2,converted_theories[ii][1])]:
end do:

converted_theories3:=table([]):

for ii in cases do
  converted_theories3[ii]:=[simplify(theories[ii][1],eqs3),theories[ii][2]]:
end do:

converted_theories_unitarity:=table([]):

for ii in cases do
  converted_theories_unitarity[ii]:=[simplify(theories[ii][3],eqs),theories[ii][2]]:
end do:

converted_theories_addconds:=table([]):

for ii in limited_cases do
  converted_theories_addconds[ii]:=[simplify(theories[ii][4],eqs),theories[ii][2]]:
end do:

no_theory_collisions:=proc(case,conditions):
  ret:=true:
  for jj in cases while jj<>case do
    if evalb(simplify(converted_theories[jj][1],altered_theory)={0}) then
      dit({fred,italic},"...reduces to Case %d",jj):
      ret:=false:
    end if:
  end do:
  return ret:
end proc:

no_new_primaries:=proc(conditions,primaries):
  untested_sectors:={sectors} minus primaries:
  ret:=true:
  for ii in untested_sectors do
    if simplify(Hamiltonian_partitions[ii][1],conditions)=0 then
      dit({fred,italic},"...invokes new PIC %s",convert(ii,string)):
      ret:=false:
    end if:
  end do:
  return ret:
end proc:

find_primaries:=proc(conditions):
  ret:={}:
  for ii in sectors do
    if simplify(Hamiltonian_partitions[ii][1],conditions)=0 then
      ret:=ret union {ii}:
    end if:
  end do:
  return ret:
end proc:

find_frees:=proc(primaries):
  ret:={sectors} minus primaries:
  return ret:
end proc:

find_simple_primaries:=proc(conditions,primaries):
  ret:={}:
  for ii in primaries do
    if (simplify(Hamiltonian_partitions[ii][2],conditions) in {0,none}) then
      ret:=ret union {ii}:
    end if:
  end do:
  return ret:
end proc:


      #print(simplify(convert(Hamiltonian_partitions[ii][3],set),conditions));

find_massless_primaries:=proc(conditions,primaries):
  ret:={}:
  ret2:={}:
  ret3:={}:
  ret4:={}:
  for ii in primaries do
    if (0 in simplify(convert(Hamiltonian_partitions[ii][3],set),conditions)) then
      ret:=ret union {ii}:
    end if:
    if (simplify(convert(Hamiltonian_partitions[ii][3],set),conditions)={0}) then 
      ret2:=ret2 union {ii}:
    end if: 
    if (simplify(Hamiltonian_partitions[ii][4],conditions)=0) then 
      ret3:=ret3 union {ii}:
    end if: 
    if (simplify(Hamiltonian_partitions[ii][5],conditions)=0) then 
      ret4:=ret4 union {ii}:
    end if: 
  end do:
print(ret);
print(ret2);
print(ret3);
print(ret4);
  return [ret,ret2]:
end proc:

find_massless_frees:=proc(conditions,frees):
  ret:={}:
  for ii in frees do
    if (0 in convert(simplify(Hamiltonian_partitions[ii][3],conditions),set)) then
      ret:=ret union {ii}:
    end if:
  end do:
  return ret:
end proc:

eliminate_complexity:=proc(case,sub_case):
  conditions:=sub_case[1]:
  primaries:=sub_case[2]:
  simple_primaries:=sub_case[3]:
  ret:={}:
  complex_primaries:=primaries minus simple_primaries:
  for ii in complex_primaries do 
    dit({},"trying to simplify PIC %s",convert(ii,string));
    new_conditions:=conditions union {Hamiltonian_partitions[ii][2]}:
    if no_theory_collisions(case,new_conditions) and no_new_primaries(new_conditions,primaries) then
      new_simple_primaries:=simple_primaries union ii:
      ret:=ret union {[new_conditions,primaries,simple_primaries]}:
      dit({},"found a simplification"):
    end if:
  end do:
  return ret:
end proc:

simple_cases:={2,16}:
#simple_cases:={20,24,25,26,28,32,3,17,16,26,2}:

YN_higher_spin:={YN1p,YN1m,YN2p,YN2m,YN0m2m1,YN0m2m2,KN}:


#mock version of kinetic part of Hamiltonian

#fin();

for ii in simple_cases do 
#for ii in viable_cases do
  dit({fred,underline},"--------------------------------------------------------------------------------------------");
  dit({},"case %d",ii):
  conditions:=converted_theories[ii][1]:
  conditions2:=converted_theories2[ii]:
  conditions3:=converted_theories3[ii][1]:
  conditions_unitarity:=converted_theories_unitarity[ii][1]:
  conditions_addconds:=converted_theories_addconds[ii][1]:
  primaries:=find_primaries(conditions):
  simple_primaries:=find_simple_primaries(conditions,primaries):
  massless_primaries_total:=find_massless_primaries(conditions,primaries):
  massless_primaries:=massless_primaries_total[1]:
  massless_primaries_new:=massless_primaries_total[2]:
  frees:=find_frees(primaries):
  simple_frees:=find_simple_primaries(conditions,frees):
  massless_frees:=find_massless_frees(conditions,frees):
  dit({},"MA:"):
  print(op(conditions2)):
  dit({},"Mike:"):
  print(op(conditions3)):
  dit({},"conditions:"):
  print(op(conditions)):
  dit({},"better conditions:"):
  better_condiions:=solve(conditions):
  print(better_condiions):
  dit({},"better Mike conditions:"):
  better_condiions3:=solve(conditions3):
  print(better_condiions3):
  dit({},"unitarity conditions:"):
  print(op(map(simplify,conditions_unitarity,better_condiions))):
  dit({},"add conds conditions:"):
  print(op(map(simplify,conditions_addconds,better_condiions))):
  dit({},"primaries:"):
  print(op(primaries)):
  dit({},"of which simple:"):
  print(op(simple_primaries)):
  dit({},"of which massless:"):
  print(op(massless_primaries)):
  dit({},"of which massless new:"):
  print(op(massless_primaries_new)):
  dit({},"frees:"):
  print(op(frees)):
  dit({},"of which simple:"):
  print(op(simple_frees)):
  dit({},"of which massless:"):
  print(op(massless_frees)):
end do:

fin();

(*

fin();

for ii in YN_higher_spin do 
#for ii in viable_cases do
  dit({fred,underline},"--------------------------------------------------------------------------------------------");
  dit({},"case %s",convert(ii,string)):
  conditions:=theories[ii][1]:
  primaries:=find_primaries(conditions):
  simple_primaries:=find_simple_primaries(conditions,primaries):
  massless_primaries:=find_massless_primaries(conditions,primaries):
  frees:=find_frees(primaries):
  massless_frees:=find_massless_frees(conditions,frees):
  dit({},"primaries:"):
  print(op(primaries)):
  dit({},"of which simple:"):
  print(op(simple_primaries)):
  dit({},"of which massless:"):
  print(op(massless_primaries)):
  dit({},"frees:"):
  print(op(frees)):
  dit({},"of which massless:"):
  print(op(massless_frees)):
end do:


fin();

*)

#	this was used to identify cases for which the roton-roton sector is malignant
for ii from 1 to 58 do 
#for ii in viable_cases do
  dit({fred,underline},"--------------------------------------------------------------------------------------------");
  dit({},"case %d",ii):
  conditions:=converted_theories[ii][1]:
  primaries:=find_primaries(conditions):
  simple_primaries:=find_simple_primaries(conditions,primaries):
  dit({},"primaries:"):
  print(op(primaries)):
  dit({},"of which simple:"):
  print(op(simple_primaries)):
  dit({},"Finding any new levels"):
  sub_case:=[conditions,primaries,simple_primaries]:
  next_level:=eliminate_complexity(ii,sub_case):
  print(next_level):
  dit({},"considering minimal statement of conditions"):
  print(conditions):
  minimal:=eliminate(conditions,{hB1,hB2,hB3,hA1,hA2,hA3,hA4,hA5,hA6})[1]:
  minimal:=simplify(minimal,{hA=0}):
  print(minimal):
  minimal:=RegSubs("="="->",convert(minimal,string));
  minimal:=RegSubs("hB(.)"="\\[Beta]\\1W",convert(minimal,string));
  minimal:=RegSubs("hA(.)"="\\[Alpha]\\1W",convert(minimal,string));
  minimal:=cat("TheoryCase",convert(ii,string),"=",minimal,";\n"):
  fprintf("./new_cases_definitions.txt",minimal):
end do:


fin():
