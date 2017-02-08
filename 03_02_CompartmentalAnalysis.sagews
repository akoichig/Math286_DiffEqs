︠da0b28b1-902b-40ba-98da-86e44a82bebai︠
%md
# 3.2 Compartmental Analysis
︡3f9c76c7-2a92-4b11-b000-edcf598ee4f1︡{"done":true,"md":"# 3.2 Compartmental Analysis"}
︠8eb142fa-cef5-4d03-976c-5f96029d7889i︠
%md
# Mixing Problems
︡d82b9657-9196-46dc-b4db-1c9a1e100203︡{"done":true,"md":"# Mixing Problems"}
︠ae938172-fe54-4a96-bf1b-e8334ec3e9f4i︠

%md
## Example:
A brine solution of salt flows at a constant rate of 6 L/min into a large tank that initially held 50 L of brine solution in which was dissolved 0.5 kg of salt.  The solution inside the tank is kept well stirred and flows out of the tank at the same rate.  If the concentration of salt in the brine entering the tank is 0.05 kg/L, determine the mass of salt in the tank after $t$ min.  When will the concentration of salt in the tank reach 0.03 kg/L?
︡c8b0ed83-836c-473a-ae4e-870d837b4500︡{"done":true,"md":"## Example:\nA brine solution of salt flows at a constant rate of 6 L/min into a large tank that initially held 50 L of brine solution in which was dissolved 0.5 kg of salt.  The solution inside the tank is kept well stirred and flows out of the tank at the same rate.  If the concentration of salt in the brine entering the tank is 0.05 kg/L, determine the mass of salt in the tank after $t$ min.  When will the concentration of salt in the tank reach 0.03 kg/L?"}
︠f1592315-2e17-405c-9758-6ebd3ea9f21a︠
# START HERE
%typeset_mode True

t,x,x0,  = var('t,x,x0', domain='real')
x = function('x')(t)

x0 = 0.5 # intial amount of salt (kg)
ri = 6 # Inflow rate (L / min)
ci = .05 # Inflow concentration (kg / L)

ro = 6 # Outflow rate (L / min)
co = x/50 # Outflow concentration (kg / L)

Ri = ri*ci
Ro = ro*co

de = diff(x,t) == Ri - Ro
soln = desolve(de, [x,t], ics=[0,x0]); 
de
soln.expand()
plot([soln, 50*.03],(t,0,50))


solve(soln/50==.03, t)
for b in solve(soln/50==.03, t): b.rhs().n()


︡e1dc1da0-3c72-4b97-bed3-f12da30e7486︡{"html":"<div align='center'>$\\displaystyle \\frac{\\partial}{\\partial t}x\\left(t\\right) = -\\frac{3}{25} \\, x\\left(t\\right) + 0.300000000000000$</div>"}︡{"html":"<div align='center'>$\\displaystyle -2 \\, e^{\\left(-\\frac{3}{25} \\, t\\right)} + \\frac{5}{2}$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/31827/tmp_1NOflK.svg","show":true,"text":null,"uuid":"0bf44a1b-fa20-4786-ba88-9bac7c3f3934"},"once":false}︡{"html":"<div align='center'>[$\\displaystyle t = \\frac{25}{3} \\, \\log\\left(2\\right)$]</div>"}︡{"html":"<div align='center'>$\\displaystyle 5.77622650466621$</div>"}︡{"done":true}︡
︠6fc5f31d-f691-4706-b603-8af6ad6d34c3i︠

%md
## Exercise: Redo the problem above assuming the outflow rate is 5 L/min.
︡ce6841e0-cbe6-4e5d-b12f-7478bdc3b436︡{"done":true,"md":"## Exercise: Redo the problem above assuming the outflow rate is 5 L/min."}
︠67f5122a-942f-4e16-ba1b-9cfa2a0530b2︠
# START HERE
%typeset_mode True

t,x,x0,  = var('t,x,x0', domain='real')
x = function('x')(t)

x0 = 0.5 # intial amount of salt (kg)
ri = 6 # Inflow rate (L / min)
ci = .05 # Inflow concentration (kg / L)

ro = 5 # Outflow rate (L / min)

