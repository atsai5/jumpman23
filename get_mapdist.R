get_mapdist <- function(i) {
    mapdist(as.numeric(test[i, c('jumpman.pickup_lon','jumpman.pickup_lat')]), 
            as.numeric(test[i, c('jumpman.dropoff_lon','jumpman.dropoff_lat')]), 
            mode='driving')
}

test$dist <- sapply(1:nrow(test), get_mapdist)