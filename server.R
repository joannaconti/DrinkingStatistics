## server.R
library(shiny)
library(ggplot2)

shinyServer(
    function(input, output) {
        drinking=read.csv("2012DrinkingData.csv")
        output$drinkingdata <- renderPlot({
            switch(input$var,
                   "drank" = ggplot(drinking, aes(x=age, y=PercDrank30, colour=sex, group=sex))+geom_line(size=1)+geom_point(size=3)+labs(title="Percent Drinking in Last 30 Days by Age") + ylab("Percent Drinking in Last 30 Days")+xlab("Age Group"),     
                   "drinks" = ggplot(drinking, aes(x=age, y=avgdrinkslast30, colour=sex, group=sex))+geom_line(size=1)+geom_point(size=3)+labs(title="Average Number of Drinks Per Typical Drinking Day by Age")+ ylab("Average Number of Drinks Drunk In A Day")+xlab("Age Group")+ylim(0, 6),
                   "binged" = ggplot(drinking, aes(x=age, y=Drinkersbinging, colour=sex, group=sex))+geom_line(size=1)+geom_point(size=3)+labs(title="Percent Who Binged In Last 30 Days by Age") + ylab("Percent Who Drank 5+ Drinks on One Occasion in Last 30 days")+xlab("Age Group"),
                   "bingingocc" = ggplot(drinking, aes(x=age, y=Bingerspercbinging, colour=sex, group=sex))+geom_line(size=1)+geom_point(size=3)+labs(title="Percent Of All Drinking Occasions In Which Bingers Binged") + ylab("Percent Of Drinking Occasions When Bingers Drank 5+ Drinks (Last 30 Day)")+xlab("Age Group")+ylim(0,80)
            )
        })   
    }   
)