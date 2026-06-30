v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -510 320 -400 320 {lab=#net1}
N -400 320 -390 320 {lab=#net1}
N -350 220 -350 290 {lab=#net2}
N -510 380 -510 460 {lab=GND}
N -510 460 -360 460 {lab=GND}
N -350 350 -350 460 {lab=GND}
N -360 460 -350 460 {lab=GND}
N -190 380 -190 450 {lab=GND}
N -350 460 -190 460 {lab=GND}
N -190 450 -190 460 {lab=GND}
N -350 460 -350 500 {lab=GND}
N -350 320 -280 320 {lab=GND}
N -280 320 -280 390 {lab=GND}
N -350 390 -280 390 {lab=GND}
N -350 200 -350 220 {lab=#net2}
N -350 200 -190 200 {lab=#net2}
N -190 200 -190 320 {lab=#net2}
C {sky130_fd_pr/nfet_01v8.sym} -370 320 0 0 {name=M1
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
C {vsource.sym} -510 350 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} -190 350 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} -350 500 0 0 {name=l1 lab=GND}
C {devices/code.sym} -920 250 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 40 150 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27

.control
run
save all

* 1. Sweep the actual component names: V2 (Vds) inner sweep, V1 (Vgs) outer sweep
dc V2 0 1.8 0.01 V1 0 1.8 0.3

* 2. Capture the current flowing through the Drain voltage source (V2)
let id = -i(V2)

* 3. Plotting the family of curves
set color0 = white
set xbrushwidth = 2

* Plots current vs the Drain voltage (V2 voltage vector)
plot id xlabel 'Vds(volts)' ylabel 'Drain Current(mA)'
.endc
"}
