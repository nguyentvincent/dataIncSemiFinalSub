


library(bigmemory)
setwd("/Users/Vincent/Dropbox/DataIncubatorChallenge/")

bigdf.trip.fare.raw = read.big.matrix("trip_fare_3.csv")
trip.fare.raw = read.csv("trip_fare_3.csv")
trip.data.raw = read.csv("trip_data_3.csv")



foo1 = nrow(subset(trip.fare.raw,total_amount<5 & payment_type == "CRD")) / 
  nrow(subset(trip.fare.raw,total_amount<5))
foo2 = nrow(subset(trip.fare.raw, total_amount > 50 & payment_type == "CRD")) / 
  nrow(subset(trip.fare.raw,total_amount>50))

print(paste("The fraction of payments under $5 using credit card is",foo1))
print(paste("The fraction of payments over $50 using credit card is",foo2))

foo3 = mean(trip.fare.raw$total_amount[trip.data.raw$trip_time_in_secs!= 0] /
              trip.data.raw$trip_time_in_secs[trip.data.raw$trip_time_in_secs!= 0])

print(paste("The mean fare per minute driven is ", foo3))

foo4 = median(trip.fare.raw$fare_amount[trip.data.raw$trip_distance !=0 ]/trip.data.raw$trip_distance[trip.data.raw$trip_distance != 0])

print(paste("the median fare per mile driven is",foo4))

foo5 = quantile(trip.data.raw$trip_distance[trip.data.raw$trip_distance != 0 & trip.data.raw$trip_time_in_secs != 0] /
                  (trip.data.raw$trip_time_in_secs[trip.data.raw$trip_distance != 0 & trip.data.raw$trip_time_in_secs != 0]/3600) ,0.95)

print(paste("the 95 percentile of the taxi's average driving speed in  miles per hour is",foo5))

trip.data.raw.2 = subset(trip.data.raw,
                         pickup_longitude != 0 &
                           pickup_latitude!= 0 &
                           dropoff_longitude != 0 &
                           dropoff_latitude!=0)

#df has the absolute distances for everything in trip.data.raw.2, including the zero distances
df = sqrt((trip.data.raw.2$pickup_longitude - trip.data.raw.2$dropoff_longitude)^2 + 
            (trip.data.raw.2$pickup_latitude - trip.data.raw.2$dropoff_latitude)^2 ) * 18/(0.1873*1.6)


df2 = df[df!=0 & trip.data.raw.2$trip_distance!= 0] / 
  trip.data.raw.2$trip_distance[df!=0 & trip.data.raw.2$trip_distance != 0]

df2 = subset(df2,df2<=1 & df2>0)

print(paste("the average ratio  of the distance between the pickup and dropoff divided by the distance driven is ", mean(df2)))

#JFK is 40.657416 to 40.643806 for longitude, aand -73.795772 to -73.780537 for latitude

jfk.rides = trip.data.raw$pickup_latitude < 40.657416 &
  trip.data.raw$pickup_latitude > 40.643806 &
  trip.data.raw$pickup_longitude <  -73.780537 &
  trip.data.raw$pickup_longitude >  -73.795772

print(paste("The average tip for rides from JFK is", mean(trip.fare.raw$tip_amount[jfk.rides])))

medallion.list = unique(trip.fare.raw$medallion)
marchFares = vector()


for (i in 1:length(medallion.list))
{
  allMarchFares = subset(trip.fare.raw, medallion == medallion.list[i] & format(as.Date(pickup_datetime),"%b") == "Mar")
  if(nrow(allMarchFares != 0))
  {
    marchFares[i] = sum(allMarchFares$total_amount)
  }
}

print(paste("The average revenue for", mean(marchFares)
            
            
            
            