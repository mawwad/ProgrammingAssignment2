## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## A "matrix" object is created that is able to cache its inverse

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  
  set <- function(y) {
    mat <<- y
    inv <<- NULL
  }
  get <- function() mat
  setInverse <- function(solve) inv <<- solve
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
## This function returns the inverse of the matrix resturned by the funtion makeCacheMatrix above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}
