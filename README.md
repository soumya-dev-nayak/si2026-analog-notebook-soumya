# Notebook: SI 2026 Analog IC Design

The below link is the official GitHub repository for the Summer Internship 2026 – Analog IC Design.

- [SI-2026 Analog IC Design GitHub Repo](https://github.com/silicon-vlsi/si2026-analog-notebook)

---

## WEEK-1

## DAY-1 (25/05/2026)

### Session 1: Linux Familiarization and Circuit Theorems

#### Linux Training
- Introduction to the Linux operating system and terminal environment.
- Practiced basic Linux commands for file and directory management.
- Created, modified, copied, moved, and deleted files and folders using terminal commands.
- Learned navigation commands and filesystem structure.

#### GitHub Familiarization
- Introduction to Git and GitHub workflow.
- Created and configured a GitHub account and repository.
- Learned repository structure, commits, and version control basics.
- Practiced cloning, pushing, and updating repository contents.

#### Superposition Theorem
- Studied the principle and statement of the Superposition Theorem.
- Learned the procedure for analyzing linear circuits with multiple independent sources.
- Solved numerical problems using source deactivation techniques.
- Verified circuit responses through superposition analysis.

### Session 2: Thevenin's Theorem

#### Thevenin Equivalent Circuit
- Studied the statement and significance of Thevenin's Theorem.
- Learned the procedure to determine Thevenin voltage (Vth) and Thevenin resistance (Rth).
- Derived and verified Thevenin equivalent circuits for different networks.
- Explored the relationship between Superposition and Thevenin theorems.
- Solved example problems involving load analysis using Thevenin equivalents.

#### NMOS analysis
- Plotted the Id vs Vgs using ngspice.
- plotted Id vs Vds using thr ngspice

## Day 2 (26/05/2026)

### Session 1

#### First-Order RC Circuits
- Studied the fundamentals of first-order RC (Resistor-Capacitor) circuits.
- Analyzed the transient response of first-order RC circuits.
- Understood the concept of the time constant (\(\tau = RC\)) and its significance in circuit behavior.
- Performed calculations related to capacitor voltage and current during charging and discharging processes.

#### Rise Time and Fall Time Analysis
- Studied the definitions and importance of rise time and fall time in first-order systems.
- Calculated rise time and fall time for various RC circuit configurations.
- Solved numerical problems based on transient response characteristics.
- Analyzed the effect of resistance and capacitance values on circuit response speed.

#### Practice Problems
- Solved multiple analytical problems involving RC circuit transient analysis.
- Applied theoretical concepts to determine voltages, currents, time constants, and switching responses.

### Session 2

#### NMOS Device Analysis
- Analyzed the relationship between Drain Current (ID) and Gate-to-Source Voltage (VGS).
- Identified different regions of operation: Cut-off, Triode, and Saturation.
- Calculated important NMOS device parameters from characteristic equations.

#### First-Order RC Circuit Simulation
- Simulated first-order RC circuits under different operating conditions.
- Observed circuit behavior for:
  - **T >> τ** (Input period much greater than the time constant)
  - **T << τ** (Input period much smaller than the time constant)
- Compared charging and discharging waveforms under different excitation frequencies.
- Studied the effect of the RC time constant on output waveform characteristics.

#### Average Output Voltage Analysis
- Calculated the average output voltage for RC circuits under periodic excitation.
- Compared theoretical calculations with simulation results.

#### AC Analysis and Frequency Response
- Performed AC analysis of RC circuits.
- Generated and interpreted Bode plots.
- Studied:
  - Magnitude Response (Gain Plot)
  - Phase Response Plot
- Analyzed cutoff frequency, gain variation, and phase shift characteristics.
- Correlated frequency-domain behavior with circuit parameters.

## DAY-3 (27/05/2026)

### Session 1

#### LC & RC Circuit Analysis 
- Analysis of different types of 1st order RC circuit configurations.
- Analysis and the finding of Vout, gain, Wp etc. parameters of LC and RC, CR circuits and their different configurations.

### Session 2

#### Op-Amp ckt Analysis
- Solved and Analyse different Op-Amp circuit configurations along with their gain and Impedance findings.
  
#### Open Circuit Time Constant 
- Derieve and analyse the expression for the open circuit Time Constant for:
    - A simple RC circuit
    - Different RC ckt configurations
      
#### ADALM Board Demo
- A demonstration experiment was performed using the ADALM 2000 device and the [SCOPY](https://github.com/analogdevicesinc/scopy) software on the Linux operating system.

## DAY-4 (28/05/2026)

### Session 1

#### Frequency Response
- Analysis and Frequency resposne of linear circuits (high-pass/low-pass).
- By Bode Plot the AC analysis of the filters were done.
- Getting Started with the MEMS microphone.
  
### Session 2

#### ADALM 2000 Exercises 
- Concepts of the MEMS microphone.
- Generation of Different Signals and their measurements using the [ADALM2000](https://www.analog.com/en/resources/evaluation-hardware-and-software/evaluation-boards-kits/adalm2000.html) and  [SCOPY](https://github.com/analogdevicesinc/scopy) software
- A Simple Voltage Divider Circuit and the measurements using  [ADALM2000](https://www.analog.com/en/resources/evaluation-hardware-and-software/evaluation-boards-kits/adalm2000.html) and  [SCOPY](https://github.com/analogdevicesinc/scopy) software

## DAY-5 (29/05/2026)

### Session 1

#### MEMS microphone modelling
- Modelling of the [SparkFun MEMS Microphone](https://cdn.sparkfun.com/assets/0/5/8/b/1/SPH8878LR5H-1_Lovato_DS.pdf) using its datasheet and extracting the required parameters for circuit modelling.
- Finding the Equivalent Thevenin's Circuit of the MEMS mic.
- Modelling the MEMS microphone in the XSCHEM for Simulation and measuing its various parameters:
    - Voltage gain in Db.
    - Phase vs. Frequency.
    - Absolute V (Vabs).
    - Pole and Zero frequency.
    - Vin vs Vout.
      
### Session 2
- Designing a Equivalent Thevenin's Circuit.
- Measuring the Parameters (Vth & Ith) using the[ADALM2000](https://www.analog.com/en/resources/evaluation-hardware-and-software/evaluation-boards-kits/adalm2000.html) and  [SCOPY](https://github.com/analogdevicesinc/scopy) software

---

## WEEK-2

## DAY-6 (01/06/2026)

### Session 1

#### MEMS Microphone and AFE Modeling
- Studied the [SparkFun MEMS Microphone Datasheet](https://cdn.sparkfun.com/assets/0/5/8/b/1/SPH8878LR5H-1_Lovato_DS.pdf) and derived its Thevenin equivalent model (\(V_{th}\) and \(R_{th}\)) for 60 dB-SPL at 1 kHz.
- Studied the [OPA344 Datasheet](https://www.ti.com/lit/ds/symlink/opa345.pdf) and modeled the amplifier as a VCVS using its DC gain.
- Modeled the complete Analog Front-End (AFE) circuit in Xschem using the [SparkFun Breakout Board Schematic](https://cdn.sparkfun.com/assets/7/5/6/e/d/SparkFun_Analog_MEMS_Microphone_Breakout_SPH8878LR5H-1.pdf).
  
#### AC and Transient Analysis of the AFE
- Performed AC analysis of the AFE using the microphone model as an AC source.
- Generated magnitude and phase plots and measured:
  - Output gain at 1 kHz
  - High-pass filter (-3 dB) frequency
  - Low-pass filter (-3 dB) frequency
    
### Session 2
- Measured the power supply gain (PSG) in dB.
- Performed transient analysis at:
  - 1 Hz
  - 1 kHz
  - 200 kHz
- Measured peak input voltage, peak output voltage, and gain.

#### RC and CR Circuit Analysis using ADALM2000
- Performed practical analysis of RC and CR circuits using [ADALM2000](https://www.analog.com/en/resources/evaluation-hardware-and-software/evaluation-boards-kits/adalm2000.html) and [SCOPY](https://github.com/analogdevicesinc/scopy).
- Observed charging/discharging characteristics, filtering effects, and phase shift under different operating conditions.
- Done the AC anslysis and onserve the Bode plot of both the RC & CR filters
- Compared practical observations with theoretical and simulation results.

## DAY-7 (02/06/2026)

### Session 1

#### IC design flow
- Got the detailed overview of the [IC Design Flow](https://github.com/silicon-vlsi/SI-2026-AnalogIC/blob/main/content/lec-intro-vlsi-0602-2026.pdf).
- Got familier with different types of ICs and their working.

### Session 2

#### OpAmp pole testing
- Modeled the OpAmp as a single-pole amplfier (pole was found from the [datasheet](https://www.ti.com/lit/ds/symlink/opa345.pdf) ) and rerun all the above measurement of the MEMS mic.

#### MEMS mic Breakout board testing
- Use the Breakout board of the MEMS microphone and use different Frequencies i.e. 1KHz & 2KHz to measure the Output voltage and different Parameters using [ADALM2000](https://www.analog.com/en/resources/evaluation-hardware-and-software/evaluation-boards-kits/adalm2000.html) and [SCOPY](https://github.com/analogdevicesinc/scopy).
- Done the FFT analysis of the input & output wave using the [SCOPY](https://github.com/analogdevicesinc/scopy) software.
-  Observe the relation betwenn the frequency and distance with the Vpk - Vpk and Power.


## DAY-8 (03/06/2026)

### Session-1 

#### IC Design Flow
- Got the IC level Resistance modelling.
- Got to know the physics behind the Resistance modelling in IC design process.
- Got to know the different modelling of capacitance.

### Session-2

#### IC Design Flow
- Continued with the IC design flow process.
- Derieve the terms related with the Capacitance in a Capacitor.
- Got to know the different MOS Capacitances and Capacitors in an IC.
- Got the idea of how the modelling of capacitors are done in ICs.

#### Microphone AFE 
- Continued the work for the Microphone AFE using xschem-ngspice.
- Completed the Given Assignments.


## DAY-9 (04/06/2026)

### Session-1 

#### Getting Started with Semiconductor Basics
- Got to know the basics of different semiconductor devices.[Introduction to Semiconductors](https://github.com/silicon-vlsi/SI-2026-AnalogIC/blob/main/content/lec-SemiConductor-IC-Devices-0604-2026.pdf)
- Studied their properties and the physics behind them.

#### Getting Started with MOSFETS 
- Got to know the Mosfet basics.
- Got to know the different operating cindition of the MOSFETS along with their properties.

### Session-2

#### Semiconductor Simulation 
- Studied the Crossection of the MOSFET with different conditions using [SILWIZ](https://app.siliwiz.com/).
- Observed the Different Region of operation along with their simulation using the [SILWIZ](https://app.siliwiz.com/).
- Completed the SILWIZ assignment.


## DAY-10 (05/06/2026)

### Session-1

#### NMOS Parameter Extraction using Xschem

* Extracted NMOS parameters using the Level-49 model in Xschem.
* Determined the Threshold Voltage (Vt) under different body-bias conditions.
* Extracted the Body Effect Coefficient (γ), Channel Length Modulation parameter (λ), and μnCox (K').
* Verified the extracted parameters using NGSpice simulations.

### Session-2

#### Level-1 vs Level-49 NMOS Simulation

* Simulated NMOS transistors using Level-1 and Level-49 models in NGSpice.
* Compared the transfer (Id-Vgs) and output (Id-Vds) characteristics of both models.
* Analyzed differences in threshold voltage and channel length modulation effects.
* Observed the improved accuracy of the Level-49 model compared to the Level-1 model.


## DAY-11 (06/06/2026)

### Session-1

#### NMOS Parameter Extraction and Device Concepts

* Continued the parameter extraction of the NMOS transistor using Xschem and NGSpice.
* Verified the extracted parameters through additional simulations and analysis.
* Studied important MOSFET device concepts related to threshold voltage, body effect, and channel length modulation.
* Analyzed the impact of different device parameters on transistor characteristics.
* Gained a deeper understanding of NMOS operation and modeling concepts.

---

## WEEK-3

## DAY-12 (08/06/2026)

### Session-1

#### MOSFET Fundamentals and Analysis

* Studied different types of MOSFETs and their classifications.
* Learned the IC layout configurations and circuit symbols of NMOS and PMOS transistors.
* Derived the MOSFET current equations for different regions of operation.
* Analyzed the Id-Vgs and Id-Vds characteristics for both NMOS and PMOS devices.
* Solved various MOSFET-based circuit problems to strengthen device-level understanding.

### Session-2

#### NMOS Configuration Simulations

* Simulated different NMOS configurations using resistive, PMOS, and diode-connected loads.
* Generated and analyzed Id-Vgs and Id-Vds characteristics for the different configurations.
* Performed AC analysis and studied the gain and phase response of the circuits.
* Performed Transient analysis and studied the input and output Waveforms. 
* Compared the performance of the various load configurations through simulation results.


## DAY-13 (09/06/2026)

### Session-1

#### MOS capacitances 

- Studied the differnt Capacitances buidup in diode(Depletion and Diffusion Capacitances).
- Got to know the effects of differnt intrinsic(parasitic) capacitances in the function of an MOS amplifier.
- Studied the effect of intrinsic capacitances on a MOS device in higher frequncies.
- Analysed them with BODE plot.
- Getting started with the basic of small signal analysis of MOSFET.

## DAY-14 (10/06/2026)

### Session-1

#### Analysis of Small Signal Model 
- Got to know the Small signal model of both NMOS and PMOS.
- Studied the differnt MOS-amplifier configurations along with their small signal model.
- Simulated the circuits to get their gain, DC Sweep, and also performed the AC analysis to get the Gain and Phase margin.

#### Getting Started with Current Mirror
- Understand the basic and working of Different types of Current mirrors.
- Calculaed the Input and Output waveforms of a simple NMOS current mirror.

### Session-2

#### Analysis and Simulation of Current Mirror
- Derieve Different Parameters of Current Mirror to help in Modelling.
- Done the Small Signal analysis of the Cascode Current Mirror.
- Constructed the Schematic of the Current Mirror in XSCHEM.
- Simulated the got the parameters like Gain, Phase and Gain Margin by AC analysis.
- Observed the input and Output transient response of the Current mirror.


## DAY-15 (11/06/2026)

### Session-1

#### Getting Started with Differential Amplifier
- Got to know the basics of a Differential Ampllifier.
- Studied the working and different configurations of a Differential Amplifier.
- Simulated different configurations of Differential Amplifier and found out:
  - Gain, Gain Margin, Phase Margin, AC response through AC Analysis.
  - Found out the Current at different branchs and different Node voltages through DC Sweep.
  - Observed the Input and Output waveform through Transient Analysis.

### Session-2

#### Getting Started with the Layout of the Differential Amplifier

- Completed the Remaining Simulation of the Differential Amplifier.
- Gettinig Started with the layout of the Differential amplifier.
- Constructed the layout of the lower halve of the Differential amplifier using [MAGIC VLSI](https://github.com/RTimothyEdwards/magic.git).
- Started with the LVS of the layout using [NETGEN](https://github.com/RTimothyEdwards/netgen.git)

## DAY-16 (12/06/2026)

### Session-1 

#### Getting started with the 2-stage OpAMP
- Completing the LVS of the differential amplifier using netgen.
- Studied the basics of 2 stage OpAmp.
- Studied the circuit configuaration and making of the 2-stage OpAmp and the need of this Amplifier.

### Session-2

#### Construction and Simulation of the 2 stage OpAmp
- Constructed and Simulated the 2 stage OpAmp circuit using XSCHEM.
- Calculated the parameters and found out:
  - Gain, Gain Margin, Phase Margin, AC response through AC Analysis.
  - Found out the Current at different branchs and different Node voltages through DC Sweep.
  - Observed the Input and Output waveform through Transient Analysis.
- Documented all the simulation output graphs and results. 
      
  

