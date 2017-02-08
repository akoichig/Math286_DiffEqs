︠da0b28b1-902b-40ba-98da-86e44a82bebai︠
%md
# 2.4 Exact Equations
︡3f9c76c7-2a92-4b11-b000-edcf598ee4f1︡{"done":true,"md":"# 2.4 Exact Equations"} 
︠8e868dd8-0656-4913-a855-61545f0684a8︠
# If
︡bb847dff-2ac3-4a52-97e4-0be1a76c91d5︡
︠5baab2d8-cf77-4d9f-a64c-a4f56a16f2bdi︠
%md
## Example:
Solve $(2x+y)dx+(x-2y)dy=0$
︡c8b0ed83-836c-473a-ae4e-870d837b4500︡{"done":true,"md":"## Example:\nSolve $(2x+y)dx+(x-2y)dy=0$"}
︠6b9c1021-d5a3-4b9f-841f-04d6e4a39476s︠
# START HERE
x,y,C = var('x,y,C')
%typeset_mode True


︡c6e8d226-785d-4155-bdc5-1412e442d800︡{"done":true}︡︡
︠d659316a-94d0-4983-8055-37cb1cb91413s︠
# Write DE as Mdx+Ndy=0
M = 2*x+y
N = x-2*y

# Check if DE above is exact (Is M_y = N_x ?)
pretty_print("$Mdx+Ndy=0$ is exact if and only if $\dfrac{\partial M}{\partial y} = \dfrac{\partial N}{\partial x}$")
md("*Technically, this test/theorem is valid when the first partial derivatives of $M$ and $N$ are continuous in some rectangle.*")
pretty_print("$M_y=$",derivative(M, y))
pretty_print("$N_x=$",derivative(N, x))
︡1467c645-8f58-456a-8203-bb607a03916a︡{"html":"<div align='center'>$Mdx+Ndy=0$ is exact if and only if $\\dfrac{\\partial M}{\\partial y} = \\dfrac{\\partial N}{\\partial x}$</div>"}︡{"md":"*Technically, this test/theorem is valid when the first partial derivatives of $M$ and $N$ are continuous in some rectangle.*"}︡{"html":"<div align='center'>$M_y=$ $\\displaystyle 1$</div>"}︡{"html":"<div align='center'>$N_x=$ $\\displaystyle 1$</div>"}︡{"done":true}︡︡︡︡
︠30fe5d8b-d18f-4d7e-93bd-fbe3e326fc35s︠
# If the equation is exact, then there is a potential function F(x,y) and solutions are given by F(x,y)=C.
g = function('g')(y);
pretty_print("Integrate $M$ wrt $x$ to get $F=\\int Mdx+g(y)$")
F = integrate(M,x); F+g(y) # After integrative w.r.t. x, F should have an unknown function g(y).

pretty_print("Differentiate $F$ wrt $y$ and set equal to $N$")
N == diff(F, y)+derivative(g,y)

pretty_print("Solve for $g'$ and integrate wrt $y$.")
pretty_print("$g'(y)=$", N-diff(F,y))
g = integrate(N-diff(F,y),y)
pretty_print("$g(y)=$",g)

soln = F+g==C
pretty_print("The general solution is ",soln)


︡54b3697a-70ce-4865-b58b-b9103d0f1146︡{"html":"<div align='center'>Integrate $M$ wrt $x$ to get $F=\\int Mdx+g(y)$</div>"}︡{"html":"<div align='center'>$\\displaystyle x^{2} + x y + g\\left(y\\right)$</div>"}︡{"html":"<div align='center'>Differentiate $F$ wrt $y$ and set equal to $N$</div>"}︡{"html":"<div align='center'>$\\displaystyle x - 2 \\, y = x + \\frac{\\partial}{\\partial y}g\\left(y\\right)$</div>"}︡{"html":"<div align='center'>Solve for $g'$ and integrate wrt $y$.</div>"}︡{"html":"<div align='center'>$g'(y)=$ $\\displaystyle -2 \\, y$</div>"}︡{"html":"<div align='center'>$g(y)=$ $\\displaystyle -y^{2}$</div>"}︡{"html":"<div align='center'>The general solution is  $\\displaystyle x^{2} + x y - y^{2} = C$</div>"}︡{"done":true}︡︡︡︡
︠84bee1f0-4a3d-48cf-8291-36040fb1d793s︠
# Plot the solution. Note that this tends to result in implicit solutions in which it may be impossible to solve for y in terms of x.
# There is a technical difference between the an implicit equation and a DE solution which must be a function of x.

