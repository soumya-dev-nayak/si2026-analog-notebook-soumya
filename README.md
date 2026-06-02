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

#### Session 2

#### OpAmp pole testing
- Modeled the OpAmp as a single-pole amplfier (pole was found from the [datasheet](https://www.ti.com/lit/ds/symlink/opa345.pdf) ) and rerun all the above measurement of the MEMS mic.

#### MEMS mic Breakout board testing
- Use the Breakout board of the MEMS microphone and use different Frequencies i.e. 1KHz & 2KHz to measure the Output voltage and different Parameters using [ADALM2000](https://www.analog.com/en/resources/evaluation-hardware-and-software/evaluation-boards-kits/adalm2000.html) and [SCOPY](https://github.com/analogdevicesinc/scopy).
- Done the FFT analysis of the input & output wave using the [SCOPY](https://github.com/analogdevicesinc/scopy) software.
-  Observe the relation betwenn the frequency and distance with the Vpk - Vpk and Power.
