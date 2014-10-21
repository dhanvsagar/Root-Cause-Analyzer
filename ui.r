
# Root Cause Analyzer.
# Tool for analysing performance problems in enterprise IT systems
# Developed by DHAN V SAGAR
# contact dhanvsagar(at)gmail(dot)com

library(shiny)

shinyUI(fluidPage( 

  titlePanel("Root Cause Analyzer"),
  helpText(" Import Your Dataset with all component level features",
"and findout the root cause for the performane problem"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose dataset',
                accept=c('text/csv', 
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"'),
	  checkboxInput('partition','Partition Data',FALSE)	
    ),
    mainPanel(
		tabsetPanel(type = "tabs", 
		#tabPanel("Dataset", tableOutput("test1")),
		tabPanel("Dataset", tableOutput("dataset")),
		tabPanel("Summary", verbatimTextOutput("summary")),
		tabPanel("Decision Tree", plotOutput("dtplot")),	
		tabPanel("Random Forest", verbatimTextOutput("rf")),
		tabPanel("Statistical Chabge Points", verbatimTextOutput("cp")),
		tabPanel("Root Causes", tableOutput("rootcause")),
		tabPanel("About", textOutput("about")))
		
      
    )
  )
)
)
