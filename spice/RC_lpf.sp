.title RC Low Pass Filter

* Components
R1 vin vout 1k
C1 vout 0 1u

* Input pulse signal
Vin vin 0 PULSE(0 5 0 1u 1u 5m 10m)


*The Measurement block

* Maximum output voltage
.meas tran vmax MAX v(vout)

* Minimum output voltage
.meas tran vmin MIN v(vout)

* Average output voltage
.meas tran vavg AVG v(vout)

* Rise time
.meas tran trise TRIG v(vout) VAL=0.5 RISE=1
+ TARG v(vout) VAL=4.5 RISE=1

* Fall time
.meas tran tfall TRIG v(vout) VAL=4.5 FALL=1
+ TARG v(vout) VAL=0.5 FALL=1


* Transient analysis
.tran 10u 30m

.control
run

echo "TRANSIENT ANALYSIS"
print vmax
print vmin
print vavg
print trise
print tfall


plot v(vin) v(vout)
.endc

.end
