# H-OBCA
This repository only has been tested on ubuntu 20.04

Hierarchical Optimization-Based Collision Avoidance - An algorithm for generating dynamically feasible parking trajectories
Paper describing the theory can be found [here](http://arxiv.org/abs/1711.03449).

This repository changes minor code errors when running [H-OBCA](https://github.com/XiaojingGeorgeZhang/H-OBCA) and give you solution how to download the old version of julia(0.6.0)

Also you can test the algotithms' computation time,length of the path repeatedly on main.jl (check line 222 to 308)  
*check no warm-start option

## Short Description
H-OBCA is an optimization-based  approach  for autonomous  parking. It builds on [OBCA](https://github.com/XiaojingGeorgeZhang/OBCA), which is a recent method for generating obstacle-free trajectories using optimal control.

H-OBCA is able to generate high-quality *kino-dynamically feasible obstacle-free* trajectories. These trajectories are smooth, and can be accurately tracked by simple low-level path following controllers. A [Julia](https://julialang.org/)-based implementation is provided.

## Julia Installation (ver 0.6.0)
Open a new terminal and go to your Downloads folder:
```sh
cd ~/Downloads
```
Use wget to retrieve the latest compressed Julia Linux Binaries:
```sh
wget https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.0-linux-x86_64.tar.gz
```
Extract the .tar.gz:
```sh
tar -xvzf julia-0.6.0-linux-x86_64.tar.gz
```
Copy the extracted folder to /opt:
```
sudo cp -r julia-903644385b /opt/
```
Create a symbolic link to julia inside the /usr/local/bin folder:
```
sudo ln -s /opt/julia-903644385b/bin/julia /usr/local/bin/julia
```
Finally, you can test your installation by re-opening a terminal and typing:
```
julia
```

## How to run the Parking code:

### First steps

1. Change to the directory when you down this repository

2. Open Julia in terminal

3. Install theses packages first to avoid issues about dataframe  
Pkg.add("DataFrames") , Pkg.add("Hiccup") 

4. Install Julia package JuMP using Pkg.add("JuMP")

5. Install Julia package Ipopt using Pkg.add("Ipopt")

6. Install Julia package PyPlot using Pkg.add("PyPlot")

7. Install Julia package NearestNeighbors using Pkg.add("NearestNeighbors")

8. Install Julia package ControlSystems using Pkg.add("ControlSystems")  
If you see error message as follows do Pkg.update() and install the package again
```sh
ERROR: Unsatisfiable requirements detected for package OrdinaryDiffEq
```

9. To use Ros for Julia install [RobotOs](https://github.com/jdlangs/RobotOS.jl/releases) using Pkg.add("RobotOS")  
**TBU with codes**

You may see other error messages to install other Julia packages. You can type it to terminal and download the other packages
> **Note** : while install Ipopt using Pkg.add("Ipopt") or Pkg.build(Ipopt) you may see error messages then type
"sudo apt-get install gfortran" and install Ipopt again

### Running the parking example

1. Start Julia in terminal

2. Type in terminal: include("setup.jl")

3. Type in terminal: include("main.jl")


### Modifying the code

1. To play with start points, change x0 in main.jl and run
the code by: include("main.jl")

2. If you change anything in one of the collision avoidance
problems, you need to activate the changes by running:
include("setup.jl")

3. If you change the size of the car in main.jl, the change
also need to be made in collision_check.jl

4. If you want to change the obstacles of the code, change **road_w** or **spot_w** variables in main.jl

5. Also **max_delta** variable can regulate maximum steering angle

### Note
1. this code has been tested on Julia 0.5.1 and 0.6.0, and might not run on any other Julia versions
2. For best results, run code in Julia terminal
