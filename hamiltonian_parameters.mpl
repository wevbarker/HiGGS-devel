#with(LinearAlgebra):
#with(StringTools):
#with(CLIo):
read(`theory_tools.mpl`):

dit({},"test");

convert_parameters_print_equations(N,M);
convert_parameters_print_equations(N,Y);
convert_parameters_print_equations(Y,N);
convert_parameters_print_equations(N,W);
dit({},"now looking at function");

dit({},"simplify..");


read(`theories.mpl`):

theories[2];


sectors:=indices(Hamiltonian_partitions,`nolist`):
cases:=[indices(theories,`nolist`)]:
minimal_theories:=table([]):
eqs:=convert_parameters_return_equations(Y,N);

dit({},"explicit test, for some reason Case 2 is coming back with three constrained sectors...");

simplify(theories[2][1],eqs);

#fin();

for jj in cases do
  dit({fred,underline},"--------------------------------------------------------------------------------------------");
  print(jj);
  if type(jj,integer) then
    minimal_theories[jj]:=simplify(theories[jj][1],eqs):
  else
    minimal_theories[jj]:=theories[jj][1]:
  end if:
  untested_sectors:={sectors}:
  dit({},"nonminimal constraints");
  constraints:={}:
  massless:={}:
  for ii in untested_sectors do
    if simplify(Hamiltonian_partitions[ii][1],minimal_theories[jj])=0 then
      constraints:=constraints union {ii}:
    end if:
    mass:=1:
    for kk in Hamiltonian_partitions[ii][3] do
      mass:=mass*simplify(kk,minimal_theories[jj]):
    end do:
    if mass=0 then
      massless:=massless union {ii}:
    end if:
  end do: 
  free:=untested_sectors minus constraints:
  massive:=untested_sectors minus massless:
  dit({},"constrained sectors:");
  print(op(constraints)):
  dit({},"superficially free massive sectors:");
  print(op(free intersect massive)):
  print(op(theories[jj][2][1])):
  dit({},"superficially free massless sectors:");
  print(op(free intersect massless)):
  print(op(theories[jj][2][2])):
(*
  dit({},"finding minimal version");
  change:=true:
  while change do
    change:=false:
    for ii in untested_sectors do
      if simplify(Hamiltonian_partitions[ii][1],minimal_theories[jj])=0 then
	dit({fred},"%s is constrained",ii):
	if Hamiltonian_partitions[ii][2]<>none then
	  minimal_theories[jj]:=minimal_theories[jj] union {Hamiltonian_partitions[ii][2]}:
	end if:
	untested_sectors:=untested_sectors minus {ii}:
	change:=true:
      end if:
    end do: 
  end do:
*)
end do:





fin();
