︠da0b28b1-902b-40ba-98da-86e44a82bebai︠
%md
# 1.3 Direction Fields
For more information: http://doc.sagemath.org/html/en/reference/plotting/sage/plot/plot_field.html
︡0f7f19c5-9989-45b5-8d82-c35d2dd7478d︡{"done":true,"md":"# 1.3 Direction Fields\nFor more information: http://doc.sagemath.org/html/en/reference/plotting/sage/plot/plot_field.html"}
︠6b9c1021-d5a3-4b9f-841f-04d6e4a39476s︠
x,y = var('x,y')
f(x,y) = 2*x+y
M=5
plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)

︡ac4ef863-31db-4895-beb2-f94e8784c784︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/18239/tmp_5hex1o.svg","show":true,"text":null,"uuid":"ae5110e5-bc80-4dae-82d8-8b89ccf9624c"},"once":false}︡{"done":true}︡
︠5abf9da3-9352-4d72-b836-7e8ced4a2e2ds︠
f(x,y) = 2*x+y
M=5
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
fig += point((0,2),size=30)
fig += plot(4*e^x-2*x-2,(x,-M,M))
show(fig, xmin=-M,xmax=M,ymin=-M,ymax=M)

︡289c5968-6c56-4175-9fab-7a01c0426a02︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/18239/tmp_XvHY9c.svg","show":true,"text":null,"uuid":"d2a87dcd-f922-4b2b-bbcc-87575c40c445"},"once":false}︡{"done":true}︡
︠88b19f11-fe8a-4bbc-992f-e6102799cb55s︠
%typeset_mode True
y = function('y', x)
de = diff(y,x) == 2*x+y
desolve(de,[y,x]).expand()
desolve(de,[y,x], [0,2]).expand()
︡481995ff-731e-46ca-9b2e-6880ae4ec362︡{"html":"<div align='center'>$\\displaystyle C e^{x} - 2 \\, x - 2$</div>"}︡{"html":"<div align='center'>$\\displaystyle -2 \\, x + 4 \\, e^{x} - 2$</div>"}︡{"done":true}︡
︠faaba153-33c4-455a-b964-26fc6a151af2s︠
f(x,y) = 2*x+y
M=5
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
fig += point((1,3),size=30)
fig += plot(7*e^(x-1)-2*x-2,(x,-M,M))
show(fig, xmin=-M,xmax=M,ymin=-M,ymax=M)

︡3ad8a76a-5260-4664-8038-205d6fa5386d︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/19542/tmp_e7XwGA.svg","show":true,"text":null,"uuid":"c93fd4e0-def9-4d59-bfb9-aa373a302a0c"},"once":false}︡{"done":true}︡
︠146ab69e-d1a1-4a3e-8fdd-f2230a2edb13s︠

f(x,y) = 2*x+y
M=5
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
fig += point((0,2),size=30)
fig += plot(4*e^x-2*x-2,(x,-M,M), color='green', thickness=2)
fig += point((1,3),size=30)
fig += plot(7*e^(x-1)-2*x-2,(x,-M,M), color='blue', thickness=2)
show(fig, xmin=-M,xmax=M,ymin=-M,ymax=M)
︡28b25902-8839-4e81-b7d4-ed63779e8517︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/19542/tmp_ufQT44.svg","show":true,"text":null,"uuid":"e0484d63-a816-47d5-90a4-e6394897da55"},"once":false}︡{"done":true}︡
︠d5afd458-ef1f-4d93-8bf1-2bf32b9c1d4ei︠
%md
## Isoclines
︡f8f8ad55-425f-4acf-b077-6ea2cd3f4803︡{"done":true,"md":"## Isoclines"}
︠3776ec9f-0c99-4cfc-b6fe-ff805cf9c841s︠
f(x,y) = 2*x+y
M=4
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
fig += plot(-2*x,(x,-M,M), color='red', thickness=3)
fig += plot(2-2*x,(x,-M,M), color='blue', thickness=3)
fig += plot(-2-2*x,(x,-M,M), color='green', thickness=3)
show(fig, xmin=-M,xmax=M,ymin=-M,ymax=M)
︡323aa11f-2529-4c4b-9467-3abd22e392b9︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/19542/tmp_AFnItQ.svg","show":true,"text":null,"uuid":"f4e0fce0-7c5c-429d-b78b-2617ce7c31ca"},"once":false}︡{"done":true}︡
︠ad505682-76c2-4040-a6be-e5167672b233s︠
f(x,y) = 2*x+y
M=5
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
fig += point((0,2),size=30)
fig += plot(4*e^x-2*x-2,(x,-M,M), color='green', thickness=1)
fig += point((1,3),size=30)
fig += plot(7*e^(x-1)-2*x-2,(x,-M,M), color='blue', thickness=1)
fig += point((-2,-2),size=30)
fig += plot(-4*e^(x+2)-2*x-2,(x,-M,M), color='black', thickness=1)
fig += plot(-2-2*x,(x,-M,M), color='red', thickness=2)
show(fig, xmin=-M,xmax=M,ymin=-M,ymax=M)
︡0d1f76cf-9b76-4ba8-a209-f18e0c1c8122︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/19542/tmp_ONdAAd.svg","show":true,"text":null,"uuid":"8edb1798-2266-4bd9-a5dd-a2eb9f443b25"},"once":false}︡{"done":true}︡
︠4c50eab4-2737-4e09-bdb2-997e07b93aa5︠









