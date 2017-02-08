︠da0b28b1-902b-40ba-98da-86e44a82bebai︠
%md
# 1.4 The Approximation Method of Euler

︡0f7f19c5-9989-45b5-8d82-c35d2dd7478d︡{"done":true,"md":"# 1.4 The Approximation Method of Euler"}
︠6b9c1021-d5a3-4b9f-841f-04d6e4a39476︠
x,y = var('x,y')
M = 2
f(x,y) = x/y
v = plot_slope_field(f(x,y), (x,0,2), (y,-2,2), headaxislength=3, headlength=3)
v.show()

︡b8b9dd6d-2bb3-4fbc-a991-462c82167180︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/21591/tmp_rB8GO_.svg","show":true,"text":null,"uuid":"a9216e1e-928b-42a6-8ff0-347ac8e8e327"},"once":false}︡{"done":true}︡︡︡︡︡
︠ada6e429-c95d-4b2b-86f3-39b58472b8f0︠
x0 = xold = 0
y0 = yold = 1
h = 0.1
N = 10
pts = [[xold, yold]]
for k in range(1,N+1):
    xnew = xold + h
    ynew = yold + h*f(xold, yold)
    print(xnew, ynew) # Printing is optional
    pts.append([xnew, ynew])
    xold = xnew
    yold = ynew
P1 = list_plot(pts, size=25)
P2 = line(pts, thickness=1)
show(P1+P2+v)

