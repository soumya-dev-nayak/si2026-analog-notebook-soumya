v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -330 80 -220 80 {lab=#net1}
N -370 130 -310 130 {lab=#net1}
N -310 80 -310 130 {lab=#net1}
N -370 320 -370 370 {lab=vm2}
N -370 370 -180 370 {lab=vm2}
N -180 320 -180 370 {lab=vm2}
N -440 520 -320 520 {lab=vm3}
N -280 550 -280 650 {lab=GND}
N -580 550 -580 650 {lab=GND}
N -580 450 -580 490 {lab=vm3}
N -540 520 -440 520 {lab=vm3}
N -370 0 -370 50 {lab=vdd}
N -370 0 -180 0 {lab=vdd}
N -180 0 -180 50 {lab=vdd}
N -1160 490 -1160 610 {lab=GND}
N -1040 490 -1040 610 {lab=GND}
N -1160 350 -1160 430 {lab=vb1}
N -1040 350 -1040 430 {lab=vdd}
N -370 290 -180 290 {lab=GND}
N -280 290 -280 320 {lab=GND}
N -280 -30 -280 0 {lab=vdd}
N -580 340 -580 390 {lab=vdd}
N -450 290 -410 290 {lab=vb1}
N -140 290 -100 290 {lab=vb1}
N -660 520 -580 520 {lab=GND}
N -660 520 -660 580 {lab=GND}
N -660 580 -580 580 {lab=GND}
N -280 520 -200 520 {lab=GND}
N -200 520 -200 570 {lab=GND}
N -280 570 -200 570 {lab=GND}
N -280 460 -280 490 {lab=#net2}
N -580 470 -500 470 {lab=vm3}
N -500 470 -500 520 {lab=vm3}
N -370 210 -370 240 {lab=vm1}
N -370 110 -370 150 {lab=#net1}
N -180 210 -180 240 {lab=vout}
N -180 110 -180 150 {lab=#net3}
N -180 220 50 220 {lab=vout}
N 20 220 20 340 {lab=vout}
N 20 400 20 450 {lab=GND}
N -460 80 -370 80 {lab=vdd}
N -460 10 -460 80 {lab=vdd}
N -460 0 -460 10 {lab=vdd}
N -460 0 -370 0 {lab=vdd}
N -180 80 -100 80 {lab=vdd}
N -100 0 -100 80 {lab=vdd}
N -180 0 -100 0 {lab=vdd}
N -280 370 -280 400 {lab=vm2}
N -370 240 -370 260 {lab=vm1}
N -180 240 -180 260 {lab=vout}
N -430 290 -430 390 {lab=vb1}
N -430 390 -100 390 {lab=vb1}
N -100 290 -100 390 {lab=vb1}
N -1160 610 -1040 610 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -300 520 0 0 {name=M5
W=5
L=2
nf=1 
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} -280 650 0 0 {name=l1 lab=GND}
C {gnd.sym} -580 650 0 0 {name=l2 lab=GND}
C {isource.sym} -580 420 0 0 {name=I0 value=50u}
C {vsource.sym} -1040 460 0 0 {name=vdd value=1.8 savecurrent=false}
C {vsource.sym} -1160 460 0 0 {name=Vb1 value=0 savecurrent=false}
C {lab_wire.sym} -1160 350 0 0 {name=p2 sig_type=std_logic lab=vb1}
C {gnd.sym} -280 320 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -200 80 0 0 {name=M2
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
model=pfet_01v8_lvt
spiceprefix=X
}
C {lab_wire.sym} -1040 350 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -280 -30 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -580 340 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} -390 290 0 0 {name=M3
W=5
L=2
nf=1 
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -160 290 0 1 {name=M4
W=5
L=2
nf=1 
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -560 520 0 1 {name=M6
W=5
L=2
nf=1 
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -350 80 0 1 {name=M1
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
model=pfet_01v8_lvt
spiceprefix=X
}
C {vsource.sym} -280 430 0 0 {name=vcm3 value=0 savecurrent=false}
C {vsource.sym} -370 180 0 0 {name=vcm1 value=0 savecurrent=false}
C {vsource.sym} -180 180 0 0 {name=vcm2 value=0 savecurrent=false}
C {opin.sym} 50 220 0 0 {name=p9 lab=vout}
C {capa.sym} 20 370 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 20 450 0 0 {name=l4 lab=GND}
C {ipin.sym} -450 290 0 0 {name=p7 lab=vb1}
C {gnd.sym} -1040 610 0 0 {name=l5 lab=GND}
C {devices/code.sym} -1130 60 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 220 -200 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27

.dc vb1 0 1.8 0.01


.control
run
save all

set color0 = white

plot i(vcm1)
plot i(vcm2)
plot i(vcm3)
plot i(vcm1) i(vcm2) i(vcm3)

MEAS DC vtail FIND v(vm2) WHEN v(vb1)=1.1 

*voltage measure
print v(vm1)[length(v(vm1))-1]
print v(vout)[length(v(vout))-1]
print v(vm2)[length(v(vm2))-1]
print v(vm3)[length(v(vm3))-1]

*plotting the vb1 vs the vm2
plot v(vb1) vs v(vm2)
plot v(vb1) v(vm1) v(vm2) v(vm3) v(vout)


.endc
.end
"}
C {lab_wire.sym} -430 520 0 0 {name=p1 sig_type=std_logic lab=vm3}
C {lab_wire.sym} -370 240 0 0 {name=p12 sig_type=std_logic lab=vm1}
C {lab_wire.sym} -280 370 0 0 {name=p3 sig_type=std_logic lab=vm2}
