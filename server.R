
# Sample Shiny Intrest Rates browser

# Load libraries
library(shiny); library(quantmod); library(ggplot2); require(scales)

shinyServer(function(input, output) {

  # Create env.
  Data <- new.env()
  
  output$currPlot <- renderPlot({
    
    # Get the values from the user 
    date.from <- input$dates[1]
    date.to <- input$dates[2]
    curr.pair <- input$pair
    
    # Do the transformations to the data
    data <- as.data.frame(getSymbols(Symbols = curr.pair, 
                                   src = "oanda", from = date.from,
                                   to = date.to, env = NULL))
    names(data)[1] <- "pair"
    data$time <- rownames(data)
    data$time <- as.Date(x = data$time, format = "%Y-%m-%d")
    
    # Draw the plot
    ggplot(data = data, aes(time, pair)) + geom_line(size = input$lineslider, 
                                                     colour = input$linecolour) + 
      xlab("Date") + ylab(input$pair) +
      scale_x_date(labels = date_format(input$dateformat)) +
      theme(panel.background = element_rect(fill='white', 
                                            colour = input$chartframe),
            axis.text = element_text(colour = "black", size = input$labelslider))
  }, height = 600)

})
