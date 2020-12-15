library(shiny)
library(tidyverse)




ui <- navbarPage(
    title = "Pisson",
    tabPanel("distribuation simulation",
             sidebarPanel(
                 sliderInput("time_inbetween",
                             "Usual time between Events:",
                             min = 5,
                             max = 59,
                             post = "min",
                             value = 10),
                 sliderInput("time_period",
                             "time period of interst:",
                             min = 60,
                             max = 720,
                             post = "min",
                             value = 60),
                 sliderInput("k",
                             "Number of new Events:",
                             min = 1,
                             max = 20,
                             value = 1)
             ),
             mainPanel(
                 plotOutput("distPlot"),
                 textOutput("calc_prob")
             )
    ),
    
    
    
    
    
    tabPanel("GLM",
             sidebarPanel(
                 radioButtons("options", "Choose predictors:",
                              c("All" = "all",
                                "construction + operation" = "co",
                                "Construction + type" = "ct",
                                "operation + type" = "ot"))
             ),
             
             mainPanel(
                 tabsetPanel(
                     tabPanel("Plot", plotOutput("modelPlot")),
                     tabPanel("Model", verbatimTextOutput("summary")),
                     tabPanel("Data", dataTableOutput("table"))
                 )
             )
             
             
    )
)
