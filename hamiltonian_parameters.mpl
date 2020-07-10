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
eqs:=convert_parameters_return_equations(Y,N);

dit({},"simplify..");
simplify({R1,R3/2-R4,T1,L},eqs);






fin();
