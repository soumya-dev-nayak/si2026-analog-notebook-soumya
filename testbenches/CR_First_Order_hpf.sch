v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 -10 80 -10 {lab=out}
N -130 -10 -80 -10 {lab=in}
N 20 -10 20 10 {lab=out}
N -20 -10 20 -10 {lab=out}
N 20 70 20 120 {lab=gref}
C {res.sym} 20 40 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {capa.sym} -50 -10 3 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {ipin.sym} -130 -10 0 0 {name=p1 lab=in}
C {iopin.sym} 20 120 1 0 {name=p2 lab=gref}
C {opin.sym} 80 -10 0 0 {name=p3 lab=out
}
