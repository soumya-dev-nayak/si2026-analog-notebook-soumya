v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1300 930 1410 930 {lab=#net1}
N 1260 980 1320 980 {lab=#net1}
N 1320 930 1320 980 {lab=#net1}
N 1260 1170 1260 1220 {lab=vm2}
N 1260 1220 1450 1220 {lab=vm2}
N 1450 1170 1450 1220 {lab=vm2}
N 1190 1370 1310 1370 {lab=vm3}
N 1350 1400 1350 1500 {lab=GND}
N 1050 1400 1050 1500 {lab=GND}
N 1050 1300 1050 1340 {lab=vm3}
N 1090 1370 1190 1370 {lab=vm3}
N 1260 850 1260 900 {lab=vdd}
N 1260 850 1450 850 {lab=vdd}
N 1450 850 1450 900 {lab=vdd}
N 1260 1140 1450 1140 {lab=GND}
N 1350 1140 1350 1170 {lab=GND}
N 1350 820 1350 850 {lab=vdd}
N 1050 1190 1050 1240 {lab=vdd}
N 1490 1140 1530 1140 {lab=vb2}
N 970 1370 1050 1370 {lab=GND}
N 970 1370 970 1430 {lab=GND}
N 970 1430 1050 1430 {lab=GND}
N 1350 1370 1430 1370 {lab=GND}
N 1430 1370 1430 1420 {lab=GND}
N 1350 1420 1430 1420 {lab=GND}
N 1350 1310 1350 1340 {lab=#net2}
N 1050 1320 1130 1320 {lab=vm3}
N 1130 1320 1130 1370 {lab=vm3}
N 1260 1060 1260 1090 {lab=vm1}
N 1260 960 1260 1000 {lab=#net1}
N 1450 1060 1450 1090 {lab=#net3}
N 1450 960 1450 1000 {lab=#net4}
N 1450 1070 1680 1070 {lab=#net3}
N 1170 930 1260 930 {lab=vdd}
N 1170 860 1170 930 {lab=vdd}
N 1170 850 1170 860 {lab=vdd}
N 1170 850 1260 850 {lab=vdd}
N 1450 930 1530 930 {lab=vdd}
N 1530 850 1530 930 {lab=vdd}
N 1450 850 1530 850 {lab=vdd}
N 1350 1220 1350 1250 {lab=vm2}
N 1260 1090 1260 1110 {lab=vm1}
N 1450 1090 1450 1110 {lab=#net3}
N 1530 850 1910 850 {lab=vdd}
N 1910 850 1910 900 {lab=vdd}
N 1910 1300 1910 1340 {lab=#net5}
N 1280 1330 1280 1370 {lab=vm3}
N 1280 1330 1830 1330 {lab=vm3}
N 1830 1330 1830 1370 {lab=vm3}
N 1830 1370 1870 1370 {lab=vm3}
N 1910 1400 1910 1500 {lab=GND}
N 1740 1070 1910 1070 {lab=vout}
N 1610 930 1870 930 {lab=#net3}
N 1610 930 1610 1070 {lab=#net3}
N 1910 1370 1990 1370 {lab=GND}
N 1990 1370 1990 1450 {lab=GND}
N 1910 1450 1990 1450 {lab=GND}
N 1910 1220 1910 1300 {lab=#net5}
N 1910 960 1910 1160 {lab=vout}
N 1910 930 2010 930 {lab=vdd}
N 2010 850 2010 930 {lab=vdd}
N 1910 850 2010 850 {lab=vdd}
N 1910 1070 2110 1070 {lab=vout}
N 2070 1070 2070 1220 {lab=vout}
N 2070 1280 2070 1460 {lab=GND}
N 2070 1460 2070 1500 {lab=GND}
N 1210 1140 1220 1140 {lab=vb1}
N 510 1410 510 1530 {lab=GND}
N 640 1410 640 1530 {lab=GND}
N 510 1270 510 1350 {lab=vb1}
N 640 1270 640 1350 {lab=vdd}
N 510 1530 640 1530 {lab=GND}
N 750 1410 750 1530 {lab=GND}
N 640 1530 750 1530 {lab=GND}
N 750 1260 750 1350 {lab=vb2}
C {sky130_fd_pr/nfet_01v8.sym} 1330 1370 0 0 {name=M5
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
C {gnd.sym} 1350 1500 0 0 {name=l1 lab=GND}
C {gnd.sym} 1050 1500 0 0 {name=l2 lab=GND}
C {isource.sym} 1050 1270 0 0 {name=I0 value=50u}
C {gnd.sym} 1350 1170 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1430 930 0 0 {name=M2
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
C {lab_wire.sym} 1350 820 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {lab_wire.sym} 1050 1190 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} 1240 1140 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} 1470 1140 0 1 {name=M4
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
C {sky130_fd_pr/nfet_01v8.sym} 1070 1370 0 1 {name=M6
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1280 930 0 1 {name=M1
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
C {vsource.sym} 1350 1280 0 0 {name=vcm3 value=0 savecurrent=false}
C {vsource.sym} 1260 1030 0 0 {name=vcm1 value=0 savecurrent=false}
C {vsource.sym} 1450 1030 0 0 {name=vcm2 value=0 savecurrent=false}
C {devices/code.sym} 560 1050 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {lab_wire.sym} 1200 1370 0 0 {name=p1 sig_type=std_logic lab=vm3}
C {lab_wire.sym} 1260 1090 0 0 {name=p12 sig_type=std_logic lab=vm1}
C {lab_wire.sym} 1350 1220 0 0 {name=p3 sig_type=std_logic lab=vm2}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1890 930 0 0 {name=M7
W=5
L=2
nf=1
mult=64
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1890 1370 0 0 {name=M8
W=5
L=2
nf=1 
mult=16
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} 1910 1500 0 0 {name=l4 lab=GND}
C {capa.sym} 1710 1070 3 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 1910 1190 0 0 {name=vcm4 value=0 savecurrent=false}
C {opin.sym} 2110 1070 0 0 {name=p8 lab=vout}
C {capa.sym} 2070 1250 0 0 {name=C2
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 2070 1500 0 0 {name=l6 lab=GND}
C {ipin.sym} 1530 1140 2 0 {name=p10 lab=vb2}
C {vsource.sym} 640 1380 0 0 {name=vdd value=1.8 savecurrent=false}
C {vsource.sym} 510 1380 0 1 {name=Vb1 value="sin(1.5 0.25m 10k 10u 0 0)" savecurrent=false}
C {lab_wire.sym} 510 1270 0 1 {name=p2 sig_type=std_logic lab=vb1}
C {lab_wire.sym} 640 1270 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {gnd.sym} 640 1530 0 0 {name=l5 lab=GND}
C {vsource.sym} 750 1380 0 0 {name=vb2 value="sin(1.5 0.25m 10k 10u 0 100)" savecurrent=false}
C {lab_wire.sym} 750 1260 2 0 {name=p7 sig_type=std_logic lab=vb2}
C {ipin.sym} 1210 1140 0 0 {name=p9 lab=vb1}
C {simulator_commands_shown.sym} 2260 990 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.tran 1u 3m

.control
run
save all
set color0 = white

plot v(vout)
plot (v(vb1) - v(vb2))

.endc
.end

"}
