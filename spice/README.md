# NGSPICE (ngspice related files here)
---

# NGSpice RC Low-Pass Filter Characterization 

## Circuit Definition

```spice
.title RC LOW PASS FILTER CHARACTERISATION AND PARAMETER FINDING dt: 27/05/26

.global vdd gnd
.temp 27

*--------------------------------------------------------------------
* CIRCUIT
*--------------------------------------------------------------------

R1      in      out     1k
*C1     t1      gnd     50p
C1      t1      gnd     1p

Vcm1    out     t1      dc      0

*--------------------------------------------------------------------
* INPUT SOURCES
*--------------------------------------------------------------------

* Normal pulse
Vin     in      gnd     PULSE(0 5 0 10p 10p 10n 20n)

* Duty cycle = 25%
*Vin    in      gnd     PULSE(0 5 0 10p 10p 5n 20n)

*--------------------------------------------------------------------
* ANALYSIS SELECTION
*--------------------------------------------------------------------

*======================
* TRANSIENT ANALYSIS
*======================

.tran 10p 50n

* Fast RC (τ << pulse width)
*.tran 1p 2n

* Slow RC (τ ≈ pulse width)
*.tran 100p 500n

*======================
* AC ANALYSIS
*======================

*.ac dec 100 10 10G

*--------------------------------------------------------------------
* CONTROL BLOCK
*--------------------------------------------------------------------
.control
run

*--------------------------------------------------------------------
* TRANSIENT PLOTS & MEASUREMENTS
*--------------------------------------------------------------------

setplot tran1

* Input and Output Waveforms
plot v(in) v(out) \
xlabel 'Time (s)' \
ylabel 'Voltage (V)'

* Maximum and Minimum Voltage
meas tran Vmax MAX v(out)
meas tran Vmin MIN v(out)

* Effective Time Constant
let vtau = 0.632*(Vmax-Vmin) + Vmin
meas tran tau_eff WHEN v(out)=vtau RISE=1

* Rise Time
let v10 = Vmin + 0.1*(Vmax-Vmin)
let v90 = Vmin + 0.9*(Vmax-Vmin)

meas tran t10r WHEN v(out)=v10 RISE=1
meas tran t90r WHEN v(out)=v90 RISE=1

let trise = t90r - t10r

* Fall Time
meas tran t90f WHEN v(out)=v90 FALL=1
meas tran t10f WHEN v(out)=v10 FALL=1

let tfall = t10f - t90f

* Average Voltage
meas tran Vavg AVG v(out)

* Print Parameters
print tau_eff
print trise
print tfall
print Vavg

*--------------------------------------------------------------------
* AC PLOTS & MEASUREMENTS
*--------------------------------------------------------------------

* Uncomment when .ac analysis is enabled
*
*setplot ac1
*
** Gain Plot
*plot db(v(out)/v(in)) \
*xlabel 'Frequency (Hz)' \
*ylabel 'Gain (dB)'
*
** Phase Plot
*plot phase(v(out)/v(in)) \
*xlabel 'Frequency (Hz)' \
*ylabel 'Phase (deg)'
*
** -3 dB Frequency
*meas ac f3db WHEN db(v(out)/v(in))=-3
*
** Unity Gain Bandwidth
*meas ac ugb WHEN db(v(out)/v(in))=0
*
*print f3db
*print ugb

.endc

.end
```
### Sample Output

```text
vmax                =  4.999774e+00 at=  1.300100e-07
vmin                =  0.000000e+00 at=  0.000000e+00
tau_eff             =  1.004603e-09

t10r                =  1.103623e-10
t90r                =  2.307173e-09

t90f                =  1.012034e-08
t10f                =  1.231755e-08

vavg                =  2.502497e+00 from=  0.000000e+00 to=  2.000000e-07

tau_eff = 1.004603e-09
trise   = 2.196811e-09
tfall   = 2.197210e-09
vavg    = 2.502497e+00
```
### Outputs

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/RC_lpf_op1_T_more_5tau.png" width="600">
</p>

<p align="center">
  <em>Figure: RC Low-Pass Filter Transient Response for T > 5τ</em>
</p>


<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/RC_lpf_op2_T_less_tau.png" width="600">
</p>

