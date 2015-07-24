## This Code creates a matrix and returns its inverse via slove function. Both values are stored in the envirement other 
## than the current one. Thus once the inverse is calculated, the calculation is not necessarily to be performed in a second call

## The first function creates a matrix and returns it's inverse.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function firstly looks up in the environment to check if the inverse of matrix exists, 
## if so, it caches the value, otherwise it calculates the inverse and stores it in the environment.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		    m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- inverse(data, ...)
        x$setinverse(m)
        m
}