︡fe7daa49-31f3-40f9-b0a5-8d3cad95325e︡{"stdout":"(0.100000000000000, 1.00000000000000)\n(0.200000000000000, 1.01000000000000)\n(0.300000000000000, 1.02980198019802)\n(0.400000000000000, 1.05893379444665)\n(0.500000000000000, 1.09670763848654)\n(0.600000000000000, 1.14229864035920)\n(0.700000000000000, 1.19482430911176)\n(0.800000000000000, 1.25341032838353)\n(0.900000000000000, 1.31723619465285)\n(1.00000000000000, 1.38556107090917)\n"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/21591/tmp_ttiM9G.svg","show":true,"text":null,"uuid":"b9d7b9f0-5c6f-4730-ad89-e7f2121b4d25"},"once":false}︡{"done":true}︡
︠5abf9da3-9352-4d72-b836-7e8ced4a2e2d︠
%typeset_mode True
y = function('y', x)
de = diff(y,x) == x/y
desolve(de,[y,x]).expand()
soln = desolve(de,[y,x], [0,1])
soln.show()
solve(soln, y)
allsolns = solve(soln, y)
s1 = allsolns[0].rhs()
s2 = allsolns[1].rhs()
︡0edc6458-5b8d-485e-8cf6-9ce75dc569df︡{"html":"<div align='center'>$\\displaystyle \\frac{1}{2} \\, y\\left(x\\right)^{2} = \\frac{1}{2} \\, x^{2} + C$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{1}{2} \\, y\\left(x\\right)^{2} = \\frac{1}{2} \\, x^{2} + \\frac{1}{2}$</div>"}︡{"html":"<div align='center'>[$\\displaystyle y\\left(x\\right) = -\\sqrt{x^{2} + 1}$, $\\displaystyle y\\left(x\\right) = \\sqrt{x^{2} + 1}$]</div>"}︡{"done":true}︡
︠3ed3668b-4ca9-4444-9818-48675a296788︠
show(v+plot([s1,s2])+P1+P2)
︡f8f9febb-7393-47ae-a63c-baff2b210eb8︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/21591/tmp_x3Cz49.svg","show":true,"text":null,"uuid":"983c424c-dbec-48f4-9519-7cb7456b662a"},"once":false}︡{"done":true}︡
︠2d677170-a368-4457-a037-2403b6641195︠
show(v+plot(s2)+P1+P2, xmin=0, xmax=1.5, ymin=.5, ymax=1.5)
︡cc9da77b-e432-4d88-b1b2-b22242cc5313︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/21591/tmp_oQewjX.svg","show":true,"text":null,"uuid":"f0d672b7-98a7-4afc-92c9-c15ecc4ab302"},"once":false}︡{"done":true}︡
︠247dfcfc-8c8a-497b-98e5-35c0f651a2ab︠
%md
Use Euler's method to approximate the solution of the IVP
\[y'=1-\sin(y),\quad y(0)=0\] at $x=\pi$, taking $1, 2, 4$ and $8$ steps.
︡48cf49e4-dac7-4ba9-b2ca-cb6ac8a4f507︡{"done":true,"md":"Use Euler's method to approximate the solution of the IVP\n\\[y'=1-\\sin(y),\\quad y(0)=0\\] at $x=\\pi$, taking $1, 2, 4$ and $8$ steps."}
︠819b0de5-29bc-474a-84a4-b5c5c996569as︠
# Direction Field
x,y = var('x,y')
M=2*pi
f(x,y) = 1-sin(y) # autonomous DE because f(x,y) doesn't depend on x
v = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
g1 = point((0,0), size=25)
g2 = implicit_plot(x==pi,(x,-M,M),(y,-M,M))
show(v+g1+g2)
︡ce5c7653-6f25-4247-928b-829cdb2a5748︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/9282/tmp_PxfH9G.svg","show":true,"text":null,"uuid":"74c120dd-b35b-49a4-909e-f767c6c6690d"},"once":false}︡{"done":true}︡
︠82021ac2-87ec-46ee-9345-2512ec529335s︠
%typeset_mode True
y = function('y', x)
de = diff(y,x) == f(x,y(x))
print("General Solution:")

desolve(de,[y,x]).expand()
soln = desolve(de,[y,x], [0,0])
print("Solution with y(0)=0")
soln.show()
print("Try to solve for y:")
solve(soln, y);

︡afe612ee-c3f4-43e1-9d13-f0e18df3f16a︡{"stdout":"General Solution:\n"}︡{"html":"<div align='center'>$\\displaystyle \\frac{2 \\, \\cos\\left(y\\left(x\\right)\\right)}{\\cos\\left(y\\left(x\\right)\\right) - \\sin\\left(y\\left(x\\right)\\right) + 1} + \\frac{2}{\\cos\\left(y\\left(x\\right)\\right) - \\sin\\left(y\\left(x\\right)\\right) + 1} = C + x$</div>"}︡{"stdout":"Solution with y(0)=0\n"}︡{"html":"<div align='center'>$\\displaystyle \\frac{2 \\, {\\left(\\cos\\left(y\\left(x\\right)\\right) + 1\\right)}}{\\cos\\left(y\\left(x\\right)\\right) - \\sin\\left(y\\left(x\\right)\\right) + 1} = x + 2$</div>"}︡{"stdout":"Try to solve for y:\n"}︡{"html":"<div align='center'>[$\\displaystyle \\sin\\left(y\\left(x\\right)\\right) = \\frac{x \\cos\\left(y\\left(x\\right)\\right) + x}{x + 2}$]</div>"}︡{"done":true}︡
︠390ac6c0-773c-4096-ba41-0ff19e1d0026s︠
# Approximation by Euler's method
# Use the method to approximate the solution at x=pi

x0 = xold = 0
y0 = yold = 0
xfinal = pi

N = 2 # steps  TRY USING N = 1, 2, 4, 8
h = (xfinal-x0)/N # increment

pts = [[xold, yold]]
for k in range(1,N+1):
    xnew = xold + h
    ynew = yold + h*f(xold, yold)
    pts.append([xnew, ynew])
    xold = xnew
    yold = ynew
P1 = list_plot(pts, size=25)
P2 = line(pts, thickness=1)

# Actual solution (from above)
y=var('y')          
soln = sin(y)==(x*cos(y)+x)/(x+2)
g = implicit_plot(soln, (x,-M,M), (y,-M,M), color='red')
vl = implicit_plot(x==pi, (x,-M,M), (y,-M,M), color='yellow')

show(v+P1+P2+g+vl, xmin=-M, xmax=M, ymin=-M, ymax=M)

pretty_print("The last point $(x,y)$ was ",pts[-1], "so $y(\pi)$ is approximately ", pts[-1][1].n())

︡1ae12a27-6b64-46b5-b460-41cfb969fb6a︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/9282/tmp_u8KY4_.svg","show":true,"text":null,"uuid":"23ac777f-d03f-447c-8e74-0456dd9245c6"},"once":false}︡{"html":"<div align='center'>The last point $(x,y)$ was  [$\\displaystyle \\pi$, $\\displaystyle \\frac{1}{2} \\, \\pi$] so $y(\\pi)$ is approximately  $\\displaystyle 1.57079632679490$</div>"}︡{"done":true}︡
︠85d5528f-0510-4361-93a3-06a701deac35︠