<p align="center">
  <em>Figure: RC Low-Pass Filter Transient Response for T < τ</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/RC_lpf_op3_T_less_tau_upto_200n.png" width="600">
</p>

<p align="center">
  <em>Figure: RC Low-Pass Filter Transient Response for T < τ (200 ns Simulation)</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/RC_lpf_op4_ac_gain.png" width="600">
</p>

<p align="center">
  <em>Figure: RC Low-Pass Filter AC Magnitude Response (Gain Plot)</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/RC_lpf_op5_ac_phase.png" width="600">
</p>

<p align="center">
  <em>Figure: RC Low-Pass Filter AC Phase Response</em>
</p>

# NGSpice CR High-Pass Filter Characterization 

## Circuit Definition

```spice
.title RC HIGH PASS FILTER CHARACTERISATION AND PARAMETER FINDING dt: 27/05/26

.global vdd gnd
.temp 27

*--------------------------------------------------------------------
* CIRCUIT
*--------------------------------------------------------------------

R1      t1      gnd     1k

*C1     in      out     1p
C1      in      out     50p

Vcm1    out     t1      dc 0

*--------------------------------------------------------------------
* INPUT SOURCES
*--------------------------------------------------------------------

* Normal Pulse
Vin     in      gnd     PULSE(0 5 0 10p 10p 10n 20n)

* Duty Cycle = 25%
*Vin    in      gnd     PULSE(0 5 0 10p 10p 5n 20n)

* AC Input
*Vin    in      gnd     AC 1

*--------------------------------------------------------------------
* ANALYSIS SELECTION
*--------------------------------------------------------------------

*======================
* TRANSIENT ANALYSIS
*======================

.tran 1p 600n

* Fast RC (τ << pulse width)
*.tran 1p 50n

* Long Simulation
*.tran 1p 1u


*======================
* AC ANALYSIS
*======================

*.ac dec 100 10 10G

*--------------------------------------------------------------------
* CONTROL BLOCK
*--------------------------------------------------------------------

.control

run

set color0 = white

*--------------------------------------------------------------------
* TRANSIENT RESULTS
*--------------------------------------------------------------------

setplot tran1

* Input and Output Waveforms
plot v(in) v(out)

*----------------------
* Maximum and Minimum
*----------------------

meas tran Vmax MAX v(out)
meas tran Vmin MIN v(out)

*----------------------
* Effective Time Constant
*----------------------

let vtau = (1 - 0.632)*Vmax

meas tran tau_eff WHEN v(out)=vtau FALL=1

*----------------------
* Rise Time
*----------------------

let v10 = Vmin + 0.1*(Vmax - Vmin)
let v90 = Vmin + 0.9*(Vmax - Vmin)

meas tran t10r WHEN v(out)=v10 RISE=2
meas tran t90r WHEN v(out)=v90 RISE=2

let trise = t90r - t10r

*----------------------
* Fall Time
*----------------------

meas tran t90f WHEN v(out)=v90 FALL=2
meas tran t10f WHEN v(out)=v10 FALL=2

let tfall = t10f - t90f

*----------------------
* Average Voltage
*----------------------

meas tran Vavg AVG v(out)

*----------------------
* Print Parameters
*----------------------

print tau_eff
print trise
print tfall
print Vavg

*--------------------------------------------------------------------
* AC RESULTS
*--------------------------------------------------------------------

* Uncomment ONLY when AC analysis is enabled
*
*setplot ac1
*
** Gain Response
*plot vdb(out)
*
** Phase Response
*plot vp(out)
*
** -3 dB Cutoff Frequency
*meas ac f3db WHEN vdb(out)=-3
*
*print f3db

.endc

.end
```

### Sample Output

```text
TRANSIENT ANALYSIS
vmax                =  4.975083e+00 at=  1.000000e-11
vmin                = -4.974857e+00 at=  3.002000e-08

tau_eff             =  1.009672e-09

t10r                =  3.024315e-08
t90r                =  2.000799e-08

t90f                =  2.023309e-08
t10f                =  3.001799e-08

vavg                =  9.999544e-02 from=  0.000000e+00 to=  5.000000e-08

tau_eff = 1.009672e-09
trise = -1.02352e-08
tfall = 9.784900e-09
vavg = 9.999544e-02

ngspice 56 ->
```
```text
AC ANALYSIS
f3db = 3.197967e+06
```
<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/CR_hpf_op1_T_more_5tau.png" width="600">
</p>

