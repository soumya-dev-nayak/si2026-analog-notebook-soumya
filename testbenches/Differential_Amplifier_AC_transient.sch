v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -1110 -780 -1000 -780 {lab=#net1}
N -1150 -730 -1090 -730 {lab=#net1}
N -1090 -780 -1090 -730 {lab=#net1}
N -1150 -540 -1150 -490 {lab=vm2}
N -1150 -490 -960 -490 {lab=vm2}
N -960 -540 -960 -490 {lab=vm2}
N -1220 -340 -1100 -340 {lab=vm3}
N -1060 -310 -1060 -210 {lab=GND}
N -1360 -310 -1360 -210 {lab=GND}
N -1360 -410 -1360 -370 {lab=vm3}
N -1320 -340 -1220 -340 {lab=vm3}
N -1150 -860 -1150 -810 {lab=vdd}
N -1150 -860 -960 -860 {lab=vdd}
N -960 -860 -960 -810 {lab=vdd}
N -1950 -370 -1950 -250 {lab=GND}
N -1820 -370 -1820 -250 {lab=GND}
N -1950 -510 -1950 -430 {lab=vb1}
N -1820 -510 -1820 -430 {lab=vdd}
N -1150 -570 -960 -570 {lab=GND}
N -1060 -570 -1060 -540 {lab=GND}
N -1060 -890 -1060 -860 {lab=vdd}
N -1360 -520 -1360 -470 {lab=vdd}
N -1230 -570 -1190 -570 {lab=vb1}
N -920 -570 -880 -570 {lab=vb2}
N -1440 -340 -1360 -340 {lab=GND}
N -1440 -340 -1440 -280 {lab=GND}
N -1440 -280 -1360 -280 {lab=GND}
N -1060 -340 -980 -340 {lab=GND}
N -980 -340 -980 -290 {lab=GND}
N -1060 -290 -980 -290 {lab=GND}
N -1060 -400 -1060 -370 {lab=#net2}
N -1360 -390 -1280 -390 {lab=vm3}
N -1280 -390 -1280 -340 {lab=vm3}
N -1150 -650 -1150 -620 {lab=vm1}
N -1150 -750 -1150 -710 {lab=#net1}
N -960 -650 -960 -620 {lab=vout}
N -960 -750 -960 -710 {lab=#net3}
N -960 -640 -730 -640 {lab=vout}
N -760 -640 -760 -520 {lab=vout}
N -760 -460 -760 -410 {lab=GND}
N -1240 -780 -1150 -780 {lab=vdd}
N -1240 -850 -1240 -780 {lab=vdd}
N -1240 -860 -1240 -850 {lab=vdd}
N -1240 -860 -1150 -860 {lab=vdd}
N -960 -780 -880 -780 {lab=vdd}
N -880 -860 -880 -780 {lab=vdd}
N -960 -860 -880 -860 {lab=vdd}
N -1060 -490 -1060 -460 {lab=vm2}
N -1150 -620 -1150 -600 {lab=vm1}
N -960 -620 -960 -600 {lab=vout}
N -1950 -250 -1820 -250 {lab=GND}
N -1710 -370 -1710 -250 {lab=GND}
N -1820 -250 -1710 -250 {lab=GND}
N -1710 -520 -1710 -430 {lab=vb2}
C {sky130_fd_pr/nfet_01v8.sym} -1080 -340 0 0 {name=M5
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
C {gnd.sym} -1060 -210 0 0 {name=l1 lab=GND}
C {gnd.sym} -1360 -210 0 0 {name=l2 lab=GND}
C {isource.sym} -1360 -440 0 0 {name=I0 value=50u}
C {vsource.sym} -1820 -400 0 0 {name=vdd value=1.8 savecurrent=false}
C {vsource.sym} -1950 -400 0 1 {name=Vb1 value="sin(1.5 0.25m 10k 10u 0 0)" savecurrent=false}
C {lab_wire.sym} -1950 -510 0 1 {name=p2 sig_type=std_logic lab=vb1}
C {gnd.sym} -1060 -540 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -980 -780 0 0 {name=M2
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
C {lab_wire.sym} -1820 -510 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -1060 -890 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -1360 -520 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} -1170 -570 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} -940 -570 0 1 {name=M4
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
C {sky130_fd_pr/nfet_01v8.sym} -1340 -340 0 1 {name=M6
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} -1130 -780 0 1 {name=M1
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
C {vsource.sym} -1060 -430 0 0 {name=vcm3 value=0 savecurrent=false}
C {vsource.sym} -1150 -680 0 0 {name=vcm1 value=0 savecurrent=false}
C {vsource.sym} -960 -680 0 0 {name=vcm2 value=0 savecurrent=false}
C {opin.sym} -730 -640 0 0 {name=p9 lab=vout}
C {capa.sym} -760 -490 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -760 -410 0 0 {name=l4 lab=GND}
C {ipin.sym} -1230 -570 0 0 {name=p7 lab=vb1}
C {gnd.sym} -1820 -250 0 0 {name=l5 lab=GND}
C {devices/code.sym} -1580 -770 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -620 -780 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.tran 1u 1m

.control
run
save all
set color0 = white

plot v(vout)
plot (v(vb1) - v(vb2))

.endc
.end

"}
C {lab_wire.sym} -1210 -340 0 0 {name=p1 sig_type=std_logic lab=vm3}
C {lab_wire.sym} -1150 -620 0 0 {name=p12 sig_type=std_logic lab=vm1}
C {lab_wire.sym} -1060 -490 0 0 {name=p3 sig_type=std_logic lab=vm2}
C {vsource.sym} -1710 -400 0 0 {name=vb2 value="sin(1.5 0.25m 10k 10u 0 100)" savecurrent=false}
C {lab_wire.sym} -1710 -520 2 0 {name=p8 sig_type=std_logic lab=vb2}
C {ipin.sym} -880 -570 2 0 {name=p10 lab=vb2}