# The outflow concentration is more complicated now because the volume in the tank is changing (6 > 5)
# The volume of the tank is 50 + (6-5)*t
co = x/(50+t) # Outflow concentration (kg / L)

Ri = ri*ci
Ro = ro*co

de = diff(x,t) == Ri - Ro
soln = desolve(de, x, ics=[0,x0]); 
de
soln
plot([soln, (50+t)*.03],(t,0,70))


solve(soln/50==.03, t)
find_root(soln/(50+t)==.03, 0, 10)
︡a36fd1f1-76be-447d-9e7f-283e10db5550︡{"html":"<div align='center'>$\\displaystyle \\frac{\\partial}{\\partial t}x\\left(t\\right) = -\\frac{5 \\, x\\left(t\\right)}{t + 50} + 0.300000000000000$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{t^{6} + 300 \\, t^{5} + 37500 \\, t^{4} + 2500000 \\, t^{3} + 93750000 \\, t^{2} + 1875000000 \\, t + 3125000000}{20 \\, {\\left(t^{5} + 250 \\, t^{4} + 25000 \\, t^{3} + 1250000 \\, t^{2} + 31250000 \\, t + 312500000\\right)}}$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/31827/tmp_MT0Gw6.svg","show":true,"text":null,"uuid":"948c0cd6-d7b8-4ab3-be82-78d7ab1414ac"},"once":false}︡{"html":"<div align='center'>[$\\displaystyle 0 = t^{6} + 270 \\, t^{5} + 30000 \\, t^{4} + 1750000 \\, t^{3} + 56250000 \\, t^{2} + 937500000 \\, t - 6250000000$]</div>"}︡{"html":"<div align='center'>$\\displaystyle 6.12310241547$</div>"}︡{"done":true}︡
︠898234b9-b7cb-4f71-94a2-dbea104e8f7ci︠
%md
## Exercise: Redo the problem above assuming the outflow rate is 7 L/min.
︡2e185c1f-7d2d-45f9-8136-93948f9b726f︡{"done":true,"md":"## Exercise: Redo the problem above assuming the outflow rate is 7 L/min."}
︠ed2ead16-72a7-4a90-80b8-1853f2ee6fe0︠
# START HERE
%typeset_mode True

t,x,x0,  = var('t,x,x0', domain='real')
x = function('x')(t)

x0 = 0.5 # intial amount of salt (kg)
ri = 6 # Inflow rate (L / min)
ci = .05 # Inflow concentration (kg / L)

ro = 7 # Outflow rate (L / min)

# The outflow concentration is more complicated now because the volume in the tank is changing (6 > 5)
# The volume of the tank is 50 + (6-5)*t
co = x/(50-t) # Outflow concentration (kg / L)

Ri = ri*ci
Ro = ro*co

de = diff(x,t) == Ri - Ro
soln = desolve(de, x, ics=[0,x0]); 
de
soln
plot([soln, (50-t)*.03],(t,0,50))


solve(soln/50==.03, t)
find_root(soln/(50-t)==.03, 0, 10)
︡256a2c9c-ffe6-45c6-afd4-1cd7c9f7b088︡{"html":"<div align='center'>$\\displaystyle \\frac{\\partial}{\\partial t}x\\left(t\\right) = \\frac{7 \\, x\\left(t\\right)}{t - 50} + 0.300000000000000$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{1}{390625000000} \\, t^{7} - \\frac{7}{7812500000} \\, t^{6} + \\frac{21}{156250000} \\, t^{5} - \\frac{7}{625000} \\, t^{4} + \\frac{7}{12500} \\, t^{3} - \\frac{21}{1250} \\, t^{2} + \\frac{23}{100} \\, t + \\frac{1}{2}$</div>"}︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/31827/tmp_gUM4NZ.svg","show":true,"text":null,"uuid":"2d23d09c-6f6d-4095-9e0a-9236225d8e88"},"once":false}︡{"html":"<div align='center'>[$\\displaystyle 0 = t^{7} - 350 \\, t^{6} + 52500 \\, t^{5} - 4375000 \\, t^{4} + 218750000 \\, t^{3} - 6562500000 \\, t^{2} + 89843750000 \\, t - 390625000000$]</div>"}︡{"html":"<div align='center'>$\\displaystyle 5.45506409298$</div>"}︡{"done":true}︡
︠bc07c3f8-e169-4dfe-86e2-2f9ce41e2cbdi︠
%md
# Population
︡8e4c4072-16af-404c-a53c-60ac78cf498c︡{"done":true,"md":"# Population"}
︠237b8ecc-e6d2-4537-bcaa-1d527e2f1470s︠
# Scrape Historical US Population data from wikipedia

