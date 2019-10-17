library(shiny)
library(shinydashboard)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Acá se ingresa el texto que se quiere evaluar"),
  
  # Salida de texto 1
  
  textAreaInput("caption", "Caption", "Jamas en la conduccion politica hay que obligar a nadie, hay que persuadir a todo el que se pueda."
                , width = "1000px"),

  # Application title
  titlePanel("Porcentaje de peronismo"),
  
  # Salida de texto 1
  fluidRow(
    valueBoxOutput("resultado")
  )))

