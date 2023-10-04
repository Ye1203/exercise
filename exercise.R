library(dplyr)
strawberry=read.csv("strawberry_oct4.csv",header=T)
strwb_census= strawberry|>
  filter(Program=="CENSUS")|>
  select(Value!="(D)")

strwb_survey= strawberry|>
  filter(Program=="SURVEY")

vals=strwb_census$Value
vals=ifelse(vals=="(D)",NA,vals)
vals=sub(",","",vals)
vals=sub('""',"",vals)
vals=as.numeric(vals)
vals
strwb_census["Value"]=vals

vals=strwb_survey$Value
vals=ifelse(vals=="(D)",NA,vals)
vals=sub('""',"",vals)
vals=as.numeric(vals)
vals
strwb_survey["Value"]=vals
