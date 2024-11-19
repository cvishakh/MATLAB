# MATLAB: Intro to MATLAB with Static Truss Experiment

## Objective
The aim of this experiment is to prepare a MATLAB script for the visualization of a 2D truss and the determination of the reaction and bar forces occurring within it. The truss is assumed to be an ideal truss, meaning the bars only transmit tensile or compressive forces.

## Overview of a Plane Truss
A plane truss can be perceived as a system of \( k \) initially free-moving nodes connected by \( s \) bars. By adding support connections to bear the truss, the remaining degree of freedom \( f \) of the bounded system is given by:

\[ f = 2k - (a + s) \]

where:  
- \( k \): number of nodes  
- \( s \): number of bars  
- \( a \): number of support reactions  

The external degree of freedom \( f_a \) is defined as:

\[ f_a = 3 - a \]

---

## Task Descriptions

### Task 1: Equilibrium Conditions
- **Objective**: Analyze the plane truss shown and establish the equilibrium conditions for each node.
- **Requirement**: Cut the truss free and set up the two equilibrium equations for every node.

---

### Task 2: Load Variables from a `.mat` File
- **Objective**: Load and extract data from a given `.mat` file.
- **Steps**:
  1. Use `uigetfile` for an interactive file selection dialogue.
  2. Load the file into the workspace.
  3. Extract and separate the following variables:
     - Coordinates of the nodes
     - Connectivity matrix
     - Bearing information
     - External forces

---

### Task 3: Truss Visualization
- **Objective**: Visualize the truss structure.
- **Requirements**:
  - Plot the truss with bars, nodes, bearings, and external forces.
  - Include labels for the axes and a legend.
- **Output**: An exemplary truss representation is provided as a reference.

---

### Task 4: Static Determinacy Check
- **Objective**: Verify the static determinacy of the truss.
- **Steps**:
  1. Check if \( f = 0 \) (a condition for static determinacy).
  2. Display a meaningful message in the Command Window.
  3. If the condition is not met, terminate the script with an error.

---

### Task 5: Angle Calculation
- **Objective**: Calculate the angle \( \alpha \) between each bar and the x-axis.
- **Implementation**:
  - Use `atan` or `atan2` for the angle calculation.
  - Consider differences between these functions and bar alignment in Cartesian coordinates.
  - Note that bar force directions differ at the two connected nodes.

---

### Task 6: Formulate and Solve Equations
- **Objective**: Formulate and solve the system of equations.
- **Requirements**:
  - Use input and generated variables to construct the system in matrix form.
  - Solve for the unknown reaction vector \( r \).
  - Reference dimensions based on the initial equilibrium analysis from Task 1.

---

### Task 7: Visualize Results
- **Objective**: Visualize the results.
- **Steps**:
  1. Color-code the bars based on their load conditions:
     - Zero force
     - Tension force
     - Compression force
  2. Refer to the exemplary representation for guidance.

---

### Task 8: Save Results
- **Objective**: Save the calculated results.
- **Steps**:
  - Store support and bar forces, along with input parameters, in a new `.mat` file.
  - Example file name: `results_truss1.mat`

---

## Notes
- Ensure all steps are implemented efficiently and clearly.
- Test the script thoroughly to verify the correctness of calculations an

