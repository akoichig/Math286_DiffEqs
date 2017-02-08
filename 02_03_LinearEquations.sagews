︠da0b28b1-902b-40ba-98da-86e44a82bebai︠
%md
# 2.3 Linear Equations
︡3f9c76c7-2a92-4b11-b000-edcf598ee4f1︡{"done":true,"md":"# 2.3 Linear Equations"}
︠5baab2d8-cf77-4d9f-a64c-a4f56a16f2bdi︠
%md
## Example:
Solve $y'=\dfrac{y}{x}+2x+1$
︡c8b0ed83-836c-473a-ae4e-870d837b4500︡{"done":true,"md":"## Example:\nSolve $y'=\\dfrac{y}{x}+2x+1$"}
︠6b9c1021-d5a3-4b9f-841f-04d6e4a39476s︠
# START HERE
x,y,C = var('x,y,C')
%typeset_mode True


︡a402d483-9363-47f6-913a-b1d0a8212441︡{"done":true}︡
︠6fc5f31d-f691-4706-b603-8af6ad6d34c3s︠

# Sage uses Maxima as a backend for symbolic integration.  Integrating 1/x results in the complex variable log(x) instead of log(|x|).
# The function below can fix that. (It's a bit of a "hack" so not guaranteed to always work)

def fix_log(myf):
    tmp = str(myf).replace('log(x)', 'log(abs(x))')
    return sage_eval(tmp, locals={'x':x, 'C':C})
# Test
f1 = integrate(1/x,x)
f1(-2) # results in a complex number, but should be log|-2|.  Note: log means natural log
f1 = fix_log(f1); f1 # FIXED!
︡ad18e98e-6d14-44f8-8b2b-ffc06c2af9d3︡{"stderr":"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/smc_sagews/sage_server.py:976: DeprecationWarning: Substitution using function-call syntax and unnamed arguments is deprecated and will be removed from a future release of Sage; you can use named arguments instead, like EXPR(x=..., y=...)\nSee http://trac.sagemath.org/5930 for details.\n  # this fixup has to happen after first block has executed (os.chdir etc)\n"}︡{"html":"<div align='center'>$\\displaystyle i \\, \\pi + \\log\\left(2\\right)$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\log\\left({\\left| x \\right|}\\right)$</div>"}︡{"done":true}︡
︠0a8032f0-f4ec-4bfa-a2bb-54499e64a9a1︠

# 1st Order Linear: y' + P(x)y = Q(x)
P(x) = -1/x
Q(x) = 2*x+1
f(x,y) = Q(x)-P(x)*y
M=5
fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
show(fig, xmin=-M,xmax=M,ymin=-M,ymax=M)

︡7718b9e4-a24c-4715-9c25-ee8744614a2a︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/2850/tmp_3gLaSd.svg","show":true,"text":null,"uuid":"1af74e03-1384-4f94-92da-4ce61c78e073"},"once":false}︡{"done":true}︡
︠f8795e6c-635a-4e43-89e1-d54a5af99aa6︠
# Determine the integrating factor
mu = exp(integrate(P(x),x)); 
pretty_print("$\\mu=e^{\\int P(x)\\,dx}=$",mu.simplify())
︡ab2a14db-57a9-4c8b-90ca-1c0b2be89b7f︡{"html":"<div align='center'>$\\mu=e^{\\int P(x)\\,dx}=$ $\\displaystyle \\frac{1}{x}$</div>"}︡{"done":true}︡
︠e1faf575-9c83-4832-a84c-138a2c7c937d︠
# Integrate both sides of (mu*y)' = mu*Q
C = var('C')
RHS = integrate(mu*Q(x),x)+C; RHS 
# has a log that needs fixing.  For more details, refer to the top of this file.
RHS = fix_log(RHS); 
pretty_print("$\\mu(x)y=$",RHS)
︡f0473cbe-6785-41bf-97f0-06066037b769︡{"html":"<div align='center'>$\\displaystyle C + 2 \\, x + \\log\\left(x\\right)$</div>"}︡{"html":"<div align='center'>$\\mu(x)y=$ $\\displaystyle C + 2 \\, x + \\log\\left({\\left| x \\right|}\\right)$</div>"}︡{"done":true}︡
︠35ddd89b-6cf2-4ea7-bc54-6d8097183dac︠
# Divide by mu to get the solution y
soln = RHS/mu; 
pretty_print("$y=$",soln.expand())
︡b71db571-3877-4fe6-9e6b-c7e7d2db8331︡{"html":"<div align='center'>$y=$ $\\displaystyle C x + 2 \\, x^{2} + x \\log\\left({\\left| x \\right|}\\right)$</div>"}︡{"done":true}︡
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

    
︡9799ec8f-f211-4bc0-ad9c-d39ab07f957e︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/2850/tmp_w4VxdC.svg","show":true,"text":null,"uuid":"67107816-66f5-41eb-b791-4dde7c1e88dd"},"once":false}︡{"done":true}︡
︠d328efe3-9690-4c5d-b2a1-d72f61957c38︠
︡9f4e0f02-9db1-46c2-b691-06f3fc563f83︡
︠2ea2ae2e-aecb-4acc-997f-131903eb85d3︠
%typeset_mode True
y = function('y', x)
de = diff(y,x) == Q(x)-P(x)*y
desolve(de,[y,x]).expand()

