v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -750 370 -700 370 {lab=vin1}
N -640 370 -590 370 {lab=vin2}
N -850 370 -850 410 {lab=vin}
N -850 370 -810 370 {lab=vin}
N -850 470 -850 510 {lab=GND}
N -640 150 -640 170 {lab=vref}
N -720 150 -640 150 {lab=vref}
N -720 150 -720 170 {lab=vref}
N -720 130 -720 150 {lab=vref}
N -640 150 -590 150 {lab=vref}
N -590 150 -590 330 {lab=vref}
N -590 330 -410 330 {lab=vref}
N -860 50 -860 140 {lab=Vbat}
N -860 50 -720 50 {lab=Vbat}
N -720 50 -720 70 {lab=Vbat}
N -720 250 -640 250 {lab=GND}
N -860 200 -860 250 {lab=GND}
N -770 250 -770 270 {lab=GND}
N -860 250 -770 250 {lab=GND}
N -720 230 -720 250 {lab=GND}
N -770 250 -720 250 {lab=GND}
N -640 230 -640 250 {lab=GND}
N -370 380 -370 510 {lab=GND}
N -430 120 -410 120 {lab=viom}
N -430 160 -430 200 {lab=viom}
N -430 200 -410 200 {lab=viom}
N -330 160 -330 200 {lab=vout}
N -350 200 -330 200 {lab=vout}
N -350 120 -330 120 {lab=vout}
N -480 160 -430 160 {lab=viom}
N -430 120 -430 160 {lab=viom}
N -330 160 -250 160 {lab=vout}
N -330 120 -330 160 {lab=vout}
N -250 160 -250 320 {lab=vout}
N -370 320 -250 320 {lab=vout}
N -250 320 -250 390 {lab=vout}
N -250 450 -250 510 {lab=GND}
N -480 370 -410 370 {lab=viom}
N -480 160 -480 370 {lab=viom}
N -530 370 -480 370 {lab=viom}
C {res.sym} -780 370 3 1 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} -670 370 3 1 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -560 370 3 1 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} -370 350 0 0 {name=E1 value=10e5}
C {vsource.sym} -850 440 0 0 {name=Vi value=" 0 AC 1" savecurrent=false}
C {gnd.sym} -850 510 0 0 {name=l1 lab=GND}
C {gnd.sym} -370 510 0 0 {name=l2 lab=GND}
C {res.sym} -720 200 2 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} -640 200 2 0 {name=C2
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -720 100 0 1 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -860 170 0 0 {name=Vcc value=2.5 savecurrent=false}
C {gnd.sym} -770 270 0 0 {name=l3 lab=GND}
C {res.sym} -380 200 1 0 {name=R5
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} -380 120 1 0 {name=C3
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -250 420 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -250 510 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -850 370 0 0 {name=p1 sig_type=std_logic lab=vin}
C {simulator_commands_shown.sym} -890 -770 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.param temp = 27
*.tran 1p 50n

.control
save all
op
ac dec 100 1 100meg

set color0 = white
setcolor1 = black

let voutdb = vdb(vout)
let voutabs = abs(vout)

meas ac vout_1k find voutabs at=1k
meas ac voutdb_1k find voutdb at=1k

let voutm3db = voutdb_1k - 3.0
meas ac fp3db WHEN voutdb=voutm3db fall=last
meas ac fz3db WHEN voutdb=voutm3db rise=1

write
plot v(vin)
plot v(vout)
plot v(voutdb)
plot v(voutabs)
.endc
"}
C {lab_wire.sym} -710 370 0 0 {name=p3 sig_type=std_logic lab=vin1}
C {lab_wire.sym} -600 370 0 0 {name=p2 sig_type=std_logic lab=vin2}
C {lab_wire.sym} -480 370 0 0 {name=p4 sig_type=std_logic lab=viom}
C {lab_wire.sym} -490 330 0 0 {name=p5 sig_type=std_logic lab=vref}
C {lab_wire.sym} -250 320 2 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_wire.sym} -790 50 0 0 {name=p7 sig_type=std_logic lab=Vbat}
