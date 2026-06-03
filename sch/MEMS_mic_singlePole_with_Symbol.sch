v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -260 10 -210 10 {lab=vin1}
N -150 10 -100 10 {lab=vin2}
N -360 10 -360 50 {lab=vin}
N -360 10 -320 10 {lab=vin}
N -360 110 -360 150 {lab=GND}
N -150 -210 -150 -190 {lab=vref}
N -230 -210 -150 -210 {lab=vref}
N -230 -210 -230 -190 {lab=vref}
N -230 -230 -230 -210 {lab=vref}
N -150 -210 -100 -210 {lab=vref}
N -100 -210 -100 -30 {lab=vref}
N -100 -30 80 -30 {lab=vref}
N -370 -310 -370 -220 {lab=Vbat}
N -370 -310 -230 -310 {lab=Vbat}
N -230 -310 -230 -290 {lab=Vbat}
N -230 -110 -150 -110 {lab=GND}
N -370 -160 -370 -110 {lab=GND}
N -280 -110 -280 -90 {lab=GND}
N -370 -110 -280 -110 {lab=GND}
N -230 -130 -230 -110 {lab=GND}
N -280 -110 -230 -110 {lab=GND}
N -150 -130 -150 -110 {lab=GND}
N 120 20 120 150 {lab=GND}
N 60 -240 80 -240 {lab=viom}
N 60 -200 60 -160 {lab=viom}
N 60 -160 80 -160 {lab=viom}
N 160 -200 160 -160 {lab=vout}
N 140 -160 160 -160 {lab=vout}
N 140 -240 160 -240 {lab=vout}
N 10 -200 60 -200 {lab=viom}
N 60 -240 60 -200 {lab=viom}
N 160 -200 690 -200 {lab=vout}
N 160 -240 160 -200 {lab=vout}
N 240 -40 240 30 {lab=#net1}
N 240 90 240 150 {lab=GND}
N 10 10 80 10 {lab=viom}
N 10 -200 10 10 {lab=viom}
N -40 10 10 10 {lab=viom}
N 240 -40 440 -40 {lab=#net1}
N 120 -40 160 -40 {lab=#net2}
N 220 -40 240 -40 {lab=#net1}
N 560 -30 690 -30 {lab=vout}
N 690 -200 690 -30 {lab=vout}
N 690 60 690 130 {lab=GND}
N 690 -30 690 0 {lab=vout}
N 480 50 480 150 {lab=GND}
N 400 -20 440 -20 {lab=GND}
N 400 -20 400 50 {lab=GND}
N 400 50 480 50 {lab=GND}
N 480 20 480 50 {lab=GND}
C {res.sym} -290 10 3 1 {name=R1
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} -180 10 3 1 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -70 10 3 1 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} 120 -10 0 0 {name=E1 value=10e5}
C {vsource.sym} -360 80 0 0 {name=Vi value="0 AC sin(0 125u 200k)" savecurrent=false}
C {gnd.sym} -360 150 0 0 {name=l1 lab=GND}
C {gnd.sym} 120 150 0 0 {name=l2 lab=GND}
C {res.sym} -230 -160 2 0 {name=R3
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} -150 -160 2 0 {name=C2
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -230 -260 0 1 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -370 -190 0 0 {name=Vcc value="DC 2.5 AC 1" savecurrent=false}
C {gnd.sym} -280 -90 0 0 {name=l3 lab=GND}
C {res.sym} 110 -160 1 0 {name=R5
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} 110 -240 1 0 {name=C3
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 240 60 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 240 150 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -360 10 0 0 {name=p1 sig_type=std_logic lab=vin}
C {simulator_commands_shown.sym} -1010 -620 0 0 {name=COMMANDS
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
C {lab_wire.sym} -220 10 0 0 {name=p3 sig_type=std_logic lab=vin1}
C {lab_wire.sym} -110 10 0 0 {name=p2 sig_type=std_logic lab=vin2}
C {lab_wire.sym} 10 10 0 0 {name=p4 sig_type=std_logic lab=viom}
C {lab_wire.sym} 0 -30 0 0 {name=p5 sig_type=std_logic lab=vref}
C {lab_wire.sym} 610 -30 2 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_wire.sym} -300 -310 0 0 {name=p7 sig_type=std_logic lab=Vbat}
C {capa.sym} 690 30 0 0 {name=C6
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 690 130 0 0 {name=l6 lab=GND}
C {res.sym} 190 -40 3 1 {name=R6
value=1k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 480 150 0 0 {name=l5 lab=GND}
C {unityGain_vcvs_Opamp.sym} 480 -30 0 0 {name=x1}
