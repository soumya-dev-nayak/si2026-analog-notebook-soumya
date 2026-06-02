v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -305 185 -305 200 {lab=GND}
N -305 -15 -305 100 {lab=in}
N -305 -15 -130 -15 {lab=in}
N 170 -15 200 -15 {lab=out}
N 170 5 170 180 {lab=GND}
N -305 185 170 180 {lab=GND}
N -305 160 -305 185 {lab=GND}
C {vsource.sym} -305 130 0 0 {name=V1 value="PULSE(0 5 2n 10p 10p 10n 20n)" savecurrent=false}
C {gnd.sym} -305 200 0 0 {name=l1 lab=GND}
C {ipin.sym} -235 -15 1 0 {name=p1 lab=in}
C {opin.sym} 200 -15 0 0 {name=p2 lab=out
}
C {RC_lpf.sym} 20 -5 0 0 {name=x1}
C {simulator_commands_shown.sym} -715 -255 0 0 {name=COMMANDS1
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.MEASURE TRAN trise TRIG v(out) VAL=0.5 RISE=1 TARG v(out) VAL=4.5 RISE=1
.MEASURE TRAN tfall TRIG v(out) VAL=4.5 FALL=1 TARG v(out) VAL=0.5 FALL=1
.control
save all
tran 1p 20n
plot v(in) v(out)
run
.endc

"}
