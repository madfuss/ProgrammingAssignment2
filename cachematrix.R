## This file contains two functions- makeCacheMatrix() and cacheSolve() which are
## used to demonstrate OOP programming and Lexical Scoping, further implementing
## the concept of "caching objects" in R

## makeCacheMatrix creates a special "matrix" object  
## cacheSolve calculates the inverse of the matrix
## If the matrix inverse has already been calculated, it will instead 
## be retrieve from the cached object and return it, and not calculate it again.


# This function creates a special "matrix" object that can cache 
# the input matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {# accepts a "matrix" as an argument
        inv_x <- NULL # sets the value of inv_x to NULL EACH time a makeCacheMatrix object is declared
        
        ## setter method
        setMatrix <- function(y) { # accepts the input matrix as argument
                x <<- y            # caches the matrix vector
                inv_x <<- NULL     # clears the cached value of inv_x
        }
        
        ## getter method
        getMatrix <- function() x # get the value of the matrix
        
        
        ## setInverse method
        setInverse<- function(solve){ # accepts the inverse value as argument
                inv_x <<- solve       # caches the value of the inverse 
        }
        
        ## getInverse method
        getInverse <- function(){
                inv_x # returns the cache value of inv_x, used to store the inverse
        }
                
        
        # creates a list objects when a instance of makeCacheMatrix is declared
        list(setMatrix = setMatrix, getMatrix = getMatrix, 
             setInverse = setInverse,getInverse = getInverse)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## cacheSolve retrieves it from cache, while if not,
## it computes, caches, and returns it.
cacheSolve <- function(x, ...) {# accepts an instance of object "makeCacheMatrix" as argument
        
        inv_x <- x$getInverse() # calls the getInverse() method of the object "x",
                                # stores the value in inv_x
        
        if(!is.null(inv_x)){ # check if the value has been cached
                message("getting cached inverse matrix")  
        } else{ # value has not been cached
                inv_x <- solve(x$getMatrix()) # use the solve() function to find inverse of "x"
                x$setInverse(inv_x) # passes the new value which will be cached by the objects setInverse method
        }
        
        return(inv_x) # returns the value of inv_x
}
