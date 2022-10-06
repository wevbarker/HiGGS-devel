ImposeTheory[IfConstraint_,$ToTheory_]:=Module[{TensorName,tmp,OnShellValue},
	TensorName=ToString@Head@x;(*Not actually needing this yet*)
	tmp=IfConstraint/.PhiToNesterFormPhi;
	tmp=tmp/.ChiPerpToNesterFormChiPerp;
	tmp=tmp/.ChiParaToNesterFormChiPara;
	tmp=tmp/.ChiSingToNesterFormChiSing;
	tmp=tmp/.$ToTheory;
	tmp=tmp//ToNewCanonical;
	tmp=tmp//CollectTensors;
	OnShellValue=tmp;
	Print@"kkr";
	Print@IfConstraint;
	tmp=MakeRule[{Evaluate@IfConstraint,Evaluate@OnShellValue},MetricOn->All,ContractMetrics->True];
	Print@"kke";
	$IfConstraintToTheoryNesterForm={};
	$IfConstraintToTheoryNesterForm=$IfConstraintToTheoryNesterForm~Join~tmp;
OnShellValue];
