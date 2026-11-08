# Model Predictive Control of a Voltage Source Inverter

A MATLAB/Simulink simulation of a three-phase, two-level voltage source inverter (VSI) using finite control set model predictive control (MPC). The controller selects inverter switching states to make load currents follow a sinusoidal reference. The electrical model includes a DC supply, a six-switch bridge, an R-L load, and three-phase back-EMF sources.

## How it works

The model converts reference and measured three-phase currents into stationary alpha-beta coordinates using Clarke transforms. At each control sample, the MATLAB Function block:

1. Estimates back-EMF from the previous switching vector and current measurements.
2. Predicts the next current for each of the eight available switching states.
3. Selects the state with the smallest squared current tracking error.
4. Outputs six complementary gate signals for the inverter bridge.

Scopes and RMS/THD displays support inspection of the simulated electrical signals. The saved simulation stop time is 0.3 seconds.

## Repository layout

| File | Purpose |
| --- | --- |
| `VSI.prj` | MATLAB project entry point; configures the project path and parameter startup script. |
| `models/VSI.slx` | Simulink electrical model, embedded MPC controller, and measurement blocks. |
| `models/Parameters.m` | Load, supply, reference, sampling, voltage-vector, and switching-state definitions. |
| `resources/project/` | MATLAB project configuration and metadata. |

## Run the simulation

Use MATLAB, Simulink, and Simscape Electrical with the Specialized Power Systems blocks referenced by the model. The model was saved in MATLAB R2019a.

1. Open `VSI.prj` in MATLAB. The project adds `models/` to the path and runs `Parameters.m` at startup.
2. Open `VSI.slx` and click **Run**.
3. Open the model's scopes and inspect its RMS and THD displays.

Alternatively, from the repository root in MATLAB:

```matlab
addpath('models');
Parameters;
open_system('VSI');
sim('VSI');
```

## Default parameters

| Parameter | Value |
| --- | --- |
| Control sample time (`Ts`) | 25 microseconds |
| Load resistance (`R`) | 10 ohms |
| Load inductance (`L`) | 10 mH |
| DC-link voltage (`Vdc`) | 520 V |
| Back-EMF peak / frequency (`e`, `f_e`) | 100 V / 50 Hz |
| Current reference peak / frequency (`I_ref_peak`, `f_ref`) | 20 A / 50 Hz |

Edit `models/Parameters.m` and rerun it before simulating to explore different operating conditions. The controller uses the same `R` and `L` parameters as the simulated load.
