## Put comments here that give an overall description of what your functions do
# Example: Caching the Mean of a Vectorless 
# In this example we introduce the <<- operator which can be used to assign a value to an object in an environment that is different from the current environment. Below are two functions that are used to create a special object that stores a numeric vector and cache's its mean.
# 
# The first function, makeVector creates a special "vector", which is really a list containing a function to
# 
# set the value of the vector
# get the value of the vector
# set the value of the mean
# get the value of the mean
# 
# makeVector <- function(x = numeric()) {
# m <- NULL
# set <- function(y) {
# x <<- y
# m <<- NULL
# }
# get <- function() x
# setmean <- function(mean) m <<- mean
# getmean <- function() m
# list(set = set, get = get,
# setmean = setmean,
# getmean = getmean)
# }

# makeVector <- function(x = numeric()) {
#   m <- NULL
#   set <- function(y) {
#     x <<- y
#     m <<- NULL
#   }
#   get <- function() x
#   setmean <- function(mean) m <<- mean
#   getmean <- function() m
#   list(set = set, get = get,
#        setmean = setmean,
#        getmean = getmean)
# }
#
# cachemean <- function(x, ...) {
#   m <- x$getmean()
#   if(!is.null(m)) {
#     message("getting cached data")
#     return(m)
#   }
#   data <- x$get()
#   m <- mean(data, ...)
#   x$setmean(m)
#   m
# }

## Write a short comment describing this function
# Write the following functions:
#   
# makeCacheMatrix: This function creates a special "matrix" object that can cache its 
# inverse.
# cacheSolve: This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated (and the matrix has 
# not changed), then the cachesolve should retrieve the inverse from the cache.

makeCacheMatrix <- function(x = matrix()) {
  matrixInv <- NULL
  set <- function(y) {
    x <<- y
    matrixInv <<- NULL
  }
  get <- function() x
  setInverse <- function(solveMatrix) matrixInv <<- solveMatrix
  getInverse <- function() matrixInv
  list(
    set = set,
    get = get,
    setInverse = setInverse,
    getInverse = getInverse
  )
}

## Write a short comment describing this function
cacheSolve <- function(x = matrix(), ...) {
  ## Return a matrix that is the inverse of 'x'
  invX <- x$getInverse()
  if (!is.null(invX)) {
    message("getting data from cache")
    return(invX)
  }
  message("setting data into cache")
  data <- x$get()
  invX <- solve(data)
  x$setInverse(invX)
  invX
}
