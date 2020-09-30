library(shiny)
library(tidyverse)
# library(yonder)
# library(shinyjs)

# Define UI for application that draws a histogram
ui <- tags$body(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href="popper_styles.css")),
  fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
               sliderInput("bins",
                           "Number of bins:",
                           min = 1,
                           max = 50,
                           value = 30
               ),
               modalDialog(title = "Welcome to the app",
                        HTML("<button class='btn btn-primary' onclick='walkthrough()' data-dismiss='modal'>Click for a walkthrough  &rarr;</button>
                             <button class='btn btn-danger' data-dismiss='modal' style='float:right'>&times;</button>"),
                        footer=NULL,
                        size="m"),
      tags$div(id = "tooltip1", `role`="tooltip",
               class="baloon tip",
               HTML("<h3>Change the bins</h3>
                    <p>Why not try 20 bins?</p>
                    <button class='btn btn-primary' onclick='advance1()'>Next &rarr;</button>"),
               tags$div(id="arrow", class="arrow", `data-popper-arrow`="")),
      tags$div(id = "tooltip2", `role`="tooltip",
               class="baloon tip",
               HTML("<h3>Check out the graph!</h3>
                    <p>The graph updates automatically!</p>
                    <button class='btn btn-primary' onclick='advance2()'>Done &#10004;</button>"),
               tags$div(id="arrow2", class= "arrow", `data-popper-arrow`=""))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )),
  
  tags$script(src="https://unpkg.com/@popperjs/core@2"),
  tags$script(src="popper_set.js"))