from bs4 import BeautifulSoup
import urllib2
wiki = "https://en.wikipedia.org/wiki/Demographic_history_of_the_United_States"
header = {'User-Agent': 'Mozilla/5.0'} 
req = urllib2.Request(wiki,headers=header)
page = urllib2.urlopen(req)
soup = BeautifulSoup(page, "lxml")

table = soup.find("table", {"class" : "toccolours"})

data = []
for row in table.findAll("tr"):
    cells = row.findAll("td")
    if len(cells) == 2:
        year = cells[0].find(text=True)
        population = cells[1].find(text=True)
        data.append([year, population.replace(',', '')])
        
# TODO: Use numpy and pandas instead.

︡f8862177-aa47-477d-823c-3bacf05ad09d︡{"done":true}︡
︠f297fb5a-e6fd-4a40-bc7b-2735c632ae85s︠
# Use numpy and pandas 
# For more information about the benefits of these python libraries, see 
# https://www.quora.com/What-is-the-relationship-among-NumPy-SciPy-Pandas-and-Scikit-learn-and-when-should-I-use-each-one-of-them
import numpy as np
from pandas import DataFrame
import pandas as pd
frame = DataFrame(data, columns=['year', 'pop'],  dtype='int')
frame.head() # The first few values



︡97c1b07d-d22a-4efe-a662-4966e401c2e3︡{"stdout":"   year    pop\n0  1610    350\n1  1620   2302\n2  1630   4646\n3  1640  26634\n4  1650  50368\n"}︡{"done":true}︡
︠d3b97281-245c-4434-ac75-5b14a97cc2e6s︠

frame.shift(1).head()
frame.shift(-1).head()
︡e4fcd819-6666-4523-9b13-2a6ac212fc5e︡{"stdout":"     year      pop\n0     NaN      NaN\n1  1610.0    350.0\n2  1620.0   2302.0\n3  1630.0   4646.0\n4  1640.0  26634.0\n"}︡{"stdout":"     year      pop\n0  1620.0   2302.0\n1  1630.0   4646.0\n2  1640.0  26634.0\n3  1650.0  50368.0\n4  1660.0  75058.0\n"}︡{"done":true}︡
︠9c3e7c90-0182-4cc1-8cea-80eb8e02b540s︠
# Change our data so that population is measured in millions.
# To plot the relative growth rate (P' / P), we need to approximate P' with the data.  There are multiple ways to do that
# P ' is approximately  [ P(x+dx) - P(x) ] / dx "forward difference"
# P ' is approximately  [ P(x) - P(x-dx) ] / dx "backdward difference"
# P ' is approximately  [ P(x+dx) - P(x-dx) ] / (2dx) "centered difference"
# The centered difference approximation is the most accurate of the three, so it gets used in the book and below

