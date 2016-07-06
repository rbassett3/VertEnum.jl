
function vrep(A, b)
    #How to document a Julia function? This function takes an
    #H-Representation {x: Ax <= b} and returns
    #a V-Representation. The function returns a tuple with the first
    #element containing an array of generating
    #vertices and the 2nd the generating rays
    
    #The following are required:
    #using PyCall
    #@pyimport cdd
    #@pyimport numpy
    
    mat=cdd.Matrix(numpy.matrix([b -A]), number_type="float")
    #fractions are not supported because of julia/python interface
    mat[:rep_type]=cdd.RepType[:INEQUALITY]
    poly=cdd.Polyhedron(mat)
    G=numpy.matrix(poly[:get_generators]())
    return (G[find(x -> x==1.0, G[:,1]), 2:end],G[find(x -> x==0.0, G[:,1]), 2:end])
end