# 1st Order Linear: Mdx+Ndy=0 which is equivalent to y' = -M/N
M = 2*x+y
N = x-2*y
f(x,y) = -M/N
K=5
fig = plot_slope_field(f(x,y), (x,-K,K), (y,-K,K), headaxislength=3, headlength=3)

# Color various solutions
colors = ['blue', 'green', 'yellow', 'orange','red']
color_index = 0

for Cval in [-2,-1,0,1,2]:
    fig += implicit_plot(soln.subs(C==Cval), (x,-K,K), (y,-K,K), color=colors[color_index])
    color_index += 1 % len(colors)

soln
show(fig, xmin=-K,xmax=K,ymin=-K,ymax=K)
︡87372fd4-b183-4437-9aac-d1cd73ed5bc0︡{"html":"<div align='center'>$\\displaystyle x^{2} + x y - y^{2} = C$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/7988/tmp_muJnqf.svg","show":true,"text":null,"text":null,"text":null,"text":null,"text":null,"uuid":"2aab2880-9be1-453a-8940-d67ab20cc7cb"},"once":false}︡{"done":true}︡︡︡︡︡︡
︠511e369f-0a2e-45ba-9c06-6e0be674a023r︠

# The solutions F(x,y)=C are level curves of the following surface (Remember Calc III topics such as conservative vector fields and potential functions?  F is a potential.)
# The level curves above have been color-coded with colder (blue) corresponding to lower z values and hotter (red) corresponding to higher z values.

x,y,z=var('x,y,z')
## EQUIPOTENTIAL SURFACE
es = implicit_plot3d(z==F(x,y)+g(y),(x,-K,K), (y,-K,K), (z,-K,K), mesh=True)

## COORDINATE PLANES AND COORDINATE RAYS
XY = plot3d(lambda x,y: 0, (-K,K), (-K,K), color="yellow", opacity=0.1)
YZ = implicit_plot3d(x==0, (x,-K,K), (y,-K,K), (z,-K,K), color="green", opacity=0.1)
XZ = implicit_plot3d(y==0,  (x,-K,K), (y,-K,K), (z,-K,K), color="red", opacity=0.1, axes=True, gridlines=True)
coordplanes = XY+YZ+XZ
from sage.plot.plot3d.shapes import Text
Xray = arrow3d((0,0,0), (K,0,0), 2, color="black")+Text("x", color="black").translate(((1.05)*K, 0.1, 0.1))
Yray = arrow3d((0,0,0), (0,K,0), 2, color="black")+Text("y", color="black").translate((0.1, (1.05)*K, 0.1))
Zray = arrow3d((0,0,0), (0,0,K), 2, color="black")+Text("z", color="black").translate((0.1, 0.1, (1.05)*K))
coordrays = Xray+Yray+Zray

coords = coordplanes + coordrays

es+coords


︡1e82b774-d4aa-437d-bbda-f341a2077545︡{"file":{"filename":"5554b63e-a05f-4530-9137-7ade6455776a.sage3d","uuid":"5554b63e-a05f-4530-9137-7ade6455776a"}}︡{"done":true}︡︡
︠6fc5f31d-f691-4706-b603-8af6ad6d34c3︠


︡e6d15007-8689-49e0-8146-84cfcb05f213︡{"html":"<div align='center'>$\\displaystyle i \\, \\pi + \\log\\left(2\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\log\\left({\\left| x \\right|}\\right)$</div>"}︡{"done":true}︡
︠0a8032f0-f4ec-4bfa-a2bb-54499e64a9a1s︠

