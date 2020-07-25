with(LinearAlgebra):
with(StringTools):
with(CLIo):
read(`theory_tools.mpl`):

dit({},"test");

convert_parameters_print_equations(N,M);
convert_parameters_print_equations(N,Y);
convert_parameters_print_equations(Y,N);
convert_parameters_print_equations(N,W);
dit({},"now looking at function");

dit({},"simplify..");

read(`theories.mpl`):

sectors:=indices(Hamiltonian_partitions,`nolist`):
cases:=[indices(theories,`nolist`)]:
minimal_theories:=table([]):
eqs:=convert_parameters_return_equations(Y,N);
eqs:=convert_parameters_return_equations(N,M);
eqs:=convert_parameters_return_equations(M,N);

fin();

cases:={seq(i,i=1..58)}:

viable_cases:={1,2,3,4,5,6,7,10,11,12,14,15,16,17,18,19}:

converted_theories:=table([]):

for ii in cases do
  converted_theories[ii]:=[simplify(theories[ii][1],eqs),theories[ii][2]]:
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

find_simple_primaries:=proc(conditions,primaries):
  ret:={}:
  for ii in primaries do
    #if simplify(Hamiltonian_partitions[ii][2],conditions)=0 then #counts as simple only if not vanishing by construction!
    if (simplify(Hamiltonian_partitions[ii][2],conditions) in {0,none}) then
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
  fprintf("/home/williamb/cases_definitions.txt",minimal):
end do:


fin():
