## The function makeCacheMatrix creates a inverse matrix, which is really a list containing a function to

## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inversed matrix
## 4. get the value of the inversed matrix

makeCacheMatrix <- function(x = matrix()) {
		m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinversematrix <- function(inversematrix) m <<- inversematrix
        getinversematrix <- function() m

        list(set = set, get = get, setinversematrix = setinversematrix, getinversematrix = getinversematrix)
}


## The following function calculates the inverse of matrix of the given matrix, created with the above function. 
## However, it first checks to see if the inverse of matrix has already been calculated. 
## If so, it gets the inverse of matrix from the cache and skips the computation. Otherwise, it calculates the inverse matrix of the data and sets the value of the inverse in the cache via the setinversematrix function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinversematrix()
        if(!is.null(m)) {
                message("getting inverse of the matrix")
                return(m)
        }
        invmatrix <- x$get()
        m <- solve(invmatrix)
        x$setinversematrix(m)
        m
}
