(*===================*)
(*  InternalIndices  *)
(*===================*)

(*
We would like to create some very easy functions which act like ReplaceDummies, but access exclusively the new internal indices. For ease of use, these functions will have a single argument and he range of internal indices will be soldered on to their names.
*)

ReplaceDummiesZ1[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"1"))&/@(ToString/@Alphabet[])));
ReplaceDummiesZ2[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"2"))&/@(ToString/@Alphabet[])));
ReplaceDummiesZ3[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"3"))&/@(ToString/@Alphabet[])));
ReplaceDummiesZ4[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"4"))&/@(ToString/@Alphabet[])));
ReplaceDummiesZ5[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"5"))&/@(ToString/@Alphabet[])));
ReplaceDummiesZ6[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"6"))&/@(ToString/@Alphabet[])));
ReplaceDummiesZ7[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"7"))&/@(ToString/@Alphabet[])));
ReplaceDummiesZ8[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"8"))&/@(ToString/@Alphabet[])));
ReplaceDummiesZ9[Expr_]:=(Expr)~ReplaceDummies~(IndexList@@((Symbol@("xAct`HiGGS`Private`Z"<>#<>"9"))&/@(ToString/@Alphabet[])));
