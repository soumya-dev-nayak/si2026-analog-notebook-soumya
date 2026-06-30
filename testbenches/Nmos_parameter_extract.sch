v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -340 130 -230 130 {lab=Vgs}
N -230 130 -220 130 {lab=Vgs}
N -340 30 -340 130 {lab=Vgs}
N -340 30 -180 30 {lab=Vgs}
N -180 30 -180 100 {lab=Vgs}
N -340 190 -340 270 {lab=GND}
N -340 270 -190 270 {lab=GND}
N -180 160 -180 270 {lab=GND}
N -190 270 -180 270 {lab=GND}
N -180 130 -20 130 {lab=vsb}
N -20 190 -20 260 {lab=GND}
N -180 270 -20 270 {lab=GND}
N -20 260 -20 270 {lab=GND}
N -180 270 -180 310 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -200 130 0 0 {name=M1
W=5
L=2
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -340 160 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -20 160 2 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} -180 310 0 0 {name=l1 lab=GND}
C {devices/code.sym} -750 60 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {lab_wire.sym} -260 30 0 1 {name=p1 sig_type=std_logic lab=Vgs}
C {lab_wire.sym} -70 130 0 1 {name=p2 sig_type=std_logic lab=vsb}
C {simulator_commands_shown.sym} -830 -760 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.temp 27

.control

dc v1 0 1.8 0.01 v2 0 1 0.5
run

save all
let id = -i(v1)
*plotting part
set color0 = white
plot id 

plot sqrt(id)

*calculation part
LET rt_id = sqrt(id)

LET d_rt_id = deriv(rt_id)

MEAS DC d_at_1v FIND d_rt_id AT=1.0

LET uncox = (2.0*2.0/5.0)*d_at_1v^2.0
print uncox

** Calculating Vt by calculating the intercept

MEAS DC rt_id_at_1  FIND rt_id AT=1.0

LET Vt=1.0-(d_at_1v^-1 * rt_id_at_1)

print Vt

.endc
"}
