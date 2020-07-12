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
tot:=simplify(%,eqs);


simplify(hA1+hA2,tot);



sectors:=indices(Hamiltonian_partitions,`nolist`):
cases:=indices(theories,`nolist`):
minimal_theories:=table([]):
eqs:=convert_parameters_return_equations(Y,N);

simplify(theories[2],eqs);

#fin();


for jj from 1 to 41 do
  dit({fgreen},"case %d",jj):
  minimal_theories[jj]:=simplify(theories[jj],eqs):
  untested_sectors:={sectors}:
  change:=true:
  while change do
    dit({},"another round!"):
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
end do:





fin();
