## This file contains two functions makeCacheMatrix and Cachesolve which together
## cab be used to find the inverse of a matrix from cache if available.

## the makeCacheMatrix creates a list of four functions set,get,setinverse and
## getinverse respectively. These can be called from another functions whenever 
## neccessary

makeCacheMatrix <- function(x = matrix()) {
  
      i <- NULL
      set <- function(y) {
      x <<- y
      i <<- NULL
   }
      get <- function() x
      setinverse <- function(inverse) i<<-inverse
      getinverse <- function() i
      list(set = set, get = get,
            setinverse = setinverse,
            getinverse = getinverse)
}


## cacheSolve function gets the inverse of a matrix is already in the cache and 
## solves for the inverse if the cache is empty

cacheSolve <- function(x, ...) {
        ## check if the inverse is already defined in getinverse() function
  
            i <- x$getinverse()
            if(!is.null(i)) {
             message("getting cached data")
            return(i)
           }
           
        ## if the inverse is not available in getinverse(), solve to get inverse
              data <- x$get()
              i <- solve(data, ...)
              x$setinverse(i)
              i
}
