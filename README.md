# Adaptive Reachability Analysis for Safe Driving in Mixed Platoons

This repository contains the implementation and report of a project developed during the **Practical Course "Motion Planning for Autonomous Vehicles"** at the Technical University of Munich (WS 2023/24), under the supervision of **Prof. Dr.-Ing. Matthias Althoff**, **Di Liu**, and **Simone Baldi**.

The work investigates the effects of human-driven disturbances in **mixed platoons** of vehicles and applies adaptive **reachability analysis** to model, quantify, and simulate safety boundaries in such scenarios.

> 🚗 Focus: Continuous Reachability Analysis with nonlinear vehicle dynamics in mixed platoons using CORA.

---

## 💡 Project Description

The project explores how disturbances—originating from human-driven vehicles—affect the safety margins of a single automated vehicle at the end of a vehicle convoy (mixed platoon).

The simulation is grounded in the **Optimal Velocity Model (OVM)** and focuses on key state variables:

- Spacing error `eᵢ`
- Relative velocity `νᵢ`
- Acceleration `aᵢ`

The system is modeled as a **nonlinear differential equation** and analyzed via **reachable sets**, computed using the [CORA Toolbox](https://tumcps.github.io/CORA/pages/continuous-systems/index.html), developed by the TUM Chair of Cyber-Physical Systems.

---

## 🧰 Technologies and Tools

- **MATLAB** (R2023a)
- **CORA Toolbox** for:
  - Nonlinear system modeling
  - Zonotope-based set representations
  - Reachability computations
  - Monte Carlo-style simulations
- Plotting and visualization of reachable sets

---

## 🛠 Files

- `simulation.m` – Main script for reachability computation and visualization  
- `MPFAV-33.pdf` – Full written report of the project, including methodology and mathematical background

---

## 🚀 What Was Implemented

- Formalization of a nonlinear dynamic model for a vehicle in a platoon
- CORA-based reachability setup with generator matrices, input sets, and zonotope configuration
- Simulation of random initial conditions and disturbances
- Visual comparison of reachable sets and trajectories
- Extension to multi-vehicle scenarios with scalable modeling logic
- Modular plotting and result evaluation

---

## 📌 Notes

This project builds directly on the **CORA Toolbox**, which offers state-of-the-art methods for reachability analysis in continuous systems.  
All results and simulations rely on CORA’s methods for nonlinear system analysis and zonotope representations. Some placeholder references or comments in the code/report are part of the student draft and should be interpreted accordingly.

---

## 📄 Citation / Acknowledgments

This work was developed as part of the **Motion Planning for Autonomous Vehicles** course at TUM’s Chair of Real-Time Systems and Robotics.  
Supervised by:  
- Prof. Dr.-Ing. Matthias Althoff  
- Di Liu  
- Simone Baldi

Student: **Maximilian Stefan Schreber**  
Contact: [max.schreber@tum.de](mailto:max.schreber@tum.de)