︡9e4060f3-f885-4990-a3a6-ce1acfc25fba︡{"html":"<div align='center'>$\\displaystyle C x + 2 \\, x^{2} + x \\log\\left(x\\right)$</div>"}︡{"done":true}︡︡
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
︡49152983-49bc-499b-adf2-b03cb10e3562︡{"html":"<div align='center'>DE: $y'+P(x)y=Q(x)$ where $P=$ $\\displaystyle \\frac{2}{x}$  and $Q=$ $\\displaystyle \\frac{1}{x^{4}}$</div>"}︡{"html":"<div align='center'>The integrating factor is $e^{\\int P\\,dx}=\\mu=$ $\\displaystyle x^{2}$</div>"}︡{"html":"<div align='center'>We now have $(\\mu y)'=\\mu Q$ and  integrate to get $\\mu y = \\int \\mu Q\\,dx=$ $\\displaystyle C - \\frac{1}{x}$</div>"}︡{"html":"<div align='center'>The solution is $y=$ $\\displaystyle \\frac{C - \\frac{1}{x}}{x^{2}}$ $=$ $\\displaystyle \\frac{C x - 1}{x^{3}}$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/2850/tmp_XBx9SE.svg","show":true,"text":null,"uuid":"72136ce3-2812-4811-bd65-abbffaf03c79"},"once":false}︡{"done":true}︡
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
pretty_print("The solution is $y=$", soln,"$=$",soln.expand())  #Sometimes .expand().full_simplify() is useful

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
pretty_print("The solution is $y=$", soln.subs(C==Cval).expand()) 

fig = plot_slope_field(f(x,y), (x,-M,M), (y,-M,M), headaxislength=3, headlength=3)
fig += plot(soln.subs(C==Cval), (x,-M,M), color='blue', thickness=2)
fig += point((x0,y0),size=30)
fig.show(ymin=-M,ymax=M)

︡d06f33ed-b731-464e-8c61-cccbfff209c5︡{"html":"<div align='center'>DE: $y'+P(x)y=Q(x)$ where $P=$ $\\displaystyle 4$  and $Q=$ $\\displaystyle e^{\\left(-x\\right)}$</div>"}︡{"html":"<div align='center'>The integrating factor is $e^{\\int P\\,dx}=\\mu=$ $\\displaystyle e^{\\left(4 \\, x\\right)}$</div>"}︡{"html":"<div align='center'>We now have $(\\mu y)'=\\mu Q$ and  integrate to get $\\mu y = \\int \\mu Q\\,dx=$ $\\displaystyle C + \\frac{1}{3} \\, e^{\\left(3 \\, x\\right)}$</div>"}︡{"html":"<div align='center'>The solution is $y=$ $\\displaystyle \\frac{1}{3} \\, {\\left(3 \\, C + e^{\\left(3 \\, x\\right)}\\right)} e^{\\left(-4 \\, x\\right)}$ $=$ $\\displaystyle C e^{\\left(-4 \\, x\\right)} + \\frac{1}{3} \\, e^{\\left(-x\\right)}$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/1387/tmp_0N0tSs.svg","show":true,"text":null,"uuid":"f66a734c-6cc6-4d3d-90ab-83455a148b7f"},"once":false}︡{"html":"<div align='center'>Now we solve for $C$ using the initial condition.</div>"}︡{"html":"<div align='center'>$\\displaystyle \\left(\\frac{4}{3}\\right) = C + \\frac{1}{3}$</div>"}︡{"html":"<div align='center'>$C=$ $\\displaystyle 1$</div>"}︡{"html":"<div align='center'>The solution is $y=$ $\\displaystyle \\frac{1}{3} \\, e^{\\left(-x\\right)} + e^{\\left(-4 \\, x\\right)}$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/1387/tmp_rvmh05.svg","show":true,"text":null,"uuid":"905c745c-8603-45dc-9f9e-c148d6b41d00"},"once":false}︡{"done":true}︡
︠e3155cb8-196a-4528-b016-4a73ad7bb9ebs︠
# We can check our work with the desolve command (without going through the entire integrating factor method)
%typeset_mode True
y = function('y')(x)
de = diff(y,x) == Q(x)-P(x)*y
desolve(de,[y,x], ics=[0,4/3]).expand()
︡17c7a222-2fe2-44ad-9b4a-ffb907f458ec︡{"html":"<div align='center'>$\\displaystyle \\frac{1}{3} \\, e^{\\left(-x\\right)} + e^{\\left(-4 \\, x\\right)}$</div>"}︡{"done":true}︡
︠eeb55fc9-d22a-4ec2-b706-46d0f5b37373︠









