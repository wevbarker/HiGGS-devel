(* Provides the ToNesterForm command *)

Options[TotalToO3]={ToShell->True,OrderOption->Infinity};
TotalToO3[x_,OptionsPattern[]]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** TotalToO3 with ToShell ",OptionValue[ToShell]," and OrderOption ",OptionValue[OrderOption],"..."];
	Expr=x;
	Expr=Expr/.Global`CDPiToCDPiP;
	Expr=Expr/.Global`CDPiToCDPiPHard;
	Expr=Expr//NoScalar/.Global`PiToPiP;
	Expr=Expr/.Global`PiToPiP;
	Expr=Expr/.Global`PiToPiPHard;
	Expr=Global`ToOrderCanonical[Expr,OptionValue[OrderOption]];
	If[OptionValue[ToShell],Expr=Expr/.Global`$TheoryCDPiPToCDPiPO3,Expr=Expr/.Global`$CDPiPToCDPiPO3];
	Expr//=ToNewCanonical;
	If[OptionValue[ToShell],Expr=Expr/.Global`$TheoryPiPToPiPO3,Expr=Expr/.Global`PiPToPiPO3];
	Expr//=ToNewCanonical;
	Expr=Global`ToO3[Expr,ToShell->OptionValue[ToShell],"Order"->OptionValue[OrderOption]];
	Expr=Global`ToOrderCanonical[Expr,OptionValue[OrderOption]];
	NotebookDelete[PrintVariable];
Expr];

CDBToDJDV[x_]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** CDBToDJDV..."];
	Expr=x;
	Expr=Expr/.Global`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3VCDBToG3DV;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3HCDBToDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3VCDBToG3DV;
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
	Expr=Expr/.Global`CDBCommute;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3HCDBToGaugeCovDJ;
	Expr//=ToNewCanonical;
	Expr=Expr/.G3VCDBToG3GaugeCovDV;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`CDBCommute;
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
		Expr=Expr/.Global`ProjectorGP->ProjectWith@Global`GP;
		Expr=Expr/.xAct`HiGGS`Private`ProjectLorentzGaugeCovDRule;
		*)

		(*this line replaces the comments above, and should be an analogue to previous implementation without derivatives*)
		Expr=Expr/.xAct`HiGGS`Private`ProjectGaugeCovDRule;

		Expr=Expr/.xAct`HiGGS`Private`ProjectedLorentzGaugeCovDVExpand;
		Expr//=ToNewCanonical,

		Expr=Expr/.Global`DGrandActivate;
		Expr=Expr/.Global`DpGrandActivate;

		Expr=Expr/.Global`DpVExpand;
		Expr//=ToNewCanonical];


		Expr=Expr/.Global`epsilonGVToEps;
		Expr=Expr/.Global`epsilonGToEpsV;
		Expr//=ToNewCanonical;

	NotebookDelete[PrintVariable];
Expr];

CollapseA[x_]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** CollapseA..."];
	Expr=x;
	Expr=Expr/.Global`CDAToCDAInert;
	Expr=Expr/.Global`AExpand;
	Expr=Expr/.Global`G3HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`HG3VCDAToHVCDA;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`HG3VAToHVA;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`HExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`CDAInertToCDA;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`HG3BExpand;(*to deal with the strange combination of A epsilon which cancels*)
	Expr=Expr/.Global`G3HExpand;
	Expr=Expr/.Global`HEpsToHG3Eps;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`AHEpsExpand;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`EpsEpsExpand;
	Expr//=ToNewCanonical;(*finished dealing with this combination*)
	NotebookDelete[PrintVariable];
Expr];

Options[PreSimplify]={Hard->False,OrderOption->Infinity};
PreSimplify[x_,OptionsPattern[]]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** TotalToO3 with Hard ",OptionValue[Hard]," and OrderOption ",OptionValue[OrderOption],"..."];
	Expr=x;
	Expr=Global`ToOrderCanonical[Expr,OptionValue[OrderOption]];
	If[OptionValue[Hard],Expr=Expr/.Global`HExpand];
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`HG3BExpandLazy;
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`G3HExpand;
	Expr=Global`ToOrderCanonical[Expr,OptionValue[OrderOption]];
	NotebookDelete[PrintVariable];
Expr];

Options[ToNesterForm]={
	ToShell->True,
	Hard->False,
	OrderOption->Infinity,
	GToFoliGOption->True,
	xTensorCovD->False};

ToNesterForm[x_,OptionsPattern[]]:=Module[{Expr,PrintVariable},
	PrintVariable=PrintTemporary[" ** ToNesterForm with Hard ",OptionValue[Hard]," and OrderOption ",OptionValue[OrderOption]," and GToFoliGOption ",OptionValue[GToFoliGOption],"..."];
	Expr=x;
	Expr=Expr/.Global`PhiActivate//NoScalar;
	Expr=Expr/.Global`ChiParaActivate//NoScalar;
	Expr=Expr/.Global`ChiPerpActivate//NoScalar;
	Expr=Expr/.Global`ChiSingActivate//NoScalar;
	If[OptionValue[ToShell],Expr=Expr/.Global`$ToTheory];
	Expr=PreSimplify[Expr,Hard->OptionValue[Hard],OrderOption->OptionValue[OrderOption]];
	Expr=TotalToO3[Expr,ToShell->OptionValue[ToShell],OrderOption->OptionValue[OrderOption]];
	Expr=Expr~CDToLorentzGaugeCovD~(UsexTensorCovD->OptionValue@xTensorCovD);
	Expr=TotalToO3[Expr,ToShell->OptionValue[ToShell],OrderOption->OptionValue[OrderOption]];
	If[OptionValue@xTensorCovD,
		Expr//=CDBToGaugeCovDJGaugeCovDV,
		Expr//=CDBToDJDV];
	Expr=Expr~CDToLorentzGaugeCovD~(UsexTensorCovD->OptionValue@xTensorCovD);
	Expr=TotalToO3[Expr,ToShell->OptionValue[ToShell],OrderOption->OptionValue[OrderOption]];
	Expr//=CollapseA;
	If[OptionValue[GToFoliGOption],Expr=Expr/.Global`GToFoliG];
	Expr//=ToNewCanonical;
	Expr=Expr/.Global`CollapseJ;
	Expr=Expr/.Global`JiToJ;
	Expr=Global`ToOrderCanonical[Expr,OptionValue[OrderOption]];
	NotebookDelete[PrintVariable];
Expr];