<p align="center">
  <em>Figure: RC High-Pass Filter Transient Response for T > 5τ</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/CR_hpf_op2_T_less_tau.png" width="600">
</p>

<p align="center">
  <em>Figure: RC High-Pass Filter Transient Response for T < τ</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/CR_hpf_op3_T_less_tau_upto_200n.png" width="600">
</p>

<p align="center">
  <em>Figure: RC High-Pass Filter Transient Response for T < τ (200 ns Simulation)</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/CR_hpf_op4_ac_gain.png" width="600">
</p>

<p align="center">
  <em>Figure: RC High-Pass Filter AC Magnitude Response (Gain Plot)</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/CR_hpf_op5_ac_phase.png" width="600">
</p>

<p align="center">
  <em>Figure: RC High-Pass Filter AC Phase Response</em>
</p>

## LEVEL-1 DIODE CONNECTED NMOS PARAMETER EXTRACTION
```spice
Title: Id-vs-Vgs for and NMOS in Saturation region
* Comparing the Level-1 and Level-49 SPICE model
* From sqrt(1*Id) vs Vgs, Vt, Kp and gamma can be extracted

* Level-1 Model
.MODEL nmos1 NMOS (LEVEL=1 PHI=0.846 VT0=0.514 KP=122U GAMMA=0.55 LAMBDA=0.0)

* Set the device temperature
.TEMP 27

* Netlist:
* diode connected (Drain/Gate shorted nmos
M2      D2      D2      0       B       nmos1    W=5u L=1u
Vds     D       0       DC      5
Vid2    D       D2      DC      0
Vsb     0       B       DC      0

* DC Sweep Analyses
*.DC    Vsrc    start   stop    step    Vsrc2   start stop step
*.DC    Vds     0       5       0.001  Vsb  0 1 0.5
.DC     Vds     0       5       0.001

* ngspice Script with control statements.
.CONTROL
RUN

** Plot sqrt(2*Id) for M1 amd M2
**PLOT Vid2#branch vs V(D)
PLOT (2*Vid2#branch)^0.5  vs V(D)

** Calculating uCox from rt-Id-Vgs slope
LET rt_id=Vid2#branch^0.5

LET d_rt_id=deriv(rt_id)

MEAS DC d_at_1v FIND d_rt_id AT=2.0

LET ucox=(2.0/5.0)*d_at_1v^2.0

print ucox

** Calculating Vt by calculating the intercept
MEAS DC rt_id_at_1 FIND rt_id AT=2.0

LET Vt=2.0-(d_at_1v^-1 * rt_id_at_1)

print Vt

.ENDC

.END
```
### Sample Output

```text
Circuit: Id-vs-Vgs for and NMOS in Saturation region

Doing analysis at TEMP = 27.000000 and TNOM = 27.000000

Using SPARSE 1.3 as Direct Linear Solver

No. of Data Rows : 15003

Warning: Missing charsets in String to FontSet conversion

d_at_1v             =  1.746425e-02
ucox = 1.220000e-04

rt_id_at_1          =  2.595187e-02
vt = 5.140003e-01
```
<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/NMOS_lvl-1_op1_Id_v_Vgs.png" width="1000">
</p>

<p align="center">
<p align="center">
  <em>Figure: NMOS Level-1 Model Id–VGS Characteristics at different Vsb</em><br>
  <em>Showing both the original and the √Id linearized version</em>
</p>

## LEVEL-49 DIODE CONNECTED NMOS PARAMETER EXTRACTION

