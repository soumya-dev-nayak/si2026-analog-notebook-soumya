v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -160 100 -160 160 {lab=vout}
N -160 120 20 120 {lab=vout}
N 20 120 20 130 {lab=vout}
N -160 220 -160 260 {lab=GND}
N 20 190 20 260 {lab=GND}
N -280 190 -200 190 {lab=vin}
N -280 190 -280 200 {lab=vin}
N -680 320 -680 400 {lab=GND}
N -680 400 -540 400 {lab=GND}
N -540 320 -540 400 {lab=GND}
N -610 400 -610 440 {lab=GND}
N -680 230 -680 260 {lab=Vb}
N -540 230 -540 260 {lab=vdd}
N -280 70 -200 70 {lab=Vb}
N -160 -20 -160 40 {lab=#net1}
N -160 190 -90 190 {lab=GND}
N -90 190 -90 230 {lab=GND}
N -160 230 -90 230 {lab=GND}
N -310 190 -280 190 {lab=vin}
N 20 120 60 120 {lab=vout}
N -160 70 -90 70 {lab=#net1}
N -90 20 -90 70 {lab=#net1}
N -160 20 -90 20 {lab=#net1}
N -160 -110 -160 -80 {lab=vdd}
C {capa.sym} 20 160 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -160 260 0 0 {name=l1 lab=GND}
C {gnd.sym} 20 260 0 0 {name=l2 lab=GND}
C {vsource.sym} -280 230 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -680 290 0 0 {name=V2 value=0.9 savecurrent=false}
C {gnd.sym} -280 260 0 0 {name=l3 lab=GND}
C {vsource.sym} -540 290 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -610 440 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -680 230 0 0 {name=p1 sig_type=std_logic lab=Vb}
C {lab_pin.sym} -540 230 0 0 {name=p2 sig_type=std_logic lab= vdd}
C {ipin.sym} -310 190 0 0 {name=p5 lab=vin}
C {opin.sym} 60 120 0 0 {name=p6 lab=vout}
C {devices/code.sym} -1070 240 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -180 70 0 0 {name=M2
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
C {simulator_commands_shown.sym} -1330 -490 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.dc v1 0 1.8 1m

.control
run
save all
set color0 = white

plot v(vout)

let gain = deriv(v(vout))
let id = i(v4)

plot gain title 'Voltage Gain (dv(vout)/dv(v1))'

plot v(vin) v(vout) gain
plot id
print id 

.endc
.end
"}
C {sky130_fd_pr/nfet_01v8.sym} -180 190 0 0 {name=M1
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
C {lab_pin.sym} -280 70 0 0 {name=p3 sig_type=std_logic lab=Vb}
C {lab_pin.sym} -160 -110 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {vsource.sym} -160 -50 0 0 {name=V4 value=0 savecurrent=false}
