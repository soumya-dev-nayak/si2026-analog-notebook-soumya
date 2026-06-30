v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 250 200 250 260 {lab=GND}
N 290 150 320 150 {lab=out}
N 170 150 210 150 {lab=in2}
N -180 120 -180 150 {lab=in1}
N -430 210 -430 290 {lab=GND}
N -430 290 -290 290 {lab=GND}
N -290 290 -180 290 {lab=GND}
N -180 210 -180 290 {lab=GND}
N -430 120 -430 150 {lab=in2}
C {simulator_commands_shown.sym} -780 -1620 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value=

"
.param temp=27

* =========================
* TRANSIENT ANALYSIS
* =========================

.control

tran 1p 5n
save all
run

* ---------------------------------
* Output Voltage Measurements
* ---------------------------------

set color0 = white

meas tran Vmax MAX v(out)
meas tran Vmin MIN v(out)

* Average Output Voltage
meas tran Vavg AVG v(out)

* ---------------------------------
* Rise Time Measurement
* ---------------------------------
let v90p = 0.9 * Vmax
let v10p = 0.1 * Vmax

meas tran t90p WHEN v(out)=v90p FALL=1
meas tran t10p WHEN v(out)=v10p FALL=1

let RiseTime = t10p - t90p
print RiseTime

* ---------------------------------
* Fall Time Measurement
* ---------------------------------
let V90n = 0.9* Vmin
let v10n = 0.1* Vmin


meas tran t90n WHEN v(out)=v90n RISE=1
meas tran t10n WHEN v(out)=v10n RISE=1

let FallTime = t10n-t90n
print FallTime

* ---------------------------------
* Plot Signals
* ---------------------------------
plot v(in2) v(out)

.endc

* =========================
* AC ANALYSIS (COMMENTED)
* =========================
.ac dec 100 1 100G

.control

save all
run

set color0 = white

** Magnitude in dB
let gain_db = db(v(out))

** Phase Response
let phase_deg = phase(v(out))

** Gain at Cutoff
meas ac Gain_1k FIND gain_db AT=1k

plot gain_db
plot phase_deg

.endc

"
}
C {CR_First_Order_hpf.sym} 250 160 0 0 {name=x1}
C {lab_wire.sym} 320 150 0 0 {name=p1 sig_type=std_logic lab=out}
C {lab_pin.sym} 170 150 0 0 {name=p3 sig_type=std_logic lab=in2
}
C {lab_pin.sym} 250 260 0 0 {name=p4 sig_type=std_logic lab=GND}
C {vsource.sym} -180 180 0 0 {name=V1 value="PULSE(0 5 0 10p 10p 10n 20n)" savecurrent=false}
C {gnd.sym} -290 290 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -180 120 0 0 {name=p2 sig_type=std_logic lab=in1}
C {vsource.sym} -430 180 0 0 {name=V2 value="DC 0 AC 1 sin(0 0.5 1G)" savecurrent=false}
C {lab_pin.sym} -430 120 0 0 {name=p5 sig_type=std_logic lab=in2}
