︠da0b28b1-902b-40ba-98da-86e44a82bebai︠
%md
# 2.2 Separable Equations
For more information: http://doc.sagemath.org/html/en/reference/plotting/sage/plot/plot_field.html
︡0f7f19c5-9989-45b5-8d82-c35d2dd7478d︡{"done":true,"md":"# 2.2 Separable Equations\nFor more information: http://doc.sagemath.org/html/en/reference/plotting/sage/plot/plot_field.html"}
︠6b9c1021-d5a3-4b9f-841f-04d6e4a39476s︠
x,t = var('x,t')
f(x,t) = 3*x*t^2
M=5
P1 = plot_slope_field(f(x,t), (t,-M,M), (x,-M,M), headaxislength=3, headlength=3)
P1.show()
︡4d738827-ed23-4a98-8ffd-55e7a3a8380d︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/29685/tmp_6mttJ4.svg","show":true,"text":null,"uuid":"03cd4e38-3965-437a-9fde-e0137f561847"},"once":false}︡{"done":true}︡
︠0841bf33-455e-4528-b819-5358c037145c︠
︡8ceea682-af55-4c73-b095-52b5eba571df︡
︠f4adc1a1-34c2-4a06-be33-847c2c7fcb02s︠
P1 = plot_slope_field(f(x,t), (t,-M,M), (x,-M,M), headaxislength=3, headlength=3)
for C in [-2, -1, 0, 1, 2]:
    P1 += plot(C*e^(t^3), (t, -M, M))
P1.show(ymin=-M, ymax=M)    
︡71c48d3c-bfc5-4078-91a1-f5df24801240︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/29685/tmp_QiMKLc.svg","show":true,"text":null,"uuid":"5d14bf1c-c316-4dda-a607-40de91f140cf"},"once":false}︡{"done":true}︡
︠f303f8ce-11d3-4bd6-a3ac-9605fc0f0ee8s︠
P1 = plot_slope_field(f(x,t), (t,-M,M), (x,-M,M), headaxislength=3, headlength=3)
for C in xrange(-M, M, 1):
    P1 += plot(C*e^(t^3), (t, -M, M))
P1.show(ymin=-M, ymax=M)    
︡57229418-e39e-484a-9a85-1d5f423e0a54︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/29685/tmp_LpXU2m.svg","show":true,"text":null,"uuid":"3f7f0e31-d84f-46c6-b5ba-1704f05449bf"},"once":false}︡{"done":true}︡
︠5abf9da3-9352-4d72-b836-7e8ced4a2e2ds︠
f(x,y) = x^3*(1-y)
M=5
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
fig += point((0,3),size=30)
fig += plot(1+2*exp(-x^2/4),(x,-M,M))
show(fig, xmin=-M,xmax=M,ymin=-M,ymax=M)

︡4506a43a-a2d2-4d98-8e63-5ad21d955eb4︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/29685/tmp_YmK7Lq.svg","show":true,"text":null,"uuid":"acbbc4bd-5aaf-4a61-b653-a01222509751"},"once":false}︡{"done":true}︡
︠88b19f11-fe8a-4bbc-992f-e6102799cb55s︠
%typeset_mode True
y = function('y', x)
de = diff(y,x) == x^3*(1-y)
desolve(de,[y,x]).expand()
desolve(de,[y,x], [0,3]).expand()
︡32a73ac7-f0c5-4a63-af49-5074a94b519e︡{"html":"<div align='center'>$\\displaystyle C e^{\\left(-\\frac{1}{4} \\, x^{4}\\right)} + 1$</div>"}︡{"html":"<div align='center'>$\\displaystyle 2 \\, e^{\\left(-\\frac{1}{4} \\, x^{4}\\right)} + 1$</div>"}︡{"done":true}︡
︠faaba153-33c4-455a-b964-26fc6a151af2︠