# 1st Order Linear: y' + P(x)y = Q(x)
P(x) = -1/x
Q(x) = 2*x+1
f(x,y) = Q(x)-P(x)*y
M=5
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
show(fig, xmin=-M,xmax=M,ymin=-M,ymax=M)

︡cd4e4b38-d4d7-404c-981e-84dd6dcf75c7︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/350/tmp_LAtONC.svg","show":true,"text":null,"uuid":"c464c163-6012-4488-a8ac-8d3f3cb3b183"},"once":false}︡{"done":true}︡
︠f8795e6c-635a-4e43-89e1-d54a5af99aa6ss︠
# Determine the integrating factor
mu = exp(integrate(P(x),x)); 
pretty_print("$\\mu=e^{\\int P(x)\\,dx}=$",mu.simplify())
︡86ba6de6-659e-44a8-b1e0-4fbce98581fc︡{"html":"<div align='center'>$\\mu=e^{\\int P(x)\\,dx}=$ $\\displaystyle \\frac{1}{x}$</div>"}︡{"done":true}︡
︠e1faf575-9c83-4832-a84c-138a2c7c937ds︠
# Integrate both sides of (mu*y)' = mu*Q
C = var('C')
RHS = integrate(mu*Q(x),x)+C; RHS 
# has a log that needs fixing.  For more details, refer to the top of this file.
RHS = fix_log(RHS); 
pretty_print("$\\mu(x)y=$",RHS)
︡6607bfab-edae-4679-99d5-e513d99e1dba︡{"html":"<div align='center'>$\\displaystyle C + 2 \\, x + \\log\\left(x\\right)$</div>"}︡{"html":"<div align='center'>$\\mu(x)y=$ $\\displaystyle C + 2 \\, x + \\log\\left({\\left| x \\right|}\\right)$</div>"}︡{"done":true}︡
︠35ddd89b-6cf2-4ea7-bc54-6d8097183dacs︠
# Divide by mu to get the solution y
soln = RHS/mu; 
pretty_print("$y=$",soln.expand())
︡2c805523-4ee9-4079-b247-b0884c56ba09︡{"html":"<div align='center'>$y=$ $\\displaystyle C x + 2 \\, x^{2} + x \\log\\left({\\left| x \\right|}\\right)$</div>"}︡{"done":true}︡
︠5c4b6870-6797-4916-8d93-433066f1ff80︠
# Plot the slope field along with various solutions
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)

# Color various solutions
colors = ['blue', 'green', 'red', 'magenta','orange', 'purple', 'pink']
color_index = 0

for Cval in [-2,-1,0,1,2]:
    fig += plot(soln.subs(C==Cval), (x,-M,M), color=colors[color_index], thickness=2)
    color_index += 1 % len(colors)
fig.show(ymin=-M,ymax=M)

    
︡743085b1-74fb-459a-96de-1afcc8fc8e17︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/15578/tmp_ugWAIg.svg","show":true,"text":null,"uuid":"e8b75e3d-4505-4f75-89d1-7262da2447b8"},"once":false}︡{"done":true}︡
︠d328efe3-9690-4c5d-b2a1-d72f61957c38︠
︡9f4e0f02-9db1-46c2-b691-06f3fc563f83︡
︠88b19f11-fe8a-4bbc-992f-e6102799cb55︠
# We can check our work with the desolve command
%typeset_mode True
y = function('y', x)
de = diff(y,x) == Q(x)-P(x)*y
desolve(de,[y,x]).expand()

︡9e4060f3-f885-4990-a3a6-ce1acfc25fba︡{"html":"<div align='center'>$\\displaystyle C x + 2 \\, x^{2} + x \\log\\left(x\\right)$</div>"}︡{"done":true}︡
︠faaba153-33c4-455a-b964-26fc6a151af2i︠

%md
## Example
︡1ad1858e-9f6c-4aa2-94ce-db2ed589b970︡{"done":true,"md":"## Example"}
︠58264a63-9ea7-4824-9d69-c82e51ed0ad5︠

