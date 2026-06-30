v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -590 -480 -590 -420 {lab=vout}
N -590 -460 -410 -460 {lab=vout}
N -410 -460 -410 -450 {lab=vout}
N -590 -360 -590 -320 {lab=GND}
N -410 -390 -410 -320 {lab=GND}
N -710 -390 -630 -390 {lab=vin}
N -710 -390 -710 -380 {lab=vin}
N -1110 -260 -1110 -180 {lab=GND}
N -1110 -180 -970 -180 {lab=GND}
N -970 -260 -970 -180 {lab=GND}
N -1040 -180 -1040 -140 {lab=GND}
N -1110 -350 -1110 -320 {lab=Vb}
N -970 -350 -970 -320 {lab=vdd}
N -710 -510 -630 -510 {lab=Vb}
N -590 -600 -590 -540 {lab=#net1}
N -590 -390 -520 -390 {lab=GND}
N -520 -390 -520 -350 {lab=GND}
N -590 -350 -520 -350 {lab=GND}
N -740 -390 -710 -390 {lab=vin}
N -410 -460 -370 -460 {lab=vout}
N -590 -510 -520 -510 {lab=#net1}
N -520 -560 -520 -510 {lab=#net1}
N -590 -560 -520 -560 {lab=#net1}
N -590 -690 -590 -660 {lab=vdd}
C {capa.sym} -410 -420 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -590 -320 0 0 {name=l1 lab=GND}
C {gnd.sym} -410 -320 0 0 {name=l2 lab=GND}
C {vsource.sym} -710 -350 0 0 {name=V1 value="DC 0.895 AC 1"  savecurrent=false}
C {vsource.sym} -1110 -290 0 0 {name=V2 value=0.9 savecurrent=false}
C {gnd.sym} -710 -320 0 0 {name=l3 lab=GND}
C {vsource.sym} -970 -290 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -1040 -140 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -1110 -350 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {lab_pin.sym} -970 -350 0 0 {name=p2 sig_type=std_logic lab= vdd}
C {ipin.sym} -740 -390 0 0 {name=p5 lab=vin}
C {opin.sym} -370 -460 0 0 {name=p6 lab=vout}
C {devices/code.sym} -1500 -340 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -610 -510 0 0 {name=M2
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
C {sky130_fd_pr/nfet_01v8.sym} -610 -390 0 0 {name=M1
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
C {lab_pin.sym} -710 -510 0 0 {name=p3 sig_type=std_logic lab=Vb}
C {lab_pin.sym} -590 -690 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {vsource.sym} -590 -630 0 0 {name=V4 value=0 savecurrent=false}
C {simulator_commands_shown.sym} -1330 -910 0 0 {name=COMMANDS
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
