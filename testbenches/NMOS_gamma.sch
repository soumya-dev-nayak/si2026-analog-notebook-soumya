v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -940 640 -830 640 {lab=Vgs}
N -830 640 -820 640 {lab=Vgs}
N -940 540 -940 640 {lab=Vgs}
N -940 540 -780 540 {lab=Vgs}
N -780 540 -780 610 {lab=Vgs}
N -940 700 -940 780 {lab=GND}
N -940 780 -790 780 {lab=GND}
N -780 670 -780 780 {lab=GND}
N -790 780 -780 780 {lab=GND}
N -780 640 -620 640 {lab=vsb}
N -620 700 -620 770 {lab=GND}
N -780 780 -620 780 {lab=GND}
N -620 770 -620 780 {lab=GND}
N -780 780 -780 820 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -800 640 0 0 {name=M1
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
C {vsource.sym} -940 670 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -620 670 2 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} -780 820 0 0 {name=l1 lab=GND}
C {devices/code.sym} -1350 570 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {lab_wire.sym} -860 540 0 1 {name=p1 sig_type=std_logic lab=Vgs}
C {lab_wire.sym} -670 640 0 1 {name=p2 sig_type=std_logic lab=vsb}
C {simulator_commands_shown.sym} 80 70 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* NMOS Gamma Parameter Extraction (Diode-Connected)
.temp 27

.control 


* RUN 1: Vsb = 0V -> Sweeps into plot "dc1"

alter V2 = 0V
dc V1 0 1.8 0.01

let id_0 = -i(V1)
let rt_id_0 = sqrt(id_0)
let d_rt_id_0 = deriv(rt_id_0)

* Measuring near 0.7V where the diode-connected device turns on cleanly

meas dc d_at_point_0 find d_rt_id_0 at=1
meas dc rt_id_at_point_0 find rt_id_0 at=1
let vt_0 = 1 - (d_at_point_0^-1 * rt_id_at_point_0)


* RUN 2: Vsb = 1V -> Sweeps into plot dc2

alter V2 = 1V
dc V1 0 1.8 0.01

let id_1 = -i(V1)
let rt_id_1 = sqrt(id_1)
let d_rt_id_1 = deriv(rt_id_1)

* Measuring near 0.8V because Vth shifts up with body bias
meas dc d_at_point_1 find d_rt_id_1 at=1
meas dc rt_id_at_point_1 find rt_id_1 at=1
let vt_1 = 1 - (d_at_point_1^-1 * rt_id_at_point_1)


* FINAL GAMMA CALCULATION

let phi_f2 = 0.874

* Cross-referencing plots explicitly to preserve the data
let gamma = (dc2.vt_1 - dc1.vt_0) / (sqrt(phi_f2 + 1.0) - sqrt(phi_f2))

print dc2.vt_1
print gamma


.endc
.end
"}
