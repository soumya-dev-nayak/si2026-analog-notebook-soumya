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


