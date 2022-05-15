# Hamiltonian Gauge Gravity Surveyor (HiGGS)
## License

Copyright © 2022 Will E. V. Barker

HiGGS is distributed as free software under the GNU General Public License (GPL).

HiGGS is provided without warranty, or the implied warranty of merchantibility or fitness for a particular purpose.

Users of HiGGS, including authors of derivative works, must cite the 2022 HiGGS papers in their resulting publications:

arXiv:
arXiv:

## About

HiGGS is an `unofficial' part of the xAct bundle. It provides tools for the Hamiltonian analysis (canoncical analysis or Dirac-Bergmann algorithm) of gravity with spacetime curvature and torsion.

## Install

1. Make sure you have installed xAct.
2. Download HiGGS:
```
git clone https://github.com/wevbarker/HiGGS
cd HiGGS
```
3. Place the `xAct/HiGGS` directory relative to your `xAct` install. A global install might be at: 
```
/usr/share/Mathematica/Applications/xAct/HiGGS
```
A local install might be at:
```
~/.Mathematica/Applications/xAct/HiGGS
```

## Quickstart 

## What's in the box? 

```
xAct
└── HiGGS
    ├── bin
    │   ├── build
    │   │   ├── CanonicalPhiToggle.mx
    │   │   ├── CDPiPToCDPiPO3.mx
    │   │   ├── ChiPerpToggle.mx
    │   │   ├── ChiSingToggle.mx
    │   │   ├── CompleteO3ProjectionsToggle.mx
    │   │   ├── GeneralComplementsToggle.mx
    │   │   ├── NesterFormIfConstraints.mx
    │   │   ├── NonCanonicalPhiToggle.mx
    │   │   ├── O13ProjectionsToggle.mx
    │   │   ├── ProjectionNormalisationsToggle.mx
    │   │   └── VelocityToggle.mx
    │   └── HiGGS.mx
    ├── Documentation
    │   ├── HiGGS.pdf
    │   └── HiGGS_sources.pdf
    ├── HiGGS.m
    ├── HiGGS.nb
    ├── HiGGS_sources.m
    ├── HiGGS_sources.nb
    ├── HiGGS_variations.m
    └── Kernel
        └── init.wl
```


The package loads just like any other part of `xAct`, just open a fresh notebook and run:
```
Needs["xAct`HiGGS`"]
```


