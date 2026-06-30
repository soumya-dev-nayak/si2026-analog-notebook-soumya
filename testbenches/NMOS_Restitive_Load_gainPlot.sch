v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -500 -390 -500 -350 {lab=vout}
N -500 -360 -380 -360 {lab=vout}
N -500 -290 -500 -220 {lab=GND}
N -380 -300 -380 -220 {lab=GND}
N -660 -320 -660 -280 {lab=#net1}
N -660 -320 -540 -320 {lab=#net1}
N -660 -220 -660 -190 {lab=GND}
N -840 -310 -840 -260 {lab=vdd}
N -840 -200 -840 -160 {lab=GND}
N -500 -490 -500 -450 {lab=vdd}
N -500 -220 -500 -190 {lab=GND}
N -380 -220 -380 -190 {lab=GND}
N -380 -360 -330 -360 {lab=vout}
N -500 -320 -440 -320 {lab=GND}
N -440 -320 -440 -250 {lab=GND}
N -500 -250 -440 -250 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -520 -320 0 0 {name=M1
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
C {res.sym} -500 -420 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -660 -250 0 0 {name=V1 value="DC 0.91 AC 1" savecurrent=false}
C {capa.sym} -380 -330 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/code.sym} -1180 -240 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {gnd.sym} -380 -190 0 0 {name=l2 lab=GND}
C {vsource.sym} -840 -230 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -840 -160 0 0 {name=l5 lab=GND}
C {lab_pin.sym} -840 -310 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {gnd.sym} -660 -190 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -500 -490 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {simulator_commands_shown.sym} -1300 -730 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* Simulation setup
.temp 27

* Transient analysis: step=10n, stop=5m
.ac dec 100 10 10G		

* Interactive plotting block
.control
  run
  set color0 = white 

* Plot Magnitude Response in Decibels (dB)
  plot db(v(vout)) title 'Magnitude Response (Gain in dB)'
  
  * Plot Phase Response in Degrees
  plot cph(v(vout)) title 'Phase Response (Degrees)'

.endc

"}
C {opin.sym} -330 -360 0 0 {name=p3 lab=vout}
C {gnd.sym} -500 -190 0 0 {name=l1 lab=GND}
