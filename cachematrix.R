

## cachematrix.R has two functions   makecacheMatrix() that creates a special matrix object that can cache its inverse and "cacheSolve ()" that is to calculate the inverse of a special matrix returned by makeCacheMatrix. if the

## The function makeCachematrix (x), where x = an invertible matrix, is a list containing a function
## 1.  Set the value of  a Matrix
## 2.  Get the  value of a Matrix
## 3.  Set the Inverse of a Matrix
## 4.  Get the Inverse of a Matrix


makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
    setinverse = setinverse,
    getinverse = getinverse)
    
}


## cacheSolve  Computes the inverse of the matrix returned by makeCacheMatrix ().
## It checks if the inverse has been calculated.  If the inverse is calculated it get the inverse from the cache and skips the computation  OTHERWISE it calculates  the inverse of the function using the solve function


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        m <- x$getinverse()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
        
        
}