# 1st Order Linear: y' + P(x)y = Q(x)
# Same code as below but consolidated for convenience.
P(x) = 2/x
Q(x) = x^(-4)
f(x,y) = Q(x)-P(x)*y
M=5
pretty_print("DE: $y'+P(x)y=Q(x)$ where $P=$",P(x)," and $Q=$", Q(x))
# Determine the integrating factor
mu = exp(integrate(P(x),x));
mu = mu.simplify()
pretty_print("The integrating factor is $e^{\\int P\\,dx}=\\mu=$",mu)

# Integrate both sides of (mu*y)' = mu*Q
C = var('C')
RHS = integrate(mu*Q(x),x)+C;

# Just in case, the RHS has a log that needs fixing.  For more details, refer to the top of this file.
RHS = fix_log(RHS); 
pretty_print("We now have $(\\mu y)'=\\mu Q$ and  integrate to get $\\mu y = \\int \\mu Q\\,dx=$",RHS)

# Divide by mu to get the solution y
soln = RHS/mu; 
pretty_print("The solution is $y=$", soln,"$=$",soln.full_simplify())

# Plot the slope field along with various solutions
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)

# Color solutions
colors = ['blue', 'green', 'red', 'magenta','orange', 'purple', 'pink']
color_index = 0

for Cval in [-2,-1,0,1,2]:
    fig += plot(soln.subs(C==Cval), (x,-M,M), color=colors[color_index], thickness=2)
    color_index += 1 % len(colors)
fig.show(ymin=-M,ymax=M)
︡6f5fc575-4c44-4bc6-8315-f3c5cc5efd2e︡{"html":"<div align='center'>DE: $y'+P(x)y=Q(x)$ where $P=$ $\\displaystyle \\frac{2}{x}$  and $Q=$ $\\displaystyle \\frac{1}{x^{4}}$</div>"}︡{"html":"<div align='center'>The integrating factor is $e^{\\int P\\,dx}=\\mu=$ $\\displaystyle x^{2}$</div>"}︡{"html":"<div align='center'>We now have $(\\mu y)'=\\mu Q$ and  integrate to get $\\mu y = \\int \\mu Q\\,dx=$ $\\displaystyle C - \\frac{1}{x}$</div>"}︡{"html":"<div align='center'>The solution is $y=$ $\\displaystyle \\frac{C - \\frac{1}{x}}{x^{2}}$ $=$ $\\displaystyle \\frac{C x - 1}{x^{3}}$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/15578/tmp_vV5Hpj.svg","show":true,"text":null,"uuid":"2999e5c8-c58b-458a-abd8-1db70e1e41bc"},"once":false}︡{"done":true}︡
︠42ca960a-6bb1-4828-b748-9308aabf50dfi︠
%md
## Example
## IVP: $y'+4y-e^{-x}=0$ where $y(0)=4/3$
︡8fe450b6-609a-4489-925e-5e46735c5ef1︡{"done":true,"md":"## Example\n## IVP: $y'+4y-e^{-x}=0$ where $y(0)=4/3$"}
︠9fb631a1-5ae8-4bad-b27e-7812899531a2s︠


# 1st Order Linear: y' + P(x)y = Q(x)
# Same code as below but consolidated for convenience.
P(x) = 4
Q(x) = e^(-x)
x0 = 0
y0 = 4/3

f(x,y) = Q(x)-P(x)*y
M=5
pretty_print("DE: $y'+P(x)y=Q(x)$ where $P=$",P(x)," and $Q=$", Q(x))
# Determine the integrating factor
mu = exp(integrate(P(x),x));
mu = mu.simplify()
pretty_print("The integrating factor is $e^{\\int P\\,dx}=\\mu=$",mu)

# Integrate both sides of (mu*y)' = mu*Q
C = var('C')
RHS = integrate(mu*Q(x),x)+C;

# Just in case, the RHS has a log that needs fixing.  For more details, refer to the top of this file.
RHS = fix_log(RHS); 
pretty_print("We now have $(\\mu y)'=\\mu Q$ and  integrate to get $\\mu y = \\int \\mu Q\\,dx=$",RHS)

