v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -20 -40 40 -40 {lab=out}
N 40 -40 40 -0 {lab=out}
N -120 -40 -80 -40 {lab=in}
N 40 60 40 110 {lab=ref}
N 40 -40 90 -40 {lab=out}
C {res.sym} -50 -40 1 1 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {ipin.sym} -120 -40 0 0 {name=p1 lab=in}
C {iopin.sym} 40 110 1 0 {name=p2 lab=ref}
C {opin.sym} 90 -40 0 0 {name=p3 lab=out}
C {gnd.sym} -450 -370 0 0 {name=l2 lab=GND}
C {capa.sym} 40 30 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
