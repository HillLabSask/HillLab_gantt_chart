#Started out with instructions from https://rpubs.com/mramos/ganttchart

setwd("/your/favourite/directory/")

#Download and install plotrix package
install.packages("plotrix")
#Load the package
library(plotrix)
library(RColorBrewer)



#People names and  dates from common cv. Priorities will be categories of student.
# 1=PI, 2=technician , 3=postdoc, 4=MSc , 5=PhD, 6=Undergrad

Ymd.format<-"%Y/%m/%d"
gantt.info<-list(labels=c("Janet Hill","Atul Desai","Shalene Storey",
                          "Amanda Russell","Kristyna Musil","Bonnie Chaban",
                          "Shan Weeratunga","Yanyun Huang","Ryan Ridgway",
                          "Catherine Vermette","Champika Fernando","Isha Katyal",
                          "Teenus Paramel Jayaprakash","Matthew Links","Shirley Chu",
                          "Catherine Vermette","Bonnie Chaban","Joe Rubin",
                          "Beata Ng","Jasmine Hui","Matheus Costa",
                          "Hollie Lemieux","Mo Patterson","Beata Ng",
                          "Bonnie Chaban","Lisa Johnson","Mo Patterson",
                          "Aline Costa de Freitas","John Schellenberg","Lisa Johnson",
                          "Gabrielle Paul-McKenzie","Mo Patterson","Lisa Johnson",
                          "Jason Byron Perez","Teenus Paramel Jayaprakash","Niradha Withana Gamage",
                          "Pubudu Basnayaka","Angela Oh","Mo Patterson",
                          "Mo Patterson","Erica Seebach","Ashton Wickramaratne",
                          "Chelsea Ziegler","Salahuddin Khan","Chelsea Ziegler",
                          "Sarah Vancuren","Maodong Zhang","Pashupati Bhandari",
                          "Shakya Kurukulasuriya","Sarah Vancuren","Elina Ren",
                          "Sarah Vancuren","Laura Speerin","Scott Dos Santos",
                          "George-Paul O'Byrne","McKayla Boguski","McKayla Boguski","Jay Rabari",
                          "Ishika Shukla","Jay Rabari","Ishika Shukla","Elina Ren",
                          "Raiza de Almeida Mesquita","Darien Deschner","Divanthika Kularatne","Agnes Truc Nguyen",
                          "Agnes Truc Nguyen","Agnes Truc Nguyen","Dhinesh Periyasamy",
                          "Andy Kim","Darien Deschner","Sylvia Li",
                          "Divanthika Kularatne"),
                   starts=as.POSIXct(strptime(c("2006/01/01","2007/05/01","2007/10/01",
                                                "2008/05/01","2008/05/01","2008/09/01",
                                                "2008/09/01","2008/09/01","2009/05/01",
                                                "2009/05/01","2009/05/01","2009/09/01",
                                                "2009/09/01","2009/09/01","2010/05/01",
                                                "2010/05/01","2010/09/01","2011/07/01",
                                                "2011/05/01","2011/05/01","2011/09/01",
                                                "2012/08/01","2012/05/01","2012/05/01",
                                                "2012/09/01","2013/05/01","2013/05/01",
                                                "2013/09/01","2014/01/01","2014/01/01",
                                                "2014/05/01","2014/05/01","2014/09/01",
                                                "2014/09/01","2015/12/01","2015/01/01",
                                                "2015/07/01","2015/05/01","2015/05/01",
                                                "2015/09/01","2016/05/01","2016/05/01",
                                                "2016/05/01","2016/05/01","2017/05/01",
                                                "2017/05/01","2017/07/01","2017/09/01",
                                                "2017/09/01","2018/05/01","2018/05/01",
                                                "2018/09/01","2018/09/01","2019/01/01",
                                                "2019/05/01","2019/09/01","2020/05/01",
                                                "2020/06/01","2020/06/01","2020/09/01",
                                                "2021/05/01","2020/09/01","2021/03/31",
                                                "2021/05/01","2022/01/01","2022/05/01",
                                                "2022/09/01","2023/05/01","2023/01/01",
                                                "2023/05/01","2023/05/01","2023/09/01",
                                                "2024/01/01"),
                             format=Ymd.format)),
                     ends=as.POSIXct(strptime(c("2099/08/31","2012/05/01","2008/04/30",
                                                "2008/08/30","2008/08/30","2010/08/30",
                                                "2008/12/31","2013/12/31","2009/08/30",
                                                "2009/08/30","2024/02/01","2015/09/01",
                                                "2015/03/01","2013/10/31","2010/08/30",
                                                "2010/08/30","2012/08/31","2012/08/31",
                                                "2011/08/31","2011/08/31","2016/02/28",
                                                "2013/08/30","2012/08/31","2012/08/31",
                                                "2014/12/31","2013/08/31","2013/08/31",
                                                "2018/02/01","2015/12/31","2014/08/31",
                                                "2014/08/31","2014/12/31","2017/10/31",
                                                "2017/02/28","2017/04/30","2016/04/30",
                                                "2016/03/31","2015/08/31","2015/08/01",
                                                "2018/04/30","2016/08/30","2016/08/30",
                                                "2016/08/30","2021/05/31","2017/08/31",
                                                "2017/08/31","2020/12/31","2023/02/28",
                                                "2020/04/06","2018/08/31","2018/08/31",
                                                "2019/06/30","2019/04/30","2023/04/30",
                                                "2020/12/31","2020/04/30","2020/08/31",
                                                "2020/08/31","2020/08/31","2021/04/30",
                                                "2021/08/31","2023/01/05","2021/12/31",
                                                "2023/04/30","2023/12/31","2022/08/31",
                                                "2023/04/30","2025/04/30","2024/12/31",
                                                "2023/08/31","2025/04/30","2024/04/30",
                                                "2026/12/31"),
                             format=Ymd.format)),
                     priorities=c(1,5,6,
                                  6,6,3,
                                  6,5,6,
                                  6,2,5,
                                  5,5,6,
                                  6,3,3,
                                  6,6,5,
                                  2,6,6,
                                  3,6,6,
                                  5,3,2,
                                  6,6,4,
                                  4,2,2,
                                  2,6,6,
                                  4,6,6,
                                  6,5,2,
                                  6,5,5,
                                  4,6,6,
                                  6,6,5,
                                  4,6,2,
                                  6,6,6,
                                  6,4,4,
                                  4,4,6,
                                  6,4,4,
                                  6,5,6,
                                  5))
