![release](https://pantheonscience.github.io/states/release.png)

# Tutorial for ExaWind-NaluWind workflow with post-processing

<p align="center">
    <img width="750" src="doc/img/workflow.png"/>
</p>
<p align="center">Diagram of the workflow in this example.</p>

A repository for examples using `ExaWind-NaluWind` and `ParaView` for creation of `Cinema` databases.

ExaWind-NaluWind build instructions for Spack can be found [here](https://nalu-wind.readthedocs.io/en/latest/source/user/build_spack.html). The Spack environment in this repo matches the ExaWind-NaluWind install available in the E4S cache.

The embedded example run is derived from a regression test, and can be found in the ExaWind-NaluWind source [here](https://github.com/Exawind/nalu-wind/tree/88342423d9ba3b22f33887357876bc4f05fefc3d/reg_tests/test_files/nonIsoEdgeOpenJet). Small tweaks were made to make the simulation run through more timesteps.

<p align="center">
<table>
<tr>
<td><img width="200" src="validate/data/pantheon.cdb/RenderView1_000000.png"</td>
<td><img width="200" src="validate/data/pantheon.cdb/RenderView1_000005.png"</td>
<td><img width="200" src="validate/data/pantheon.cdb/RenderView1_000011.png"</td>
</tr>
</table>
</p>
<p align="center">Images from the resulting Cinema database (used to validate run)</p>

The workflow does the following:

- Creates a [Pantheon](http://pantheonscience.org/) environment and build location
- Uses `spack` to find an installed version of [ExaWind-NaluWind](https://nalu-wind.readthedocs.io/en/latest/)
- Runs a regression test, which produces output readable by [ParaView](https://paraview.org)
- Runs a `ParaView` (`pvpython`) script to produce a `Cinema` database
- Installs a `Cinema` viewer, then packages up the results
- Validates the `Cinema` database

## Using this repository

This repository is specifcally designed to run on a virtual machine that has ExaWind/nalu-wind installd, and includes only the scripts needed to run that installed version. 

To us this repository, clone it and then:

- Execute the workflow by typing `./execute`. Take a look at this file to see the steps that are executed, and where to look for more detail.
