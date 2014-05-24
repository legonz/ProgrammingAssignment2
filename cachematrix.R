## The functions makeCacheMatrix.R and cacheSolve.R cache the inverse of a matrix
## using the solve() function

## makeCacheMatrix create a special matrix object which is really a list 
## containing functions to:

## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse
## 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
        ## Assignment 2 R-Programming
        ## by Leslie Gonzalez Castillo - Costa Rica
        
        ## 'x' is a numeric square invertible matrix
        
        ## initialize the cache
        m <- NULL
        
        ## 1. Set the value of the matrix
        set <- function(y) {
                x <<- y
                m <<- NULL
                ## assign a value to x and m objects in an environment that is 
                ## different from the current environment
        }
        
        ## 2. Get the value of the matrix
        get <- function() x
        
        ## 3. Set the value of the inverse        
        setinverse <- function(solve) m <<- solve
        ## assign a the result of matrix solve function to m objects in an 
        ## environment that is different from the current environment
        
        ## 4. Get the value of the inverse
        getinverse <- function() m
        
        ## List containing object
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## cacheSolve compute the inverse of a special matrix object 'x'
## returned by makeCacheMatrix function

## if the inverse is already been calculated then should retrive the 
## inverse of the cache

cacheSolve <- function(x, ...) {
        ## Assignment 2 R-Programming
        ## by Leslie Gonzalez Castillo - Costa Rica
        
        ## 'x' is a special matrix object returned by makeCacheMatrix function
        
        ## '...' The ellipsis tells R that we reserve the right to pass in other 
        ## arguments
        
        m <- x$getinverse()
        if(!is.null(m)) {
                ## if the returned cache has anything in it
                message("getting cached data inverse")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