# Divide by mu to get the solution y
soln = RHS/mu; 
pretty_print("The solution of the DE is $y=$", soln,"$=$",soln.expand().full_simplify())

# Plot the slope field along with various solutions
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)

# Color solutions
colors = ['blue', 'green', 'red', 'magenta','orange', 'purple', 'pink']
color_index = 0

for Cval in [-2,-1,0,1,2]:
    fig += plot(soln.subs(C==Cval), (x,-M,M), color=colors[color_index], thickness=2)
    color_index += 1 % len(colors)
fig.show(ymin=-M,ymax=M)

pretty_print("Now we solve for $C$ using the initial condition.")

eq = (y==soln).subs(x==x0, y==y0)
eq
Cval = solve(eq, C)[0].rhs()
pretty_print("$C=$",Cval)
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
fig += plot(soln.subs(C==Cval), (x,-M,M), color='blue', thickness=2)
fig += point((x0,y0),size=50)
fig.show(ymin=-M,ymax=M)
pretty_print("The solution of the IVP is $y=$",soln.subs(C==Cval).expand() ) # sometimes expand().full_simplify() is better than just expand()

︡1ec4ffd8-be47-4382-b934-1ac7789c29d6︡{"html":"<div align='center'>DE: $y'+P(x)y=Q(x)$ where $P=$ $\\displaystyle 4$  and $Q=$ $\\displaystyle e^{\\left(-x\\right)}$</div>"}︡{"html":"<div align='center'>The integrating factor is $e^{\\int P\\,dx}=\\mu=$ $\\displaystyle e^{\\left(4 \\, x\\right)}$</div>"}︡{"html":"<div align='center'>We now have $(\\mu y)'=\\mu Q$ and  integrate to get $\\mu y = \\int \\mu Q\\,dx=$ $\\displaystyle C + \\frac{1}{3} \\, e^{\\left(3 \\, x\\right)}$</div>"}︡{"html":"<div align='center'>The solution of the DE is $y=$ $\\displaystyle \\frac{1}{3} \\, {\\left(3 \\, C + e^{\\left(3 \\, x\\right)}\\right)} e^{\\left(-4 \\, x\\right)}$ $=$ $\\displaystyle \\frac{1}{3} \\, {\\left(3 \\, C + e^{\\left(3 \\, x\\right)}\\right)} e^{\\left(-4 \\, x\\right)}$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/350/tmp_g8bXHv.svg","show":true,"text":null,"uuid":"f0a10ccb-aa1a-4606-8467-460b78f3a499"},"once":false}︡{"html":"<div align='center'>Now we solve for $C$ using the initial condition.</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\frac{4}{3}\\right) = C + \\frac{1}{3}$</div>"}︡{"html":"<div align='center'>$C=$ $\\displaystyle 1$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/350/tmp_KCSspn.svg","show":true,"text":null,"uuid":"e0a697cf-cfcf-458d-ad27-4e96b834aa1b"},"once":false}︡{"html":"<div align='center'>The solution of the IVP is $y=$ $\\displaystyle \\frac{1}{3} \\, e^{\\left(-x\\right)} + e^{\\left(-4 \\, x\\right)}$</div>"}︡{"done":true}︡
︠e3155cb8-196a-4528-b016-4a73ad7bb9ebs︠
# We can check our work with the desolve command (without going through the entire integrating factor method)
%typeset_mode True
y = function('y', x)
de = diff(y,x) == Q(x)-P(x)*y
desolve(de,[y,x], ics=[0,4/3]).expand()
︡b29b03db-5ba5-4f27-8859-b581bd8251ee︡{"html":"<div align='center'>$\\displaystyle \\frac{1}{3} \\, e^{\\left(-x\\right)} + e^{\\left(-4 \\, x\\right)}$</div>"}︡{"done":true}︡︡
︠eeb55fc9-d22a-4ec2-b706-46d0f5b37373︠









