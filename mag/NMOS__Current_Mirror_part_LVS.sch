v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -40 -0 40 -0 {lab=CS}
N -80 -120 -80 -30 {lab=CS}
N 80 -120 80 -30 {lab=toM6}
N -80 -60 -20 -60 {lab=CS}
N -20 -60 -20 -0 {lab=CS}
N -80 30 -80 120 {lab=GND}
N 80 30 80 120 {lab=GND}
N -140 0 -80 0 {lab=GND}
N -140 0 -140 60 {lab=GND}
N -140 60 -80 60 {lab=GND}
N 80 -0 140 -0 {lab=GND}
N 140 -0 140 50 {lab=GND}
N 80 60 140 60 {lab=GND}
N 140 50 140 60 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -60 0 0 1 {name=M1
W=5
L=2
nf=1 
mult=4
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 60 0 0 0 {name=M2
W=5
L=2
nf=1 
mult=4
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {iopin.sym} -80 -120 0 0 {name=p1 lab=CS}
C {iopin.sym} 80 -120 0 0 {name=p2 lab=toM6}
C {iopin.sym} -80 120 0 0 {name=p3 lab=GND}
C {iopin.sym} 80 120 0 0 {name=p4 lab=GND}
