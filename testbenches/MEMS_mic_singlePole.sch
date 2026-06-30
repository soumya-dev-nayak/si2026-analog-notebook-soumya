v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 220 -50 270 -50 {lab=vin1}
N 330 -50 380 -50 {lab=vin2}
N 120 -50 120 -10 {lab=vin}
N 120 -50 160 -50 {lab=vin}
N 120 50 120 90 {lab=GND}
N 330 -270 330 -250 {lab=vref}
N 250 -270 330 -270 {lab=vref}
N 250 -270 250 -250 {lab=vref}
N 250 -290 250 -270 {lab=vref}
N 330 -270 380 -270 {lab=vref}
N 380 -270 380 -90 {lab=vref}
N 380 -90 560 -90 {lab=vref}
N 110 -370 110 -280 {lab=Vbat}
N 110 -370 250 -370 {lab=Vbat}
N 250 -370 250 -350 {lab=Vbat}
N 250 -170 330 -170 {lab=GND}
N 110 -220 110 -170 {lab=GND}
N 200 -170 200 -150 {lab=GND}
N 110 -170 200 -170 {lab=GND}
N 250 -190 250 -170 {lab=GND}
N 200 -170 250 -170 {lab=GND}
N 330 -190 330 -170 {lab=GND}
N 600 -40 600 90 {lab=GND}
N 540 -300 560 -300 {lab=viom}
N 540 -260 540 -220 {lab=viom}
N 540 -220 560 -220 {lab=viom}
N 640 -260 640 -220 {lab=vout}
N 620 -220 640 -220 {lab=vout}
N 620 -300 640 -300 {lab=vout}
N 490 -260 540 -260 {lab=viom}
N 540 -300 540 -260 {lab=viom}
N 640 -260 1090 -260 {lab=vout}
N 640 -300 640 -260 {lab=vout}
N 720 -100 720 -30 {lab=#net1}
N 720 30 720 90 {lab=GND}
N 490 -50 560 -50 {lab=viom}
N 490 -260 490 -50 {lab=viom}
N 440 -50 490 -50 {lab=viom}
N 720 -100 920 -100 {lab=#net1}
N 920 40 920 70 {lab=GND}
N 960 -50 960 40 {lab=GND}
N 920 40 960 40 {lab=GND}
N 920 -60 920 40 {lab=GND}
N 1090 -50 1090 70 {lab=GND}
N 600 -100 640 -100 {lab=#net2}
N 700 -100 720 -100 {lab=#net1}
N 1090 -260 1090 -110 {lab=vout}
N 960 -110 1090 -110 {lab=vout}
C {res.sym} 190 -50 3 1 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} 300 -50 3 1 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} 410 -50 3 1 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} 600 -70 0 0 {name=E1 value=10e5}
C {vsource.sym} 120 20 0 0 {name=Vi value="0 AC sin(0 125u 200k)" savecurrent=false}
C {gnd.sym} 120 90 0 0 {name=l1 lab=GND}
C {gnd.sym} 600 90 0 0 {name=l2 lab=GND}
C {res.sym} 250 -220 2 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} 330 -220 2 0 {name=C2
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {res.sym} 250 -320 0 1 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 110 -250 0 0 {name=Vcc value="DC 2.5 AC 1" savecurrent=false}
C {gnd.sym} 200 -150 0 0 {name=l3 lab=GND}
C {res.sym} 590 -220 1 0 {name=R5
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} 590 -300 1 0 {name=C3
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 720 0 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 720 90 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 120 -50 0 0 {name=p1 sig_type=std_logic lab=vin}
C {simulator_commands_shown.sym} -520 -430 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.param temp = 27
.param freq = 20k

.control
tran 1u 10m

set color0 = white

plot v(vin)
plot v(vout)
plot v(vin) v(vout)


.endc

.control
save all
op
ac dec 100 1 100meg

set color0 = white


let voutdb = vdb(vout)
let voutabs = abs(vout)
let psgain = v(vout)/v(vbat)
let psgaindb = db(psgain)

*comment out when measuring at 1k
meas ac vout_1k find voutabs at=1k
meas ac voutdb_1k find voutdb at=1k

let voutm3db = voutdb_1k - 3.0
meas ac fp3db WHEN voutdb=voutm3db fall=1
meas ac fz3db WHEN voutdb=voutm3db fall=1


meas ac psrr_db find psgaindb at=200k

write
plot v(vin)
plot voutdb
plot voutabs

.endc

.end
"}
C {lab_wire.sym} 260 -50 0 0 {name=p3 sig_type=std_logic lab=vin1}
C {lab_wire.sym} 370 -50 0 0 {name=p2 sig_type=std_logic lab=vin2}
C {lab_wire.sym} 490 -50 0 0 {name=p4 sig_type=std_logic lab=viom}
C {lab_wire.sym} 480 -90 0 0 {name=p5 sig_type=std_logic lab=vref}
C {lab_wire.sym} 1020 -110 2 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_wire.sym} 180 -370 0 0 {name=p7 sig_type=std_logic lab=Vbat}
C {vcvs.sym} 960 -80 0 0 {name=E2 value=1}
C {gnd.sym} 920 70 0 0 {name=l5 lab=GND}
C {capa.sym} 1090 -80 0 0 {name=C6
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 1090 70 0 0 {name=l6 lab=GND}
C {res.sym} 670 -100 3 1 {name=R6
value=1k
footprint=1206
device=resistor
m=1}