frame['pop'] = frame['pop']*10**(-6)
frame['centeredDiff']=(frame['pop'].shift(-1)-frame['pop'].shift(1))*.05
frame['relGrowth'] = frame['centeredDiff']/frame['pop']
frame
︡654edcdc-0c86-40a2-a25a-49f26478c054︡{"stdout":"    year         pop  centeredDiff  relGrowth\n0   1610    0.000350           NaN        NaN\n1   1620    0.002302      0.000215   0.093310\n2   1630    0.004646      0.001217   0.261860\n3   1640    0.026634      0.002286   0.085834\n4   1650    0.050368      0.002421   0.048070\n5   1660    0.075058      0.003078   0.041013\n6   1670    0.111935      0.003822   0.034149\n7   1680    0.151507      0.004922   0.032486\n8   1690    0.210372      0.004969   0.023620\n9   1700    0.250888      0.006067   0.024182\n10  1710    0.331711      0.010765   0.032452\n11  1720    0.466185      0.014887   0.031933\n12  1730    0.629445      0.021969   0.034902\n13  1740    0.905563      0.027066   0.029888\n14  1750    1.170760      0.034403   0.029385\n15  1760    1.593625      0.048866   0.030663\n16  1770    2.148076      0.059337   0.027623\n17  1780    2.780369      0.089057   0.032031\n18  1790    3.929214      0.126406   0.032171\n19  1800    5.308483      0.165533   0.031183\n20  1810    7.239881      0.216499   0.029904\n21  1820    9.638453      0.281307   0.029186\n22  1830   12.866020      0.371550   0.028878\n23  1840   17.069453      0.516293   0.030247\n24  1850   23.191876      0.718693   0.030989\n25  1860   31.443321      0.768325   0.024435\n26  1870   38.558371      0.937294   0.024308\n27  1880   50.189209      1.221070   0.024329\n28  1890   62.979766      1.301148   0.020660\n29  1900   76.212168      1.462436   0.019189\n30  1910   92.228496      1.490468   0.016161\n31  1920  106.021537      1.548706   0.014607\n32  1930  123.202624      1.307152   0.010610\n33  1940  132.164569      1.406159   0.010639\n34  1950  151.325798      2.357930   0.015582\n35  1960  179.323175      2.594306   0.014467\n36  1970  203.211926      2.361132   0.011619\n37  1980  226.545805      2.274897   0.010042\n38  1990  248.709873      2.743805   0.011032\n39  2000  281.421906      3.001783   0.010666\n40  2010  308.745538           NaN        NaN\n"}︡{"done":true}︡
︠561df9dc-8c3c-474b-9d9f-e99515caf3f2s︠
#%matplotlib inline
#import matplotlib
import matplotlib.pyplot as plt
plt.scatter(frame['year'], frame['pop'])
plt.title('US Population')
plt.xlabel('Year')
plt.ylabel('Population (in millions)')
plt.show()
︡9028612a-324e-4374-b019-fff226eb1354︡{"stdout":"<matplotlib.collections.PathCollection object at 0x7efc92ca6650>"}︡{"stdout":"\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92c6d310>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92d1d150>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92cb4550>\n"}︡{"file":{"filename":"58e2b8b3-29a8-4751-9cca-ce0c8714775e.svg","show":true,"text":null,"uuid":"158e7ee9-dccb-4d87-94ae-8a2368cbdf9c"},"once":false}︡{"done":true}︡
︠f1d2bef3-2b99-43d5-bfb2-7fd0403df80ds︠
plt.scatter(frame['pop'], frame['relGrowth'])
plt.title('Relative Growth Rate of US Population')
plt.xlabel('Population (in millions)')
plt.ylabel('Relative Growth Rate')
plt.show()

︡3800930d-d4b2-40f5-8c89-e66c97e19113︡{"stdout":"<matplotlib.collections.PathCollection object at 0x7efc92a54ad0>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92c29290>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92c67910>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92a9b390>\n"}︡{"file":{"filename":"be839f25-2a05-486a-89b2-adddc1096812.svg","show":true,"text":null,"uuid":"cc4c608a-516b-45ee-b6b6-a606db3f386f"},"once":false}︡{"done":true}︡
︠b2be4a37-5fbc-4e80-b953-332d25d8242as︠

# Observe the outliers above.  They involve very small populations but much larger relative growth rates.  These likely belong to the years preceeding the US.  We can find WHEN they occured by plotting against year.

plt.scatter(frame['year'], frame['relGrowth'])
plt.title('Relative Growth Rate of US Population')
plt.xlabel('Year')
plt.ylabel('Relative Growth Rate')
plt.show()



︡1c2eb7e3-b6ce-4900-8397-02295390af65︡{"stdout":"<matplotlib.collections.PathCollection object at 0x7efc929eaed0>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc929c24d0>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92cd9290>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92c67ed0>\n"}︡{"file":{"filename":"6b1d13de-af8b-4656-b085-478978fb4e34.svg","show":true,"text":null,"uuid":"6408c776-5713-4b8a-915e-f9d9bd170fab"},"once":false}︡{"done":true}︡
︠0d75e9c9-ec10-4ee5-805b-21e3e3d95140s︠

# From the plot above it seems like we would get a more accurate model by ignoring some of the earlier data points.  
initYear = 1800 # This year will correspond to t=0 in our initial value problem

