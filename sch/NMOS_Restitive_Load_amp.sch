v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -100 -10 -100 30 {lab=vout}
N -100 20 20 20 {lab=vout}
N -100 90 -100 160 {lab=GND}
N 20 80 20 160 {lab=GND}
N -260 60 -260 100 {lab=vin}
N -260 60 -140 60 {lab=vin}
N -260 160 -260 190 {lab=GND}
N -440 70 -440 120 {lab=vdd}
N -440 180 -440 220 {lab=GND}
N -100 160 -100 190 {lab=GND}
N 20 160 20 190 {lab=GND}
N 20 20 70 20 {lab=vout}
N -100 60 -40 60 {lab=GND}
N -40 60 -40 130 {lab=GND}
N -100 130 -40 130 {lab=GND}
N -260 190 -260 220 {lab=GND}
N -100 190 -100 220 {lab=GND}
N 20 190 20 220 {lab=GND}
N -100 -100 -100 -70 {lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} -120 60 0 0 {name=M1
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
C {vsource.sym} -260 130 0 0 {name=V1 value="0.8 SIN(0 1m 1k)" savecurrent=false}
C {capa.sym} 20 50 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/code.sym} -780 140 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {gnd.sym} 20 220 0 0 {name=l2 lab=GND}
C {vsource.sym} -440 150 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -440 220 0 0 {name=l5 lab=GND}
C {simulator_commands_shown.sym} -650 -300 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* Simulation setup
.temp 27

* Transient analysis: step=10n, stop=5m
.tran 1u 5m

* Interactive plotting block
.control
  run
  set color0 = white 

  plot v(vin) v(vout)
  plot v(vout)

.endc

"}
C {opin.sym} 70 20 0 0 {name=p3 lab=vout}
C {ipin.sym} -260 60 0 0 {name=p4 lab=vin}
C {gnd.sym} -260 220 0 0 {name=l1 lab=GND}
C {gnd.sym} -100 220 0 0 {name=l3 lab=GND}
C {res.sym} -100 -40 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} -440 70 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -100 -100 0 0 {name=p2 sig_type=std_logic lab=vdd}
