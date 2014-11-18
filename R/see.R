
# A function to plot dataframes with histograms for each column.

# Example
# z <- data.frame(a = rnorm(50), b = rexp(50), d = runif(50))
# see(z)



see <- function(x){
  UseMethod('see')
}


chartStats <- function(x){
  if(inherits(x, 'numeric')){

    b <- as.vector(table(cut(x, 8)))
    b <- round(6*b/max(b, na.rm = TRUE))

    return(b)
  } else {

    b <- as.vector(table(x))
    if(length(b) > 8) b <- rep(NA, 8)
    if(length(b) < 8) {
      empty <- rep(NA, 8)
      empty[(9 - length(b)):8] <- b
      b <- empty

    } 
    b <- round(6*b/max(b, na.rm = TRUE))
    return(b)
  }
}



see.data.frame <- function(x, rows = 6){

  histVals <- as.vector(sapply(x, chartStats))

  m <- (as.matrix(format.data.frame(x, digits = 8, 
            na.encode = FALSE)))[1:rows, ]


  # m <- formatC(m,  format = "d", flag = " ")

  hist <- matrix(' ', ncol = length(histVals), nrow = 3)

  hist[1, histVals == 6] <- ':'                                 
  hist[1, histVals == 5] <- '.'                                 
  hist[2, histVals > 4] <- ':' 
  hist[2, histVals == 3] <- '.'
  hist[3, histVals > 2] <- ':'      
  hist[3, histVals == 1] <- '.'


  hist <- apply(hist, 1, function(x) paste0(x, collapse = ''))
  hist <- lapply(hist, function(x) substring(x, seq(1, nchar(x)-1, 8), seq(8, nchar(x), 8)))
  matr <- do.call(rbind, hist)

  print(rbind(matr, m),  quote = FALSE, right = TRUE)

  invisible(x)
}
