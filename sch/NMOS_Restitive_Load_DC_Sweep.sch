v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -200 50 -200 90 {lab=vout}
N -200 80 -80 80 {lab=vout}
N -200 150 -200 220 {lab=GND}
N -80 140 -80 220 {lab=GND}
N -360 120 -360 160 {lab=vin}
N -360 120 -240 120 {lab=vin}
N -360 220 -360 250 {lab=GND}
N -540 130 -540 180 {lab=vdd}
N -540 240 -540 280 {lab=GND}
N -200 -50 -200 -10 {lab=vdd}
N -200 220 -200 250 {lab=GND}
N -80 220 -80 250 {lab=GND}
N -80 80 -30 80 {lab=vout}
N -200 120 -140 120 {lab=GND}
N -140 120 -140 190 {lab=GND}
N -200 190 -140 190 {lab=GND}
N -390 120 -360 120 {lab=vin}
C {sky130_fd_pr/nfet_01v8.sym} -220 120 0 0 {name=M1
W=5
L=2
nf=1 
mult=4
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {res.sym} -200 20 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -360 190 0 0 {name=V1 value=0 savecurrent=false}
C {capa.sym} -80 110 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/code.sym} -880 200 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {gnd.sym} -80 250 0 0 {name=l2 lab=GND}
C {vsource.sym} -540 210 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -540 280 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -540 130 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {gnd.sym} -360 250 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -200 -50 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {simulator_commands_shown.sym} -910 -400 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* Simulation setup
.temp 27

* DC Sweep: Sweep V1 from 0V to 1.8V in 1mV steps
.dc V1 0 1.8 1m

* Interactive plotting and calculation block
.control
  run
  
  * Plot the DC Transfer Characteristic (Vout vs Vin)
  plot v(vout)
  
  * Calculate and plot the derivative (Voltage Gain)
  let gain = deriv(v(vout))
  plot gain title 'Voltage Gain (dv(vout)/dv(v1))'
.endc
"}
C {opin.sym} -30 80 0 0 {name=p3 lab=vout}
C {gnd.sym} -200 250 0 0 {name=l1 lab=GND}
C {ipin.sym} -390 120 0 0 {name=p4 lab=vin}
