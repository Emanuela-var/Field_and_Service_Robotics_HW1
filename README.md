# Field and Service Robotics - Homework 1

**University of Naples Federico II**  
Master's Degree in Automation and Robotics Engineering

**Student:** Emanuela Varone  

---

## Overview

This repository contains the solutions for Homework 1 of the Field and Service Robotics course. The homework covers fundamental concepts in robotics including actuation analysis, degrees of freedom, configuration space topology, and holonomic/nonholonomic systems.

## Contents

| File | Description |
|------|-------------|
| `Report_HW1_FSR.pdf` | Complete report with theoretical analysis and solutions |
| `Point6_HW1_Emanuela_Varone.m` | MATLAB script for holonomy analysis of Raibert's Hopper Robot |

## Topics Covered

### 1. Actuation Analysis of ATLAS Robot
- Fully actuated vs underactuated configurations
- Analysis during standing and backflip phases

### 2. Degrees of Freedom and Configuration Space Topology
- Experimental surgical manipulator (PUU kinematic structure)
- Spatial mechanism with spherical joints
- Application of Grübler's formula

### 3. Underactuation vs Full Actuation
- Car dynamics with steering and throttle inputs
- KUKA youBot system analysis
- Hexarotor with co-planar propellers
- KUKA iiwa 7-DOF robot

### 4. Involutive Distributions and Annihilator
- Lie bracket computation
- Involutivity verification
- Annihilator calculation for various distributions

### 5. Pfaffian Constraints Integrability
- Proof that constant Pfaffian constraints are always integrable
- Accessibility rank condition application

### 6. Raibert's Hopper Robot Analysis
- Kinematic model derivation
- Holonomy test using Lie brackets
- MATLAB implementation for numerical verification

## MATLAB Script Usage

To run the holonomy analysis for Raibert's Hopper Robot:

```matlab
% Run the script in MATLAB
Point6_HW1_Emanuela_Varone
```

The script performs:
- Symbolic variable definition
- Pfaffian constraint implementation
- Null space computation
- Lie bracket calculation
- Holonomy test with results interpretation

## Key Results

The analysis demonstrates that **Raibert's Hopper Robot is a nonholonomic system**, as the Lie bracket test shows that the extended distribution rank (3) exceeds the original null space rank (2). This implies non-integrable constraints and requires sophisticated control strategies.

## Requirements

- MATLAB with Symbolic Math Toolbox

## License

This project is for educational purposes as part of the Field and Service Robotics course at University of Naples Federico II.
