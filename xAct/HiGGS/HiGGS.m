(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Input::Initialization:: *)
xAct`HiGGS`$Version={"2.2.1",{2022,2,1}};


(* ::Input::Initialization:: *)
(* HiGGS, Hamiltonian analysis of Poincare gauge theory *)

(* Copyright (C) 2005-2018 Will E. V. Barker *)

(* This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License as
 published by the Free Software Foundation; either version 2 of
 the License,or (at your option) any later version.

This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 General Public License for more details.

You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place-Suite 330, Boston, MA 02111-1307,
  USA. 
*)


(* ::Input::Initialization:: *)
(* :Title: HiGGS *)

(* :Author: Will E. V. Barker *)

(* :Summary: Hamiltonian analysis of Poincare gauge theory *)

(* :Brief Discussion:
   - tbc
*)
  
(* :Context: xAct`HiGGS` *)

(* :Package Version: 2.2.1 *)

(* :Copyright: Will E. V. Barker (2005-2018) *)

(* :History: see HiGGS.History *)

(* :Keywords: *)

(* :Source: HiGGS.nb *)

(* :Mathematica Version: 6.0 and later *)

(* :Limitations: 
	- many *)


(* ::Input::Initialization:: *)
BeginPackage["xAct`HiGGS`",{"xAct`xTensor`","xAct`xPerm`","xAct`xCore`","xAct`xTras`"}];


(* ::Input::Initialization:: *)
SetOptions[$FrontEndSession,EvaluationCompletionAction->"ScrollToOutput"];


(* ::Input::Initialization:: *)
Print["Package xAct`HiGGS`  version ",$Version[[1]],", ",$Version[[2]]];
Print["CopyRight (C) 2005-2018, Will E. V. Barker, under the General Public License."];
Print[xAct`xCore`Private`bars];
Print["This free version of HiGGS is an open source dependent of the xAct bundle, but NOT an official part thereof."];
Print["This free version of HiGGS incorporates Cyril Pitrou's code from the public repository at https://github.com/xAct-contrib/examples."];
Print[xAct`xCore`Private`bars];


(* ::Input::Initialization:: *)
Print["The notebook directory is "<>NotebookDirectory[]];
$HiGGSInstallDirectory=Select[FileNameJoin[{#,"xAct/HiGGS"}]&/@$Path,DirectoryQ][[1]];
Print["At least one HiGGS installation directory was found at "<>$HiGGSInstallDirectory<>"."];
$HiGGSInstallDirectory=FileNameJoin@{NotebookDirectory[],"xAct/HiGGS"};
Print[xAct`xCore`Private`bars];


(* ::Input::Initialization:: *)
ActiveCellTags={"build","cache"};
UnitTests={"CheckOrthogonalityToggle","ShowIrrepsToggle","ProjectionNormalisationsCheckToggle","ShowIrrepsToggle"};
PrematureCellTags={"TransferCouplingsPerpPerpToggle","TransferCouplingsPerpParaToggle"};
BinaryNames={"O13ProjectionsToggle","CompleteO3ProjectionsToggle","ProjectionNormalisationsToggle","CanonicalPhiToggle","NonCanonicalPhiToggle","ChiPerpToggle","ChiSingToggle"};
BuiltBinaries=BinaryNames~Select~(FileExistsQ@FileNameJoin@{$HiGGSInstallDirectory,"bin/build/"<>#<>".mx"}&);
ActiveCellTags=ActiveCellTags~Join~(BinaryNames~Complement~BuiltBinaries);


(* ::Input::Initialization:: *)
(*
NotebookEvaluate[FileNameJoin@{$HiGGSInstallDirectory,"HiGGS_sources.nb"},EvaluationElements\[Rule]"Tags"->ActiveCellTags];
Print["The context on quitting HiGGS.nb is ",$Context,"."];
*)


(* ::Input::Initialization:: *)
$Theory::usage="The gauge theory as defined by a system of equations which constrains the coupling coefficients";
BuildHiGGS::usage="Rebuild the HiGGS session";
DefTheory::usage="Define a theory using a system of equations to constrain the coupling coefficients";
BuildShell::usage="Define a set of rules which can be used to restrict quantities to the constrained shell";


(* ::Input::Initialization:: *)
Begin["xAct`HiGGS`Private`"];
BuildHiGGS[]:=Module[{},
xAct`xTensor`Private`MakeDefInfo[BuildHiGGS,$KernelID,{"HiGGS environment for kernel",""}];
Print["Building session from ",FileNameJoin@{$HiGGSInstallDirectory,"HiGGS_sources.nb"}," with active CellTags ",ActiveCellTags,"."];
NotebookEvaluate[FileNameJoin@{$HiGGSInstallDirectory,"HiGGS_sources.nb"},EvaluationElements->"Tags"->ActiveCellTags,InsertResults->False];
Print["The context on quitting HiGGS.nb is ",$Context,"."];
Print["The HiGGS environment is now ready to use."];
];

End[];
EndPackage[];
(*
Quit[];
*)