#Assign values for the set up of your Gantt Chart

#months <- seq(as.Date("2006/01/01", "%Y/%m/%d"), by="month", length.out=800)
#monthslab <- format(months, format="%b")

#vgridpos<-as.POSIXct(months,format=Ymd.format)
#vgridlab<-monthslab

vgridpos<-as.POSIXct(strptime(c("2006/01/01","2007/01/01","2008/01/01",
                                "2009/01/01","2010/01/01","2011/01/01",
                                "2012/01/01","2013/01/01","2014/01/01",
                                "2015/01/01","2016/01/01","2017/01/01",
                                "2018/01/01","2019/01/01","2020/01/01",
                                "2021/01/01","2022/01/01","2023/01/01",
                                "2024/01/01"),format=Ymd.format))
     vgridlab<-c("2006","2007","2008",
                 "2009","2010","2011",
                 "2012","2013","2014",
                 "2015","2016","2017",
                 "2018","2019","2020",
                 "2021","2022","2023",
                 "2024")

colfunc <- colorRampPalette(c("#762a83","#af8dc3","#e7d4e8","#d9f0d3","#7fbf7b","#1b7837"))

timeframe <- as.POSIXct(c("2006/01/01","2024/08/31"),format=Ymd.format)

#Plot and save your Gantt chart into PDF form
gantt.chart(gantt.info, taskcolors=colfunc(6),xlim=timeframe, main="We are the Hill Lab (est. 2006)", priority.legend=FALSE, 
            vgridpos=vgridpos,vgridlab=vgridlab,hgrid=FALSE,half.height=0.45,cylindrical=FALSE,border.col="black",
            label.cex=0.8,priority.label="Type",priority.extremes=c("PI","Undergrad"),time.axis=1)
            
            
