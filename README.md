# MATLAB
Intro to Matlab with Static Truss Experiment:
The aim of this experiment is to prepare a Matlab script for the visualisation of a 2D truss and the determination of the reaction and bar forces occurring in it. It is assumed that the truss is an ideal truss, which means that the bars in it can only transmit tensile or compressive forces.

A plane truss can be perceived as a system of k initially free-moving nodes that are connected to each other by s bars. With the addition of support connections by which the truss is borne, the remaining degree of freedom f of the bounded system follows as f = 2k − (a + s)
and the external degree of freedom fa: fa = 3 − a.

%Task 1:
Cut the plane truss shown here free and set up the two equilibrium conditions for every node in the truss.

%Task 2:
Load the variables of one of the given mat files into the workspace and extract the coordinates of the nodes, the connectivity matrix, the bearings as well and the external forces as separate variables. To enable an interactive selection of the input file, a matlab dialogue box can be utilised by exploiting the Matlab function uigetfile.

%Task 3:
Visualise the given truss with its bars (and numbers), nodes, bearings and forces. The labelling of the axes and the legend should also be given. An exemplary representation is given below.

%Task 4: 
Check whether the necessary condition f = 0 of static determinateness is fulfilled and write out an appropriate and informative message in the Command Window. If necessary, terminate the script with an error message.

%Task 5:
Calculate the angle α that every bar encloses with the x-axis. Use either the Matlab function atan or atan2 for your implementation. Consider here the difference between these two functions and the alignment of the bar in the Cartesian coordinate system. Additionally, note that the direction of the bar force at its two nodes is not identical.

%Task 6:
Formulate the linear system of equations in matrix form by using the given input variables and already generated variables from the previous tasks. Note the dimensions of the bounded system (see task 1). Then solve this linear system of equations for the unknown vector r.

%Task 7:
Visualise the solution of the calculation by colouring the bars according to their load condition, i.e. zero, tension or compression bar. An exemplary representation is shown here.

%Task 8:
Save the results of the calculation (support and bar forces) as well as the input parameters in a new mat file, e.g. labelled results_truss1.mat.
