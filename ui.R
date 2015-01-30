
# Quantmod fun

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Currency Pair"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Currency Settings"),
      dateRangeInput("dates", label = h4("Date range"), end = Sys.Date(), 
                     start = Sys.Date() - 14),
      textInput("pair", label = h4("Currency pair"), value = "USD/EUR"),
      p("For the availble pairs visit OANDA.com"),
      h3("Chart Aesthetics"),
      sliderInput("lineslider", label = h4("Line width"), min = 0.5, 
                  max = 10, value = 1),
      sliderInput("labelslider", label = h4("Axis label size"), min = 1, 
                  max = 30, value = 10),
      selectInput("linecolour", label = h4("Line colour"), 
                  choices = list("Black" = "Black", 
                                 "Red" = "Red", 
                                 "Blue" = "Blue",
                                 "Green" = "Green"), 
                  selected = 1),
      radioButtons("chartframe", label = h4("Show chart frame?"),
                   choices = list("Yes" = "Black", "No" = "White"), 
                   selected = "Black"),
      textInput("dateformat", label = h4("Date format:"), value = "%m/%d")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("currPlot", height = 600),
      h4("Notes"),
      p("The following application was developed for the educational purposes only. The data is sourced from the OANDA.com."),
      p("Konrad Zdeb",
      br(),
        a("Cultured Software and Curious Research", 
          href = "https://culturedsoftwareandcuriousresearch.wordpress.com/"))
    )
  )
))
