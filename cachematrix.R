## Functions for creating a special "matrix" object, computing its inverse and caching it 
## 


## Copying the makeVector example here to use as a template
#makeVector <- function(x = numeric()) {
#        m <- NULL
#        set <- function(y) {
#                x <<- y
#                m <<- NULL
#        }
#        get <- function() x
#        setmean <- function(mean) m <<- mean
#        getmean <- function() m
#        list(set = set, get = get,
#             setmean = setmean,
#             getmean = getmean)
#}


#####
##
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
##
#####
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmatrix <- function(matrix) m <<- matrix
        getmatrix <- function() m
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}

#####
##
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
##      If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
##      will retrieve the inverse from the cache.
##
#####

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setmatrix(m)
        m
}