```spice
Title: Id-vs-Vgs for and NMOS in Saturation region
* From sqrt(1*Id) vs Vgs, Vt, Kp and gamma can be extracted

* Level-49 BSIM 3v1 Model Lobrary for 0.5um SCMOS Technology
.LIB scn4m_cnrs_bsim3v1.lib nom

* Level-1 Model
.MODEL sitn NMOS (LEVEL=1 PHI=0.846 VT0=0.514 KP=122U GAMMA=0.55 LAMBDA=0.0)

* Set the device temperature
.TEMP 27

* Netlist:
* Two diode connected (Drain/Gate shorted nmos
* one with Level-1 model (M2) and another
* with Level-49 BSIM 3v1 model (M1)
M1      D1      D1      0       B       scmosn  W=5u L=1u
M2      D2      D2      0       B       sitn    W=5u L=1u
Vds     D       0       DC      5
Vid1    D       D1      DC      0
Vid2    D       D2      DC      0
Vsb     0       B       DC      0

* DC Sweep Analyses
*.DC    Vsrc    start   stop    step    Vsrc2   start stop step
.DC     Vds     0       1.8     0.001  Vsb  0 1 0.5


* ngspice Script with control statements.

.CONTROL
RUN

set color0 = white

* Plot sqrt(2Id) vs VGS
PLOT (2*Vid2#branch)^0.5 (2*Vid1#branch)^0.5 vs V(D)
PLOT (2*Vid2#branch)^0.5 vs V(D)
PLOT (2*Vid1#branch)^0.5 vs V(D)

************************************************
* LEVEL-1 PARAMETER EXTRACTION (M2)
************************************************

* sqrt(2Id)
LET rt_id = (2*Vid2#branch)^0.5

* derivative of sqrt(2Id)
LET d_rt_id = deriv(rt_id)

* Slope at VGS = 1V
MEAS DC d_at_2v FIND d_rt_id AT=1.0

* KP extraction
* sqrt(2Id) = sqrt(KP*W/L)*(VGS-VT)
* slope = sqrt(KP*W/L)

LET kp_extracted = d_at_2v^2/(5u/1u)
PRINT kp_extracted

* Threshold Voltage extraction
MEAS DC rt_id_at_2v FIND rt_id AT=1.0

LET vt_extracted = 1.0 - rt_id_at_2v/d_at_2v
PRINT vt_extracted

************************************************
* BODY EFFECT EXTRACTION (GAMMA)
************************************************

* For each VSB step, determine VT
* VSB = 0V
MEAS DC rt0 FIND rt_id AT=1.0 WHEN Vsb=0
MEAS DC slope0 FIND d_rt_id AT=1.0 WHEN Vsb=0
LET vt0 = 1.0 - rt0/slope0

* VSB = 1V
MEAS DC rt1 FIND rt_id AT=1.0 WHEN Vsb=1
MEAS DC slope1 FIND d_rt_id AT=1.0 WHEN Vsb=1
LET vt1 = 1.0 - rt1/slope1

PRINT vt0
PRINT vt1

* Gamma extraction
LET phi = 0.874

LET gamma_extracted = (vt1-vt0) / ( sqrt(phi+1)-sqrt(phi) )

PRINT gamma_extracted

.ENDC

.END
```
### Sample Output

```text
Doing analysis at TEMP = 27.000000 and TNOM = 27.000000

Using SPARSE 1.3 as Direct Linear Solver

No. of Data Rows : 5403

d_at_2v             =  2.469818e-02
kp_extracted = 1.220000e-04

rt_id_at_2v         =  1.200331e-02
vt_extracted = 5.140002e-01

rt0                 =  1.200331e-02
slope0              =  2.469818e-02

rt1                 =  1.956331e-02
slope1              =  2.469818e-02

vt0 = 5.140002e-01
vt1 = 7.080000e-01

gamma_extracted ≈ 0.55
```
<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/NMOS_lvl-49_lvl-1_comaprision.png" width="1100">
</p>

<p align="center">
  <em>Figure: Comparison of NMOS Level-1 and Level-49 (BSIM3v1) Models</em><br>
  <em>√(2Id) vs VGS characteristics for different VSB values</em>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/soumya-dev-nayak/si2026-analog-notebook-soumya/main/spice/pics/NMOS_lvl-49_lvl-1_in_one_graph.png" width="500">
</p>

<p align="center">
  <em>Figure: Comparison of NMOS Level-1 and Level-49 (BSIM3v1) Models on a Single Plot</em><br>
  <em>√(2Id) vs VGS characteristics showing the difference between the analytical and BSIM models</em>
</p>
