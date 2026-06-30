v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -450 -370 -450 -320 {lab=vout}
N -590 -400 -590 -350 {lab=vin}
N -590 -400 -490 -400 {lab=vin}
N -590 -290 -590 -200 {lab=GND}
N -590 -200 -450 -200 {lab=GND}
N -450 -260 -450 -200 {lab=GND}
N -310 -260 -310 -200 {lab=GND}
N -450 -200 -310 -200 {lab=GND}
N -310 -330 -310 -320 {lab=vout}
N -830 -220 -830 -140 {lab=GND}
N -450 -200 -450 -150 {lab=GND}
N -450 -500 -450 -430 {lab=vdd}
N -830 -340 -830 -280 {lab=vdd}
N -450 -330 -260 -330 {lab=vout}
N -450 -400 -360 -400 {lab=vdd}
N -360 -460 -360 -400 {lab=vdd}
N -450 -460 -360 -460 {lab=vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -470 -400 0 0 {name=M1
W=5
L=2
nf=1
mult=12
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {res.sym} -450 -290 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -590 -320 0 0 {name=V1 value="DC 0.9 AC 1" savecurrent=false}
C {capa.sym} -310 -290 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -830 -250 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -450 -150 0 0 {name=l1 lab=GND}
C {gnd.sym} -830 -140 0 0 {name=l2 lab=GND}
C {lab_wire.sym} -450 -500 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -830 -340 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {ipin.sym} -590 -400 0 0 {name=p3 lab=vin}
C {opin.sym} -260 -330 0 0 {name=p4 lab=vout}
C {devices/code.sym} -1270 -270 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -1250 -880 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* Simulation setup
.temp 27

* Transient analysis: step=10n, stop=5m
.ac dec 10 10 10G		

* Interactive plotting block
.control
  run
  set color0 = white 

* Plot Magnitude Response in Decibels (dB)
  plot db(v(vout)) title 'Magnitude Response (Gain in dB)'
  
  * Plot Phase Response in Degrees
  plot cph(v(vout)) title 'Phase Response (Degrees)'

  plot -(v(vout)/v(vin))

.endc

"}
