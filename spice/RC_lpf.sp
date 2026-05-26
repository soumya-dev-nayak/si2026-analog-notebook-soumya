.title RC Low Pass Filter

* Components
R1 vin vout 1k
C1 vout 0 1u

* Input pulse signal
Vin vin 0 PULSE(0 5 0 1u 1u 5m 10m)

* Transient analysis
.tran 10u 30m

.control
run
plot v(vin) v(vout)
.endc

.end
