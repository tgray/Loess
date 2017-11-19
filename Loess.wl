(* ::Package:: *)

(* ::Title:: *)
(*Loess` Package*)


(* ::Text:: *)
(*Algorithm from https://mathematica.stackexchange.com/questions/45519/smoothing-listcontourplot-contours/45524#45524.*)
(**)
(*Source is modified from 3D data to 2D data.*)


BeginPackage["Loess`"];


(* ::Subtitle:: *)
(*Loess*)


Loess::usage="y = Loess[{{x1,y1},..}, k, order:2] constructs a local fit of 
	order \!\(\*
StyleBox[\"order\",\nFontSlant->\"Italic\"]\) of the data using the \!\(\*
StyleBox[\"k\",\nFontSlant->\"Italic\"]\) nearest points.  The local fit is quadratic.";


LoessFit::usage="y = Fitting function for Loess.  Loess is a convenience
	wrapper around LoessFit that precalculates the nearest values for the 
	data.";


EndPackage[];


(* ::Title:: *)
(*Loess`Private` Package*)


Begin["Loess`Private`"];


(* ::Subtitle:: *)
(*Loess*)


(*local quadratic regression with k neighbours around point (x,y)*)
LoessFit[nearest_,k_,order_:2][x_]:=Module[{n,d,w,f,model},n=nearest[x,k];
model=Table[u^i,{i,0,order}];
d=EuclideanDistance[{x},Most[#]]&/@n;
d=d/Max[d];
w=(1-d^3)^3;
f=LinearModelFit[n,model,{u},Weights->w];
f[x]]

Loess[data_,k_,order_:2]:=Module[{nearest,fit},
(* precompute spatial data structure because we'll be needing nearest neighbours a lot *)
nearest=Nearest[data/.{x_,y_}:>({x}->{x,y})];
fit=LoessFit[nearest,k,order];
fit]



End[];
