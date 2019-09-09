# Data visualization in R, using ggplot2
# Name: Eduardo Ocaña Pérez.
# Time: "2019-03-14 01:51:15 CST"

# ================ Packages ====================
library("ggplot2") # Grammar of Graphics plot 2
library("gridExtra") # Helps to get different plots together
library("quantmod") # It helps to get stock prices
library("TTR") # It helps us with the common technical analysis

# ================== Code ======================
# I create folders were to store the information in a more organized manner.
dir.create("data")
dir.create("documentation")
dir.create("output")
dir.create("data\\raw")
dir.create("data\\processed") # I make a distinction between raw and processed data.

# I need to be capable to delete the information that I am presenting to re-run the program
rm(list = ls())
dev.off()

# I want to save the working directory of the file in order to be capable to move the project around without having to change everything
wd <- getwd()
getwd()

# I get some variables to set the analysis
stocks <- c("BACHOCOB.MX","BIMBOA.MX", "AAPL","ALFAA.MX","AMXL.MX")

# I load the financial data I will need
getSymbols(stocks, from = "2015-01-01", to = "2017-12-31", periodicity = "monthly", src = "yahoo")
getSymbols("USDMXN=x", from = "2015-01-01", to = "2017-12-31", periodicity = "monthly", src = "yahoo")

# I can save the information in the raw data folder, to avoid having to download again
saveSymbols(stocks, file.path="data\\raw")
saveSymbols("USDMXN=X", file.path="data\\raw")

# I can delet the information in my environment and the load it again
rm("BACHOCOB.MX")
load(file = paste(wd, "/data/raw/BACHOCOB.MX.RData", sep = ""))
unlink("BACHOCOB.MX.RData")
stocks <- c("BACHOCOB.MX","BIMBOA.MX", "AAPL","ALFAA.MX","AMXL.MX")

################## Needs to be replaced with the new data
ggsave("mtcars.png", scale = 1.5, path = paste(wd, "/output", sep = ""))