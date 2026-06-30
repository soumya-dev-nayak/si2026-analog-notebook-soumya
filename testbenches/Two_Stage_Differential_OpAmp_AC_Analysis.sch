v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -500 80 -390 80 {lab=#net1}
N -540 130 -480 130 {lab=#net1}
N -480 80 -480 130 {lab=#net1}
N -540 320 -540 370 {lab=vm2}
N -540 370 -350 370 {lab=vm2}
N -350 320 -350 370 {lab=vm2}
N -610 520 -490 520 {lab=vm3}
N -450 550 -450 650 {lab=GND}
N -750 550 -750 650 {lab=GND}
N -750 450 -750 490 {lab=vm3}
N -710 520 -610 520 {lab=vm3}
N -540 0 -540 50 {lab=vdd}
N -540 0 -350 0 {lab=vdd}
N -350 0 -350 50 {lab=vdd}
N -540 290 -350 290 {lab=GND}
N -450 290 -450 320 {lab=GND}
N -450 -30 -450 0 {lab=vdd}
N -750 340 -750 390 {lab=vdd}
N -620 290 -580 290 {lab=vb1}
N -310 290 -270 290 {lab=vb2}
N -830 520 -750 520 {lab=GND}
N -830 520 -830 580 {lab=GND}
N -830 580 -750 580 {lab=GND}
N -450 520 -370 520 {lab=GND}
N -370 520 -370 570 {lab=GND}
N -450 570 -370 570 {lab=GND}
N -450 460 -450 490 {lab=#net2}
N -750 470 -670 470 {lab=vm3}
N -670 470 -670 520 {lab=vm3}
N -540 210 -540 240 {lab=vm1}
N -540 110 -540 150 {lab=#net1}
N -350 210 -350 240 {lab=#net3}
N -350 110 -350 150 {lab=#net4}
N -350 220 -120 220 {lab=#net3}
N -630 80 -540 80 {lab=vdd}
N -630 10 -630 80 {lab=vdd}
N -630 0 -630 10 {lab=vdd}
N -630 0 -540 0 {lab=vdd}
N -350 80 -270 80 {lab=vdd}
N -270 0 -270 80 {lab=vdd}
N -350 0 -270 0 {lab=vdd}
N -450 370 -450 400 {lab=vm2}
N -540 240 -540 260 {lab=vm1}
N -350 240 -350 260 {lab=#net3}
N -270 0 110 0 {lab=vdd}
N 110 0 110 50 {lab=vdd}
N 110 450 110 490 {lab=#net5}
N -520 480 -520 520 {lab=vm3}
N -520 480 30 480 {lab=vm3}
N 30 480 30 520 {lab=vm3}
N 30 520 70 520 {lab=vm3}
N 110 550 110 650 {lab=GND}
N -60 220 110 220 {lab=vout}
N -190 80 70 80 {lab=#net3}
N -190 80 -190 220 {lab=#net3}
N 110 520 190 520 {lab=GND}
N 190 520 190 600 {lab=GND}
N 110 600 190 600 {lab=GND}
N 110 370 110 450 {lab=#net5}
N 110 110 110 310 {lab=vout}
N 110 80 210 80 {lab=vdd}
N 210 0 210 80 {lab=vdd}
N 110 0 210 0 {lab=vdd}
N 110 220 310 220 {lab=vout}
N 270 220 270 370 {lab=vout}
N 270 430 270 610 {lab=GND}
N 270 610 270 650 {lab=GND}
N -1260 470 -1260 590 {lab=GND}
N -1130 470 -1130 590 {lab=GND}
N -1260 330 -1260 410 {lab=vb1}
N -1130 330 -1130 410 {lab=vdd}
N -1260 590 -1130 590 {lab=GND}
N -1020 470 -1020 590 {lab=GND}
N -1130 590 -1020 590 {lab=GND}
N -1020 320 -1020 410 {lab=vb2}
C {sky130_fd_pr/nfet_01v8.sym} -470 520 0 0 {name=M5
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
C {gnd.sym} -450 650 0 0 {name=l1 lab=GND}
C {gnd.sym} -750 650 0 0 {name=l2 lab=GND}
C {isource.sym} -750 420 0 0 {name=I0 value=50u}
C {gnd.sym} -450 320 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -370 80 0 0 {name=M2
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
C {lab_wire.sym} -450 -30 0 0 {name=p5 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -750 340 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} -560 290 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} -330 290 0 1 {name=M4
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
C {sky130_fd_pr/nfet_01v8.sym} -730 520 0 1 {name=M6
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
C {sky130_fd_pr/pfet_01v8_lvt.sym} -520 80 0 1 {name=M1
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
C {vsource.sym} -450 430 0 0 {name=vcm3 value=0 savecurrent=false}
C {vsource.sym} -540 180 0 0 {name=vcm1 value=0 savecurrent=false}
C {vsource.sym} -350 180 0 0 {name=vcm2 value=0 savecurrent=false}
C {ipin.sym} -620 290 0 0 {name=p7 lab=vb1}
C {devices/code.sym} -1130 60 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 460 0 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27

.ac dec 10 1 10G

.control
run
save all

set color0 = white

*Plotting gain and Phase
plot db(v(vout)) title 'Magnitude Response (Gain in dB)'
plot ph(v(vout))*(180/pi)

*Low-frequency gain (at first AC point)
let gain0 = db(v(vout))[0]

*3-DB bandwidth
meas ac BW_3DB when db(v(vout)) = (gain0-3)

*Unity Gain BW
meas ac UGB when db(v(vout)) = 0


.endc
.end
"}
C {lab_wire.sym} -600 520 0 0 {name=p1 sig_type=std_logic lab=vm3}
C {lab_wire.sym} -540 240 0 0 {name=p12 sig_type=std_logic lab=vm1}
C {lab_wire.sym} -450 370 0 0 {name=p3 sig_type=std_logic lab=vm2}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 90 80 0 0 {name=M7
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
C {sky130_fd_pr/nfet_01v8.sym} 90 520 0 0 {name=M8
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
C {gnd.sym} 110 650 0 0 {name=l4 lab=GND}
C {capa.sym} -90 220 3 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 110 340 0 0 {name=vcm4 value=0 savecurrent=false}
C {opin.sym} 310 220 0 0 {name=p8 lab=vout}
C {capa.sym} 270 400 0 0 {name=C2
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 270 650 0 0 {name=l6 lab=GND}
C {vsource.sym} -1130 440 0 0 {name=vdd value=1.8 savecurrent=false}
C {vsource.sym} -1260 440 0 1 {name=Vb1 value="1.5 AC 0.5" savecurrent=false}
C {lab_wire.sym} -1260 330 0 1 {name=p2 sig_type=std_logic lab=vb1}
C {lab_wire.sym} -1130 330 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {gnd.sym} -1130 590 0 0 {name=l5 lab=GND}
C {vsource.sym} -1020 440 0 0 {name=vb2 value="1.5 AC -0.5" savecurrent=false}
C {lab_wire.sym} -1020 320 2 0 {name=p9 sig_type=std_logic lab=vb2}
C {ipin.sym} -270 290 2 0 {name=p10 lab=vb2}
