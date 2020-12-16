library(shiny)
library(tidyverse)
library(shinyWidgets)


# Define UI for application that draws a Poisson probability plot and give a probability of event based on Poisson distribution

ui <- navbarPage(
    setBackgroundColor(
        color = c("#E4F9F9", "#BDF1F1"),
        gradient = "linear",
        direction = "bottom"),
    title = "Poisson",
    tabPanel("distribuation simulation",
             # Sidebar with a slider input for the time in between each Events
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
                 #plot Poisson distribution based on the choice of the slider
                 plotOutput("distPlot"),
                 #to show the probability calculated based on the inputs of the slider
                 textOutput("calc_prob")
             )
    ),
    
    
    
    
    
    tabPanel("GLM",
             sidebarPanel(
                 #radiobutton to choose between predictors 
                 radioButtons("options", "Choose predictors:",
                              c("All" = "all",
                                "construction + operation" = "co",
                                "Construction + type" = "ct",
                                "operation + type" = "ot"))
             ),
             
             mainPanel(
                 tabsetPanel(
                     #plot the model based on the choice of the predictors in the radiobuttons
                     tabPanel("Plot", plotOutput("modelPlot")),
                     #summary the model based on the choice of the predictors in the radiobuttons
                     tabPanel("Model", verbatimTextOutput("summary")),
                     #show the data used for demonstrating Poisson GLM
                     tabPanel("Data", dataTableOutput("table"))
                 )
             )
             
             
    )
)
