complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, full.names = TRUE)
  
  dat <- data.frame()
  
  cleanrows <- function(dat){
    nrow(dat[which(complete.cases(dat) == TRUE),])
  }
  
  for (i in id){
    
    nobs <- c(i, cleanrows(read.csv(files_list[i])))
    dat <- rbind(dat, nobs)
    
    
  }
  
  colnames(dat) <- c("id", "nobs")
  
  print(dat)
  
}