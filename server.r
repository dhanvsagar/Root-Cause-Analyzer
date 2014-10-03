library(shiny)

shinyServer(function(input, output) {


  output$dataset <- renderTable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)    
    read.csv(inFile$datapath, header=input$header, sep=input$sep, quote=input$quote)
  })

  
  
  output$summary <- renderPrint({
	fileData <- reactiveFileReader(1000, session, 'input$file1', read.csv)
	output$data <- renderTable({
	fileData()
	})
  })
  
  #About Tab
  output$about <- renderPrint({
    text <- 'Developed By DVS at Amrita Vishwa Vidyapeetham as a part of M.Tech Project Work'
    return(text)
  })
  
  })

