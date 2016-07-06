# VertEnum.jl

A Julia package for enumerating vertices of a polyhedra in Julia. More
specifically, this package allows to go from a hyperplane
representation {x: Ax <= b} of a polyhedra, to a set of generating
vertices and rays. It uses the python module PyCDDlib to interface
with CDD, an implementation of the double description method in C.

**Please note that this package is in its infancy! Occasional issues
should be expected**

## Installation

1. Install CDD and PyCDDlib. The best way to do this depends on your
OS and python package manager. I won't attempt to provide directions
for all possible configurations--a quick google search with your
specifications will be much more fruitful.

2. In Julia, install PyCall
```julia 
julia> Pkg.add("PyCall")
```

3. Clone this repository to your julia directory (~/.julia/v0.4/ for
me on linux) using the commands

```julia
julia> Pkg.clone("https://github.com/rbassett3/VertEnum.jl.git")
```

##A Short Example

In this example we'll use the vrep function to compute the generators
of the polyhedron {(x,y): x >= 0, y >=0, x+y <=1}. By examination, we
see that there are three generating vertices (0,0), (1,0), (0,1) and
no generating rays.

The vrep function computes the generators of the polyhedron {x: Ax <=
b} via the syntax
```julia
julia> vrep(A,b)
```
The function returns a tuple of arrays. The first is a set of
vertices, and the second contains generating rays. So we simply
convert our polyhedron to this format and apply the function.

```julia
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

