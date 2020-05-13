# Assignment 2 Task 3
# BUSA8090
# Author, Zhengyu Pan
# May 13th, 2020 

rm(list = ls(all = TRUE))  # clear all 
                           # addtionally do shift + control+ F10
                           # to clean up the libraries
library(WDI) # assume that WDI is installed 
library(ggplot2) # assume that ggplot2 is installed
library(dplyr)    # assume that dplyr is installed
library(maps)   # assume that maps is installed
                # it seems that we don't need this library, but 
                # I will leave it here anyway
library(countrycode)  # assume that countrycode is installed
library(UserNetR)   # assume already did 
                    # install_github("DougLuke/UserNetR")
                    # install.packages("UserNetR") will NOT work
library(sna)            # assume sna is installed 


# question 2 part a
wdi_data   <-WDI(indicator=c("NY.GDP.PCAP.PP.KD",   "EN.ATM.CO2E.PC"),   start   =   2010, end   =   2010,   extra   =   TRUE) 
wdi_data   =   as_tibble(wdi_data) 
wdi   <-   wdi_data   %>%   rename(GDPpercap   =   NY.GDP.PCAP.PP.KD, Emit_co2percap=EN.ATM.CO2E.PC)
dat_map<-map_data("world")

dat_map$ccode <- countrycode(dat_map$region,origin = "country.name",destination = "wb")

wdi$ccode<- countrycode(wdi$country, origin = "country.name", destination = "wb")
merged <-full_join(dat_map, wdi, by="ccode")
ggplot(merged, aes(x=long,y =lat, group = group, fill= Emit_co2percap))+geom_polygon()

# question 2 part b 


data(Bali)
op <- par(mar = c(0,0,0,0))
plot(Bali,displaylabels=TRUE,label.cex=0.8,
     pad=0.4,label.col="darkblue")


# question 2 part c
rolelab <- get.vertex.attribute(Bali,"role")

plot(Bali,usearrows=FALSE,label=rolelab,
     
     displaylabels=T,label.col="darkblue")

