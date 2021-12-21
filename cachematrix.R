## Write a short comment describing this function
#I have created 1 function that contains 4 functions. 
#Those 4 functions have not yet been called - we just store them into a list and return them.
makeCacheMatrix <- function(x = matrix()) {
    inversed_matrix <- NULL
    
    set_new_matrix <- function(x) {
        new_matrix <<- x
        inversed_matrix <<- NULL
    }
    get_new_matrix <- function() new_matrix
    
    set_inversed_matrix <- function(matrix_to_be_solved){
        inversed_matrix <<- solve(matrix_to_be_solved)
    }
    get_inversed_matrix <- function() inversed_matrix
    
    list(set_new_matrix = set_new_matrix,
         get_new_matrix = get_new_matrix,
         set_inversed_matrix = set_inversed_matrix,
         get_inversed_matrix = get_inversed_matrix)
}


## Write a short comment describing this function
#In this function we must provide a function as the first argument('makeCacheMatrix')
#and the matrix we would like to be inverted and cached(eclipsis holds the matrix that would be provided). 
#Use the sample test code to run the functions - change only the path to the 'cachematrix.R' file.

cacheSolve <- function(cached_matrix_function, ...) {
    inversed_matrix <- cached_matrix_function$get_inversed_matrix()
    if (!is.null(inversed_matrix)){
        message('getting cached inversed matrix')
        return (inversed_matrix)
    }

    a_matrix <- list(...)
    cached_matrix_function$set_new_matrix(a_matrix)
    new_matrix <- cached_matrix_function$get_new_matrix()
    cached_matrix_function$set_inversed_matrix(new_matrix[[1]])
    return (cached_matrix_function$get_inversed_matrix())
}

#Test code:

#Example 1:
# exp1 <- matrix(1:4, 2,2)
# source('R Programming/Week 3/ProgrammingAssignment2/cachematrix.R')
# cacheSolve(makeCacheMatrix(exp1), exp1)

#Example 2:
# rm(list= ls())
# exp1 <- matrix(4:8, 2,2)
# source('R Programming/Week 3/ProgrammingAssignment2/cachematrix.R')
# cached_matrix_function <- makeCacheMatrix(exp1)
# cached_matrix_function$set_new_matrix(exp1)
# new_matrix <- cached_matrix_function$get_new_matrix()
# cached_matrix_function$set_inversed_matrix(new_matrix)
# cacheSolve(cached_matrix_function, exp1)
