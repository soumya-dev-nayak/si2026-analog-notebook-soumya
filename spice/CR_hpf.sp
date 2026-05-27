.temp 27

R1      t1      gnd     1k
C1      in      out     50p
Vcm1    out     t1      dc      0

*for the normal pulsed input 
Vin     in      gnd     dc      PULSE(0 5 0 10p 10p 10n 20n)



.tran 1p 600n

.control
run

plot v(in) v(out) xlabel 'Time (ns)' ylabel 'Magnitude (volts)'

*Max & Min voltage measurement
meas tran Vmax MAX v(out)
meas tran Vmin MIN v(out)

*Time constant calculation
let vtau = (1-0.632) * Vmax
meas tran tau_eff WHEN v(out) = vtau FALL=1


*now v10 and v90
let v10 = Vmin + 0.1*(Vmax-Vmin)
let v90 = Vmin + 0.9*(Vmax-Vmin)


*Rise time calculation
meas tran t10r WHEN v(out) = v10 RISE=2
meas tran t90r WHEN v(out) = v90 RISE=2

let trise = t90r - t10r

*Fall Time calculation
meas tran t90f WHEN v(out) = v90 FALL=2
meas tran t10f WHEN v(out) = v10 FALL=2

let tfall = t10f - t90f


*Measuring the Average voltage at steady state
meas tran Vavg AVG v(out)
*let Vavg = avg(v(out))




*Parameter printing
print trise
print tfall
print tau_eff
print Vavg

.endc
.end



