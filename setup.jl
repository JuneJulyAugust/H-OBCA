###############
# H-OBCA: Hierarchical Optimization-based Collision Avoidance - a path planner for autonomous parking
# Copyright (C) 2018
# Alexander LINIGER [liniger@control.ee.ethz.ch; Automatic Control Lab, ETH Zurich]
# Xiaojing ZHANG [xiaojing.zhang@berkeley.edu; MPC Lab, UC Berkeley]
# Atsushi SAKAI [atsushisakai@global.komatsu; Komatsu Ltd / MPC Lab]
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
###############
# The paper describing the theory can be found here:
# 	X. Zhang, A. Liniger and F. Borrelli; "Optimization-Based Collision Avoidance"; Technical Report, 2017, [https://arxiv.org/abs/1711.03449]
#   X. Zhang, A. Liniger, A. Sakai and F. Borrelli; "Autonomous  Parking  using  Optimization-Based  Collision  Avoidance"; Technical Report, 2018 [add URL]
###############

###############
# setup.jl: run this file before running main.jl
###############

##############################
# include JuMP -> Optimization modeling tool
# include IPOPT -> Interior point based nonlinear solver
# include PyPlot -> Ploting library (matplotlib python)
##############################
using JuMP, Ipopt, PyPlot, NearestNeighbors, ControlSystems
##############################
# register warm start function
##############################
# register Distance and Signeddistance
# parking optimal control problems

include("ParkingSignedDist.jl")
include("ParkingConstraints.jl")
##############################
# register polytope converter
include("obstHrep.jl")
##############################
# register ploting function
include("plotTraj.jl")
include("hybrid_a_star.jl")
##############################
include("DualMultWS.jl")
include("veloSmooth.jl")

# function that clears terminal output
clear() = run(@static is_unix() ? `clear` : `cmd /c cls`)

