## Put comments here that give an overall description of what your
## functions do

makeCacheMatrix <- function(x = matrix()) {
 q<-NULL                                          ## Initialize the inverse property 
  set<-function(z){                               ## Method to set the matrix 
    x<<-z
    q<<-NULL
  }
  get <- function() {                             ## Method the get the matrix
    x                                             ## Return the matrix
  }
  setInverse <- function(inverse) {               ## Method to set the inverse of the matrix
    i <<- inverse
  }
  getInverse <- function() {                      ## Method to get the inverse of the matrix
    q                                             ## Return the inverse property
  }
  list(set = set, get = get,                      ## Return a list of the methods
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
 b <- x$getInverse()                              ## Return a matrix that is the inverse of 'x'        
          if(!is.null(b)) {                       ## Return the inverse if its already set        
          message("Bringing cached data")
          return(b)
        }
   data <- x$get()                                ## Get the matrix from our object
   b <- solve(data) %*% data                      ## Calculate the inverse using matrix multiplication
   x$setInverse(b)                                ## Set the inverse to the object
   b                                              ## Return the matrix
}
