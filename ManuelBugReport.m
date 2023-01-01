(*==========================================*)
(*  A short file to address Manuel's email  *)
(*==========================================*)

Print@"This time around I have no patience for the notebook at all, so let's
just load something to allow better formatting in vi...";

Get@FileNameJoin@{NotebookDirectory[],"VimFormat.m"};

Comment@"Okay, so from this point onwards the commentary for ManuelBugReport.m
will appear in blue, but all the HiGGS output will still be in key...";

Comment@"First load the latest version of the HiGGS package:";

<<xAct`HiGGS`;

Comment@"We are working in the context of the TEGR, so we need to load it into
memory. I didn't document this, but we can pass some options to hide basically
all the details:"

ViewTheory["TEGR", Literature->False, Brackets->False, Velocities->False];

Comment@"So the current issue pertains to the auto-commutator of the
super-Hamiltonian. We can obtain this, and cache it into a binary for future
use...";

(*
AutoCommutator = PoissonBracket[TEGR@$SuperHamiltonian,TEGR@$SuperHamiltonian,ToShell->False,Parallel->True];
Comment@"Since it takes a while to obtain I save this...";
DumpSave[FileNameJoin@{NotebookDirectory[],"AutoCommutator.mx"},{AutoCommutator}];
Quit[];
*)

Get@FileNameJoin@{NotebookDirectory[],"AutoCommutator.mx"};

Comment@"...here is the auto-commutator recovered from the file";
Print@AutoCommutator;

Comment@"Now from this statement of the auto commutator we follow Manuel's
computations in the email from 23rd Dec.";

TestTerm=AutoCommutator[[1,0]]/.{ProjectorGP->ProjectWith[GP]};
TestTerm//=Expand;
TestTerm//=ContractMetric;
TestTerm//=ToCanonical;
TestTerm//=Select[#,Not@*FreeQ[PiPB0p]]&;
TestTerm//=Select[#,Not@*FreeQ[PiPB1m]]&;

Comment@"Here is the selection of contributions to the auto-commutator which
contain the scalar and odd-vector tetrad momenta:";
Print@TestTerm;

Comment@"In this there is only a derivative of S2, not S1, so we follow the
step of integrating by parts:";
AntisymmetrizedTerm=TestTerm-ParaLorentzGaugeCovD[-a][SmearingLeft[]SmearingRight[]PiPB0p[]PiPB1m[a]/6/J[]];
AntisymmetrizedTerm//=Expand;
AntisymmetrizedTerm//=ContractMetric[#,OverDerivatives->True]&;
AntisymmetrizedTerm//=ToCanonical;
Print@AntisymmetrizedTerm;

Comment@"So now indeed there is antisymmetry, but there is a covariant
derivative acting on an induced metric. The fact that this does not vanish
automatically is indeed a bug, and perhaps I can fix this within the future of
this branch before the next merge. For now, to make this vanish, we force as
follows:";
AntisymmetrizedTerm//=ToBasicForm;
AntisymmetrizedTerm//=ToNesterForm;
AntisymmetrizedTerm//=ToCanonical;
Print@AntisymmetrizedTerm;
Comment@"And here above we can see the torsion and measure terms (which can
	surely never cancel).";

Comment@"It seems to me that one possible line of thinking here, might be that
the term which we used above to antisymmeterise does not properly constitute a
surface term. If Poisson brackets are well defined for functionals obtained by
integrating densities (scalars multiplied by the spatial measure J) over a
constant-time hypersurface, then it does seem that the output of PoissonBracket
should be unique only up to divergences (partial derivatives using strictly
	three spatial coordinates) of some quantities, and I guess that is your
design. It seems natural (but I cannot for the moment make it quite precise)
that if these partial divergences were to be written covariantly by pulling out
a factor of the measure J from under the derivative, then the (now covariant)
divergence must act on a vector (not a vector density) with one raised Greek
index. Now to proceed I have to remind myself that conjugate momenta contain
(by their definition from the Lagrangian density) an implicit factor of the
measure already, as compared with e.g. the fields or field strength tensors,
and so once J has been pulled out the covariant derivative could (amongst other
	kinds of terms) be acting on a second power of momentum divided by a
squared J. Equivalently, the whole surface term could be a partial
(spatial-index) divergence of a second power of momentum divided by a single
power of J. On this basis, there is only one such term we can use to
antisymmetrise the given expression:";
AntisymmetrizedTerm=TestTerm-HoldForm[CD[-a][G3[a,-c]H[-b,c]PPara[b,-k]SmearingLeft[]SmearingRight[]PiPB0p[]PiPB1m[k]/6/J[]]];
Print@AntisymmetrizedTerm;

Comment@"To doubly-clarify here, since the documentation is still not written,
CD is always the partial derivative with Greek (coordinate) indices implied, G3
contracts strictly with Greek indices and picks out only the spatial
coordinates (i.e. G[0,a]=0, I use G3 to enforce Blagojevic's alpha, beta Greek
indices running from 1,3), PPara carries only Lorentz indices and projects
parallel to the hypersurface (it is mathematically equivalent to the induced
	metric, one of the many-too-many ways that the induced metric can be
written, for historical reasons! This I hope to improve), and H is the inverse
translational gauge field with both Greek and Lorenz indices. In fact, I only
include PPara for safety, since I'm about to call ToNesterForm on a nonlinear
quantity (which is dangerous, it could give a very large non-covariant output
	as you know!) -- the parallel character is implied already by the
Lorentz index on the PiPB1m, and this could be seen by expanding the whole
thing with ToBasicForm.";

Comment@"Okay so, simplifying the whole thing as above:";
AntisymmetrizedTerm//=ReleaseHold;
AntisymmetrizedTerm=AntisymmetrizedTerm/.PADMActivate;
AntisymmetrizedTerm//=Expand;
AntisymmetrizedTerm//=ContractMetric[#,OverDerivatives->True]&;
AntisymmetrizedTerm//=ToCanonical;
AntisymmetrizedTerm//=ToBasicForm;
AntisymmetrizedTerm//=ToNesterForm;
AntisymmetrizedTerm//=ToCanonical;
Print@AntisymmetrizedTerm;

Quit[];
