v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 120 -80 150 {lab=in}
N 250 170 250 230 {lab=GND}
N -80 210 -80 240 {lab=GND}
N 290 120 320 120 {lab=out}
N 170 120 210 120 {lab=in}
C {vsource.sym} -80 180 0 0 {name=V1 value="PULSE (0 1 0 10p 10p 10n 20n)" savecurrent=false}
C {gnd.sym} -80 240 0 0 {name=l1 lab=GND}
C {simulator_commands_shown.sym} -1150 -490 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.tran 1p 60n

.control 
run
plot v(in) v(out)

.endc
"}
C {CR_First_Order_hpf.sym} 250 130 0 0 {name=x1}
C {lab_wire.sym} 320 120 0 0 {name=p1 sig_type=std_logic lab=out}
C {lab_pin.sym} -80 120 0 0 {name=p2 sig_type=std_logic lab=in}
C {lab_pin.sym} 170 120 0 0 {name=p3 sig_type=std_logic lab=in}
C {lab_pin.sym} 250 230 0 0 {name=p4 sig_type=std_logic lab=GND}
