(*================*)
(*  ToNesterForm  *)
(*================*)

CautiousNesterFormQ[Expr_]:=Quiet@Check[NesterFormQ@Expr,False];

Options[TotalToO3]={ToShell->False,TheoryNameOption->""};
TotalToO3[x_,OptionsPattern[]]:=Module[{
	Expr,
	PrintVariable,
	Theory},

	If[OptionValue[ToShell],Theory=Evaluate@Symbol@OptionValue@TheoryNameOption];

	PrintVariable=PrintTemporary[" ** TotalToO3 with ToShell ",OptionValue[ToShell],"..."];
	Expr=x;
	Expr=Expr/.xAct`HiGGS`CDPiToCDPiP;
	Expr=Expr/.xAct`HiGGS`CDPiToCDPiPHard;
	Expr=Expr//NoScalar/.xAct`HiGGS`PiToPiP;
	Expr=Expr/.xAct`HiGGS`PiToPiP;
	Expr=Expr/.xAct`HiGGS`PiToPiPHard;
	Expr//=ToNewCanonical;
	If[OptionValue[ToShell],Expr=Expr/.(Evaluate@(Theory@$TheoryCDPiPToCDPiPO3)),Expr=Expr/.$CDPiPToCDPiPO3];
	Expr//=ToNewCanonical;
	If[OptionValue[ToShell],Expr=Expr/.(Evaluate@(Theory@$TheoryPiPToPiPO3)),Expr=Expr/.PiPToPiPO3];
	Expr//=ToNewCanonical;
	Expr=ToO3[Expr,ToShell->OptionValue[ToShell],TheoryNameOption->OptionValue@TheoryNameOption];
	Expr//=ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];

CDBToDJDV[x_]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** CDBToDJDV..."];
	Expr=x;
	Expr=Expr/.xAct`HiGGS`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];

CDBToGaugeCovDJGaugeCovDV[x_]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** CDBToGaugeCovDJGaugeCovDV..."];
	Expr=x;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];

Options[CDToLorentzGaugeCovD]={UsexTensorCovD->False};
CDToLorentzGaugeCovD[x_,OptionsPattern[]]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** CDToLorentzGaugeCovD..."];
	Expr=x;
	If[OptionValue@UsexTensorCovD,

		Expr=Expr/.xAct`HiGGS`Private`CDGaugeFieldsToInert;
		Expr//=xAct`HiGGS`Private`CDToGaugeCovD;
		Expr=Expr/.xAct`HiGGS`Private`CDGaugeFieldsFromInert;

		(*
		Expr//=xAct`HiGGS`Private`GaugeCovDToLorentzGaugeCovD;
		Expr=Expr/.xAct`HiGGS`ProjectorGP->ProjectWith@xAct`HiGGS`GP;
		Expr=Expr/.xAct`HiGGS`Private`ProjectLorentzGaugeCovDRule;
		*)

		(*this line replaces the comments above, and should be an analogue to previous implementation without derivatives*)
		Expr=Expr/.xAct`HiGGS`Private`ProjectGaugeCovDRule;

		Expr=Expr/.xAct`HiGGS`Private`ProjectedLorentzGaugeCovDVExpand;
		Expr//=ToNewCanonical;

		Expr=Expr/.xAct`HiGGS`Private`ProjectedParaLorentzGaugeCovDVExpand;
		Expr//=ToNewCanonical;

		(*this line to catch some stragglers*)
		Expr//=xAct`HiGGS`Private`LorentzGaugeCovDToParaLorentzGaugeCovD;
		Expr//=ToNewCanonical;
		,

		Expr=Expr/.xAct`HiGGS`DGrandActivate;
		Expr=Expr/.xAct`HiGGS`DpGrandActivate;

		Expr=Expr/.xAct`HiGGS`DpVExpand;
		Expr//=ToNewCanonical];


		Expr=Expr/.xAct`HiGGS`epsilonGVToEps;
		Expr=Expr/.xAct`HiGGS`epsilonGToEpsV;
		Expr//=ToNewCanonical;

	NotebookDelete[PrintVariable];
Expr];