df = frame[frame['year']>initYear-10].dropna() 
df
︡cd430f4b-ff7d-449f-a7c5-3fc9e4faf80e︡{"stdout":"    year         pop  centeredDiff  relGrowth\n19  1800    5.308483      0.165533   0.031183\n20  1810    7.239881      0.216499   0.029904\n21  1820    9.638453      0.281307   0.029186\n22  1830   12.866020      0.371550   0.028878\n23  1840   17.069453      0.516293   0.030247\n24  1850   23.191876      0.718693   0.030989\n25  1860   31.443321      0.768325   0.024435\n26  1870   38.558371      0.937294   0.024308\n27  1880   50.189209      1.221070   0.024329\n28  1890   62.979766      1.301148   0.020660\n29  1900   76.212168      1.462436   0.019189\n30  1910   92.228496      1.490468   0.016161\n31  1920  106.021537      1.548706   0.014607\n32  1930  123.202624      1.307152   0.010610\n33  1940  132.164569      1.406159   0.010639\n34  1950  151.325798      2.357930   0.015582\n35  1960  179.323175      2.594306   0.014467\n36  1970  203.211926      2.361132   0.011619\n37  1980  226.545805      2.274897   0.010042\n38  1990  248.709873      2.743805   0.011032\n39  2000  281.421906      3.001783   0.010666\n"}︡{"done":true}︡
︠16e8ec77-bb06-4fd7-bbe6-1c70844667c1s︠
plt.scatter(df['year'], df['relGrowth'])
plt.title('Relative Growth Rate of US Population')
plt.xlabel('Population (in millions)')
plt.ylabel('Relative Growth Rate')
plt.show()
︡d0ab87d1-87bd-4b68-abb6-3fc95ed8d1c9︡{"stdout":"<matplotlib.collections.PathCollection object at 0x7efc928f2e50>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc9294c450>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc9299eed0>\n"}︡{"stdout":"<matplotlib.text.Text object at 0x7efc92a07050>\n"}︡{"file":{"filename":"43c7d74a-adb2-4c6a-866c-09489474f6b6.svg","show":true,"text":null,"uuid":"855844d4-bc08-4101-a483-2a40e809e709"},"once":false}︡{"done":true}︡
︠80afa2d5-253c-45e3-bb91-656a543a0f1c︠
# The data above suggests a linear relationship between population and the relative growth rate.  We use linear regression to model that relationship.

import statsmodels.api as sm
from statsmodels.formula.api import ols
result = ols(formula='relGrowth ~ pop', data=df).fit()

# There will be some deprecation errors, but they can be ignored ... for now..

