![license](https://img.shields.io/github/license/wevbarker/HiGGS)
[![arXiv](https://img.shields.io/badge/arXiv-1234.56789-b31b1b.svg)](https://arxiv.org/abs/paper-b)
[![arXiv](https://img.shields.io/badge/arXiv-1234.56789-b31b1b.svg)](https://arxiv.org/abs/paper-c)
[![arXiv](https://img.shields.io/badge/arXiv-2101.02645-b31b1b.svg)](https://arxiv.org/abs/2101.02645)

# Hamiltonian Gauge Gravity Surveyor (HiGGS)
## License

Copyright © 2022 Will E. V. Barker

HiGGS is distributed as free software under the [GNU General Public License (GPL)](https://www.gnu.org/licenses/gpl-3.0.en.html).

HiGGS is provided without warranty, or the implied warranty of merchantibility or fitness for a particular purpose.

Users of HiGGS, including authors of derivative works, must cite the 2022 HiGGS papers in their resulting publications.

These conditions apply to all software in this repository, including HPC visualisation tools.

## About

HiGGS is an `unofficial' part of the [xAct bundle](http://www.xact.es/). It provides tools for the Hamiltonian analysis (canoncical analysis or Dirac-Bergmann algorithm) of gravity with spacetime curvature and torsion.

## Install

1. Make sure you have [installed xAct](http://www.xact.es/download.html).
2. Download HiGGS:
	```bash
	git clone https://github.com/wevbarker/HiGGS
	cd HiGGS
	```
3. Place the `./xAct/HiGGS` directory relative to your xAct install. A global install might have ended up at: 
	```bash
	/usr/share/Mathematica/Applications/xAct/HiGGS
	```

## Quickstart 


The package loads just like any other part of `xAct`, just open a fresh notebook and run:
```wolfram
Needs["xAct`HiGGS`"]
```
This 

## What's in the box? 

The HiGGS package has the following structure:
```
xAct
└── HiGGS
    ├── bin
    │   └── build
    │       ├── CanonicalPhiToggle.mx
    │       ├── CDPiPToCDPiPO3.mx
    │       ├── ChiPerpToggle.mx
    │       ├── ChiSingToggle.mx
    │       ├── CompleteO3ProjectionsToggle.mx
    │       ├── GeneralComplementsToggle.mx
    │       ├── NesterFormIfConstraints.mx
    │       ├── NonCanonicalPhiToggle.mx
    │       ├── O13ProjectionsToggle.mx
    │       ├── ProjectionNormalisationsToggle.mx
    │       └── VelocityToggle.mx
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
The file `init.wl` is called when the package is invoked, and points to `HiGGS.m`, a small Wolfram language file and main package file sourced by the notebook `HiGGS.nb`. 

When the HiGGS environment is actually built, `HiGGS.m` is actually running `HiGGS_sources.m` - the larger `physics package' sourced by `HiGGS_source.nb`.

During the course of the build, the binaries `./xAct/HiGGS/bin/build/*.mx` are incorporated; these contain some heavy expressions.

The files `./xAct/HiGGS/Documentation/*.pdf` are carbon copies of the source notebooks.

## What are peta4 and appcg? 

The files `/peta4.*` and `/appcg.*` refer to the jobs which implement the [HiGGS Commissioning Survey](https://wevbarker.com/higgs.html) and various unit tests. The names refer to two computing services: 
1. [Peta-4](https://www.hpc.cam.ac.uk/systems/peta-4) is a supercomputer, the CPU component of the heterogeneous [CSD3](https://www.hpc.cam.ac.uk/high-performance-computing) facility belonging to the [University of Cambridge](https://www.cam.ac.uk/).
2. [appcg](https://www.astro.phy.cam.ac.uk/local/computing) is a small, private compute server belonging to the [Cavendish Laboratory Astrophysics Group]().

These sources are included to give inspiration to users who which to perform HPC surveys, though the user's architecture may well differ.
