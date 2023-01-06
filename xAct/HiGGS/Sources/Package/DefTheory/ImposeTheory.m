(*================*)
(*  ImposeTheory  *)
(*================*)

ImposeTheory[IfConstraint_,TheoryName_?StringQ]:=Module[{
	Theory,
	$IfConstraintToTheoryNesterFormValue,
	TensorName,
	tmp,
	OnShellValue},

	Theory=Evaluate@Symbol@TheoryName;

	TensorName=ToString@Head@x;(*Not actually needing this yet*)
	tmp=IfConstraint/.PhiToNesterFormPhi;
	tmp=tmp/.ChiPerpToNesterFormChiPerp;
	tmp=tmp/.ChiParaToNesterFormChiPara;
	tmp=tmp/.ChiSingToNesterFormChiSing;
	tmp=tmp/.VarPhiPerpToNesterFormVarPhiPerp;
	tmp=tmp/.VarPhiParaToNesterFormVarPhiPara;
	tmp=tmp/.(Evaluate@(Theory@$ToTheory));
	tmp=tmp//ToNewCanonical;
	tmp=tmp//CollectTensors;
	OnShellValue=tmp;

	tmp=MakeRule[{Evaluate@IfConstraint,Evaluate@OnShellValue},MetricOn->All,ContractMetrics->True];
	$IfConstraintToTheoryNesterFormValue=(Evaluate@(Theory@$IfConstraintToTheoryNesterForm));
	$IfConstraintToTheoryNesterFormValue=$IfConstraintToTheoryNesterFormValue~Join~tmp;

	UpdateTheoryAssociation[TheoryName,$IfConstraintToTheoryNesterForm,$IfConstraintToTheoryNesterFormValue];
	
OnShellValue];
