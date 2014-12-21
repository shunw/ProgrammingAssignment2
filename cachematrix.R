## Put comments here that give an overall description of what your
## functions do

#Below two functions main purpose is to create and store 
#the inverse matrix in case the same inverse matrix would be calculated. 
#This way, we could save computing time. 

## This function here has four different function containing in it
## set function is to get the new matrix
## get function is to show what the matrix is
## setmatrix function could set new matrix here, by assign a new matrix to it. 
##     But the getmatrix would be changed by it. 
##getmatrix function could get the inverse matrix from the cachesolve function 

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


## This function is to get the inverse matrix. If this matrix has been calculated the inverse matrix, 
##     the function will just show the previous calculate data here. 
##     Otherwise, it will calculate the inverse matrix by using the solve function. 

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
