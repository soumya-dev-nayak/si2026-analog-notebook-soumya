Title: Id-vs-Vgs for and NMOS in Saturation region
* From sqrt(1*Id) vs Vgs, Vt, Kp and gamma can be extracted

* Level-49 BSIM 3v1 Model Lobrary for 0.5um SCMOS Technology
.LIB scn4m_cnrs_bsim3v1.lib nom

* Level-1 Model 
.MODEL sitn NMOS (LEVEL=1 PHI=0.846 VT0=0.514 KP=122U GAMMA=0.55 LAMBDA=0.0)

* Set the device temperature
.TEMP 27

* Netlist:
* Two diode connected (Drain/Gate shorted nmos 
* one with Level-1 model (M2) and another
* with Level-49 BSIM 3v1 model (M1) 
M1	D1	D1	0	B 	scmosn  W=5u L=1u
M2	D2	D2	0	B 	sitn    W=5u L=1u
Vds	D	0	DC	5
Vid1	D	D1	DC	0
Vid2	D	D2	DC	0
Vsb	0	B	DC	0

* DC Sweep Analyses
*.DC 	Vsrc	start	stop	step	Vsrc2	start stop step
.DC	Vds	0	1.8	0.001  Vsb  0 1 0.5


* ngspice Script with control statements.

.CONTROL
RUN

set color0 = white

* Plot sqrt(2Id) vs VGS
PLOT (2*Vid2#branch)^0.5 (2*Vid1#branch)^0.5 vs V(D)

************************************************
* LEVEL-1 PARAMETER EXTRACTION (M2)
************************************************

* sqrt(2Id)
LET rt_id = (2*Vid2#branch)^0.5

* derivative of sqrt(2Id)
LET d_rt_id = deriv(rt_id)

* Slope at VGS = 1V
MEAS DC d_at_2v FIND d_rt_id AT=1.0

* KP extraction
* sqrt(2Id) = sqrt(KP*W/L)*(VGS-VT)
* slope = sqrt(KP*W/L)

LET kp_extracted = d_at_2v^2/(5u/1u)
PRINT kp_extracted

* Threshold Voltage extraction
MEAS DC rt_id_at_2v FIND rt_id AT=1.0

LET vt_extracted = 1.0 - rt_id_at_2v/d_at_2v
PRINT vt_extracted

************************************************
* BODY EFFECT EXTRACTION (GAMMA)
************************************************

* For each VSB step, determine VT
* VSB = 0V
MEAS DC rt0 FIND rt_id AT=1.0 WHEN Vsb=0
MEAS DC slope0 FIND d_rt_id AT=1.0 WHEN Vsb=0
LET vt0 = 1.0 - rt0/slope0

* VSB = 1V
MEAS DC rt1 FIND rt_id AT=1.0 WHEN Vsb=1
MEAS DC slope1 FIND d_rt_id AT=1.0 WHEN Vsb=1
LET vt1 = 1.0 - rt1/slope1

PRINT vt0
PRINT vt1

* Gamma extraction
LET phi = 0.874

LET gamma_extracted = (vt1-vt0) / ( sqrt(phi+1)-sqrt(phi) )

PRINT gamma_extracted

.ENDC
