using JuMP;
using Cbc; # integer based solver

#initializing the solver
m = Model(solver=CbcSolver())

#defining variables
@variable(m, oneRupees >= 0, Int)
@variable(m, twoRupees >= 0, Int)
@variable(m, fiveRupees >= 0, Int)
@variable(m, fiftyPaise >= 0, Int)

#add constraints
@constraint(m, 1*oneRupees + 2*twoRupees + 5*fiveRupees + 0.5*fiftyPaise == 83)

# add object to minimize weight in grams
@objective(m, Min, 4.85*oneRupees + 5.62*twoRupees + 6.00*fiveRupees + 3.79*fiftyPaise)

# Solve
status = solve(m)

println("Minimum weight: ", getobjectivevalue(m), " grams")
println(round(getvalue(oneRupees)), " one rupees")
println(round(getvalue(twoRupees)), " two rupees")
println(round(getvalue(fiveRupees)), " five rupees")
println(round(getvalue(fiftyPaise)), " fifty paises")
