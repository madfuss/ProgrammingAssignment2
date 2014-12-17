## -- This file contains two functions- makeCacheMatrix() and cacheSolve() which accepts
## -- a matrix and returns the inverse of a matrix respectively


## Write a short comment describing this function
## --This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL # sets the value of m to NULL (provides a default if cacheSolve has not yet been used)
        y <- NULL # sets the value of y to NULL (provides a default if cacheSolve has not yet been used)
        
        setmatrix <- function(y) { #set the value of the matrix
                x <<- y ## caches the inputted matrix so that cacheSolve can check whether it has changed (note this is within the setmatrix function)
                m <<- NULL # # sets the value of m (the matrix inverse if used cacheSolve) to NULL
        }
        
        getmatrix <- function() x #get the value of the matrix
        
        setinverse<- function(solve)
                m <<- solve # store the value of the inverse
        getinverse <- function()
                m #return the cache value of m used to store the inverse
        
        # creates a list to house the four functions
        list(setmatrix = setmatrix, 
             getmatrix = getmatrix, 
             setinverse = setinverse,
                getinverse = getinverse)

}


## Write a short comment describing this function
## -- This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## -- If the inverse has already been calculated (and the matrix has not changed), 
## -- then the cachesolve should retrieve the inverse from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
