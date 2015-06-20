corr <- function(directory, threshold = 0) {
  files_list <- list.files(directory, full.names = TRUE)
  dat <- data.frame()
  nscorrs <- vector()
  cleandat <- data.frame()
  
  cleanrows <- function(dat){
    nrow(dat[which(complete.cases(dat) == TRUE),])
  }
  
  for(i in 332){
    dat <- read.csv(files_list[i])
    cleandat <- dat[which(complete.cases(dat) == TRUE),]
    
    if(cleanrows(dat) > threshold){
          nscorrs <- as.vector(c(nscorrs, as.vector(cor(cleandat["sulfate"], cleandat["nitrate"]))))
        
  }
    
  }
  nscorrs <- as.vector(nscorrs)
  print(nscorrs)
  
}