v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -620 550 -570 550 {lab=vin1}
N -510 550 -460 550 {lab=vin2}
N -720 550 -720 590 {lab=vin}
N -720 550 -680 550 {lab=vin}
N -720 650 -720 690 {lab=GND}
N -510 330 -510 350 {lab=vref}
N -590 330 -510 330 {lab=vref}
N -590 330 -590 350 {lab=vref}
N -590 310 -590 330 {lab=vref}
N -510 330 -460 330 {lab=vref}
N -460 330 -460 510 {lab=vref}
N -460 510 -280 510 {lab=vref}
N -730 230 -730 320 {lab=Vbat}
N -730 230 -590 230 {lab=Vbat}
N -590 230 -590 250 {lab=Vbat}
N -590 430 -510 430 {lab=GND}
N -730 380 -730 430 {lab=GND}
N -640 430 -640 450 {lab=GND}
N -730 430 -640 430 {lab=GND}
N -590 410 -590 430 {lab=GND}
N -640 430 -590 430 {lab=GND}
N -510 410 -510 430 {lab=GND}
N -240 560 -240 690 {lab=GND}
N -300 300 -280 300 {lab=viom}
N -300 340 -300 380 {lab=viom}
N -300 380 -280 380 {lab=viom}
N -200 340 -200 380 {lab=vout}
N -220 380 -200 380 {lab=vout}
N -220 300 -200 300 {lab=vout}
N -350 340 -300 340 {lab=viom}
N -300 300 -300 340 {lab=viom}
N -200 340 -120 340 {lab=vout}
N -200 300 -200 340 {lab=vout}
N -120 340 -120 500 {lab=vout}
N -240 500 -120 500 {lab=vout}
N -120 500 -120 570 {lab=vout}
N -120 630 -120 690 {lab=GND}
N -350 550 -280 550 {lab=viom}
N -350 340 -350 550 {lab=viom}
N -400 550 -350 550 {lab=viom}
C {res.sym} -650 550 3 1 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} -540 550 3 1 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -430 550 3 1 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} -240 530 0 0 {name=E1 value=10e5}
C {vsource.sym} -720 620 0 0 {name=Vi value="0 AC sin(0 125u 1k)" savecurrent=false}
C {gnd.sym} -720 690 0 0 {name=l1 lab=GND}
C {gnd.sym} -240 690 0 0 {name=l2 lab=GND}
C {res.sym} -590 380 2 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} -510 380 2 0 {name=C2
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -590 280 0 1 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -730 350 0 0 {name=Vcc value="DC 2.5 AC 1" savecurrent=false}
C {gnd.sym} -640 450 0 0 {name=l3 lab=GND}
C {res.sym} -250 380 1 0 {name=R5
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} -250 300 1 0 {name=C3
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -120 600 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -120 690 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -720 550 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_wire.sym} -580 550 0 0 {name=p3 sig_type=std_logic lab=vin1}
C {lab_wire.sym} -470 550 0 0 {name=p2 sig_type=std_logic lab=vin2}
C {lab_wire.sym} -350 550 0 0 {name=p4 sig_type=std_logic lab=viom}
C {lab_wire.sym} -360 510 0 0 {name=p5 sig_type=std_logic lab=vref}
C {lab_wire.sym} -120 500 2 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_wire.sym} -660 230 0 0 {name=p7 sig_type=std_logic lab=Vbat}
C {simulator_commands_shown.sym} -1230 80 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.param temp = 27
.param freq = 1k


.control
save all
tran 1u 10m 

set color0 = white 

plot v(vin)
plot v(vout)

meas tran vmax_out MAX v(vout)
meas tran vmin_out MIN v(vout)

meas tran vmax_in MAX v(vin)
meas tran vmin_in MIN v(vin)

let vinpk  = (vmax_in - vmin_in)/2
let voutpk = (vmax_out - vmin_out)/2

let gain = voutpk/vinpk

print vinpk
print voutpk
print gain

.endc

.end
"}
