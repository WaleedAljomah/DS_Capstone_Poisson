
library(shiny)
library(shinyWidgets)
# Define UI for application that draws a Poisson probability plot and give a probability of event based on Poisson distribution

shinyUI(fluidPage(
    setBackgroundColor(
        color = c("#E4F9F9", "#BDF1F1"),
        gradient = "linear",
        direction = "bottom"
    ),
    titlePanel(h1("Probability of events based on Poisson Distribution", align = "center")),
    
    sidebarLayout(
        # Sidebar with a slider input for the time in between each Events
        sidebarPanel(
            sliderInput("time_inbetween",
                        "Usual time between Events:",
                        min = 5,
                        max = 59,
                        post = "min",
                        value = 10
            ),
            sliderInput("time_period",
                        "time period of interest:",
                        min = 60,
                        max = 720,
                        post = "min",
                        value = 60),
            sliderInput("k",
                        "new Events:",
                        min = 1,
                        max = 20,
                        value = 1)
        ),
        mainPanel(
            plotOutput("distPlot"),
            textOutput("calc_prob")
        )
    )
)
)