︡d92ab86e-f943-4cc3-99a9-143b110b06a3︡{"stderr":"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/numpy/lib/utils.py:99: DeprecationWarning: `scipy.linalg.calc_lwork` is deprecated!\n\ncalc_lwork was an internal module in Scipy and has been removed.\n\nSeveral functions in scipy.linalg.lapack have *_lwork variants\nthat perform the lwork calculation (from Scipy >= 0.15.0), or\nallow passing in LWORK=-1 argument to perform the computation.\n\n\n  warnings.warn(depdoc, DeprecationWarning)\n"}︡{"stderr":"/projects/sage/sage-7.5/local/lib/python2.7/site-packages/patsy/util.py:652: DeprecationWarning: pandas.core.common.is_categorical_dtype is deprecated. import from the public API: pandas.api.types.is_categorical_dtype instead\n  return safe_is_pandas_categorical_dtype(data.dtype)\n/projects/sage/sage-7.5/local/lib/python2.7/site-packages/patsy/util.py:679: DeprecationWarning: pandas.core.common.is_categorical_dtype is deprecated. import from the public API: pandas.api.types.is_categorical_dtype instead\n  if safe_is_pandas_categorical_dtype(dt1):\n"}︡{"done":true}︡
︠f961476f-a4cc-4669-9ce0-0888ca873e55s︠
print result.params
print result.summary()
︡7b3e6bf1-1f03-4cbf-b846-31f8ce1ad619︡{"stdout":"Intercept    0.028058\npop         -0.000082\ndtype: float64\n"}︡{"stdout":"                            OLS Regression Results                            \n==============================================================================\nDep. Variable:              relGrowth   R-squared:                       0.797\nModel:                            OLS   Adj. R-squared:                  0.786\nMethod:                 Least Squares   F-statistic:                     74.50\nDate:                Tue, 07 Feb 2017   Prob (F-statistic):           5.33e-08\nTime:                        23:29:25   Log-Likelihood:                 88.868\nNo. Observations:                  21   AIC:                            -173.7\nDf Residuals:                      19   BIC:                            -171.6\nDf Model:                           1                                         \nCovariance Type:            nonrobust                                         \n==============================================================================\n                 coef    std err          t      P>|t|      [95.0% Conf. Int.]\n------------------------------------------------------------------------------\nIntercept      0.0281      0.001     22.647      0.000         0.025     0.031\npop        -8.201e-05    9.5e-06     -8.631      0.000        -0.000 -6.21e-05\n==============================================================================\nOmnibus:                        1.233   Durbin-Watson:                   0.451\nProb(Omnibus):                  0.540   Jarque-Bera (JB):                1.101\nSkew:                          -0.487   Prob(JB):                        0.577\nKurtosis:                       2.443   Cond. No.                         200.\n==============================================================================\n\nWarnings:\n[1] Standard Errors assume that the covariance matrix of the errors is correctly specified.\n"}︡{"done":true}︡
︠97ccc011-5c24-452b-a2c1-eb08523540f6s︠
sm.graphics.plot_fit(result, 'pop')
︡e1e08fa0-c1d2-4cbd-b833-46838a966a0f︡{"file":{"filename":"/projects/6d36b90e-dc9a-437e-8197-59bfd1567862/.sage/temp/compute6-us/28654/tmp_jzgIPS.svg","show":true,"text":null,"uuid":"a8581006-d7c8-4480-af6c-4b61df681ca1"},"once":false}︡{"done":true}︡
︠68ba6078-c4b5-44b2-8898-b98611145a64s︠
b, a = result.params; 
#a, b = float(a), float(b)
print a
print b

︡b959492f-82c5-4623-bcea-5c517b3d3829︡{"stdout":"-8.20083146476e-05\n"}︡{"stdout":"0.0280579526045\n"}︡{"done":true}︡
︠073d82ab-dee7-466c-934a-e650a8da4c19s︠
# Set P0 to initial population.  This code would be cleaner if the DataFrame df was indexed by year.
mask = df['year']==initYear
df[mask]
idx = df[mask].index
initPop = df[mask].loc[idx[0]]['pop']; initPop

︡10d94da0-ea21-48e5-86a7-4efbf6bf7f25︡{"html":"<table border=\"1\" class=\"dataframe\">\n  <thead>\n    <tr style=\"text-align: right;\">\n      <th></th>\n      <th>year</th>\n      <th>pop</th>\n      <th>centeredDiff</th>\n      <th>relGrowth</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <th>19</th>\n      <td>1800</td>\n      <td>5.308483</td>\n      <td>0.165533</td>\n      <td>0.031183</td>\n    </tr>\n  </tbody>\n</table>"}︡{"html":"<div align='center'>$\\displaystyle 5.308483$</div>"}︡{"done":true}︡
︠2913bb46-a2f9-4d5e-af0e-924bd0ebd16ds︠
%typeset_mode True

t,P = var('t,P')
P = function('P')(t)

t0, P0 = 0, initPop
de = diff(P,t) == P*(a*P+b)
soln = desolve(de, [P,t], ics=[t0, P0]); soln

# The solution below is not pretty.  Mainly, this is because a and b are being treated as rational numbers and the arithmetic is resulting fractions with large numerators and denominators.  A bigger problem is that the desolve command is integrating a fraction to get a complex log. That's why there is an i on the right side. Let's manually separate the variables below to get the solution.

