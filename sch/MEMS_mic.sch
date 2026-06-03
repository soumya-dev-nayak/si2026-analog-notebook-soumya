v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -910 420 -860 420 {lab=vin1}
N -800 420 -750 420 {lab=vin2}
N -1010 420 -1010 460 {lab=vin}
N -1010 420 -970 420 {lab=vin}
N -1010 520 -1010 560 {lab=GND}
N -800 200 -800 220 {lab=vref}
N -880 200 -800 200 {lab=vref}
N -880 200 -880 220 {lab=vref}
N -880 180 -880 200 {lab=vref}
N -800 200 -750 200 {lab=vref}
N -750 200 -750 380 {lab=vref}
N -750 380 -570 380 {lab=vref}
N -1020 100 -1020 190 {lab=Vbat}
N -1020 100 -880 100 {lab=Vbat}
N -880 100 -880 120 {lab=Vbat}
N -880 300 -800 300 {lab=GND}
N -1020 250 -1020 300 {lab=GND}
N -930 300 -930 320 {lab=GND}
N -1020 300 -930 300 {lab=GND}
N -880 280 -880 300 {lab=GND}
N -930 300 -880 300 {lab=GND}
N -800 280 -800 300 {lab=GND}
N -530 430 -530 560 {lab=GND}
N -590 170 -570 170 {lab=viom}
N -590 210 -590 250 {lab=viom}
N -590 250 -570 250 {lab=viom}
N -490 210 -490 250 {lab=vout}
N -510 250 -490 250 {lab=vout}
N -510 170 -490 170 {lab=vout}
N -640 210 -590 210 {lab=viom}
N -590 170 -590 210 {lab=viom}
N -490 210 -410 210 {lab=vout}
N -490 170 -490 210 {lab=vout}
N -410 210 -410 370 {lab=vout}
N -530 370 -410 370 {lab=vout}
N -410 370 -410 440 {lab=vout}
N -410 500 -410 560 {lab=GND}
N -640 420 -570 420 {lab=viom}
N -640 210 -640 420 {lab=viom}
N -690 420 -640 420 {lab=viom}
C {res.sym} -940 420 3 1 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} -830 420 3 1 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -720 420 3 1 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} -530 400 0 0 {name=E1 value=10e5}
C {vsource.sym} -1010 490 0 0 {name=Vi value="0 AC sin(0 125u 200k)" savecurrent=false}
C {gnd.sym} -1010 560 0 0 {name=l1 lab=GND}
C {gnd.sym} -530 560 0 0 {name=l2 lab=GND}
C {res.sym} -880 250 2 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} -800 250 2 0 {name=C2
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -880 150 0 1 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -1020 220 0 0 {name=Vcc value="DC 2.5 AC 1" savecurrent=false}
C {gnd.sym} -930 320 0 0 {name=l3 lab=GND}
C {res.sym} -540 250 1 0 {name=R5
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} -540 170 1 0 {name=C3
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -410 470 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -410 560 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -1010 420 0 0 {name=p1 sig_type=std_logic lab=vin}
C {simulator_commands_shown.sym} -1650 40 0 0 {name=COMMANDS
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
C {lab_wire.sym} -870 420 0 0 {name=p3 sig_type=std_logic lab=vin1}
C {lab_wire.sym} -760 420 0 0 {name=p2 sig_type=std_logic lab=vin2}
C {lab_wire.sym} -640 420 0 0 {name=p4 sig_type=std_logic lab=viom}
C {lab_wire.sym} -650 380 0 0 {name=p5 sig_type=std_logic lab=vref}
C {lab_wire.sym} -410 370 2 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_wire.sym} -950 100 0 0 {name=p7 sig_type=std_logic lab=Vbat}
