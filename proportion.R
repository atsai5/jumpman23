#x is a data frame
proportion <- function(x){
    prop <- matrix(nrow = nrow(x), ncol = ncol(x)-1)

    for(i in 1: nrow(x)){
        for(j in 2:ncol(x)){
            prop[i,j-1] <- paste(round(x[i,j]/sum(x[,j]),digits = 3)*100,"%")
        }
    }
    prop <- cbind(x[1], prop)
    colnames(prop) <- colnames(x)
    data.frame(prop)
}