︡559418f1-5bcd-4ba5-b0f0-3c39e37aa146︡{"html":"<div align='center'>$\\displaystyle -\\frac{1522691324}{42723601} \\, \\log\\left(57097879267352 \\, P\\left(t\\right) - 19535209291674719\\right) + \\frac{1522691324}{42723601} \\, \\log\\left(P\\left(t\\right)\\right) = t - \\frac{61017177862898334}{544951963322891} i - \\frac{18228619575921256619}{14276140534461953}$</div>"}︡{"done":true}︡
︠208bf6a0-fefc-4c4e-85a9-1776ab2c2d7ci︠
%md
## Solving $\frac{dP}{dt}=P(kP+q), P(0)=P_0$ using separation of variables.
︡00a5815d-5668-46cb-ad0a-aa89dc71c626︡{"done":true,"md":"## Solving $\\frac{dP}{dt}=P(kP+q), P(0)=P_0$ using separation of variables."}
︠d2e39e0c-ebad-468a-b4a3-4a771cb070ads︠
# We use k and q because a and b have already been assigned numbers, but we would prefer to use symbolic variables k and q (to avoid horrendous fractions)
t,k,q,C,P0 = var('t,k,q,C,P0')
%typeset_mode True

P=var('P')
eq = integrate(1/(P*(k*P+q)), P)==t+C; eq
eq = eq.multiply_both_sides(q).expand(); eq
eq = eq.subs(C*q==C); eq
eq = exp(eq.lhs()).simplify()==exp(eq.rhs()).simplify(); eq
eq = eq.subs(C==ln(C)).simplify(); eq
eq = eq.multiply_both_sides(P*k+q).expand(); eq
soln = solve(eq, P)
thesoln = soln[0].rhs(); thesoln
Csoln = solve(P0==thesoln.subs(t==0), C)
Cval = Csoln[0].rhs()
thesoln = thesoln.subs(C==Cval); thesoln
thesoln = thesoln.full_simplify(); thesoln

︡a3aef474-4fff-442f-a53c-0a05fb7d77f5︡{"html":"<div align='center'>$\\displaystyle -\\frac{\\log\\left(P k + q\\right)}{q} + \\frac{\\log\\left(P\\right)}{q} = C + t$</div>"}︡{"html":"<div align='center'>$\\displaystyle -\\log\\left(P k + q\\right) + \\log\\left(P\\right) = C q + q t$</div>"}︡{"html":"<div align='center'>$\\displaystyle -\\log\\left(P k + q\\right) + \\log\\left(P\\right) = q t + C$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{P}{P k + q} = e^{\\left(q t + C\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle \\frac{P}{P k + q} = C e^{\\left(q t\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle P = C P k e^{\\left(q t\\right)} + C q e^{\\left(q t\\right)}$</div>"}︡{"html":"<div align='center'>$\\displaystyle -\\frac{C q e^{\\left(q t\\right)}}{C k e^{\\left(q t\\right)} - 1}$</div>"}︡{"html":"<div align='center'>$\\displaystyle -\\frac{P_{0} q e^{\\left(q t\\right)}}{{\\left(P_{0} k + q\\right)} {\\left(\\frac{P_{0} k e^{\\left(q t\\right)}}{P_{0} k + q} - 1\\right)}}$</div>"}︡{"html":"<div align='center'>$\\displaystyle -\\frac{P_{0} q e^{\\left(q t\\right)}}{{\\left(k e^{\\left(q t\\right)} - k\\right)} P_{0} - q}$</div>"}︡{"done":true}︡
︠58a8f96b-c1c3-42c4-a7ca-cf1f7c4ece8as︠
P(t) = thesoln.subs(k==a, q==b, P0==initPop) # Recall, t=0 corresponds to initYear
pretty_print("Our population model is P(t)=", P(t))

Pop2014est = P(2014-initYear); pretty_print("Estimated 2014 population: ", Pop2014est.n(digits=5), " million people.")
Pop2014act = 318.9; pretty_print("Actual 2014 population: ", Pop2014act.n(digits=5), " million people.")

err = abs(Pop2014est-Pop2014act)/Pop2014act*100; 
pretty_print("The relative error is ", err.n(digits=3), " %")

