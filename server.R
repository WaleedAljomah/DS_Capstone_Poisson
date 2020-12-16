library(shiny)
library(tidyverse)
library(ggplot2)
library(plotly)
library(AER)




shinyServer(function(input, output) {
    output$currentTime <- renderText({
        invalidateLater(1000)
        paste(Sys.time())
    })
    #Panel1
    
    # Reactive expression
    output$distPlot <- renderPlot({
        
        # generate lambda based on inputs (events, time_inbetween, time_period) from ui.R
        lambda <- 1/input$time_inbetween * input$time_period
        
        # draw the probability
        #generate number of events that can happen to create a data frame
        events <- 0:20
        # (log)density using dpois based on average rate of success(lambda)
        density <- dpois(x = events, lambda = lambda)
        # probability using ppois for cumulative successes based on lambda
        prob <- ppois(q = events, lambda = lambda, lower.tail = TRUE)
        p_data <- data.frame(events, density, prob)
        ggplot(p_data, aes(x = factor(events), y = density)) +
            geom_col() +
            geom_text(
                aes(label = round(density,2), y = density + 0.01),
                position = position_dodge(0.9),
                size = 3,
                vjust = 0
            ) +
            labs(title = " Poisson Distribution",
                 x = "Events",
                 y = "Density") +
            geom_line(data = p_data, aes(x = events, y = prob))
    })
    
    output$calc_prob <- renderText({
        
        lambda <- 1/input$time_inbetween * input$time_period
        
        #calculate probability based on Poisson distribution formula (k based on input)
        probability_k <- exp(-lambda) * lambda**input$k / factorial(input$k)
        paste("The probability of the new events = ",round(probability_k,2)*100,"%")
    })
    
    
    
    #Panel2
    output$modelPlot <- renderPlot({
        ship <- data("ShipAccidents")
        sa <- subset(ShipAccidents, service > 0)
        
           p_1 <- switch(input$options,
                      all = ggplot(sa, aes(x= construction + operation + type, y = incidents  )),
                      co = ggplot(sa, aes(x= construction + operation, y = incidents  )),
                      ct = ggplot(sa, aes(x= construction + type, y = incidents )),
                      ot = ggplot(sa, aes(x= operation + type, y =incidents )))
        print(
             p_1 +
                geom_smooth(method = 'glm', method.args = list(family = "Poisson"), formula = y ~ x) +
                geom_point()
        )
    })
    output$table <- renderDataTable({
        ship <- data("ShipAccidents")
        sa <- subset(ShipAccidents, service > 0)
    })
    output$summary <- renderPrint({
        ship <- data("ShipAccidents")
        sa <- subset(ShipAccidents, service > 0)
        linearOption <- switch(input$options,
                               all = glm(incidents ~ type + construction + operation, family = poisson, data = sa, offset = log(service)),
                               co = glm(incidents ~ construction + operation, family = poisson, data = sa, offset = log(service)),
                               ct = glm(incidents ~ construction + type, family = poisson, data = sa, offset = log(service)),
                               ot = glm(incidents ~ type + operation, family = poisson, data = sa, offset = log(service)))
        summary(linearOption)
    })
})









