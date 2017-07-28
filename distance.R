
#x is the jumpman dataframe
distance <- function(x) {
    library(ggmap)
    library(dplyr)
    
    locations <- data.frame(x$delivery_id, x$pickup_lon, x$pickup_lat, x$dropoff_lon, x$dropoff_lat, x$vehicle_type)
    
    #clean data to remove NAs
    locations <- locations[complete.cases(locations),]

    pickup <- matrix(nrow = nrow(locations), ncol = 8)
    colnames(pickup) <- c("from","to","m","km","miles","seconds","minutes","hours")
    transport <- character()
    
    #run through list to generate distances between pickup/dropoff
    for(i in 1:nrow(locations)) {
        
        #determine mode of transport
        if(locations[i,6] == "walker") {
            transport <- "walking"
        } else if(locations[i,6] == "bicycle") {
            transport <- "bicycling"
        } else {
            transport <- "driving"
        }
        
        #there is a query limit that has to be addressed - Google Maps API allows for 2500 geocode queries a day and the dataset will require more
        
        a <- mapdist(c(locations[i,2],locations[i,3]), c(locations[i,4],locations[i,5]), mode = transport)
        
        if(complete.cases(a)) {
            pickup[i,] <- unlist(a)
        } else {
            pickup[i,] <- unlist(c(a[1], a[2], NA, NA, NA, NA, NA, NA))
        }
    }
    cbind(locations[1],pickup)
}
