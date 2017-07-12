# Load required libraries ----
rm(list=ls())
detach("package:plyr", unload=TRUE)#will error - no worries
library(tidyr)
library(dplyr)
options(dplyr.width = Inf) #enables head() to display all coloums
#library(stringr)
library("readr") # allows you to save final data as text file

## STEP 1 - Set Project and Campaign -----
## Barrow Island Gorgon ----
# Project <- "Barrow Island Gorgon"

## Campaigns ----
# ID <- "2008-10_Barrow.Island.Gorgon_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2009-03_Barrow.Island.Gorgon_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2010-03_Barrow.Island.Gorgon_stereoBRUVs" # habitat classes 12/07/17

## Cape Howe Marine Park_Moore ----
# Project<-"Cape Howe Marine Park_Moore"

# Campaigns ----
# ID <- "2006-11_Cape.Howe.MNP_stereoBRUVs" # habitat classes 12/07/17

## Dampier Archipelago Pluto ----
# Project<-"Dampier Archipelago Pluto"

# Campaigns ----
# ID <- "2008-08_Dampier.Pluto_stereoBRUVs" # habitat classes 12/07/17

## Department of Fisheries deepwater transects ----
# Project<-"Department of Fisheries deepwater transects"

# Campaigns ----
# ID <- "2010-03_Perth.Canyon.60_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2010-03_Perth.Canyon.90_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2010-03_Perth.Canyon.180_stereoBRUVs"# habitat classes 12/07/17
# ID <- "2010-11_Perth.Canyon.60_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2010-11_Perth.Canyon.90_stereoBRUVs" # habitat classes 12/07/17

## Nagari Capes long-term monitoring ----
# Project <- "Nagari Capes long-term monitoring"

# Campaigns ----
# ID <- "2006-00_Capes.sanctuaries_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2007-03_Capes.sanctuaries_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2008-02_Capes.sanctuaries_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2008-04_Capes.sanctuaries_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2009-03_Capes.sanctuaries_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2009-08_Capes.sanctuaries_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2010-01_Capes.sanctuaries_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2010-06_Capes.sanctuaries_stereoBRUVs" # habitat classes 12/07/17 - All Unknown or NAs

## Ningaloo Marine Park WAMSI_Fitzpatrick ----
# Project <- "Ningaloo Marine Park WAMSI_Fitzpatrick"

# Campaigns ----
# ID <- "2006-07_Ningaloo.sanctuaries_stereoBRUVs" # habitat classes 12/07/17
# ID <- "2007-07_Ningaloo.sanctuaries_stereoBRUVs" # habitat classes 12/07/17 - A lot of Unknown + NAs

## Ningaloo Marine Park_DPaW ----
 Project <- "Ningaloo Marine Park_DPaW"

# Campaigns ----
 ID <- "2014-10_Ningaloo.shallow.sanctuaries_stereoBRUVs"
# ID <- "2015-08_Ningaloo.deep.sanctuaries_stereoBRUVs"
# ID <- "2015-08_Ningaloo.shallow.sanctuaries_stereoBRUVs"

# STEP 2 - Set Custodian ----
custodian <- "Tim Langlois"
# custodian <- "Euan Harvey"
# custodian <- "Joachim Claudet"
# custodian <- "Luke Smith"

# STEP 3 - Set Method ----
method <- "stereo-BRUVs"
# method <- "stereo-DOVs/UVC"

## STEP 4 - Set Directories ----
data.dir=paste("C:/Users/21301367/Google Drive/GlobalArchive_Uploads",custodian,Project,method,ID,sep="/") # Example Directory 

# STEP 5 - Load Metadata and write Habitat Classes ----
setwd(data.dir)
dir()

data<-paste(ID,"Metadata.txt",sep="_")

habitat.classes<-read.delim(data,header=T,stringsAsFactors=FALSE)%>%
  select(c(Sample,BENTHOS,DETAIL.BENTHOS,RELIEF,DETIAL.RELIEF))%>%
  rename(Detail.Relief=DETIAL.RELIEF)%>%
  rename(Relief=RELIEF)%>%
  rename(Detail.Benthos=DETAIL.BENTHOS)%>%
  rename(Benthos=BENTHOS)%>%
  write_tsv(paste(ID,"Habitat.classes.txt",sep="_"))
head(habitat.classes)

