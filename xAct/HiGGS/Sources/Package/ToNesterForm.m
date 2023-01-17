(*================*)
(*  ToNesterForm  *)
(*================*)

BuildPackage@"ToNesterForm/NesterFormQ.m";
BuildPackage@"ToNesterForm/CautiousNesterFormQ.m";
BuildPackage@"ToNesterForm/ToO3.m";
BuildPackage@"ToNesterForm/TotalToO3.m";
BuildPackage@"ToNesterForm/CDBToGaugeCovDJGaugeCovDV.m";
BuildPackage@"ToNesterForm/CDToLorentzGaugeCovD.m";
BuildPackage@"ToNesterForm/CollapseA.m";
BuildPackage@"ToNesterForm/PreSimplify.m";

Options[ToNesterForm]={
	ToShell->False,
	Hard->False,
	GToFoliGOption->True};

ToNesterForm[InputExpr_,OptionsPattern[]]:=Module[{
	Expr=InputExpr,		
	PrintVariable,
	Theory},

	If[StringQ@OptionValue@ToShell,Theory=Evaluate@Symbol@OptionValue@ToShell];
	
	PrintVariable=PrintTemporary@" ** ToNesterForm...";

	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`PhiActivate//NoScalar);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`ChiParaActivate//NoScalar);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`ChiPerpActivate//NoScalar);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`ChiSingActivate//NoScalar);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`VarPhiParaActivate//NoScalar);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`VarPhiPerpActivate//NoScalar);
	If[StringQ@OptionValue@ToShell,Expr=Expr/.(Evaluate@(Theory@$ToTheory))];
	(!CautiousNesterFormQ@Expr)~If~(Expr=PreSimplify[Expr,Hard->OptionValue[Hard]]);
	Expr=TotalToO3[Expr,ToShell->OptionValue@ToShell];
	(!CautiousNesterFormQ@Expr)~If~(Expr//=CDToLorentzGaugeCovD);
	Expr=TotalToO3[Expr,ToShell->OptionValue@ToShell];
	(!CautiousNesterFormQ@Expr)~If~(Expr//=CDBToGaugeCovDJGaugeCovDV);
	(!CautiousNesterFormQ@Expr)~If~(Expr//=CDToLorentzGaugeCovD);
	Expr=TotalToO3[Expr,ToShell->OptionValue@ToShell];
	(!CautiousNesterFormQ@Expr)~If~(Expr//=CollapseA);
	(!CautiousNesterFormQ@Expr)~If~(If[OptionValue[GToFoliGOption],Expr=Expr/.xAct`HiGGS`GToFoliG]);
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CollapseJ;
	Expr=Expr/.xAct`HiGGS`JiToJ;
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`HExpand;Expr//=ToNewCanonical;Expr//=GaugeCovDToLorentzGaugeCovD);
	Expr//=ToNewCanonical;
	(!CautiousNesterFormQ@Expr)~If~(Expr//=LorentzGaugeCovDToParaLorentzGaugeCovD;Expr//=ToNewCanonical;);
	NotebookDelete@PrintVariable;
Expr];