CollapseA[x_]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** CollapseA..."];
	Expr=x;
	Expr=Expr/.xAct`HiGGS`CDAToCDAInert;
	Expr=Expr/.xAct`HiGGS`AExpand;
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HG3VCDAToHVCDA;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HG3VAToHVA;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CDAInertToCDA;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`HG3BExpand;(*to deal with the strange combination of A epsilon which cancels*)
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr=Expr/.xAct`HiGGS`HEpsToHG3Eps;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`AHEpsExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`EpsEpsExpand;
	Expr//=ToNewCanonical;(*finished dealing with this combination*)
	NotebookDelete[PrintVariable];
Expr];

Options[PreSimplify]={Hard->False};
PreSimplify[x_,OptionsPattern[]]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** TotalToO3 with Hard ",OptionValue[Hard],"..."];
	Expr=x;
	Expr//=ToNewCanonical;
	If[OptionValue[Hard],Expr=Expr/.xAct`HiGGS`HExpand];
	Expr//=ToNewCanonical;
	(*Expr=Expr/.xAct`HiGGS`HG3BExpandLazy;*)
	Expr=Expr/.xAct`HiGGS`HG3BExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`G3HExpand;
	Expr//=ToNewCanonical;
	NotebookDelete[PrintVariable];
Expr];

Options[ToNesterForm]={
	ToShell->False,
	Hard->False,
	GToFoliGOption->True,
	xTensorCovD->True,
	TheoryNameOption->""};

ToNesterForm[x_,OptionsPattern[]]:=Module[{
	Expr,
	PrintVariable,
	Theory},

	If[OptionValue[ToShell],Theory=Evaluate@Symbol@OptionValue@TheoryNameOption];
	

	PrintVariable=PrintTemporary[" ** ToNesterForm with Hard ",OptionValue[Hard]," and GToFoliGOption ",OptionValue[GToFoliGOption],"..."];
	Expr=x;
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`PhiActivate//NoScalar);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`ChiParaActivate//NoScalar);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`ChiPerpActivate//NoScalar);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`ChiSingActivate//NoScalar);
	If[OptionValue[ToShell],Expr=Expr/.(Evaluate@(Theory@$ToTheory))];
	(!CautiousNesterFormQ@Expr)~If~(Expr=PreSimplify[Expr,Hard->OptionValue[Hard]]);
	Expr=TotalToO3[Expr,ToShell->OptionValue[ToShell],TheoryNameOption->OptionValue@TheoryNameOption];
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr~CDToLorentzGaugeCovD~(UsexTensorCovD->OptionValue@xTensorCovD));
	Expr=TotalToO3[Expr,ToShell->OptionValue[ToShell],TheoryNameOption->OptionValue@TheoryNameOption];
	(!CautiousNesterFormQ@Expr)~If~(If[OptionValue@xTensorCovD,
		Expr//=CDBToGaugeCovDJGaugeCovDV,
		Expr//=CDBToDJDV]);
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr~CDToLorentzGaugeCovD~(UsexTensorCovD->OptionValue@xTensorCovD));
	Expr=TotalToO3[Expr,ToShell->OptionValue[ToShell],TheoryNameOption->OptionValue@TheoryNameOption];
	(!CautiousNesterFormQ@Expr)~If~(Expr//=CollapseA);
	(!CautiousNesterFormQ@Expr)~If~(If[OptionValue[GToFoliGOption],Expr=Expr/.xAct`HiGGS`GToFoliG]);
	Expr//=ToNewCanonical;
	Expr=Expr/.xAct`HiGGS`CollapseJ;
	Expr=Expr/.xAct`HiGGS`JiToJ;
	(!CautiousNesterFormQ@Expr)~If~(Expr=Expr/.xAct`HiGGS`HExpand;Expr//=ToNewCanonical;Expr//=GaugeCovDToLorentzGaugeCovD);
	Expr//=ToNewCanonical;
	(!CautiousNesterFormQ@Expr)~If~(Expr//=LorentzGaugeCovDToParaLorentzGaugeCovD;Expr//=ToNewCanonical;);
	NotebookDelete[PrintVariable];
Expr];
