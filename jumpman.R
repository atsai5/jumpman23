jumpman <- read.csv('C:/Users/at121015/Documents/MyProject/Jumpman23/analyze_me.csv')

#clean dates
jumpman$when_the_delivery_started <- strptime(jumpman$when_the_delivery_started, format = "%m/%d/%y %H:%M %p")
jumpman$when_the_Jumpman_arrived_at_dropoff <- strptime(jumpman$when_the_Jumpman_arrived_at_pickup, format = "%m/%d/%y %H:%M %p")
jumpman$when_the_Jumpman_left_pickup <- strptime(jumpman$when_the_Jumpman_left_pickup, format = "%m/%d/%y %H:%M %p")
jumpman$when_the_Jumpman_arrived_at_dropoff <- strptime(jumpman$when_the_Jumpman_arrived_at_dropoff, format = "%m/%d/%y %H:%M %p")

