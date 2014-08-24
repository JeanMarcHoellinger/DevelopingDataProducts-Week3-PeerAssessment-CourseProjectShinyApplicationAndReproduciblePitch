library(shiny)
require(markdown)

shinyUI(navbarPage("Navigation bar",
        tabPanel("Documentation",
                includeMarkdown("documentation.md")
        ),
        tabPanel("Shiny Application",
                pageWithSidebar(
                        headerPanel("Distribution Explorer"),
                        sidebarPanel(
                                selectInput('dist', 'Distribution type',
                                        c("norm","unif","lnorm","exp")
                                ),
                                sliderInput('n', 'Number of observations', 
                                        value= 500, min = 1, max = 1e3, step = 1
                                )
                        ),
                        mainPanel(
                                plotOutput('plot')
                        )
                )
        ),
        tabPanel("Summary", 
                 verbatimTextOutput("summary")
        )
))