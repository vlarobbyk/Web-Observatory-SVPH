#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)
library(tidyverse)
library(shinytitle)

ui <- fluidPage(
  
  tags$head(
    tags$style(
      HTML(
          '/* Ensure body and html fill the screen */
            body, html {
              margin: 0;
              padding: 0;
              width: 100%;
              height: 100%;
              overflow-x: hidden;
            }
          
          /* Ensure main wrapper stretches fully */
            .container-fluid {
              margin: 0 !important;
              padding: 0 !important;
              width: 100% !important;
              max-width: 100% !important;
            }
          
          /* Adjust panel width */
            .panel {
              width: 100% !important;
            }
          
          /* Adjust slider panel and content */
            .well {
              margin: 0 !important;
              padding: 10px !important;
            }
        
        '
      )
    )
  ),
  
  titlePanel('Sexual Violence Prevention WO'),
  
    fluidRow(
      column(width = 12, 
        tabsetPanel(
          tabPanel(
            h4("Introduction"),
            
            # Inline Markdown using HTML
            HTML(markdown::markdownToHTML(
              text = "**This text is bold**  \n*This text is italic*  \n[Link to RStudio](https://www.rstudio.com/)"
            )),
            
            br()
          ),
          tabPanel(
            h4('SVP Knowledge level | Children')
          ),
          tabPanel(
            h4('SVP Knowledge level | Teachers')
          )
        )
      )
    )

  #titlePanel('Sexual Violence Prevention WO')
)

server <- function(input, output){
  
}


shinyApp(ui, server)