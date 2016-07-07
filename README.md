# VertEnum.jl

A [Julia](http://julialang.org/)
package for enumerating vertices of a polyhedra in Julia. More
specifically, this package transforms a polyhedra from a hyperplane
representation {x: Ax <= b} to a set of generating
vertices and rays. It uses the python module
[pycddlib](http://pycddlib.readthedocs.io/en/latest/quickstart.html)
to interface with [cdd](https://www.inf.ethz.ch/personal/fukudak/cdd_home/),
an implementation of the double description method in C.

**Please note that this package is in its infancy! Occasional issues
should be expected**

## Installation

1. Install CDD and PyCDDlib. The best way to do this depends on your
OS and python package manager. I won't attempt to provide directions
for all possible configurations--a quick google search with your
specifications will be much more fruitful.

2. In Julia, install the package using the command
```julia
julia> Pkg.clone("https://github.com/rbassett3/VertEnum.jl.git")
```

##A Short Example

In this example we'll use the vrep function to compute the generators
of the polyhedron {(x,y): x >= 0, y >=0, x+y <=1}. By examination, we
see that there are three generating vertices (0,0), (1,0), (0,1) and
no generating rays. Let's double check this with the vrep function.

The vrep function computes the generators of the polyhedron {x: Ax <=
b} via the syntax
```julia
julia> vrep(A,b)
```
The function returns a tuple of arrays. The first is a set of
vertices, and the second contains generating rays. So we simply
convert our polyhedron to this format and apply the function.

```julia
julia> using VertEnum
julia> A=[-1 0; 0 -1; 1 1]
julia> b=[0; 0; 1]
julia> (V,R)=vrep(A,b)

(
3x2 Array{Float64,2}:
 0.0  1.0
 1.0  0.0
 0.0  0.0,

0x2 Array{Float64,2}
```
Note that the rows of the arrays are the points. The same goes for the
rays, though the array of generating rays is empty in the above
example.

