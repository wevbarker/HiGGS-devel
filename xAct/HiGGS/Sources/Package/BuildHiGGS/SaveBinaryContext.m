(*=====================*)
(*  SaveBinaryContext  *)
(*=====================*)

SaveBinaryContext[Context_String]:=DumpSave[FileNameJoin[{$HiGGSInstallDirectory,"Binaries","Contexts",Context<>".mx"}],Context];