︡77539ecf-e8f1-456e-8bef-09312c4668f2︡{"html":"<div align='center'>Our population model is P(t)= $\\displaystyle -\\frac{0.148945164416 \\, e^{\\left(0.0280579526045 \\, t\\right)}}{-0.000435339744165 \\, e^{\\left(0.0280579526045 \\, t\\right)} - 0.0276226128603}$</div>"}︡{"html":"<div align='center'>Estimated 2014 population:  $\\displaystyle 295.81$  million people.</div>"}︡{"html":"<div align='center'>Actual 2014 population:  $\\displaystyle 318.90$  million people.</div>"}︡{"html":"<div align='center'>The relative error is  $\\displaystyle 7.24$  %</div>"}︡{"done":true}︡
︠4f2bf80b-ee50-46e5-8548-32c0287ea1ccs︠
#The limiting population in the US in this model is 342.14 million people.  
L = limit(P(t),t=infinity).n(digits=5); L
︡4365d355-dc36-4670-afca-f53035c8b620︡{"html":"<div align='center'>$\\displaystyle 342.14$</div>"}︡{"done":true}︡
︠94268c12-27c8-402d-94f1-ba68577209adi︠
%md
## Alternate "Initial Population" $P_0$
︡f7bf52e6-d1a6-40b7-80ea-0f45ddc409da︡{"done":true,"md":"## Alternate \"Initial Population\" $P_0$"}
︠d74c4338-50b4-4516-a02b-cdc4b3df1350︠
#After solving the DE for P(t), we had three paramaters: k, q, and P0.  The first two were estimated with linear regression using many data points.  On the other hand, P0 just used a single data point.  The book offers an alternate approach by 
# 1. Solving for P0 in terms of P(t), k and q
# 2. Calculuate various P0 for each data point (t,P(t))
# 3. Let P0 be the average of different computed P0.
# The motivation in the book was to let the entire model be determined "equally" from each data point.

# Let's do this and see how the 2014 prediction and carrying capacity are affected.

# 1. Solving for P0 in terms of P(t), k and q
# We use k and q because a and b have already been assigned numbers, but we would prefer to use symbolic variables k and q (to avoid horrendous fractions)

initPops = []
P=var('P')
for index, row in df.iterrows():
    y = row['year']
    p = row['pop']
    initPops.append(solve(float(p)==thesoln.subs(P==p, t==y-initYear, k==a, q==b), P0)[0].rhs().n())
newP0 = np.mean(initPops); newP0 # Observe this new initial population is close, but slightly different from initPop
︡877bc3f1-4e08-44ac-9e20-1ad63be96930︡{"html":"<div align='center'>$\\displaystyle 5.2757047036$</div>"}︡{"done":true}︡
︠7d4cca4c-55de-412c-9c02-bde8de3453c7s︠
P(t) = thesoln.subs(k==a, q==b, P0==newP0) # Recall, t=0 corresponds to 1780
pretty_print("Our population model is P(t)=", P(t))

Pop2014est = P(2014-initYear); pretty_print("Estimated 2014 population: ", Pop2014est.n(digits=5), " million people.")
Pop2014act = 318.9; pretty_print("Actual 2014 population: ", Pop2014act.n(digits=5), " million people.")

err = abs(Pop2014est-Pop2014act)/Pop2014act*100; 
pretty_print("The relative error is ", err.n(digits=3), " %")

︡d79fefa2-2ef7-40a1-8abf-94a16400db2a︡{"html":"<div align='center'>Our population model is P(t)= $\\displaystyle -\\frac{0.148025472529 \\, e^{\\left(0.0280579526045 \\, t\\right)}}{-0.00043265165132 \\, e^{\\left(0.0280579526045 \\, t\\right)} - 0.0276253009531}$</div>"}︡{"html":"<div align='center'>Estimated 2014 population:  $\\displaystyle 295.56$  million people.</div>"}︡{"html":"<div align='center'>Actual 2014 population:  $\\displaystyle 318.90$  million people.</div>"}︡{"html":"<div align='center'>The relative error is  $\\displaystyle 7.32$  %</div>"}︡{"done":true}︡
︠b600650e-ff6f-4790-b263-585754975659s︠
#The limiting population in the US in this model is 342.14 million people. 
#This should be the same value.  Can you see from the general solution or the DE why L is independent of P0?
L = limit(P(t),t=infinity).n(digits=5); L
︡162838fd-f916-498b-baa0-7e9436041b21︡{"html":"<div align='center'>$\\displaystyle 342.14$</div>"}︡{"done":true}︡
︠bbee277c-1886-4610-92df-795fe8c1b96f︠









