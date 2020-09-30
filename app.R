library(shiny)
library(tidyverse)
library(yonder)
library(shinyjs)

# Define UI for application that draws a histogram
ui <- tags$body(fluidPage(
    
    tags$style("
                     #tooltip {
        background: #333;
        color: white;
        font-weight: bold;
        padding: 4px 8px;
        font-size: 13px;
        border-radius: 4px;
                     }
      #arrow,
#arrow::before {
  position: absolute;
  width: 8px;
  height: 8px;
  z-index: -1;
}

#arrow::before {
  content: '';
  transform: rotate(45deg);
  background: #333;
}
#tooltip[data-popper-placement^='top'] > #arrow {
  bottom: -4px;
}

#tooltip[data-popper-placement^='bottom'] > #arrow {
  top: -4px;
}

#tooltip[data-popper-placement^='left'] > #arrow {
  right: -4px;
}

#tooltip[data-popper-placement^='right'] > #arrow {
  left: -4px;
}
               "),
    # Application title
    titlePanel("Old Faithful Geyser Data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            tags$div(id="binned",
                sliderInput("bins",
                            "Number of bins:",
                            min = 1,
                            max = 50,
                            value = 30),
                `aria-describedby`="tooltip"),
        tags$div(id = "tooltip", `role`="tooltip",
                 "Tip for part1",
                 tags$div(id="arrow", `data-popper-arrow`=""))
        
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("distPlot")
    )
)),

tags$script(src="https://unpkg.com/@popperjs/core@2"),
tags$script("
    const slider = document.querySelector('#binned');
    const tooltip = document.querySelector('#tooltip');

    Popper.createPopper(slider, tooltip,
    {
        placement:'top',
    });
                "))

# simple_ui <- fluidPage()

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
