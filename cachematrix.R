## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(matrix = matrix()) {
  invert <- NULL
  set <- function(y) {
    matrix  <<- y
    invert  <<- NULL
  }
  get <- function() matrix
  setinvert<- function(solve) invert  <<- solve
  getinvert <- function() invert 
  list(set = set, get = get,
       setinvert = setinvert,
       getinvert = getinvert)
}

cacheSolve <- function(matrixinvert, ...) {
  invert  <- matrixinvert$getinvert()
  if(!is.null(invert)) {
    message("Getting cached inverse matrix")
    return(invert)
  }
  data <- matrixinvert$get()
  invert <- solve(data, ...)
  matrixinvert$setinvert(invert)
  invert 
}
