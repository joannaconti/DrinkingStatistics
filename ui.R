# ui.R
library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Alcohol Usage by Age"),
    
    sidebarPanel(
        selectInput("var", "Graph to Display",
                        choices = list("Percent Drank in Last 30 Days"="drank", "Average Number of Drinks Per Day"="drinks",
                                       "Percent Binged in Last 30 Days"="binged", "Percent of Drinking Occasions When Bingers Binged"="bingingocc"),
                        selected = "drank")

    ),
        
    mainPanel(
        plotOutput("drinkingdata")
    )
))
