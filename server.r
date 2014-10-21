
# Root Cause Analyzer.
# Tool for analysing performance problems in enterprise IT systems
# Developed by DHAN V SAGAR
# contact dhanvsagar(at)gmail(dot)com
library(shiny)
library(ggplot2)
library(plyr)


shinyServer(function(input, output) {


  output$dataset <- renderTable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)    
    read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
  })

  
  output$dtplot<-renderPlot({
    p<-ggplot(diamonds) + 
      geom_density(aes_string(x="price",y="color"))
    title<-"Plot1 scatter and density"
    print(p+ggtitle(title))
  })
  
  output$summary <- renderPrint({
  #inFile <- input$file1
  #read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
	#fileData <- reactiveFileReader(1000, session, 'input$file1', read.csv)
	#output$data <- renderTable({
	summary()
	})
  
  
  #About Tab
  output$about <- renderText({
    text <- "Developed By Dhan V Sagar at Amrita Vishwa Vidyapeetham as a part of M.Tech Project Work. This tool comes with absolutely no warrenty.Visit GitHub for more"
    return(text)
  })
  
  })

