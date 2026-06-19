v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 30 -0 80 {lab=vout}
N -140 0 -140 50 {lab=vin}
N -140 0 -40 0 {lab=vin}
N -140 110 -140 200 {lab=GND}
N -140 200 -0 200 {lab=GND}
N 0 140 -0 200 {lab=GND}
N 140 140 140 200 {lab=GND}
N 0 200 140 200 {lab=GND}
N 140 70 140 80 {lab=vout}
N -380 180 -380 260 {lab=GND}
N -0 200 0 250 {lab=GND}
N -0 -100 -0 -30 {lab=vdd}
N -380 60 -380 120 {lab=vdd}
N 0 70 190 70 {lab=vout}
N -0 -0 90 0 {lab=vdd}
N 90 -60 90 -0 {lab=vdd}
N 0 -60 90 -60 {lab=vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -20 0 0 0 {name=M1
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
C {res.sym} 0 110 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -140 80 0 0 {name=V1 value=0.9 savecurrent=false}
C {capa.sym} 140 110 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -380 150 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} 0 250 0 0 {name=l1 lab=GND}
C {gnd.sym} -380 260 0 0 {name=l2 lab=GND}
C {lab_wire.sym} 0 -100 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_wire.sym} -380 60 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {simulator_commands_shown.sym} -630 -430 0 0 {name=COMMANDS
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

plot gain title 'Voltage Gain (dv(vout)/dv(v1))'

plot v(vin) v(vout) gain
plot -v(v(vout)/v(vin))

.endc
.end
"}
C {ipin.sym} -140 0 0 0 {name=p3 lab=vin}
C {opin.sym} 190 70 0 0 {name=p4 lab=vout}
C {devices/code.sym} -820 130 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
